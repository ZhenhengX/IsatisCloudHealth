package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xzh.common.pojo.Order;
import org.apache.ibatis.annotations.Mapper;

/**
 * 更新干预方案
 */
@Mapper
public interface AdviceDao extends BaseMapper<Order> {
}
