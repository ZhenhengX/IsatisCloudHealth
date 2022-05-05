package com.xzh.service.controller;

import com.xzh.common.pojo.OrderSetting;
import com.xzh.service.service.OrderSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("Service/orderSetting")
public class OrderSettingController {

    @Autowired
    private OrderSettingService orderSettingService;

    //存储时期和对应的最大预约人数
    @PostMapping("add")
    public void add(@RequestBody List<OrderSetting> orderSettings) {
        orderSettingService.add(orderSettings);
    }

    //根据月份查询预约数据
    @GetMapping("getOrderSettingByMonth/{date}")
    public List<Map> getOrderSettingByMonth(@PathVariable String date) {
        return orderSettingService.getOrderSettingByMonth(date);
    }

    //根据日期修改预约信息
    @PutMapping("editOrderSettingByDate")
    public void editOrderSettingByDate(@RequestBody OrderSetting orderSetting) {
        orderSettingService.editOrderSettingByDate(orderSetting);
    }

}
