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
    @Select("select count(*) from t_order_setting where orderDate=#{orderDate}")
    long findCountByOrderDate(Date orderDate);

    //根据日期修改可预约人数
    @Update("update t_order_setting set number=#{number} where orderDate=#{orderDate}")
    void updateByDate(OrderSetting orderSetting);

    //根据月份查询预约数据
    @Select("SELECT * FROM t_order_setting WHERE orderDate BETWEEN #{begain} AND #{end}")
    List<OrderSetting> getOrderSettingByMonth(Map<String, String> map);

    //根据日期查询预约设置
    @Select("SELECT * FROM t_order_setting WHERE orderDate =#{date}")
    OrderSetting findByOrderDate(Date date);

    //根据日期修改已预约人数
    @Update("update t_order_setting set reservations=#{reservations} where orderDate=#{orderDate}")
    void editReservationsByOrderDate(OrderSetting orderSetting);
}
