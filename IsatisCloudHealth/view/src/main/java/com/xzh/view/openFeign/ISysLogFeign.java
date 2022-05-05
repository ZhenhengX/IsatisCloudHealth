package com.xzh.view.openFeign;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Syslog;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

@FeignClient(name = "Service", path = "Service/iSysLog")
public interface ISysLogFeign {

    @PostMapping("saveLog")
    void saveLog(@RequestBody Syslog syslog); //保存日志

    @GetMapping("findAll")
    PageResult findAll(@RequestBody QueryPageBean queryPageBean);//查询所有日志

    @DeleteMapping("deleteById/{id}")
    void deleteById(@PathVariable("id") String id);

    @DeleteMapping("deleteByIds")
    void deleteByIds(@RequestBody String[] ids);

}
