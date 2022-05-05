package com.xzh.view.openFeign;

import com.xzh.common.dto.AdviceDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "Service", path = "Service/advice")
public interface AdviceFeign {

    @PostMapping("add")
    void add(@RequestBody AdviceDTO adviceDTO);

}
