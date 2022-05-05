package com.xzh.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Permission;
import com.xzh.common.pojo.Role;

import java.util.List;

public interface PermissionService extends IService<Permission> {

    PageResult findPage(QueryPageBean queryPageBean);

    void add(Permission permission);

    Permission findByPmName2KeyWord(String name, String keyword);

    void edit(Permission permission);

    List<Role> findRolesByPmId(Integer id);

    void delete(Integer id);

    List<Permission> findAllPermissionZF();
}
