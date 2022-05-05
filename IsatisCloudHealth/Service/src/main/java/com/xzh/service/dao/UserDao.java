package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.xzh.common.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserDao extends BaseMapper<User> {
    //根据用户名查询用户
    @Select("select * from t_user where username=#{username}")
    User findByUsername(String username);

    @Select("<script>" +
            "select * from t_user" +
            "        <if test=\"value != null and value.length > 0\">" +
            "            where username like concat('%',#{value},'%')" +
            "        </if>" +
            "</script>")
    Page<User> findPage(String queryString);

    @Insert("insert into t_user_role (user_id,role_id) values (#{lastId},#{roleId})")
    void addRoleIdAndUser(@Param("lastId") Integer lastId, @Param("roleId") Integer roleId);

    @Delete("delete from t_user_role where user_id=#{uid}")
    void deleteConnection4roleByUid(Integer uid);

    @Select("SELECT" +
            "            t_user_role.role_id" +
            "        FROM" +
            "            t_user_role" +
            "        WHERE" +
            "            t_user_role.user_id = #{uid}")
    List<Integer> findRoleIdByUid(Integer uid);

    @Select("select * from t_user where id in (select user_id from t_user_role where role_id = #{id})")
    List<User> findUsByrId(Integer id);
}
