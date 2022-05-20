package com.xzh.view.controller;

import com.xzh.common.constant.MessageConstant;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Permission;
import com.xzh.common.pojo.Role;
import com.xzh.view.openFeign.PermissionFeign;
import com.xzh.view.openFeign.UserFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

/**
 * 权限管理
 */
@RestController
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private PermissionFeign permissionService;
    @Autowired
    private UserFeign userService;

    /**
     * 获取该用户拥有的权限，键为该用户的权限的keyword 值为have
     */
    @RequestMapping("/findAllPermission")
    public Map<String, String> findAllPermission() {
        //获取当前登录的用户
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        HashMap<String, String> map = new HashMap<>();

        //遍历用户拥有的权限，并按照规则把权限封装进map集合
        for (GrantedAuthority authority : user.getAuthorities()) {
            map.put(authority.getAuthority(), "have");
        }

        return map;
    }


    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return permissionService.findPage(queryPageBean);
    }

    @RequestMapping("/add")
    public Result add(@RequestBody Permission permission) {
        try {
            //当且权限对象存在，权限名以及关键字存在 才能进行添加操作
            if (permission == null && permission.getName() == null && permission.getKeyword() == null) {
                return new Result(false, MessageConstant.ADD_PERMISSION_FAIL);
            }
            //判断是否有相同的权限如果有添加失败，如果没有进行添加
            Permission oldPermission = permissionService.findByPmName2KeyWord(permission.getName(), permission.getKeyword());
            if (oldPermission != null) {
                return new Result(false, "添加失败，已创建相同权限");
            }
            permissionService.add(permission);
            return new Result(true, MessageConstant.ADD_PERMISSION_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.ADD_PERMISSION_FAIL);
        }
    }

    @RequestMapping(value = "/edit")
    public Result edit(@RequestBody Permission permission) {

        try {
            //当且权限对象存在，权限名以及关键字存在 才能进行添加操作
            if (permission == null && permission.getName() == null && permission.getKeyword() == null) {
                return new Result(false, MessageConstant.EDIT_PERMISSION_FAIL);
            }
            permissionService.edit(permission);
            return new Result(true, MessageConstant.EDIT_PERMISSION_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.EDIT_PERMISSION_FAIL);
        }
    }

    @RequestMapping(value = "/findRoleByPmId")
    public Result findRoleByPmId(Integer id) {

        try {
            //获取当前登录对象
            User loginuser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            //查询当前用户的姓名
            String username = loginuser.getUsername();
            //通过用户名获取用户对象
            com.xzh.common.pojo.User user = userService.findByUsername(username);
            //通过当前对象查找是否关联此权限Id
            if (user != null && user.getRoles() != null) {//如果当前用户角色存在
                //获取当前用户的角色遍历获取他的权限
                Set<Role> roles = user.getRoles();
                for (Role role : roles) {
                    Set<Permission> permissions = role.getPermissions();
                    //遍历权限
                    if (permissions != null) {
                        for (Permission permission : permissions) {
                            if (Objects.equals(permission.getId(), id)) {//如果权限id与删除的权限id相同，不允许删除
                                return new Result(true, "当前角色绑定了该权限无法删除");
                            }
                        }
                    }
                }
            }
            //通过权限id获取角色
            List<Role> roleList = permissionService.findRolesByPmId(id);
            if (roleList != null) {//如果角色存在
                StringBuilder roleNames = new StringBuilder();
                for (Role role : roleList) {
                    roleNames.append(role.getName()).append("、");
                }
                int lastIndexOf = roleNames.lastIndexOf("、");
                //获取所有角色的名称
                String names = roleNames.deleteCharAt(lastIndexOf).toString();
                return new Result(true, names);
            }
            //查询角色失败
            return new Result(false, MessageConstant.GET_ROLE_FAIL);

        } catch (Exception e) {
            e.printStackTrace();
            //查询角色失败
            return new Result(false, MessageConstant.GET_ROLE_FAIL);
        }
    }


    @RequestMapping("/delete")
    public Result delete(Integer id) {
        try {
            permissionService.delete(id);
            return new Result(true, MessageConstant.DELETE_CHECKITEM_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.DELETE_CHECKITEM_FAIL);
        }
    }
}
