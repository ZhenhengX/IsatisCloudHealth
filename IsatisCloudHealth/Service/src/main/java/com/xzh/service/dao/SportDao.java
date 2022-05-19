package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.xzh.common.pojo.Sport;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface SportDao extends BaseMapper<Sport> {

    @Select("<script>" +
            "select *" +
            "        from h_sport" +
            "        <if test=\"queryString != null and queryString.length > 0\">" +
            "            where id like concat('%', #{queryString}, '%')" +
            "               or sportname like concat('%', #{queryString}, '%')" +
            "        </if>" +
            "</script>")
    Page<Sport> selectByCondition(String queryString);

    @Select("select count(id) from h_sport where sportname = #{sportname}")
    int findCountSportName(Sport sport);

}
