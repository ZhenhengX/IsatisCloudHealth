package com.xzh.service.controller;

import com.xzh.common.dto.CheckGroupDTO;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.CheckGroup;
import com.xzh.service.service.CheckGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("Service/checkGroup")
public class CheckGroupController {

    @Autowired
    private CheckGroupService checkGroupService;

    //新增功能
    @PostMapping("add")
    public void add(@RequestBody CheckGroupDTO checkGroupDTO) {
        checkGroupService.add(checkGroupDTO.getCheckGroup(), checkGroupDTO.getCheckitemIds());
    }

    //分页查询
    @GetMapping("findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return checkGroupService.findPage(queryPageBean);
    }

    //根据id查询
    @GetMapping("findById/{checkgroupId}")
    public CheckGroup findById(@PathVariable Integer checkgroupId) {
        return checkGroupService.findById(checkgroupId);
    }

    //根据检查组id查询其所关联的检查项的id
    @GetMapping("findCheckitemIdsByCheckgroupId/{checkgroupId}")
    public List<Integer> findCheckitemIdsByCheckgroupId(@PathVariable Integer checkgroupId) {
        return checkGroupService.findCheckitemIdsByCheckgroupId(checkgroupId);
    }

    //编辑
    @PutMapping("edit")
    public void edit(@RequestBody CheckGroupDTO checkGroupDTO) {
        checkGroupService.edit(checkGroupDTO.getCheckGroup(), checkGroupDTO.getCheckitemIds());
    }

    //删除
    @DeleteMapping("delete/{id}")
    public void delete(@PathVariable Integer id) {
        checkGroupService.delete(id);
    }

    //不带分页的查询所有
    @GetMapping("findAll")
    public List<CheckGroup> findAll() {
        return checkGroupService.findAll();
    }

}
