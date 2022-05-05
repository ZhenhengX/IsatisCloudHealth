package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xzh.common.pojo.Syslog;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ISysLogDao extends BaseMapper<Syslog> {
}