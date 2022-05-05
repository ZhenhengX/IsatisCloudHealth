package com.xzh.service.controller;

import com.xzh.common.dto.UserDTO;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Menu;
import com.xzh.common.pojo.Role;
import com.xzh.common.pojo.User;
import com.xzh.service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashSet;
import java.util.List;

@RestController
@RequestMapping("Service/user")
public class UserController {

    @Autowired
    private UserService userService;

    //根据用户名查询用户
    @GetMapping("findByUsername/{username}")
    public User findByUsername(@PathVariable String username) {
        return userService.findByUsername(username);
    }

    @GetMapping("findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return userService.findPage(queryPageBean);
    }

    @GetMapping("findAllRoles")
    public List<Role> findAllRoles() {
        return userService.findAllRoles();
    }

    @PostMapping("add")
    public void add(@RequestBody UserDTO userDTO) {
        userService.add(userDTO.getRoleIds(), userDTO.getUser());
    }

    @PutMapping("edit")
    public void edit(@RequestBody UserDTO userDTO) {
        userService.edit(userDTO.getRoleIds(), userDTO.getUser());
    }

    @GetMapping("findRoleIdByUid/{uId}")
    public List<Integer> findRoleIdByUid(@PathVariable Integer uId) {
        return userService.findRoleIdByUid(uId);
    }

    @DeleteMapping("delete")
    public void delete(@RequestBody User user) {
        userService.delete(user);
    }

    @GetMapping("getAllMenusById/{id}")
    public LinkedHashSet<Menu> getAllMenusById(@PathVariable Integer id) {
        return userService.getAllMenusById(id);
    }

    @PostMapping("upload")
    public void upload(@RequestBody User user) {
        userService.upload(user);
    }

    @GetMapping("findById/{id}")
    public User findById(@PathVariable Integer id) {
        return userService.findById(id);
    }

    @PutMapping("editUser")
    public void editUser(@RequestBody User user) {
        userService.editUser(user);
    }

}
