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
    @Select("select count(id) from h_order where orderDate =#{date}")
    Integer findOrderByMonth(String date);

    @Select("select count(id) from h_order where orderDate = #{date2String} and orderStatus = '已到诊'")
    Integer findArriveByMonth(String date2String);

    @Select("SELECT h_setmeal.name AS name, SUM(h_setmeal.price) AS value" +
            "        FROM h_order INNER JOIN h_setmeal ON h_order.setmeal_id = h_setmeal.id" +
            "        GROUP BY h_setmeal.price")
    List<Map> findSetmealMoney();

}
