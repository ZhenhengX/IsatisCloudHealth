package com.xzh.service.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Food;
import com.xzh.service.dao.FoodDao;
import com.xzh.service.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 饮食管理
 */
@Service
@Transactional
public class FoodServiceImpl extends ServiceImpl<FoodDao, Food> implements FoodService {
    @Autowired
    private FoodDao foodDao;


    // 分页查询食品库
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();

        Page<Food> foodPage = new Page<>(currentPage, pageSize);
        LambdaQueryWrapper<Food> queryWrapper = Wrappers.lambdaQuery(Food.class);
        if (queryString != null && queryString.length() > 0) {
            queryWrapper.like(Food::getId, queryString);
            queryWrapper.or();
            queryWrapper.like(Food::getFoodname, queryString);
        }
        Page<Food> page = this.page(foodPage, queryWrapper);

        long total = page.getTotal();
        List<Food> rows = page.getRecords();
        return new PageResult(total, rows);
    }

    // 新增饮食管理
    public void add(Food food) {
        foodDao.insert(food);
    }

    // 根据id查询 - 实现数据回显
    public Food findById(Integer id) {
        return foodDao.selectById(id);
    }

    // 删除
    public void delete(Integer id) {
        foodDao.deleteById(id);
    }

    // 更新
    public void edit(Food food) {
        foodDao.updateById(food);
    }

    // 批量导入 去重复的方法
    public void save(List<Food> foods) {
        // 如果输入的食物信息已经存在，则实现更新操作，如果输入的事务不存在则直接执行插入操作
        this.saveOrUpdateBatch(foods);
    }

    @Override
    public List<Food> findAll() {
        return this.list();
    }
}
