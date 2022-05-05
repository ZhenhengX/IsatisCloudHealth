package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.xzh.common.pojo.Booking;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface BookingDao {
    //分页查询预约信息
    @Select("SELECT m.`name` memberName, m.`phoneNumber`, o.id orderId, o.`orderDate`, o.`orderType`, o.`orderStatus`, s.`name` setmealName" +
            "    FROM t_member m, t_order o, t_setmeal s" +
            "    WHERE o.`setmeal_id` = s.`id` AND m.`id` = o.`member_id`")
    Page<Booking> findPage(String queryString);
}
