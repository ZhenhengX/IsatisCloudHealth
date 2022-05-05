package com.xzh.common.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * 饮食管理实体类
 */
@Data
public class Food implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;//主键 编号
    private String foodname;//名称
    private String kind;//种类
    private String size;//尺寸
    private String age;//年龄区间

    public Food() {
    }

    public Food(String foodname, String kind, String size, String age) {
        this.foodname = foodname;
        this.kind = kind;
        this.size = size;
        this.age = age;
    }
}
