package com.xzh.common.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 会员实体类
 */
@Data
public class Member implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;//主键
    @TableField("fileNumber")
    private String fileNumber;//档案号
    private String name;//姓名
    private String sex;//性别
    @TableField("idCard")
    private String idCard;//身份证号
    @TableField("phoneNumber")
    private String phoneNumber;//手机号
    private Date regTime;//注册时间
    private String password;//登录密码
    private String email;//邮箱
    private Date birthday;//出生日期
    private String remark;//备注
    private String healthmanager;//健康管理师
    private Integer age;
}
