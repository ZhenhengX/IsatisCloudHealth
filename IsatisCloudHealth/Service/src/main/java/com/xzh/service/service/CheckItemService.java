package com.xzh.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.common.entity.CheckItemDeleteException;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.CheckItem;

import java.util.List;

public interface CheckItemService extends IService<CheckItem> {
    //新增功能
    void add(CheckItem checkItem);

    //分页查询
    PageResult findPage(QueryPageBean queryPageBean);

    //根据id删除
    void deltetByid(Integer id) throws CheckItemDeleteException;

    //编辑
    void edit(CheckItem checkItem);

    //不带分页的查询所有
    List<CheckItem> findAll();
}
