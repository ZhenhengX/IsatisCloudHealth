package com.xzh.common.pojo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.apache.ibatis.type.JdbcType;

import java.io.Serializable;
import java.util.Date;

/**
 * 预约信息管理中 实体类
 */
@Data
@TableName(autoResultMap = true)
public class Booking implements Serializable {
    private Integer orderId;//订单id
    private String memberName;//会员姓名
    private String phoneNumber;//电话号码
    @TableField(jdbcType = JdbcType.DATE)
    private Date orderDate;//预约时间
    private String orderType;//预约类型
    private String orderStatus;//预约状态
    private String setmealName;//预约套餐名称
}
