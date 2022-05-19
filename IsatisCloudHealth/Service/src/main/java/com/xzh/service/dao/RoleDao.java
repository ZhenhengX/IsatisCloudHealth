package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.xzh.common.pojo.Menu;
import com.xzh.common.pojo.Role;
import org.apache.ibatis.annotations.*;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@Mapper
public interface RoleDao extends BaseMapper<Role> {

    @Select("select r.*" +
            "        from h_role r," +
            "             h_user_role ur" +
            "        where r.id = ur.role_id" +
            "          and ur.user_id = #{userId}")
    Set<Role> findByUserId(Integer userId);

    @Select("<script>" +
            "select *" +
            "        from h_role" +
            "        <if test=\"queryString != null and queryString.length > 0\">" +
            "            where name like concat('%', #{queryString}, '%')" +
            "        </if>" +
            "</script>")
    Page<Role> findPage(String queryString);

    @Select("select *" +
            "        from h_role" +
            "        where name = #{name}" +
            "           or keyword = #{keyword}")
    List<Role> findByName2Kd(@Param("name") String name, @Param("keyword") String keyword);

    @Insert("insert into h_role_permission" +
            "        values (#{roleId}, #{permissionId})")
    void addPermissionAndRole(@Param("roleId") Integer roleId, @Param("permissionId") Integer permissionId);

    @Insert("insert into h_role_menu" +
            "        values (#{roleId}, #{menuId})")
    void addMenuAndRole(@Param("roleId") Integer roleId, @Param("menuId") Integer menuId);

    @Select("select permission_id" +
            "        from h_role_permission" +
            "        where role_id = #{rId}")
    List<Integer> findPermissionIdByrid(Integer rId);

    @Select("select menu_id" +
            "        from h_role_menu" +
            "        where role_id = #{rId}")
    List<Integer> findMenuIdByrid(Integer rId);

    @Delete("delete" +
            "        from h_role_permission" +
            "        where role_id = #{roleId}")
    void deleteConnection4PermissionByrid(Integer roleId);

    @Delete("delete" +
            "        from h_role_menu" +
            "        where role_id = #{roleId}")
    void deleteConnection4MenuByrid(Integer roleId);

    @Delete("delete" +
            "        from h_user_role" +
            "        where role_id = #{roleId}")
    void deleteConnection4UserByrid(Integer id);

    @Select("select *" +
            "        from h_role" +
            "        where id in (select role_id from h_role_menu where menu_id = #{id})")
    List<Role> findRoleBymid(Integer id);

    @Select("select *" +
            "        from h_menu" +
            "        where id in (select menu_id from h_role_menu where role_id = #{roleId})")
    LinkedHashSet<Menu> findMenuByRoleId(Integer roleId);
}
