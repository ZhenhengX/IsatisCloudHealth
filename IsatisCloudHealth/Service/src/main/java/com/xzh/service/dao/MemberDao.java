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
    @Select("select count(id) from t_member where regTime <= #{month}")
    Integer findMemberCountBeforeDate(String month);

    //获取会员总数
    @Select("select count(id) from t_member")
    Integer findMemberTotalCount();

    //获取指定日期之后的会员总数
    @Select("select count(id) from t_member where regTime >= #{thisWeekMonday}")
    Integer findMemberCountAfterDate(String thisWeekMonday);

    //对健康管理师的回显
    @Select("select a.username from t_user a join t_user_role b on a.id=b.user_id where b.role_id=(select id from t_role where name= '健康管理师' );")
    List<String> findHealthManager();

    //查询所有关联信息
    @Select("SELECT" +
            "    t_check_group.`name` AS checkgroups," +
            "    t_check_item.`name` AS checkitems," +
            "    t_setmeal.`name` AS setmeal," +
            "    t_address.`detailaddress` AS address " +
            "FROM" +
            "    t_check_group" +
            "    INNER JOIN t_checkgroup_checkitem ON t_checkgroup_checkitem.checkgroup_id = t_check_group.id" +
            "    INNER JOIN t_check_item ON t_checkgroup_checkitem.checkitem_id = t_check_item.id" +
            "    INNER JOIN t_setmeal_checkgroup ON t_setmeal_checkgroup.checkgroup_id = t_check_group.id" +
            "    INNER JOIN t_setmeal ON t_setmeal_checkgroup.setmeal_id = t_setmeal.id" +
            "    INNER JOIN t_order ON t_order.setmeal_id = t_setmeal.id" +
            "    INNER JOIN t_member ON t_order.member_id = t_member.id" +
            "    INNER JOIN t_address ON t_order.address_id = t_address.id " +
            "WHERE" +
            "    t_member.id = #{id}")
    List<Map<String, Object>> findAllmessageById(Integer id);

    @Update(" UPDATE  t_member set healthmanager = #{healthName} where id  in  (SELECT t_order.member_id FROM t_order where id = #{id})")
    void update(@Param("id") Integer tempOrderId, @Param("healthName") String username);

    @Select("select * from t_member where email=#{email} and password=#{md5_password}")
    Member findByEmailAndPwd(@Param("email") String email, @Param("password") String md5_password);
}
