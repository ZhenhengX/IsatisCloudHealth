package com.xzh.view.openFeign;

import com.xzh.common.dto.UserDTO;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Menu;
import com.xzh.common.pojo.Role;
import com.xzh.common.pojo.User;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashSet;
import java.util.List;

@FeignClient(name = "Service", path = "Service/user")
public interface UserFeign {
    //根据用户名查询用户
    @GetMapping("findByUsername/{username}")
    User findByUsername(@PathVariable("username") String username);

    @GetMapping("findPage")
    PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    @GetMapping("findAllRoles")
    List<Role> findAllRoles();

    @PostMapping("add")
    void add(@RequestBody UserDTO userDTO);

    @PutMapping("edit")
    void edit(@RequestBody UserDTO userDTO);

    @GetMapping("findRoleIdByUid/{uId}")
    List<Integer> findRoleIdByUid(@PathVariable("uId") Integer uId);

    @DeleteMapping("delete")
    void delete(@RequestBody User user);

    @GetMapping("getAllMenusById/{id}")
    LinkedHashSet<Menu> getAllMenusById(@PathVariable("id") Integer id);

    @PostMapping("upload")
    void upload(@RequestBody User user);

    @GetMapping("findById/{id}")
    User findById(@PathVariable("id") Integer id);

    @PutMapping("editUser")
    void editUser(@RequestBody User user);
}
