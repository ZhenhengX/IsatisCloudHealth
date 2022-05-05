package com.xzh.common.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 预约设置
 */
@Data
public class OrderSetting implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;
    @TableField("orderDate")
    private Date orderDate;//预约设置日期
    private int number;//可预约人数
    private int reservations;//已预约人数

    public OrderSetting() {
    }

    public OrderSetting(Date orderDate, int number) {
        this.orderDate = orderDate;
        this.number = number;
    }

}
