package com.xzh.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Sport;

import java.util.List;

public interface SportService extends IService<Sport> {
    PageResult findPage(QueryPageBean queryPageBean);

    void add(Sport sport);

    Sport findById(Integer id);

    void edit(Sport sport);

    void delete(Integer id);

    List<Sport> findAll();

    void save(List<Sport> sports);
}
