package com.xzh.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Scheme;

public interface SchemeService extends IService<Scheme> {
    PageResult findPage(QueryPageBean queryPageBean);

    void add(Scheme scheme);

    Scheme findById(Integer id);

    void edit(Scheme scheme);

    void delete(Integer id);
}
