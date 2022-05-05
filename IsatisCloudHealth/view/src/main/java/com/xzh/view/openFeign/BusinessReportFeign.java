package com.xzh.view.openFeign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@FeignClient(name = "Service", path = "Service/businessReport")
public interface BusinessReportFeign {

    @GetMapping("getBusinessReportData")
    Map<String, Object> getBusinessReportData();

}
