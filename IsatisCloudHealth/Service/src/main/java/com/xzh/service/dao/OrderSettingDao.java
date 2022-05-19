package com.xzh.service.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xzh.common.pojo.OrderSetting;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Mapper
public interface OrderSettingDao extends BaseMapper<OrderSetting> {
    //查询日期是否存在
    @Select("select count(*) from h_order_setting where orderDate=#{orderDate,jdbcType=DATE}")
    long findCountByOrderDate(Date orderDate);

    //根据日期修改可预约人数
    @Update("update h_order_setting set number=#{number} where orderDate=#{orderDate,jdbcType=DATE}")
    void updateByDate(OrderSetting orderSetting);

    //根据月份查询预约数据
    @Select("SELECT * FROM h_order_setting WHERE orderDate BETWEEN #{begain,jdbcType=DATE} AND #{end,jdbcType=DATE}")
    List<OrderSetting> getOrderSettingByMonth(Map<String, String> map);

    //根据日期查询预约设置
    @Select("SELECT * FROM h_order_setting WHERE orderDate =#{date,jdbcType=DATE}")
    OrderSetting findByOrderDate(Date date);

    //根据日期修改已预约人数
    @Update("update h_order_setting set reservations=#{reservations} where orderDate=#{orderDate,jdbcType=DATE}")
    void editReservationsByOrderDate(OrderSetting orderSetting);
}
