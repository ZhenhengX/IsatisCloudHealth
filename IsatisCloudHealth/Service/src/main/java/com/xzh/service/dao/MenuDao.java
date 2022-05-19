package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xzh.common.pojo.Menu;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Mapper
public interface MenuDao extends BaseMapper<Menu> {

    @Select("select * from h_menu")
    Set<Menu> findAllMenus();

    @Select("select * from h_menu where id in (select menu_id from h_role_menu where role_id = #{id})")
    Set<Menu> findByRole(Integer id);

    @Select("select name as label, id as value from h_menu")
    List<Map<String, Object>> findMenus();

    @Select("select * from h_menu where id =#{id}")
    Menu findById(Integer id);

    @Select("select * from h_menu where parentMenuId = #{id}")
    List<Menu> findByParentId(Integer id);

    @Delete("delete from h_role_menu where menu_id = #{id}")
    void deleteConnection4RoleBymid(Integer id);

    @Select("select * from h_menu where id in" +
            "        (select rm.menu_id from h_role_menu as rm where rm.role_id in" +
            "        (select ur.role_id from h_user_role as ur where ur.user_id = #{id} ))" +
            "        and parentMenuId is null" +
            "        order by priority asc")
    LinkedHashSet<Menu> findAllFistMenusById(Integer id);

    @Select("select * from h_menu where id in" +
            "        (select rm.menu_id from h_role_menu as rm where rm.role_id in" +
            "        (select ur.role_id from h_user_role as ur where ur.user_id = #{id} ))" +
            "        and parentMenuId is not null and parentMenuId = #{menuId}" +
            "        order by priority asc")
    List<Menu> findSecondMenusByMenuId(@Param("id") Integer id, @Param("menuId") Integer menuId);
}
