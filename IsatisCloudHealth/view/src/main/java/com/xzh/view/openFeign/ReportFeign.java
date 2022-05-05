package com.xzh.view.openFeign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.Map;

@FeignClient(name = "Service", path = "Service/report")
public interface ReportFeign {

    @GetMapping("getBusinessReportData")
    Map<String, Object> getBusinessReportData() throws Exception;

    @GetMapping("findOrderByMonth")
    List<Integer> findOrderByMonth(@RequestBody List<String> yearAndMonth) throws Exception;

    @GetMapping("findSetmealMoney")
    List<Map> findSetmealMoney();

    @GetMapping("getMemberAgeReport")
    Map<String, Object> getMemberAgeReport();

    @GetMapping("findArriveByMonth")
    List<Integer> findArriveByMonth(@RequestBody List<String> yearAndMonth) throws Exception;

}
