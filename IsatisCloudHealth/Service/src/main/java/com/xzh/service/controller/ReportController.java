package com.xzh.service.controller;

import com.xzh.service.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("Service/report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("getBusinessReportData")
    public Map<String, Object> getBusinessReportData() throws Exception {
        return reportService.getBusinessReportData();
    }

    @GetMapping("findOrderByMonth")
    public List<Integer> findOrderByMonth(@RequestBody List<String> yearAndMonth) throws Exception {
        return reportService.findOrderByMonth(yearAndMonth);
    }

    @GetMapping("findSetmealMoney")
    public List<Map> findSetmealMoney() {
        return reportService.findSetmealMoney();
    }

    @GetMapping("getMemberAgeReport")
    public Map<String, Object> getMemberAgeReport() {
        return reportService.getMemberAgeReport();
    }

    @GetMapping("findArriveByMonth")
    public List<Integer> findArriveByMonth(@RequestBody List<String> yearAndMonth) throws Exception {
        return reportService.findArriveByMonth(yearAndMonth);
    }

}
