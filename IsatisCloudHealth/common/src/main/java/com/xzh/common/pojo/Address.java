package com.xzh.common.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Data
public class Address implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;
    @TableField("addressName")
    private String addressName;   //体检机构名
    private String telephone; //联系电话
    @TableField("lngAndLat")
    private String lngAndLat; //经纬度
//    private String lat; //纬度

    private String img;
    private String map;     //地图
    private String detailaddress; //详细地址

    //体检机构对应订单关系: 一对多的关系,一个体检机构对应多个订单
    @TableField(exist = false)
    private Set<Order> orderSet = new HashSet<>(0);

    public Address() {
    }
}
