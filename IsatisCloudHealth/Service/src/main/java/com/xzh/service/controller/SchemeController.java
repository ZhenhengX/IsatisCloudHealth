package com.xzh.service.controller;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Scheme;
import com.xzh.service.service.SchemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("Service/scheme")
public class SchemeController {

    @Autowired
    private SchemeService schemeService;

    @GetMapping("findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return schemeService.findPage(queryPageBean);
    }

    @PostMapping("add")
    public void add(@RequestBody Scheme scheme) {
        schemeService.add(scheme);
    }

    @GetMapping("findById/{id}")
    public Scheme findById(@PathVariable Integer id) {
        return schemeService.findById(id);
    }

    @PutMapping("edit")
    public void edit(@RequestBody Scheme scheme) {
        schemeService.edit(scheme);
    }

    @DeleteMapping("delete/{id}")
    public void delete(@PathVariable Integer id) {
        schemeService.delete(id);
    }
}
