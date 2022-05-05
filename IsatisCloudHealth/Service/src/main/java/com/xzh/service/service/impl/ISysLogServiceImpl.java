package com.xzh.service.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Syslog;
import com.xzh.service.dao.ISysLogDao;
import com.xzh.service.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;

@Service
public class ISysLogServiceImpl extends ServiceImpl<ISysLogDao, Syslog> implements ISysLogService {

    @Autowired
    private ISysLogDao iSysLogDao;

    public void saveLog(Syslog syslog) {//保存日志
        iSysLogDao.insert(syslog);
    }


    public PageResult findAll(QueryPageBean queryPageBean) throws ParseException {
        //获取前端传入的数据
        Integer pageSize = queryPageBean.getPageSize();
        Integer currentPage = queryPageBean.getCurrentPage();
        String queryString = queryPageBean.getQueryString();
        //进行分页查询
        Page<Syslog> syslogPage = new Page<>(currentPage, pageSize);
        LambdaQueryWrapper<Syslog> queryWrapper = Wrappers.lambdaQuery(Syslog.class);
        queryWrapper.like(queryString != null && queryString.length() > 0, Syslog::getUsername, queryString);
        Page<Syslog> page = this.page(syslogPage, queryWrapper);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        for (Syslog syslog : page.getRecords()) {
            String dateFormat = simpleDateFormat.format(syslog.getVisitTime());
            syslog.setVisitTime(simpleDateFormat.parse(dateFormat));
        }
        return new PageResult(page.getTotal(), page.getRecords());
    }

    /**
     * 通过id删除
     */
    public void deleteById(String id) {
        iSysLogDao.deleteById(id);
    }

    /**
     * 通过id批量删除
     */
    public void deleteByIds(String[] list) {
        iSysLogDao.deleteBatchIds(Arrays.asList(list));
    }


}
