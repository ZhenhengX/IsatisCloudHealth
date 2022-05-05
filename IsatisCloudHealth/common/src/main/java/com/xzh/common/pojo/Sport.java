package com.xzh.common.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * 运动管理实体类
 */
@Data
public class Sport implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;//主键
    @TableField("helpCode")
    private String helpCode;//助记码
    private String sportname;//运动名称
    private String number;//运动次数
    private String sporttime;//运动时间

    public Sport() {
    }

    public Sport(String helpCode, String sportname, String number, String sporttime) {
        this.helpCode = helpCode;
        this.sportname = sportname;
        this.number = number;
        this.sporttime = sporttime;
    }
}
