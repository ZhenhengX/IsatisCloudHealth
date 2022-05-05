package com.xzh.service.controller;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Permission;
import com.xzh.common.pojo.Role;
import com.xzh.service.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("Service/permission")
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    @GetMapping("findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return permissionService.findPage(queryPageBean);
    }

    @PostMapping("add")
    public void add(@RequestBody Permission permission) {
        permissionService.add(permission);
    }

    @GetMapping("findByPmName2KeyWord/{name}/{keyword}")
    public Permission findByPmName2KeyWord(@PathVariable String name, @PathVariable String keyword) {
        return permissionService.findByPmName2KeyWord(name, keyword);
    }

    @PutMapping("edit")
    public void edit(@RequestBody Permission permission) {
        permissionService.edit(permission);
    }

    @GetMapping("findRolesByPmId/{id}")
    public List<Role> findRolesByPmId(@PathVariable Integer id) {
        return permissionService.findRolesByPmId(id);
    }

    @DeleteMapping("delete/{id}")
    public void delete(@PathVariable Integer id) {
        permissionService.delete(id);
    }

    @GetMapping("findAllPermissionZF")
    public List<Permission> findAllPermissionZF() {
        return permissionService.findAllPermissionZF();
    }
}
