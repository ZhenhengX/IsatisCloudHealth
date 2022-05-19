package com.xzh.common.pojo;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.apache.ibatis.type.JdbcType;

import java.io.Serializable;
import java.util.Date;

@Data
@TableName(autoResultMap = true)
public class Syslog implements Serializable {

    @TableId(type = IdType.ASSIGN_UUID)
    private String id;
    private String username;
    @TableField("consumerName")
    private String consumerName;
    @TableField(value = "visitTime", jdbcType = JdbcType.DATE)
    private Date visitTime;
    @TableField("visit_timestr")
    private String visitTimestr; //注意 visitTimestr 设计数据库字段为visit_timestr Mapper才会识别
    private String ip;
    private String url;
    @TableField("executionTime")
    private String executionTime;
    private String method;
    @TableField(exist = false)
    private String formatVisitTime;//格式化的访问时间
}
