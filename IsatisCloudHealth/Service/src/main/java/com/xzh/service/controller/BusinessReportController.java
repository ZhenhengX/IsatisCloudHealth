package com.xzh.service.controller;

import com.xzh.service.service.BusinessReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("Service/businessReport")
public class BusinessReportController {

    @Autowired
    private BusinessReportService businessReportService;

    @GetMapping("getBusinessReportData")
    public Map<String, Object> getBusinessReportData() throws Exception {
        return businessReportService.getBusinessReportData();
    }

}
