package com.xzh.service.service;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;

public interface BookingService {
    //分页查询
    PageResult findPage(QueryPageBean queryPageBean);

}
