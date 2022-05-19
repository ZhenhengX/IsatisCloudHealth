package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xzh.common.pojo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

@Mapper
public interface MemberDao extends BaseMapper<Member> {

    //查询指定月份之前会员总数
    @Select("select count(id) from h_member where regTime <= #{month,jdbcType=DATE}")
    Integer findMemberCountBeforeDate(String month);

    //获取会员总数
    @Select("select count(id) from h_member")
    Integer findMemberTotalCount();

    //获取指定日期之后的会员总数
    @Select("select count(id) from h_member where regTime >= #{thisWeekMonday,jdbcType=DATE}")
    Integer findMemberCountAfterDate(String thisWeekMonday);

    //对健康管理师的回显
    @Select("select a.username from h_user a join h_user_role b on a.id=b.user_id where b.role_id=(select id from h_role where name= '健康管理师' );")
    List<String> findHealthManager();

    //查询所有关联信息
    @Select("SELECT" +
            "    h_check_group.`name` AS checkgroups," +
            "    h_check_item.`name` AS checkitems," +
            "    h_setmeal.`name` AS setmeal," +
            "    h_address.`detailaddress` AS address " +
            "FROM" +
            "    h_check_group" +
            "    INNER JOIN h_checkgroup_checkitem ON h_checkgroup_checkitem.checkgroup_id = h_check_group.id" +
            "    INNER JOIN h_check_item ON h_checkgroup_checkitem.checkitem_id = h_check_item.id" +
            "    INNER JOIN h_setmeal_checkgroup ON h_setmeal_checkgroup.checkgroup_id = h_check_group.id" +
            "    INNER JOIN h_setmeal ON h_setmeal_checkgroup.setmeal_id = h_setmeal.id" +
            "    INNER JOIN h_order ON h_order.setmeal_id = h_setmeal.id" +
            "    INNER JOIN h_member ON h_order.member_id = h_member.id" +
            "    INNER JOIN h_address ON h_order.address_id = h_address.id " +
            "WHERE" +
            "    h_member.id = #{id}")
    List<Map<String, Object>> findAllmessageById(Integer id);

    @Update(" UPDATE  h_member set healthmanager = #{healthName} where id  in  (SELECT h_order.member_id FROM h_order where id = #{id})")
    void update(@Param("id") Integer tempOrderId, @Param("healthName") String username);

    @Select("select * from h_member where email=#{email} and password=#{md5_password}")
    Member findByEmailAndPwd(@Param("email") String email, @Param("password") String md5_password);
}
