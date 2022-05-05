package com.xzh.service.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Sport;
import com.xzh.service.dao.SportDao;
import com.xzh.service.service.SportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 运动管理
 */
@Service
@Transactional
public class SportServiceImpl extends ServiceImpl<SportDao, Sport> implements SportService {
    @Autowired
    private SportDao sportDao;

    //分页查询
    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();

        PageHelper.startPage(currentPage, pageSize);
        Page<Sport> page = sportDao.selectByCondition(queryString);
        long total = page.getTotal();
        List<Sport> rows = page.getResult();

        return new PageResult(total, rows);
    }

    @Override
    public void add(Sport sport) {
        sportDao.insert(sport);
    }

    @Override
    public Sport findById(Integer id) {
        return sportDao.selectById(id);
    }

    @Override
    public void edit(Sport sport) {
        sportDao.updateById(sport);
    }

    @Override
    public void delete(Integer id) {
        sportDao.deleteById(id);
    }

    @Override
    public List<Sport> findAll() {
        return this.list();
    }

    @Override
    //批量导入 去重复的方法
    public void save(List<Sport> sports) {
        //todo 如果输入的食物信息已经存在，则实现更新操作，如果输入存在则直接执行插入操作
        if (sports != null && sports.size() > 0) {
            for (Sport sport : sports) {
                //检查输入的食物是否存在
                int count = sportDao.findCountSportName(sport);
                if (count > 0) {
                    //修改信息
                    sportDao.updateById(sport);
                } else {
                    //插入信息
                    sportDao.insert(sport);
                }
            }
        }
    }
}
