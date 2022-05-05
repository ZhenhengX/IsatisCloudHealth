package com.xzh.service.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Permission;
import com.xzh.common.pojo.Role;
import com.xzh.service.dao.PermissionDao;
import com.xzh.service.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class PermissionServiceImpl extends ServiceImpl<PermissionDao, Permission> implements PermissionService {
    @Autowired
    private PermissionDao permissionDao;

    /**
     * 分页查询 并包括模糊查询所有的权限信息
     */
    public PageResult findPage(QueryPageBean queryPageBean) {
        //获取前端传入的数据
        Integer pageSize = queryPageBean.getPageSize();
        Integer currentPage = queryPageBean.getCurrentPage();
        String queryString = queryPageBean.getQueryString();
        //进行分页设置
        PageHelper.startPage(currentPage, pageSize);
        //查询所以 权限信息
        Page<Permission> page = permissionDao.findPage(queryString);
        return new PageResult(page.getTotal(), page.getResult());
    }

    /**
     * 通过权限名字或者关键字查找权限
     */
    public Permission findByPmName2KeyWord(String name, String keyword) {
        return permissionDao.findByPmName2KeyWord(name, keyword);
    }


    /**
     * 添加权限
     */
    public void add(Permission permission) {
        //设置创建时间
        permission.setCretime(new Date());
        permissionDao.insert(permission);
    }

    /**
     * 修改权限
     */
    public void edit(Permission permission) {
        permissionDao.updateById(permission);
    }


    /**
     * 查询是否有除当前登录对象外与该权限关联的角色
     */
    public List<Role> findRolesByPmId(Integer id) {
        return permissionDao.findRolesByPmId(id);
    }

    /**
     * 通过权限id删除该权限
     */
    public void delete(Integer id) {
        //删除所有与权限id绑定的role中间关联表
        permissionDao.deleteConnection4roleByPmId(id);

        //根据权限id删除权限
        permissionDao.deleteById(id);


    }


    @Override
    public List<Permission> findAllPermissionZF() {
        return this.list();
    }
}
