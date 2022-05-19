package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.xzh.common.pojo.CheckGroup;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface CheckGroupDao extends BaseMapper<CheckGroup> {

    //分页、条件查询
    @Select("<script>" +
            "select * from h_check_group" +
            "  <if test=\"queryString != null and queryString.length>0\">" +
            "    where code = #{queryString} or name = #{queryString} or helpCode = #{queryString}" +
            "  </if>" +
            "</script>")
    Page<CheckGroup> selectByCondition(String queryString);

    //新增关联关系
    @Insert("insert into h_checkgroup_checkitem(checkgroup_id,checkitem_id) " +
            "values (#{checkgroupId},#{checkitemId})")
    void setCheckGroupIdAndCheckItemId(Map map);

    //根据检查组id查询其所关联的检查项的id
    @Select("select checkitem_id from h_checkgroup_checkitem where checkgroup_id=#{checkgroupId}")
    List<Integer> findCheckitemIdsByCheckgroupId(Integer checkgroupId);

    //清理关联关系
    @Delete("delete from h_checkgroup_checkitem where checkgroup_id=#{groupId}")
    void clear(Integer groupId);

}
