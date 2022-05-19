package com.xzh.service.controller;

import com.xzh.common.entity.Conditions;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Order;
import com.xzh.service.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("Service/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    // 体检预约
    @PostMapping("order")
    public Result order(@RequestBody Map map) throws Exception {
        return orderService.order(map);
    }

    @PostMapping("submit")
    public Result submit(@RequestBody Map dataMap) {
        return orderService.submit(dataMap);
    }

    @GetMapping("findById/{id}")
    public Map findById(@PathVariable Integer id) throws Exception {
        return orderService.findById(id);
    }

    @GetMapping("findByMemberIdWithCondition/{memberId}")
    public List<Order> findByMemberIdWithCondition(@PathVariable Integer memberId) {
        return orderService.findByMemberIdWithCondition(memberId);
    }

    @GetMapping("findAll4OrderAndSetmeal/{memberId}")
    public List<Map> findAll4OrderAndSetmeal(@PathVariable Integer memberId) {
        return orderService.findAll4OrderAndSetmeal(memberId);
    }

    @GetMapping("findSetmealByIdAndDate/{memberId}/{startDate}/{endDate}/{setmealName}")
    public List<Map> findSetmealByIdAndDate(@PathVariable Integer memberId, @PathVariable String startDate, @PathVariable String endDate, @PathVariable String setmealName) {
        return orderService.findSetmealByIdAndDate(memberId, startDate, endDate, setmealName);
    }

    @GetMapping("findAllDataByOrderId/{orderId}")
    public Map findAllDataByOrderId(@PathVariable Integer orderId) {
        return orderService.findAllDataByOrderId(orderId);
    }

    // 分页查询
    @GetMapping("findByPageAndCondition")
    public PageResult findByPageAndCondition(@RequestBody Conditions conditions) {
        return orderService.findByPageAndCondition(conditions);
    }

    // 编辑操作，先查询点击对象的id
    @GetMapping("findOrderById/{id}")
    public Map findOrderById(@PathVariable Integer id) {
        return orderService.findOrderById(id);
    }

    // 通过订单id查询套餐id
    @GetMapping("findSetmealIdsByOrderId/{id}")
    public List<Integer> findSetmealIdsByOrderId(@PathVariable Integer id) {
        return orderService.findSetmealIdsByOrderId(id);
    }

    // 新增预约
    @PostMapping("addPhoneOrder")
    public Result addPhoneOrder(@RequestBody Map map) throws Exception {
        return orderService.addPhoneOrder(map);
    }

    // 保存编辑后的数据
    @PutMapping("edit/{setmealId}")
    public void edit(@PathVariable Integer setmealId, @RequestBody Map map) {
        orderService.edit(setmealId, map);
    }

    // 删除预约
    @DeleteMapping("delete/{id}")
    public void delete(@PathVariable Integer id) {
        orderService.delete(id);
    }

    // 修改预约状态
    @PutMapping("statusEdit/{id}")
    public void statusEdit(@PathVariable Integer id) {
        orderService.statusEdit(id);
    }

    // 根据订单id，返回干预信息
    @GetMapping("findHealtMessageById/{id}")
    public Order findHealtMessageById(@PathVariable Integer id) {
        return orderService.findHealtMessageById(id);
    }

    // 修改就诊状态
    @PutMapping("statusEdit/{orderStatusId}/{orderId}")
    public void statusEdit(@PathVariable Integer orderStatusId, @PathVariable Integer orderId) {
        orderService.statusEdit(orderStatusId, orderId);
    }

    @GetMapping("findOrderByMemberId/{id}")
    public List<Map<String, Object>> findOrderByMemberId(@PathVariable Integer id) {
        return orderService.findOrderByMemberId(id);
    }

    /**
     * 根据会员id查询预约信息
     */
    @GetMapping("findAllById/{id}")
    public Order findAllById(@PathVariable Integer id) {
        return orderService.getById(id);
    }

    /**
     * 根据orderId更新检查报告
     */
    @PutMapping("updateCheckReport/{orderId}")
    public Integer updateCheckReport(@PathVariable Integer orderId, @RequestBody Map<String, Map<String, String>> checkReport) {
        return orderService.updateCheckReport(orderId, checkReport);
    }

    /**
     * 根据orderId查询检查报告
     */
    @GetMapping("findCheckReportByOrderId/{orderId}")
    public Map<String, Map<String, String>> findCheckReportByOrderId(@PathVariable Integer orderId) {
        return orderService.findCheckReportByOrderId(orderId);
    }
}
