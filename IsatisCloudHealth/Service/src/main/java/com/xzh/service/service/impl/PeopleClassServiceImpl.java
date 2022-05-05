package com.xzh.service.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.PeopleClass;
import com.xzh.service.dao.PeopleClassDao;
import com.xzh.service.service.PeopleClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PeopleClassServiceImpl implements PeopleClassService {

    @Autowired
    private PeopleClassDao peopleClassDao;

    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();

        PageHelper.startPage(currentPage, pageSize);
        Page<PeopleClass> page = peopleClassDao.selectByCondition(queryString);
        long total = page.getTotal();
        List<PeopleClass> rows = page.getResult();

        return new PageResult(total, rows);
    }
}
