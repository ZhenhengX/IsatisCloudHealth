package com.xzh.service.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.xzh.common.pojo.Scheme;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface SchemeDao extends BaseMapper<Scheme> {

    @Select("<script>" +
            "select *" +
            "        from t_scheme" +
            "        <if test=\"value != null and value.length > 0\">" +
            "            where title like concat('%', #{value}, '%')" +
            "               or people like concat('%', #{value}, '%')" +
            "        </if>" +
            "</script>")
    Page<Scheme> selectByCondition(String queryString);

}
