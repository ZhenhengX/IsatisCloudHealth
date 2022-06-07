package com.xzh.wechat.controller;

import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Order;
import com.xzh.wechat.openFeign.OrderFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderFeign orderFeign;

    @RequestMapping("/submit")
    public Result submit(@RequestBody Map dataMap) {
        try {
            return orderFeign.submit(dataMap);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "预约失败");
        }
    }

    @RequestMapping("/findOrderByMemberId/{id}")
    public Result findOrderByMemberId(@PathVariable String id) {
        return new Result(true, orderFeign.findOrderByMemberId(Integer.parseInt(id)));
    }

    @GetMapping("findAllById/{id}")
    public Order findAllById(@PathVariable Integer id) {
        return orderFeign.findAllById(id);
    }

    /**
     * <p>根据orderId查询检查报告</p>
     */
    @RequestMapping("findCheckReportByOrderId/{orderId}")
    public Result findCheckReportByOrderId(@PathVariable Integer orderId) {
        List<Map<String, String>> checkReport = orderFeign.findCheckReportByOrderId(orderId);
        if (checkReport != null && checkReport.size() > 0) {
            return new Result(true, checkReport);
        }
        return new Result(false);
    }
}
