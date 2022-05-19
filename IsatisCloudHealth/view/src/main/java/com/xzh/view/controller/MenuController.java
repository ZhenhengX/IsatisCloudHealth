package com.xzh.view.controller;

import com.xzh.common.constant.MessageConstant;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Menu;
import com.xzh.common.pojo.Role;
import com.xzh.view.openFeign.MenuFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    private MenuFeign menuService;


    //查询所有用户
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return menuService.findPage(queryPageBean);
    }


    //查询所有的菜单的名称与id
    @RequestMapping("/findAllMenu")
    public Result findAllMenu() {
        try {
            List<Map<String, Object>> list = menuService.findAllMenu();
            return new Result(true, MessageConstant.QUERT_MENU_SUCCESS, list);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERT_MENU_FAIL);
        }
    }


    //添加菜单
    @RequestMapping("/add")
    public Result add(@RequestBody Menu menu) {
        try {
            if (menu == null && menu.getName() == null && menu.getPath() == null
                    && menu.getPriority() == null && menu.getLevel() == null) {
                return new Result(false, MessageConstant.ADD_MENU_FAIL);
            }

            //通过菜单名与访问路径查找菜单,判断菜单是否存在，存在添加失败
            List<Menu> menuList;
            if (menu.getLinkUrl() == null) {
                menuList = menuService.findByNameAndLkurl(menu.getName(), "null");
            } else {
                menuList = menuService.findByNameAndLkurl(menu.getName(), menu.getLinkUrl());
            }
            if (menuList != null && menuList.size() > 0) {
                return new Result(false, MessageConstant.ADD_MENU_FAIL + ",菜单名称或请求路径重复");
            }

            //判断二级菜单 访问路径 路径级别 自关联id
            if (menu.getLinkUrl() != null && menu.getParentMenuId() != null) {
                menuService.add(menu);
                return new Result(true, MessageConstant.ADD_MENU_SUCCESS);
            }

            //判断是一级菜单
            if (menu.getLinkUrl() == null && menu.getParentMenuId() == null) {
                menuService.add(menu);
                return new Result(true, MessageConstant.ADD_MENU_SUCCESS);
            }

            //上方能添加的都添加不了，所以添加失败
            return new Result(false, MessageConstant.ADD_MENU_FAIL + "菜单格式有误");
        } catch (Exception e) {
            return new Result(false, MessageConstant.ADD_MENU_FAIL);
        }
    }

    //编辑菜单
    @RequestMapping("/edit")
    public Result edit(@RequestBody Menu menu) {
        try {
            if (menu == null) {
                if (menu.getName() == null && menu.getPath() == null
                        && menu.getPriority() == null && menu.getLevel() == null) {
                    return new Result(false, MessageConstant.EDIT_MENU_FAIL);
                }
            }
            //为true是二级路径格式正确
            boolean flag2 = (menu.getLinkUrl() != null && menu.getLinkUrl().length() > 0 && menu.getParentMenuId() != null);
            //为true是一级路径正确
            boolean flag1 = (menu.getLinkUrl() == null || menu.getLinkUrl().equals("") && menu.getParentMenuId() == null);

            if (flag1 || flag2) {
                //通过id查找修改前的菜单
                Menu oldMenu = menuService.findById(menu.getId());
                boolean nflag = oldMenu.getName().equals(menu.getName());
                boolean lflag;
                if (oldMenu.getLinkUrl() != null && oldMenu.getLinkUrl().length() > 0) {
                    lflag = oldMenu.getLinkUrl().equals(menu.getLinkUrl());
                } else {
                    lflag = menu.getLinkUrl().equals(oldMenu.getLinkUrl());
                }
                return good(nflag, lflag, menu);
            }
            return new Result(false, MessageConstant.EDIT_MENU_FAIL + ",菜单格式有误");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.EDIT_MENU_FAIL);
        }
    }

    //对菜单的名字与请求路径进行3次判断 分为3中情况
    private Result good(boolean nflag, boolean lflag, Menu menu) {
        Result result;
        if (nflag && lflag) {
            menuService.edit(menu);
            result = new Result(true, MessageConstant.EDIT_MENU_SUCCESS);
        } else if (!nflag && !lflag) {
            result = oneFindByNameAndLkurl(menu);
        } else {
            result = twoFindByNameAndLkurl(menu);
        }
        return result;
    }

    private Result oneFindByNameAndLkurl(Menu menu) {
        List<Menu> list = menuService.findByNameAndLkurl(menu.getName(), menu.getLinkUrl());
        if (list != null && list.size() >= 1) {//如果集合数量大于等于1，则存在其他相同的菜单
            return new Result(false, MessageConstant.EDIT_MENU_FAIL + ",菜单或者请求路径重复");
        } else {
            menuService.edit(menu);
            return new Result(true, MessageConstant.EDIT_MENU_SUCCESS);
        }
    }

    private Result twoFindByNameAndLkurl(Menu menu) {
        List<Menu> list = menuService.findByNameAndLkurl(menu.getName(), menu.getLinkUrl());
        if (list != null && list.size() > 1) {//如果集合数量大于1，则存在其他相同的菜单
            return new Result(false, MessageConstant.EDIT_MENU_FAIL + ",菜单或者请求路径重复");
        } else {
            menuService.edit(menu);
            return new Result(true, MessageConstant.EDIT_MENU_SUCCESS);
        }
    }


    //查询所有与当前菜单有关的角色
    @RequestMapping("/findRoleBymid")
    public Result findRoleByRid(Integer id) {
        try {
            //通过id查询所有的关联角色
            List<Role> roleList = menuService.findRoleBymid(id);
            if (roleList != null && roleList.size() > 0) {
                return new Result(true, roleList.size() + "角色关联此菜单");
            } else {
                return new Result(false, MessageConstant.GET_ROLE_FAIL);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    @RequestMapping("/deletemenu")
    public Result deletemenu(Integer id) {

        try {
            //通过id查询菜单
            Menu menu = menuService.findmenuById(id);
            if (menu.getChildren() != null && menu.getChildren().size() > 0) {
                return new Result(false, "删除失败，该菜单包含子菜单");
            }
            menuService.delete(id);
            return new Result(true, MessageConstant.DELETE_MENU_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.DELETE_MENU_FAIL);
        }
    }

}
