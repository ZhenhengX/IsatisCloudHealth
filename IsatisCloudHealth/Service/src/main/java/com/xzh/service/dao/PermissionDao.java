package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.xzh.common.pojo.Permission;
import com.xzh.common.pojo.Role;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Set;

@Mapper
public interface PermissionDao extends BaseMapper<Permission> {

    @Select("select p.*" +
            "        from h_permission p," +
            "             h_role_permission rp" +
            "        where p.id = rp.permission_id" +
            "          and rp.role_id = #{rid}")
    Set<Permission> findByRoleId(Integer rid);

    @Select("<script>" +
            "select *" +
            "        from h_permission" +
            "        <if test=\"value != null and value.length > 0\">" +
            "            where name like concat('%', #{value}, \"%\")" +
            "        </if>" +
            "</script>")
    Page<Permission> findPage(String queryString);


    @Select("select *" +
            "        from h_permission" +
            "        where name = #{name}" +
            "           or keyword = #{keyword}")
    Permission findByPmName2KeyWord(@Param("name") String name, @Param("keyword") String keyword);


    @Select("select r.*" +
            "        from h_role r" +
            "        where r.id in (select role_id from h_role_permission where permission_id = #{id})")
    List<Role> findRolesByPmId(Integer id);

    @Delete("delete" +
            "        from h_role_permission" +
            "        where permission_id = #{id}")
    void deleteConnection4roleByPmId(Integer id);

    @Select("select * from h_permission")
    Set<Permission> findAllPermission();
}
