package com.xzh.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Food;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public interface FoodService extends IService<Food> {
    Food findById(Integer id);

    PageResult findPage(QueryPageBean queryPageBean);

    void add(Food food);

    void delete(Integer id);

    void edit(Food food);

    void save(List<Food> foods);

    List<Food> findAll();

}
