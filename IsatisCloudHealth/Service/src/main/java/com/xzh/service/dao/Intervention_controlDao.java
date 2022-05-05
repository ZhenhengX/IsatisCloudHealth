package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.xzh.common.pojo.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface Intervention_controlDao extends BaseMapper<Member> {
    //分页查询
    @Select("<script>" +
            "SELECT" +
            "         t_member.fileNumber,t_member.name" +
            "        from" +
            "            t_member," +
            "            t_order" +
            "        <if test=\"queryString !=null and queryString.length >0\">" +
            "            where" +
            "            t_member.id = t_order.member_id and t_order.orderStatus='已到诊'" +
            "            and t_member.fileNumber like concat('%',#{queryString},'%') or t_member.name like concat('%',#{queryString},'%')" +
            "        </if>" +
            "</script>")
    Page<Member> selectIntervenByCondition(String queryString);
}
