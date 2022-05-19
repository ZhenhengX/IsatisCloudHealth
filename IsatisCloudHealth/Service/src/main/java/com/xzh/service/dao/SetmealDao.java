package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.xzh.common.pojo.Setmeal;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface SetmealDao extends BaseMapper<Setmeal> {

    //新增关联关系
    @Insert("insert into h_setmeal_checkgroup(setmeal_id, checkgroup_id)" +
            "        values (#{setMealId}, #{checkGroupId})")
    void setSetmealIdAndCheckGroupId(Map<String, Integer> map);

    //分页查询
    @Select("<script>" +
            "select *" +
            "        from h_setmeal" +
            "        <if test=\"queryString != null and queryString.length > 0\">" +
            "            where code = #{queryString}" +
            "               or name = #{queryString}" +
            "               or helpCode = #{queryString}" +
            "        </if>" +
            "</script>")
    Page<Setmeal> selectByCondition(String queryString);

    //查询套餐预约占比
    @Select("select s.name, count(o.id) value" +
            "        from h_order o," +
            "             h_setmeal s" +
            "        where o.setmeal_id = s.id" +
            "        group by s.name")
    List<Map<String, Object>> findSetmealCount();

    //根据套餐Id查询检查组id
    @Select("SELECT checkgroup_id" +
            "        FROM h_setmeal_checkgroup" +
            "        WHERE setmeal_id = #{setMealId}")
    List<String> findCheckGroupIdsBySetMealId(String setMealId);

    //根据SetmealID删除关联关系
    @Delete("DELETE" +
            "        FROM h_setmeal_checkgroup" +
            "        WHERE setmeal_id = #{setmealId}")
    void deleteSetmealAndCheckgroup(Integer setmealId);

    //查询套餐名称
    @Select("select name" +
            "        from h_setmeal" +
            "        where id = #{setmealId}")
    List<String> findSetmealNameById(Integer setmealId);
}
