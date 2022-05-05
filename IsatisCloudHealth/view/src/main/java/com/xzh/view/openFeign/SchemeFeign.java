package com.xzh.view.openFeign;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Scheme;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

@FeignClient(name = "Service", path = "Service/scheme")
public interface SchemeFeign {

    @GetMapping("findPage")
    PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    @PostMapping("add")
    void add(@RequestBody Scheme scheme);

    @GetMapping("findById/{id}")
    Scheme findById(@PathVariable("id") Integer id);

    @PutMapping("edit")
    void edit(@RequestBody Scheme scheme);

    @DeleteMapping("delete/{id}")
    void delete(@PathVariable("id") Integer id);

}
