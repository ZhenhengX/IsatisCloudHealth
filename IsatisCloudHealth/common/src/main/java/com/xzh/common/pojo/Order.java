package com.xzh.common.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.FastjsonTypeHandler;
import lombok.Data;
import org.apache.ibatis.type.JdbcType;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 体检预约Order 实体类
 */
@Data
@TableName(autoResultMap = true)
public class Order implements Serializable {
    public static final String ORDERTYPE_TELEPHONE = "电话预约";
    public static final String ORDERTYPE_WEIXIN = "微信预约";
    public static final String ORDERSTATUS_YES = "已到诊";
    public static final String ORDERSTATUS_NO = "未到诊";

    @TableId(type = IdType.AUTO)
    private Integer id;

    @TableField("member_id")
    private Integer memberId;//会员id
    private String orderName;
    private Integer sex;
    private String telephone;
    private String idCard;
    @TableField(value = "orderDate", jdbcType = JdbcType.DATE)
    private Date orderDate;//预约日期
    @TableField("orderType")
    private String orderType;//预约类型 电话预约/微信预约
    @TableField("orderStatus")
    private String orderStatus;//预约状态（是否到诊）

    @TableField("setmeal_id")
    private Integer setmealId;//体检套餐id
    private String food;//建议食物
    private String sport;//建议运动
    @TableField("healthName")
    private String healthName;//健康管理师姓名
    private String suggestion;//健康管理师建议
    private Integer address_id;
    @TableField(typeHandler = FastjsonTypeHandler.class)
    private List<Map<String, String>> checkReport;

    @TableField(exist = false)
    private Member member;
    @TableField(exist = false)
    private Setmeal setmeal;
    @TableField(exist = false)
    private String setmealName;

    public Order() {
    }

    public Order(Integer id) {
        this.id = id;
    }

    public Order(Integer memberId, Date orderDate, Integer setmealId) {
        this.memberId = memberId;
        this.orderDate = orderDate;
        this.setmealId = setmealId;
    }

    public Order(Integer memberId, Date orderDate, String orderType, String orderStatus, Integer setmealId) {
        this.memberId = memberId;
        this.orderDate = orderDate;
        this.orderType = orderType;
        this.orderStatus = orderStatus;
        this.setmealId = setmealId;
    }

    public Order(Integer id, Integer memberId, Date orderDate, String orderType, String orderStatus, Integer setmealId) {
        this.id = id;
        this.memberId = memberId;
        this.orderDate = orderDate;
        this.orderType = orderType;
        this.orderStatus = orderStatus;
        this.setmealId = setmealId;
    }

    public static String getOrdertypeTelephone() {
        return ORDERTYPE_TELEPHONE;
    }

    public static String getOrdertypeWeixin() {
        return ORDERTYPE_WEIXIN;
    }

    public static String getOrderstatusYes() {
        return ORDERSTATUS_YES;
    }

    public static String getOrderstatusNo() {
        return ORDERSTATUS_NO;
    }
}
