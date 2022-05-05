package com.xzh.service.controller;

import com.xzh.common.entity.CheckItemDeleteException;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.CheckItem;
import com.xzh.service.service.CheckItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("Service/checkItem")
public class CheckItemController {

    @Autowired
    private CheckItemService checkItemService;

    //新增功能
    @PostMapping("add")
    public void add(@RequestBody CheckItem checkItem) {
        checkItemService.add(checkItem);
    }

    //分页查询
    @GetMapping("findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return checkItemService.findPage(queryPageBean);
    }

    //根据id删除
    @DeleteMapping("deleteById/{id}")
    public void deltetByid(@PathVariable Integer id) throws CheckItemDeleteException {
        checkItemService.deltetByid(id);
    }

    //编辑
    @PutMapping("edit")
    public void edit(@RequestBody CheckItem checkItem) {
        checkItemService.edit(checkItem);
    }

    //不带分页的查询所有
    @GetMapping("findAll")
    public List<CheckItem> findAll() {
        return checkItemService.findAll();
    }
}
