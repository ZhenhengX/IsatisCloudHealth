package com.xzh.view.controller;

import com.xzh.common.constant.MessageConstant;
import com.xzh.common.dto.CheckGroupDTO;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.CheckGroup;
import com.xzh.view.openFeign.CheckGroupFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/checkgroup")
public class CheckGroupController {
    @Autowired
    private CheckGroupFeign checkGroupService;

    //新增
    @PreAuthorize("hasAuthority('CHECKGROUP_ADD')")//权限校验
    @RequestMapping("/add")
    public Result add(@RequestBody CheckGroup checkGroup, Integer[] checkitemIds) {
        try {
            CheckGroupDTO checkGroupDTO = new CheckGroupDTO(checkGroup, checkitemIds);
            checkGroupService.add(checkGroupDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.ADD_CHECKGROUP_FAIL);
        }
        return new Result(true, MessageConstant.ADD_CHECKGROUP_SUCCESS);
    }

    //查询所有(分页查询)
    @PreAuthorize("hasAuthority('CHECKGROUP_QUERY')")//权限校验
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return checkGroupService.findPage(queryPageBean);
    }

    //根据id查询
    @RequestMapping("/findById")
    public Result findById(Integer checkgroupId) {
        CheckGroup checkGroup;
        try {
            checkGroup = checkGroupService.findById(checkgroupId);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_CHECKGROUP_FAIL);
        }
        return new Result(true, MessageConstant.QUERY_CHECKGROUP_SUCCESS, checkGroup);
    }

    //根据检查组ID查询其所关联的检查项ID
    @RequestMapping("/findCheckitemIdsByCheckgroupId")
    public Result findCheckitemIdsByCheckgroupId(Integer checkgroupId) {
        try {
            List<Integer> data = checkGroupService.findCheckitemIdsByCheckgroupId(checkgroupId);
            return new Result(true, MessageConstant.QUERY_CHECKITEM_SUCCESS, data);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_CHECKITEM_FAIL);
        }
    }

    //编辑
    @PreAuthorize("hasAuthority('CHECKGROUP_EDIT')")//权限校验
    @RequestMapping("/edit")
    public Result edit(@RequestBody CheckGroup checkGroup, Integer[] checkitemIds) {
        try {
            CheckGroupDTO checkGroupDTO = new CheckGroupDTO(checkGroup, checkitemIds);
            checkGroupService.edit(checkGroupDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.EDIT_CHECKGROUP_FAIL);
        }
        return new Result(true, MessageConstant.EDIT_CHECKGROUP_SUCCESS);
    }

    //删除
    @PreAuthorize("hasAuthority('CHECKGROUP_DELETE')")//权限校验
    @RequestMapping("/delete")
    public Result delete(Integer id) {
        try {
            checkGroupService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.DELETE_CHECKGROUP_FAIL);
        }
        return new Result(true, MessageConstant.DELETE_CHECKGROUP_SUCCESS);
    }

    //不带分页的查询所有
    @RequestMapping("/findAll")
    public Result findAll() {
        try {
            List<CheckGroup> data = checkGroupService.findAll();
            return new Result(true, MessageConstant.QUERY_CHECKGROUP_SUCCESS, data);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_CHECKGROUP_FAIL);
        }
    }
}
