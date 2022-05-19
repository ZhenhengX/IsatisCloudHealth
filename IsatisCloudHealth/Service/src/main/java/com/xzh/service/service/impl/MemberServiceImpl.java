package com.xzh.service.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xzh.common.constant.MessageConstant;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Member;
import com.xzh.common.pojo.Order;
import com.xzh.common.utils.DateUtils;
import com.xzh.service.dao.MemberDao;
import com.xzh.service.dao.OrderDao;
import com.xzh.service.dao.SetmealDao;
import com.xzh.service.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class MemberServiceImpl extends ServiceImpl<MemberDao, Member> implements MemberService {
    @Autowired
    private MemberDao memberDao;
    @Autowired
    private SetmealDao setMealDao;
    @Autowired
    private OrderDao orderDao;

    // 根据手机号查询会员
    @Override
    public Member findByTelephone(String telephone) {
        Member member = null;
        if (telephone != null) {
            member = memberDao.selectOne(Wrappers.lambdaQuery(Member.class).eq(Member::getPhoneNumber, telephone));
        }
        return member;
    }

    // 根据手机号密码查询会员（登录用）
    public Member findByTelephoneAndPassword(String telephone, String password) {
        LambdaQueryWrapper<Member> lambdaQueryWrapper = Wrappers.lambdaQuery(Member.class);
        lambdaQueryWrapper.eq(Member::getPhoneNumber, telephone);
        lambdaQueryWrapper.eq(Member::getPassword, password);
        return memberDao.selectOne(lambdaQueryWrapper);
    }

    //新增会员
    @Override
    public void add(Member member) {
        if (member != null) {
            memberDao.insert(member);
        }
    }

    @Override
    public List<Integer> findMemberCountByMonths(List<String> months) {
        List<Integer> list = new ArrayList<>();
        if (months != null) {
            for (String month : months) {
                month += ".31";
                Integer count = memberDao.findMemberCountBeforeDate(month);
                list.add(count);
            }
        }
        return list;
    }

    //========================================================================
    //分页查询
    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        //取出QueryPageBean封装的数据
        Integer pageSize = queryPageBean.getPageSize();// 每页面显示的条数
        Integer currentPage = queryPageBean.getCurrentPage();//当前页数
        String queryString = queryPageBean.getQueryString(); //查询条件

        Page<Member> MemberPage = new Page<>(currentPage, pageSize);
        LambdaQueryWrapper<Member> queryWrapper = Wrappers.lambdaQuery(Member.class);
        if (queryString != null && queryString.length() > 0) {
            queryWrapper.like(Member::getFileNumber, queryString);
            queryWrapper.or();
            queryWrapper.like(Member::getName, queryString);
            queryWrapper.or();
            queryWrapper.like(Member::getPhoneNumber, queryString);
        }
        Page<Member> page = this.page(MemberPage, queryWrapper);
        //健康管理师
        List<String> nameList = memberDao.findHealthManager();
        for (Member member : page.getRecords()) {
            //生日换算年龄
            if (member.getBirthday() != null) {
                member.setAge(DateUtils.getAgeByBirth(member.getBirthday()));
            }

            if (member.getHealthmanager() == null) {
                member.setHealthmanager("此会员暂时未绑定健康管理师");
            }

            //如果查询的健康管理师不包含这个会员管理的健康管理师 那么说明此用户健康管理师权限消失
            if ((!nameList.contains(member.getHealthmanager())) && (!member.getHealthmanager().equals("此会员暂时未绑定健康管理师"))) {
                //给出显示信息
                String message = "管理师已失去权限,请更换";
                member.setHealthmanager(message);
            }
        }
        //          每页总条数
        long total = page.getTotal();
        //查询出的Member表数据
        List<Member> result = page.getRecords();

        return new PageResult(total, result);

    }

    /**
     * 查询健康管理师
     */
    @Override
    public List<Map<String, Object>> findHealthManager() {
        List<String> nameList = memberDao.findHealthManager();
        List<Map<String, Object>> list = new ArrayList<>();
        for (String name : nameList) {
            Map<String, Object> map = new HashMap<>();
            map.put("value", name);
            list.add(map);
        }

        return list;
    }

    @Override
    public void addMember(Member member) {
        memberDao.insert(member);
    }

    //编辑修改会员信息
    @Override
    public Member findMemberById(Integer memberId) {
        return memberDao.selectById(memberId);
    }

    /**
     * 此方法与前端公用  注意!!!!!!!!!!!!!
     */
    @Override
    public void editMember(Member member) {
        //修改会员表里的内容
        memberDao.updateById(member);
    }

    @Override
    public Result deleteMember(Integer id) {
        List<Order> orders = orderDao.findOrderById(id);
        if (orders.size() == 0) {
            memberDao.deleteById(id);
            return new Result(true, MessageConstant.DELETE_MEMBER_SUCCESS);
        } else {
            //根据id查询套餐
            //返回信息的拼接
            StringBuilder message = new StringBuilder();
            message.append("删除失败,此会员有预约:");
            //套餐姓名
            List<String> setmeals = null;
            for (Order order : orders) {
                //查询获取套餐信息
                setmeals = setMealDao.findSetmealNameById(order.getSetmealId());
                if (order.getOrderType() != null) {
                    message.append(order.getOrderType()).append(",");
                }
            }

            if (setmeals != null) {
                for (String setmeal : setmeals) {
                    //套餐信息添加
                    message.append(setmeal).append(",");
                }
            }
            return new Result(false, message.toString());
        }


    }

    @Override
    public List<String> findAllmessageById(Integer id) {
        //查询所有关联信息
        List<Map<String, Object>> list = memberDao.findAllmessageById(id);
        //查询机构地址

        Set<String> setmealSet = new HashSet<>();
        Set<String> checkgrouplSet = new HashSet<>();
        Set<String> checkitemsSet = new HashSet<>();
        Set<String> addressSet = new HashSet<>();

        for (Map<String, Object> map : list) {
            //取出需要的字段名称
            String setmeal = (String) map.get("setmeal");
            String checkgroup = (String) map.get("checkgroups");
            String checkitems = (String) map.get("checkitems");
            String address = (String) map.get("address");
            //添加到各自的集合中
            setmealSet.add(setmeal);
            checkgrouplSet.add(checkgroup);
            checkitemsSet.add(checkitems);
            addressSet.add(address);
        }
        //存入集合返回
        List<String> list1 = new ArrayList<>();
        //判断套餐是否为空
        if (setmealSet.toString().equals("[]")) {
            list1.add("");
        } else {
            String setmeal = setmealSet.toString().substring(1, setmealSet.toString().indexOf(']'));
            list1.add(setmeal);
        }
        //判断检查组是否为空
        if (checkgrouplSet.toString().equals("[]")) {
            list1.add("");
        } else {
            list1.add(checkgrouplSet.toString().substring(1, checkgrouplSet.toString().indexOf(']')));
        }
        //判断检查项是否为空
        if (checkitemsSet.toString().equals("[]")) {
            list1.add("");
        } else {
            list1.add(checkitemsSet.toString().substring(1, checkitemsSet.toString().indexOf(']')));
        }
        //判断地址是否为空
        if (addressSet.toString().equals("[]")) {
            list1.add("");
        } else {
            list1.add(addressSet.toString().substring(1, addressSet.toString().indexOf(']')));
        }

        return list1;
    }

    @Override
    public Member findByEmailAndPwd(String email, String md5_password) {
        return memberDao.findByEmailAndPwd(email, md5_password);
    }

    @Override
    public void editEmail(Member member) {
        memberDao.updateById(member);
    }

    @Override
    public void editPhoneNumber(Member member) {
        memberDao.updateById(member);
    }

    @Override
    public void editPassword(Member member) {
        memberDao.updateById(member);
    }
}
