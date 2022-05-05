package com.xzh.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Menu;
import com.xzh.common.pojo.Permission;
import com.xzh.common.pojo.Role;
import com.xzh.common.pojo.User;

import java.util.List;
import java.util.Set;

public interface RoleService extends IService<Role> {


    PageResult findPage(QueryPageBean queryPageBean);

    Set<Permission> findAllPermission();

    Set<Menu> findAllMenus();

    List<Role> findByName2Kd(String name, String keyword);

    void add(Integer[] permissionIds, Integer[] menuIds, Role role);

    List<Integer> findPermissionIdByrid(Integer rId);

    List<Integer> findMenuIdByrid(Integer rId);

    void edit(Integer[] permissionIds, Integer[] menuIds, Role role);

    Role findById(Integer id);

    Set<Permission> findPmByrId(Integer id);

    Set<Menu> findMnByrId(Integer id);

    List<User> findUsById(Integer id);

    void deleterole(Integer id);
}
