package com.xzh.service.controller;

import com.xzh.common.dto.RoleDTO;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Menu;
import com.xzh.common.pojo.Permission;
import com.xzh.common.pojo.Role;
import com.xzh.common.pojo.User;
import com.xzh.service.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("Service/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @GetMapping("findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return roleService.findPage(queryPageBean);
    }

    @GetMapping("findAllPermission")
    public Set<Permission> findAllPermission() {
        return roleService.findAllPermission();
    }

    @GetMapping("findAllMenus")
    public Set<Menu> findAllMenus() {
        return roleService.findAllMenus();
    }

    @GetMapping("findByName2Kd/{name}/{keyword}")
    public List<Role> findByName2Kd(@PathVariable String name, @PathVariable String keyword) {
        return roleService.findByName2Kd(name, keyword);
    }

    @PostMapping("add")
    public void add(@RequestBody RoleDTO roleDTO) {
        roleService.add(roleDTO.getPermissionIds(), roleDTO.getMenuIds(), roleDTO.getRole());
    }

    @GetMapping("findPermissionIdByrid/{rId}")
    public List<Integer> findPermissionIdByrid(@PathVariable Integer rId) {
        return roleService.findPermissionIdByrid(rId);
    }

    @GetMapping("findMenuIdByrid/{rId}")
    public List<Integer> findMenuIdByrid(@PathVariable Integer rId) {
        return roleService.findMenuIdByrid(rId);
    }

    @PutMapping("edit")
    public void edit(@RequestBody RoleDTO roleDTO) {
        roleService.edit(roleDTO.getPermissionIds(), roleDTO.getMenuIds(), roleDTO.getRole());
    }

    @GetMapping("findById/{id}")
    public Role findById(@PathVariable Integer id) {
        return roleService.findById(id);
    }

    @GetMapping("findPmByrId/{id}")
    public Set<Permission> findPmByrId(@PathVariable Integer id) {
        return roleService.findPmByrId(id);
    }

    @GetMapping("findMnByrId/{id}")
    public Set<Menu> findMnByrId(@PathVariable Integer id) {
        return roleService.findMnByrId(id);
    }

    @GetMapping("findUsById/{id}")
    public List<User> findUsById(@PathVariable Integer id) {
        return roleService.findUsById(id);
    }

    @DeleteMapping("deleterole/{id}")
    public void deleterole(@PathVariable Integer id) {
        roleService.deleterole(id);
    }

}
