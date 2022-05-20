package com.xzh.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.common.entity.Conditions;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Order;

import java.util.List;
import java.util.Map;

public interface OrderService extends IService<Order> {
    //体检预约
    Result order(Map map) throws Exception;

    Result submit(Map dataMap);

    Map findById(Integer id) throws Exception;

    List<Order> findByMemberIdWithCondition(Integer memberId);

    List<Map> findAll4OrderAndSetmeal(Integer memberId);

    List<Map> findSetmealByIdAndDate(Integer memberId, String startDate, String endDate, String setmealName);

    Map findAllDataByOrderId(Integer orderId);

    //分页查询
    PageResult findByPageAndCondition(Conditions conditions);

    //编辑操作，先查询点击对象的id
    Map findOrderById(Integer id);

    //通过订单id查询套餐id
    List<Integer> findSetmealIdsByOrderId(Integer id);

    //新增预约
    Result addPhoneOrder(Map map) throws Exception;

    //保存编辑后的数据
    void edit(Integer setmealId, Map map);

    //删除预约
    void delete(Integer id);

    //修改预约状态
    void statusEdit(Integer id);

    /**
     * 根据订单id，返回干预信息
     */
    Order findHealtMessageById(Integer id);

    /**
     * 修改就诊状态
     */
    void statusEdit(Integer orderStatusId, Integer orderId);

    /**
     * 根据会员id查询预约信息
     */
    List<Map<String, Object>> findOrderByMemberId(Integer id);

    /**
     * 根据orderId更新检查报告
     */
    Integer updateCheckReport(Integer orderId, List<Map<String, String>> checkReport);

    /**
     * 根据orderId查询检查报告
     */
    List<Map<String, String>> findCheckReportByOrderId(Integer orderId);


    Order findOrderAllById(Integer id);
}
