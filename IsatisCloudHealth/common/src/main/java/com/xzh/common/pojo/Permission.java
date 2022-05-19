package com.xzh.common.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.apache.ibatis.type.JdbcType;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 权限
 */
@Data
@TableName(autoResultMap = true)
public class Permission implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String name; // 权限名称
    private String keyword; // 权限关键字，用于权限控制
    private String description; // 描述
    @TableField(jdbcType = JdbcType.DATE)
    private Date cretime; //创建时间
    private String station; //是否禁用 1 表示否 0表示是
    @TableField(exist = false)
    private Set<Role> roles = new HashSet<Role>(0);
}
