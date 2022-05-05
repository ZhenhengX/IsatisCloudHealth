package com.xzh.service.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Menu;
import com.xzh.common.pojo.Role;
import com.xzh.service.dao.MenuDao;
import com.xzh.service.dao.RoleDao;
import com.xzh.service.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class MenuServiceImpl extends ServiceImpl<MenuDao, Menu> implements MenuService {
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private MenuDao menuDao;


    /**
     * 分页查询所有的菜单
     */
    public PageResult findPage(QueryPageBean queryPageBean) {
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();
        //进行分页设置
        Page<Menu> menuPage = new Page<>(currentPage, pageSize);
        LambdaQueryWrapper<Menu> queryWrapper = Wrappers.lambdaQuery(Menu.class);
        if (queryString == null || queryString.isEmpty()) {
            queryWrapper.isNull(Menu::getParentMenuId);
        } else {
            queryWrapper.like(Menu::getName, queryString);
            queryWrapper.and(menuLambdaQueryWrapper -> menuLambdaQueryWrapper.isNull(Menu::getParentMenuId));
        }
        Page<Menu> page = this.page(menuPage, queryWrapper);

        return new PageResult(page.getTotal(), page.getRecords());

    }

    /**
     * 查询所有额菜单名称与菜单id
     */
    public List<Map<String, Integer>> findAllMenu() {

        return menuDao.findMenus();
    }

    /**
     * 通过菜单名称与访问路径查找菜单
     */
    public List<Menu> findByNameAndLkurl(String name, String linkUrl) {
        LambdaQueryWrapper<Menu> queryWrapper = Wrappers.lambdaQuery(Menu.class);
        queryWrapper.eq(Menu::getName, name);
        if (linkUrl != null && linkUrl.length() > 0) {
            queryWrapper.or();
            queryWrapper.eq(Menu::getLinkUrl, linkUrl);
        }
        return menuDao.selectList(queryWrapper);
    }

    /**
     * 添加菜单
     */
    public void add(Menu menu) {
        menuDao.insert(menu);
    }

    /**
     * 通过id查找菜单
     */
    public Menu findById(Integer id) {
        return menuDao.findById(id);
    }

    /**
     * 修改菜单
     */
    public void edit(Menu menu) {
        menuDao.updateById(menu);
    }

    /**
     * 通过菜单id 查询所有的角色id
     */
    public List<Role> findRoleBymid(Integer id) {
        return roleDao.findRoleBymid(id);
    }

    /**
     * 通过id查询所有的菜单包括子菜单
     */
    public Menu findmenuById(Integer id) {
        //查询菜单
        Menu menu = menuDao.findById(id);
        //查询本菜单可能对应的子菜单
        List<Menu> menuList = menuDao.findByParentId(id);
        if (menuList != null && menuList.size() > 0) {
            menu.setChildren(menuList);
        }
        return menu;
    }

    /**
     * 通过id删除菜单
     */
    public void delete(Integer id) {
        //通过菜单id删除 角色与菜单之间的关系
        menuDao.deleteConnection4RoleBymid(id);
        menuDao.deleteById(id);
    }
}
