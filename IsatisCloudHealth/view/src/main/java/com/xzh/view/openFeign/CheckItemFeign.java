package com.xzh.view.openFeign;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.CheckItem;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@FeignClient(name = "Service", path = "Service/checkItem")
public interface CheckItemFeign {

    //新增功能
    @PostMapping("add")
    void add(@RequestBody CheckItem checkItem);

    //分页查询
    @GetMapping("findPage")
    PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    //根据id删除
    @DeleteMapping("deleteById/{id}")
    void deltetByid(@PathVariable("id") Integer id);

    //编辑
    @PutMapping("edit")
    void edit(@RequestBody CheckItem checkItem);

    //不带分页的查询所有
    @GetMapping("findAll")
    List<CheckItem> findAll();

}
