package com.xzh.view.openFeign;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Sport;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@FeignClient(name = "Service", path = "Service/sport")
public interface SportFeign {

    @GetMapping("findPage")
    PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    @PostMapping("add")
    void add(@RequestBody Sport sport);

    @GetMapping("findById/{id}")
    Sport findById(@PathVariable("id") Integer id);

    @PutMapping("edit")
    void edit(@RequestBody Sport sport);

    @DeleteMapping("delete/{id}")
    void delete(@PathVariable("id") Integer id);

    @GetMapping("findAll")
    List<Sport> findAll();

    @PostMapping("save")
    void save(@RequestBody List<Sport> sports);

}
