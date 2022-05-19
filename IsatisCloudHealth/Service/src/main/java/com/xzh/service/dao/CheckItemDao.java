package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.xzh.common.pojo.CheckItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface CheckItemDao extends BaseMapper<CheckItem> {

    //查询所有
    @Select("<script>" +
            "select * from h_check_item" +
            "        <if test=\"queryString!=null and queryString.length>0\">" +
            "            where code=#{queryString} or name =#{queryString}" +
            "        </if>" +
            "</script>")
    Page<CheckItem> selectByCondition(String queryString);

    //查询有无关联关系
    @Select("select count(*) from h_checkgroup_checkitem where checkitem_id=#{id}")
    long findCountCheckItemID(Integer id);
}
