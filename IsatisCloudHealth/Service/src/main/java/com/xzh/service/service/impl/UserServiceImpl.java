package com.xzh.service.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Menu;
import com.xzh.common.pojo.Permission;
import com.xzh.common.pojo.Role;
import com.xzh.common.pojo.User;
import com.xzh.service.dao.MenuDao;
import com.xzh.service.dao.PermissionDao;
import com.xzh.service.dao.RoleDao;
import com.xzh.service.dao.UserDao;
import com.xzh.service.service.RoleService;
import com.xzh.service.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl extends ServiceImpl<UserDao, User> implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private RoleService roleService;
    @Autowired
    private PermissionDao permissionDao;
    @Autowired
    private MenuDao menuDao;

    //根据用户名查询用户
    @Override
    public User findByUsername(String username) {
        User user = userDao.findByUsername(username);
        if (user == null) {
            return null;
        }
        //获取用户id
        Integer userId = user.getId();
        //根据用户id查询用户对应的角色
        Set<Role> roles = roleDao.findByUserId(userId);
        if (roles != null && roles.size() > 0) {
            for (Role role : roles) {
                //获取角色id
                Integer roleId = role.getId();
                //根据角色id查询用户对应的权限
                Set<Permission> permissions = permissionDao.findByRoleId(roleId);
                //角色关联权限
                role.setPermissions(permissions);
            }
        }
        //用户关联角色
        user.setRoles(roles);
        return user;
    }

    /**
     * 分页及查询所有
     */
    public PageResult findPage(QueryPageBean queryPageBean) {
        //获取前端传入的数据
        Integer pageSize = queryPageBean.getPageSize();
        Integer currentPage = queryPageBean.getCurrentPage();
        String queryString = queryPageBean.getQueryString();
        //进行分页设置
        PageHelper.startPage(currentPage, pageSize);
        //查询所以 用户信息
        Page<User> page = userDao.findPage(queryString);
        return new PageResult(page.getTotal(), page.getResult());
    }

    /**
     * 查询所有的角色信息
     */
    public List<Role> findAllRoles() {
        return roleService.list();
    }

    /**
     * 添加用户 和 关联表
     */
    public void add(Integer[] roleIds, User user) {

        userDao.insert(user);
        Integer uid = user.getId();

        addRoleIdAndUser(roleIds, uid);
    }

    /**
     * 修改用户以及用户与角色之间的关联表
     */
    public void edit(Integer[] roleIds, User user) {
        //获取用户id
        Integer uid = user.getId();

        //修改用户表中的数据
        userDao.updateById(user);

        //根据用户id删除中间表中的数据
        userDao.deleteConnection4roleByUid(uid);

        addRoleIdAndUser(roleIds, uid);
    }

    /**
     * * 通过用户id查询所有与用户有关的角色id
     */
    public List<Integer> findRoleIdByUid(Integer uId) {

        return userDao.findRoleIdByUid(uId);
    }

    /**
     * 通过用户id删除用户
     */
    public void delete(User user) {
        //根据用户id删除中间表中的数据
        userDao.deleteConnection4roleByUid(user.getId());
        //根据用户id删除用户
        userDao.deleteById(user.getId());
    }

    /**
     * 通过角色id查找所有的菜单
     */
    public LinkedHashSet<Menu> getAllMenusById(Integer id) {
        LinkedHashSet<Menu> menus = menuDao.findAllFistMenusById(id);

        if (menus != null && menus.size() > 0) {
            for (Menu menu : menus) {
                List<Menu> menuSet = menuDao.findSecondMenusByMenuId(id, menu.getId());
                menu.setChildren(menuSet);
            }
        }

        return menus;
    }

    @Override
    public void upload(User user) {
        userDao.updateById(user);
    }

    /**
     * 通过id查询用户
     */
    public User findById(Integer id) {

        return userDao.selectById(id);
    }

    /**
     * 修改用户登录状态
     */
    public void editUser(User user) {
        userDao.updateById(user);
    }

    //添加用户与角色之间的关系 参数为角色id与用户id
    private void addRoleIdAndUser(Integer[] roleIds, Integer uid) {
        if (roleIds != null && roleIds.length > 0) {
            for (Integer roleId : roleIds) {
                userDao.addRoleIdAndUser(uid, roleId);
            }
        }
    }
}
