package com.xzh.service.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xzh.common.entity.CheckItemDeleteException;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.CheckItem;
import com.xzh.service.dao.CheckItemDao;
import com.xzh.service.service.CheckItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CheckItemServiceImpl extends ServiceImpl<CheckItemDao, CheckItem> implements CheckItemService {
    @Autowired
    private CheckItemDao checkItemDao;

    //新增功能
    @Override
    public void add(CheckItem checkItem) {
        checkItemDao.insert(checkItem);
    }

    //分页查询
    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();
        //使用分页插件分页查询
        PageHelper.startPage(currentPage, pageSize);
        //调用持久层查询所有
        Page<CheckItem> page = checkItemDao.selectByCondition(queryString);
        //获取总共查询到的条目数
        long total = page.getTotal();
        //获取查询结果
        List<CheckItem> rows = page.getResult();
        return new PageResult(total, rows);
    }

    //根据id删除
    @Override
    public void deltetByid(Integer id) throws CheckItemDeleteException {
        //先查询有无关联关系
        long count = checkItemDao.findCountCheckItemID(id);
        //如何有关联关系不进行删除操作
        if (count > 0) {
            throw new CheckItemDeleteException();
        }
        //如果没有关联关系直接执行删除操作
        checkItemDao.deleteById(id);
    }

    //编辑
    @Override
    public void edit(CheckItem checkItem) {
        checkItemDao.updateById(checkItem);
    }

    //不带分页的查询所有
    @Override
    public List<CheckItem> findAll() {
        return this.list();
    }

}
