package com.xzh.view.openFeign;

import com.xzh.common.dto.CheckGroupDTO;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.CheckGroup;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@FeignClient(name = "Service", path = "Service/checkGroup")
public interface CheckGroupFeign {

    //新增功能
    @PostMapping("add")
    void add(@RequestBody CheckGroupDTO checkGroupDTO);

    //分页查询
    @GetMapping("findPage")
    PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    //根据id查询
    @GetMapping("findById/{checkgroupId}")
    CheckGroup findById(@PathVariable("checkgroupId") Integer checkgroupId);

    //根据检查组id查询其所关联的检查项的id
    @GetMapping("findCheckitemIdsByCheckgroupId/{checkgroupId}")
    List<Integer> findCheckitemIdsByCheckgroupId(@PathVariable("checkgroupId") Integer checkgroupId);

    //编辑
    @PutMapping("edit")
    void edit(@RequestBody CheckGroupDTO checkGroupDTO);

    //删除
    @DeleteMapping("delete/{id}")
    void delete(@PathVariable("id") Integer id);

    //不带分页的查询所有
    @GetMapping("findAll")
    List<CheckGroup> findAll();

}
