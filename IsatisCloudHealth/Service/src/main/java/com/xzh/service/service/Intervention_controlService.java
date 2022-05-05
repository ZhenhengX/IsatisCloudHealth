package com.xzh.service.service;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import org.springframework.web.bind.annotation.RequestBody;

public interface Intervention_controlService {
    PageResult findPage(QueryPageBean queryPageBean);

}
