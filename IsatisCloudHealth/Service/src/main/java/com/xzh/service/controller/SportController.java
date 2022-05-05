package com.xzh.service.controller;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Sport;
import com.xzh.service.service.SportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("Service/sport")
public class SportController {

    @Autowired
    private SportService sportService;

    @GetMapping("findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return sportService.findPage(queryPageBean);
    }

    @PostMapping("add")
    public void add(@RequestBody Sport sport) {
        sportService.add(sport);
    }

    @GetMapping("findById/{id}")
    public Sport findById(@PathVariable Integer id) {
        return sportService.findById(id);
    }

    @PutMapping("edit")
    public void edit(@RequestBody Sport sport) {
        sportService.edit(sport);
    }

    @DeleteMapping("delete/{id}")
    public void delete(@PathVariable Integer id) {
        sportService.delete(id);
    }

    @GetMapping("findAll")
    public List<Sport> findAll() {
        return sportService.findAll();
    }

    @PostMapping("save")
    public void save(@RequestBody List<Sport> sports) {
        sportService.save(sports);
    }

}
