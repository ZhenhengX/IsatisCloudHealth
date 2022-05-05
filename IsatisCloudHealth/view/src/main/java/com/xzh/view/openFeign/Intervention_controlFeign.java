package com.xzh.view.openFeign;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "Service", path = "Service/intervention")
public interface Intervention_controlFeign {

    @GetMapping("findPage")
    PageResult findPage(@RequestBody QueryPageBean queryPageBean);

}
