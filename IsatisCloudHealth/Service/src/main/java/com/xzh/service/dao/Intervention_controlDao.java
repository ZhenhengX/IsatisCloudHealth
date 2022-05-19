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
            "         h_member.fileNumber,h_member.name" +
            "        from" +
            "            h_member," +
            "            h_order" +
            "        <if test=\"queryString !=null and queryString.length >0\">" +
            "            where" +
            "            h_member.id = h_order.member_id and h_order.orderStatus='已到诊'" +
            "            and h_member.fileNumber like concat('%',#{queryString},'%') or h_member.name like concat('%',#{queryString},'%')" +
            "        </if>" +
            "</script>")
    Page<Member> selectIntervenByCondition(String queryString);
}
