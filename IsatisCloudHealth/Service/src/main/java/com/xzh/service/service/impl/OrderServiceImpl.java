package com.xzh.service.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xzh.common.constant.MessageConstant;
import com.xzh.common.entity.Conditions;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Member;
import com.xzh.common.pojo.Order;
import com.xzh.common.pojo.OrderSetting;
import com.xzh.common.utils.DateUtils;
import com.xzh.service.dao.MemberDao;
import com.xzh.service.dao.OrderDao;
import com.xzh.service.dao.OrderSettingDao;
import com.xzh.service.service.MemberService;
import com.xzh.service.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class OrderServiceImpl extends ServiceImpl<OrderDao, Order> implements OrderService {
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private OrderSettingDao orderSettingDao;
    @Autowired
    private MemberDao memberDao;
    @Autowired
    private MemberService memberService;
    @Autowired
    private SetmealServiceImpl setmealService;

    //体检预约
    @Override
    public Result order(Map map) throws Exception {
        //1.检查用所选择的日期是否已经进行预约设置
        String orderDate = (String) map.get("orderDate");
        //把string类型的日期改为Date类型
        Date date = DateUtils.parseString2Date(orderDate);
        //根据日期查询预约设置
        OrderSetting orderSetting = orderSettingDao.findByOrderDate(date);
        //如果当天没有进行预约设置无法进行体检预约
        if (orderSetting == null) {
            return new Result(false, MessageConstant.SELECTED_DATE_CANNOT_ORDER);
        }
        //2.检查用户选择的预约日期是否已被约满
        //获得可预约人数
        int number = orderSetting.getNumber();
        //获取已预约人数
        int reservations = orderSetting.getReservations();
        if (reservations >= number) {
            //当天已被约满
            return new Result(false, MessageConstant.ORDER_FULL);
        }
        //3.检查该用户是否重复预约同一套餐
        //获取用户手机号
        String telephone = (String) map.get("telephone");
        //根据手机号查询会员信息
        Member member = memberService.findByTelephone(telephone);

        //获取会员id
        Integer memberId = member.getId();
        //获取套餐id
        Integer setmealId = Integer.parseInt((String) map.get("setmealId"));
        Order order = new Order(memberId, date, setmealId);
        //根据条件查询
        List<Order> list = orderDao.findByCondition(order);
        if (list != null && list.size() > 0) {
            //重复预约
            return new Result(false, MessageConstant.HAS_ORDERED);
        }
        order.setOrderName((String) map.get("name"));
        //预约类型
        order.setOrderType((String) map.get("orderType"));
        //就诊状态
        order.setOrderStatus(Order.ORDERSTATUS_NO);
        orderDao.insert(order);
        //5.预约成功，设置已预约人数+1
        orderSetting.setReservations(orderSetting.getReservations() + 1);
        //根据预约日期修改已预约人数
        orderSettingDao.editReservationsByOrderDate(orderSetting);
        return new Result(true, MessageConstant.ORDER_SUCCESS, order.getId());
    }

    //根据id查询预约信息
    @Override
    public Map<String, Object> findById(Integer id) throws Exception {
        Order order = orderDao.selectById(id);
        Map<String, Object> map = new HashMap<>();
        map.put("member", order.getOrderName());
        map.put("setmeal", setmealService.findById(order.getSetmealId()).getName());
        map.put("orderDate", DateUtils.parseDate2String(order.getOrderDate()));
        map.put("orderType", order.getOrderType());
        return map;
    }

    /**
     * 微信预约
     */
    @Override
    public Result submit(Map dataMap) {
        //查询用户选择的预约日期是否允许预约
        //查询用户选择的日期是否已经满员
        //进行预约操作(更新h_order表,更新已预约的人数,发送预约成功短信)

        //获取体检日期
        String orderDate = (String) dataMap.get("orderDate");
        Date order_Date = null;
        try {
            order_Date = DateUtils.parseString2Date(orderDate);
        } catch (Exception e) {
            //日期格式解析异常
            e.printStackTrace();
            return new Result(false, "日期格式解析失败");
        }

        //根据体检日期查询并把结果封装成OrderSetting对象
        OrderSetting orderSetting = orderSettingDao.findByOrderDate(order_Date);

        if (orderSetting != null) {
            //说明用户选择的日期允许预约

            //当天可预约的人数
            int number = orderSetting.getNumber();
            //当天已预约的人数
            int reservations = orderSetting.getReservations();
            if (number > 0 && reservations < number) {
                Integer memberId = (Integer) dataMap.get("memberId");
                //把该用户对应的memberId、预约日期、套餐id封装成order对象
                Order order = new Order();
                order.setIdCard((String) dataMap.get("idCard"));
                order.setOrderDate(order_Date);
                order.setSetmealId(Integer.parseInt(dataMap.get("setmealId").toString()));
                //查询该用户对应的预约
                List<Order> orderList = orderDao.findByCondition(order);
                if (orderList != null && orderList.size() > 0) {
                    //该用户已经预约了
                    return new Result(false, MessageConstant.HAS_ORDERED);
                } else {
                    //完善该预约信息
                    order = new Order(memberId, order_Date, Order.ORDERTYPE_WEIXIN, Order.ORDERSTATUS_NO, Integer.parseInt(dataMap.get("setmealId").toString()));
                    order.setOrderName((String) dataMap.get("name"));
                    order.setSex((Integer) dataMap.get("sex"));
                    order.setTelephone((String) dataMap.get("telephone"));
                    order.setIdCard((String) dataMap.get("idCard"));
                    //更新h_order表（添加）
                    orderDao.insert(order);

                    //设置预约人数+1
                    orderSetting.setReservations(orderSetting.getReservations() + 1);
                    orderSettingDao.editReservationsByOrderDate(orderSetting);

                    //返回预约成功后新增的那条预约的id
                    return new Result(true, MessageConstant.ORDER_SUCCESS, order.getId());
                }


            } else {
                //当天预约人数已满
                return new Result(false, MessageConstant.ORDER_FULL);
            }

        } else {
            //说明用户选择的日期不允许预约
            return new Result(false, MessageConstant.SELECTED_DATE_CANNOT_ORDER);
        }
    }

    @Override
    public List<Order> findByMemberIdWithCondition(Integer memberId) {
        return orderDao.findByMemberIdWithCondition(memberId);
    }

    @Override
    public List<Map> findAll4OrderAndSetmeal(Integer memberId) {
        return orderDao.findAll4OrderAndSetmeal(memberId);
    }

    @Override
    public List<Map> findSetmealByIdAndDate(Integer memberId, String startDate, String endDate, String setmealName) {
        if (setmealName != null && setmealName.length() > 0) {
            //套餐名称非空
            setmealName = "%" + setmealName + "%";
            return orderDao.findSetmealByIdAndDate(memberId, startDate, endDate, setmealName);
        } else {
            //套餐名称为空
            return orderDao.findSetmealByIdAndDateWithoutName(memberId, startDate, endDate);
        }
    }

    @Override
    public Map findAllDataByOrderId(Integer orderId) {
        return orderDao.findAllDataByOrderId(orderId);
    }

    //分页查询
    public PageResult findByPageAndCondition(Conditions conditions) {
        System.out.println("-----------------");
        System.out.println(conditions.toString());
        System.out.println("-----------------");
        Integer currentPage = conditions.getCurrentPage();
        Integer pageSize = conditions.getPageSize();
        //查询规则
        String queryString = conditions.getQueryString();
        System.out.println(queryString);
        Date[] queryDate = conditions.getQueryDate();
        String queryOrderStatus = conditions.getQueryOrderStatus();
        String queryOrderType = conditions.getQueryOrderType();

        PageHelper.startPage(currentPage, pageSize);
        Date startDate = null;
        Date endDate = null;
        if (queryDate != null && queryDate.length > 0) {
            startDate = queryDate[0];
            endDate = queryDate[1];
        }
        Page page = orderDao.findByPageAndCondition(queryString, startDate, endDate, queryOrderStatus, queryOrderType);
        //查询的总条数
        long total = page.getTotal();
        //查询的当前页的集合
        List result = page.getResult();
        return new PageResult(total, result);
    }

    //编辑操作，先查询点击对象的id
    public Map findOrderById(Integer id) {
        return orderDao.findOrderById1(id);
    }

    //通过订单id查询套餐id
    public List<Integer> findSetmealIdsByOrderId(Integer id) {
        return orderDao.findSetmealIdsByOrderId(id);
    }

    //新增预约
    public Result addPhoneOrder(Map map) throws Exception {
        //1、检查用户所选择的预约日期是否已经提前进行了预约设置，如果没有设置则无法进行预约
        String orderDate = (String) map.get("orderDate");//预约日期
        OrderSetting orderSetting = orderSettingDao.findByOrderDate(DateUtils.parseString2Date(orderDate));
        if (orderSetting == null) {
            //指定日期没有进行预约设置，无法完成体检预约
            return new Result(false, MessageConstant.SELECTED_DATE_CANNOT_ORDER);
        }
        //2、检查用户所选择的预约日期是否已经约满，如果已经约满则无法预约
        int number = orderSetting.getNumber();//可预约人数
        int reservations = orderSetting.getReservations();//已预约人数
        if (reservations >= number) {
            //已经约满，无法预约
            return new Result(false, MessageConstant.ORDER_FULL);
        }
        //3、检查用户是否重复预约（同一个用户在同一天预约了同一个套餐），如果是重复预约则无法完成再次预约
        String telephone = (String) map.get("phoneNumber");//获取用户页面输入的手机号
        Member member = memberService.findByTelephone(telephone);
        Integer setmealId = null;
        if (member != null) {
            //判断是否在重复预约
            Integer memberId = member.getId();//会员ID
            Date order_Date = DateUtils.parseString2Date(orderDate);//预约日期
            setmealId = (Integer) map.get("setmealId");//套餐ID
            Order order = new Order(memberId, order_Date, setmealId);
            //根据条件进行查询
            List<Order> list = orderDao.findByCondition(order);
            if (list != null && list.size() > 0) {
                //说明用户在重复预约，无法完成再次预约
                return new Result(false, MessageConstant.HAS_ORDERED);
            }
        } else {
            //4、检查当前用户是否为会员，如果是会员则直接完成预约，如果不是会员则自动完成注册并进行预约
            member = new Member();
            member.setName((String) map.get("name"));
            member.setPhoneNumber(telephone);
            member.setIdCard((String) map.get("idCard"));
            member.setSex((String) map.get("sex"));
            member.setRegTime(new Date());
            memberDao.insert(member);//自动完成会员注册
        }
        //5、预约成功，更新当日的已预约人数
        Order order = new Order();
        order.setMemberId(member.getId());//设置会员ID
        order.setOrderDate(DateUtils.parseString2Date(orderDate));//预约日期
        order.setOrderType((String) map.get("orderType"));//预约类型
        order.setOrderStatus(Order.ORDERSTATUS_NO);//到诊状态
        setmealId = (Integer) map.get("setmealId");
        order.setSetmealId(setmealId);//套餐ID
        orderDao.insert(order);

        orderSetting.setReservations(orderSetting.getReservations() + 1);//设置已预约人数+1
        orderSettingDao.editReservationsByOrderDate(orderSetting);

        return new Result(true, MessageConstant.ORDER_SUCCESS, order.getId());
    }

    //保存编辑后的数据
    public void edit(Integer setmealId, Map map) {
        //获取dataEditForm中各个字段的值
        String name = (String) map.get("name");
        String phoneNumber = (String) map.get("phoneNumber");
        Member member = new Member();
        member.setName(name);
        member.setPhoneNumber(phoneNumber);
        memberDao.update(member, Wrappers.lambdaQuery(Member.class).eq(Member::getPhoneNumber, phoneNumber));

        //将编辑页面的字段值重新封装为一个对象
        Order order = new Order();
        String orderDate = (String) map.get("orderDate");
        try {
            order.setOrderDate(DateUtils.parseString2Date(orderDate));
        } catch (Exception e) {
            e.printStackTrace();
        }
        String orderType = (String) map.get("orderType");
        order.setOrderType(orderType);
        String orderStatus = (String) map.get("orderStatus");
        order.setOrderStatus(orderStatus);
        Integer orderId = (Integer) map.get("orderId");
        order.setId(orderId);
        order.setSetmealId(setmealId);
        //执行修改
        orderDao.updateById(order);
    }

    //删除预约
    public void delete(Integer id) {
        orderDao.deleteById(id);
    }

    //修改预约状态
    public void statusEdit(Integer id) {
        Order order = orderDao.findOrderStatesById(id);
        if (order.getOrderStatus().equals("已到诊")) {
            orderDao.editStatus(id);
        } else {
            orderDao.editStatusTo(id);
        }
    }


    /**
     * 后台的预约管理中实现健康管理师的意见的回显
     */
    @Override
    public Order findHealtMessageById(Integer id) {
        return orderDao.findHealtMessageById(id);//返回order中的sport food suggestion第三个属性值封装到order中返回到前端
    }

    /**
     * 编辑用户的就诊状态
     */
    @Override
    public void statusEdit(Integer orderStatusId, Integer orderId) {
        String orderStatus = null;
        if (orderStatusId == 0) {
            orderStatus = "已到诊";
        }
        orderDao.update1(orderStatus, orderId);
    }

    /**
     * 根据会员id查询预约信息
     */
    public List<Map<String, Object>> findOrderByMemberId(Integer id) {
        return orderDao.findOrderByMemberId(id);
    }

    /**
     * 根据orderId更新检查报告
     */
    public Integer updateCheckReport(Integer orderId, Map<String, Map<String, String>> checkReport) {
        Order order = new Order();
        order.setId(orderId);
        order.setCheckReport(checkReport);
        return orderDao.updateById(order);
    }

    /**
     * 根据orderId查询检查报告
     */
    public Map<String, Map<String, String>> findCheckReportByOrderId(Integer orderId) {
        return orderDao.selectById(orderId).getCheckReport();
    }

}
