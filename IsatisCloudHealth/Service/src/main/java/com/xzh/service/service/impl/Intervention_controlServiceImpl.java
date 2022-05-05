package com.xzh.service.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Member;
import com.xzh.service.dao.Intervention_controlDao;
import com.xzh.service.service.Intervention_controlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class Intervention_controlServiceImpl implements Intervention_controlService {
    @Autowired
    private Intervention_controlDao intervention_controlDao;

    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();

        PageHelper.startPage(currentPage, pageSize);
        Page<Member> page = intervention_controlDao.selectIntervenByCondition(queryString);
        long total = page.getTotal();
        List<Member> rows = page.getResult();

        return new PageResult(total, rows);
    }

}
