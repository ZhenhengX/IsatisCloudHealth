package com.xzh.service.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface ReportDao {
    /**
     * 查询已预约的套餐的名称和对应的已预约的套餐的数量
     */
    @Select("select count(id) from t_order where orderDate =#{date}")
    Integer findOrderByMonth(String date);

    @Select("select count(id) from t_order where orderDate = #{value} and orderStatus = '已到诊'")
    Integer findArriveByMonth(String date2String);

    @Select("SELECT t_setmeal.name AS name, SUM(t_setmeal.price) AS value" +
            "        FROM t_order INNER JOIN t_setmeal ON t_order.setmeal_id = t_setmeal.id" +
            "        GROUP BY t_setmeal.price")
    List<Map> findSetmealMoney();

}
