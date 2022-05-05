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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

@Service
@Transactional
public class RoleServiceImpl extends ServiceImpl<RoleDao, Role> implements RoleService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private PermissionDao permissionDao;
    @Autowired
    private MenuDao menuDao;

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
        Page<Role> page = roleDao.findPage(queryString);
        return new PageResult(page.getTotal(), page.getResult());
    }


    /**
     * 查找所有的权限
     */
    public Set<Permission> findAllPermission() {
        return permissionDao.findAllPermission();
    }

    /**
     * 查询所有的菜单
     */
    public Set<Menu> findAllMenus() {
        return menuDao.findAllMenus();
    }

    /**
     * 通过用户名或关键字查询角色，为判断是否有相同的角色
     */
    public List<Role> findByName2Kd(String name, String keyword) {
        return roleDao.findByName2Kd(name, keyword);
    }

    /**
     * 添加角色，新建角色与权限之间的关系  角色与菜单之间的关系
     */
    public void add(Integer[] permissionIds, Integer[] menuIds, Role role) {
        roleDao.insert(role);
        Integer roleId = role.getId();


        if (permissionIds != null && permissionIds.length > 0) {
            for (Integer permissionId : permissionIds) {
                roleDao.addPermissionAndRole(roleId, permissionId);
            }
        }
        if (menuIds != null && menuIds.length > 0) {
            for (Integer menuId : menuIds) {
                roleDao.addMenuAndRole(roleId, menuId);
            }
        }
    }

    /**
     * 通过角色id查找所有关联的权限id
     */
    public List<Integer> findPermissionIdByrid(Integer rId) {
        return roleDao.findPermissionIdByrid(rId);
    }

    /**
     * 通过角色id查找所有关联的菜单id
     */
    public List<Integer> findMenuIdByrid(Integer rId) {
        return roleDao.findMenuIdByrid(rId);
    }

    /**
     * 编辑角色，以及权限，菜单关联表
     */
    public void edit(Integer[] permissionIds, Integer[] menuIds, Role role) {
        Integer roleId = role.getId();
        roleDao.updateById(role);
        //根据觉色id删除中间表权限中的数据
        roleDao.deleteConnection4PermissionByrid(roleId);
        //根据觉色id删除中间表菜单中的数据
        roleDao.deleteConnection4MenuByrid(roleId);

        //添加与权限和菜单之间的关系
        addMenuAndRole(roleId, menuIds);
        addPermissionAndRole(roleId, permissionIds);
    }

    /**
     * 通过id来查找角色
     */
    public Role findById(Integer id) {
        return roleDao.selectById(id);
    }

    /**
     * 通过角色id查找关联的所有权限
     */
    public Set<Permission> findPmByrId(Integer id) {
        return permissionDao.findByRoleId(id);
    }

    /**
     * 通过角色id查找所有关联的菜单
     */
    public Set<Menu> findMnByrId(Integer id) {
        return menuDao.findByRole(id);
    }

    /**
     * 通过id查找用户
     */
    public List<User> findUsById(Integer id) {
        return userDao.findUsByrId(id);
    }

    /**
     * 通过id删除角色 要删除权限 菜单 用户之间的关联关系
     */
    public void deleterole(Integer id) {
        //删除与权限相关的中间表
        roleDao.deleteConnection4PermissionByrid(id);
        //删除与菜单相关的中间表
        roleDao.deleteConnection4MenuByrid(id);
        //删除与用户相关的中间表
        roleDao.deleteConnection4UserByrid(id);
        //删除角色
        roleDao.deleteById(id);
    }

    //添加菜单关联
    private void addMenuAndRole(Integer roleId, Integer[] menuIds) {
        if (menuIds != null && menuIds.length > 0) {
            for (Integer menuId : menuIds) {
                roleDao.addMenuAndRole(roleId, menuId);
            }
        }
    }

    //添加权限关联
    private void addPermissionAndRole(Integer roleId, Integer[] permissionIds) {
        if (permissionIds != null && permissionIds.length > 0) {
            for (Integer permissionId : permissionIds) {
                roleDao.addPermissionAndRole(roleId, permissionId);
            }
        }
    }

}
