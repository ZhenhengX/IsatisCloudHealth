package com.xzh.view.openFeign;

import com.xzh.common.pojo.OrderSetting;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@FeignClient(name = "Service", path = "Service/orderSetting")
public interface OrderSettingFeign {

    //存储时期和对应的最大预约人数
    @PostMapping("add")
    void add(@RequestBody List<OrderSetting> orderSettings);

    //根据月份查询预约数据
    @GetMapping("getOrderSettingByMonth/{date}")
    List<Map> getOrderSettingByMonth(@PathVariable("date") String date);

    //根据日期修改预约信息
    @PutMapping("editOrderSettingByDate")
    void editOrderSettingByDate(@RequestBody OrderSetting orderSetting);

}
