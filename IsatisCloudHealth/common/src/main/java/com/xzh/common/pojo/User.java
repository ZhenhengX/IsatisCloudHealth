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
 * 用户
 */
@Data
@TableName(autoResultMap = true)
public class User implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id; // 主键
    @TableField(jdbcType = JdbcType.DATE)
    private Date birthday; // 生日
    private String gender; // 性别
    private String username; // 用户名，唯一
    private String password; // 密码
    private String remark; // 备注
    private String station; // 状态
    private String telephone; // 联系电话
    @TableField(exist = false)
    private Set<Role> roles = new HashSet<Role>(0);//对应角色集合
}
