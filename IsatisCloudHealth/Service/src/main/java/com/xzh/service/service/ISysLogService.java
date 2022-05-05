package com.xzh.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Syslog;

import java.text.ParseException;

public interface ISysLogService extends IService<Syslog> {
    void saveLog(Syslog syslog); //保存日志

    PageResult findAll(QueryPageBean queryPageBean) throws ParseException;//查询所有日志

    void deleteById(String id);

    void deleteByIds(String[] id);
}
