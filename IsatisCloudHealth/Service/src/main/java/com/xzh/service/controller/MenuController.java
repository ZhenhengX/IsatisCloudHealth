package com.xzh.service.controller;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Menu;
import com.xzh.common.pojo.Role;
import com.xzh.service.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("Service/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @GetMapping("findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return menuService.findPage(queryPageBean);
    }

    @GetMapping("findAllMenu")
    public List<Map<String, Integer>> findAllMenu() {
        return menuService.findAllMenu();
    }

    @GetMapping("findByNameAndLkurl/{name}/{linkUrl}")
    public List<Menu> findByNameAndLkurl(@PathVariable String name, @PathVariable String linkUrl) {
        return menuService.findByNameAndLkurl(name, linkUrl);
    }

    @PostMapping("add")
    public void add(@RequestBody Menu menu) {
        menuService.add(menu);
    }

    @GetMapping("findById/{id}")
    public Menu findById(@PathVariable Integer id) {
        return menuService.findById(id);
    }

    @PutMapping("edit")
    public void edit(@RequestBody Menu menu) {
        menuService.edit(menu);
    }

    @GetMapping("findRoleBymid/{id}")
    public List<Role> findRoleBymid(@PathVariable Integer id) {
        return menuService.findRoleBymid(id);
    }

    @GetMapping("findmenuById/{id}")
    public Menu findmenuById(@PathVariable Integer id) {
        return menuService.findmenuById(id);
    }

    @DeleteMapping("delete/{id}")
    public void delete(@PathVariable Integer id) {
        menuService.delete(id);
    }

}
