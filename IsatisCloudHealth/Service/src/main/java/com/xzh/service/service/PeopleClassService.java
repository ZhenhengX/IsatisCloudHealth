package com.xzh.service.service;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;

public interface PeopleClassService {
    PageResult findPage(QueryPageBean queryPageBean);
}
