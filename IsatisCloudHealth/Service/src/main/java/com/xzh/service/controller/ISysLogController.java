package com.xzh.service.controller;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Syslog;
import com.xzh.service.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;

@RestController
@RequestMapping("Service/iSysLog")
public class ISysLogController {

    @Autowired
    private ISysLogService iSysLogService;

    @PostMapping("saveLog")
    public void saveLog(@RequestBody Syslog syslog) {
        iSysLogService.saveLog(syslog);
    } //保存日志

    @GetMapping("findAll")
    public PageResult findAll(@RequestBody QueryPageBean queryPageBean) throws ParseException {
        return iSysLogService.findAll(queryPageBean);
    }//查询所有日志

    @DeleteMapping("deleteById/{id}")
    public void deleteById(@PathVariable String id) {
        iSysLogService.deleteById(id);
    }

    @DeleteMapping("deleteByIds")
    public void deleteByIds(@RequestBody String[] ids) {
        iSysLogService.deleteByIds(ids);
    }

}
