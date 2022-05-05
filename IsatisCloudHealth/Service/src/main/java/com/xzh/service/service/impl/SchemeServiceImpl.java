package com.xzh.service.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Scheme;
import com.xzh.service.dao.SchemeDao;
import com.xzh.service.service.SchemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 干预方案
 */
@Service
@Transactional
public class SchemeServiceImpl extends ServiceImpl<SchemeDao, Scheme> implements SchemeService {
    @Autowired
    private SchemeDao schemeDao;

    //分页查询
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();

        PageHelper.startPage(currentPage, pageSize);
        Page<Scheme> page = schemeDao.selectByCondition(queryString);
        long total = page.getTotal();
        List<Scheme> rows = page.getResult();

        return new PageResult(total, rows);
    }

    //添加
    public void add(Scheme scheme) {
        schemeDao.insert(scheme);
    }

    //根据id查询 实现数据回显
    public Scheme findById(Integer id) {
        return schemeDao.selectById(id);
    }

    //修改
    public void edit(Scheme scheme) {
        schemeDao.updateById(scheme);
    }

    //删除
    public void delete(Integer id) {
        schemeDao.deleteById(id);
    }
}
