package com.xzh.common.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 体检套餐
 */
@Data
public class Setmeal implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String name;
    private String code;
    @TableField("helpCode")
    private String helpCode;
    private String sex;//套餐适用性别：0不限 1男 2女
    private String age;//套餐适用年龄
    private Float price;//套餐价格
    private String remark;
    private String attention;
    private String img;//套餐对应图片存储路径
    @TableField(exist = false)
    private List<CheckGroup> checkGroups;//体检套餐对应的检查组，多对多关系
}
