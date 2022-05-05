package com.xzh.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.CheckGroup;

import java.util.List;

public interface CheckGroupService extends IService<CheckGroup> {
    //新增功能
    void add(CheckGroup checkGroup, Integer[] checkitemIds);

    //分页查询
    PageResult findPage(QueryPageBean queryPageBean);

    //根据id查询
    CheckGroup findById(Integer checkgroupId);

    //根据检查组id查询其所关联的检查项的id
    List<Integer> findCheckitemIdsByCheckgroupId(Integer checkgroupId);

    //编辑
    void edit(CheckGroup checkGroup, Integer[] checkitemIds);

    //删除
    void delete(Integer id);

    //不带分页的查询所有
    List<CheckGroup> findAll();
}
