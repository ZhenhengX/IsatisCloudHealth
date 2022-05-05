package com.xzh.service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Menu;
import com.xzh.common.pojo.Role;

import java.util.List;
import java.util.Map;

public interface MenuService extends IService<Menu> {


    PageResult findPage(QueryPageBean queryPageBean);

    List<Map<String, Integer>> findAllMenu();

    List<Menu> findByNameAndLkurl(String name, String linkUrl);

    void add(Menu menu);

    Menu findById(Integer id);

    void edit(Menu menu);

    List<Role> findRoleBymid(Integer id);

    Menu findmenuById(Integer id);

    void delete(Integer id);
}
