package com.xzh.wechat.openFeign;

import com.xzh.common.entity.Conditions;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Order;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@FeignClient(name = "Service", path = "Service/order")
public interface OrderFeign {

    // 体检预约
    @PostMapping("order")
    Result order(@RequestBody Map map);

    @PostMapping("submit")
    Result submit(@RequestBody Map dataMap);

    @GetMapping("findById/{id}")
    Map findById(@PathVariable("id") Integer id);

    @GetMapping("findByMemberIdWithCondition/{memberId}")
    List<Order> findByMemberIdWithCondition(@PathVariable("memberId") Integer memberId);

    @GetMapping("findAll4OrderAndSetmeal/{memberId}")
    List<Map> findAll4OrderAndSetmeal(@PathVariable("memberId") Integer memberId);

    @GetMapping("findSetmealByIdAndDate/{memberId}/{startDate}/{endDate}/{setmealName}")
    List<Map> findSetmealByIdAndDate(@PathVariable("memberId") Integer memberId, @PathVariable("startDate") String startDate, @PathVariable("endDate") String endDate, @PathVariable("setmealName") String setmealName);

    @GetMapping("findAllDataByOrderId/{orderId}")
    Map findAllDataByOrderId(@PathVariable("orderId") Integer orderId);

    // 分页查询
    @GetMapping("findByPageAndCondition")
    PageResult findByPageAndCondition(@RequestBody Conditions conditions);

    // 编辑操作，先查询点击对象的id
    @GetMapping("findOrderById/{id}")
    Map findOrderById(@PathVariable("id") Integer id);

    // 通过订单id查询套餐id
    @GetMapping("findSetmealIdsByOrderId/{id}")
    List<Integer> findSetmealIdsByOrderId(@PathVariable("id") Integer id);

    // 新增预约
    @PostMapping("addPhoneOrder")
    Result addPhoneOrder(@RequestBody Map map) throws Exception;

    // 保存编辑后的数据
    @PutMapping("edit/{setmealId}")
    void edit(@PathVariable("setmealId") Integer setmealId, @RequestBody Map map);

    // 删除预约
    @DeleteMapping("delete/{id}")
    void delete(@PathVariable("id") Integer id);

    // 修改预约状态
    @PutMapping("statusEdit/{id}")
    void statusEdit(@PathVariable("id") Integer id);

    // 根据订单id，返回干预信息
    @GetMapping("findHealtMessageById/{id}")
    Order findHealtMessageById(@PathVariable("id") Integer id);

    // 修改就诊状态
    @PutMapping("statusEdit/{orderStatusId}/{orderId}")
    void statusEdit(@PathVariable("orderStatusId") Integer orderStatusId, @PathVariable("orderId") Integer orderId);

    @GetMapping("findOrderByMemberId/{id}")
    List<Map<String, Object>> findOrderByMemberId(@PathVariable("id") Integer id);

    @GetMapping("findAllById/{id}")
    Order findAllById(@PathVariable("id") Integer id);

    /**
     * 根据orderId查询检查报告
     */
    @GetMapping("findCheckReportByOrderId/{orderId}")
    List<Map<String, String>> findCheckReportByOrderId(@PathVariable("orderId") Integer orderId);

}
