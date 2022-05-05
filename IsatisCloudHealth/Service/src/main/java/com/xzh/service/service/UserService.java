package com.xzh.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Menu;
import com.xzh.common.pojo.Role;
import com.xzh.common.pojo.User;

import java.util.LinkedHashSet;
import java.util.List;

public interface UserService extends IService<User> {
    //根据用户名查询用户
    User findByUsername(String username);

    PageResult findPage(QueryPageBean queryPageBean);

    List<Role> findAllRoles();

    void add(Integer[] roleIds, User user);

    void edit(Integer[] roleIds, User user);

    List<Integer> findRoleIdByUid(Integer uId);

    void delete(User user);

    LinkedHashSet<Menu> getAllMenusById(Integer id);

    void upload(User user);

    User findById(Integer id);

    void editUser(User user);
}
