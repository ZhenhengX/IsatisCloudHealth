package com.xzh.service.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xzh.common.pojo.Food;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FoodDao extends BaseMapper<Food> {
}
