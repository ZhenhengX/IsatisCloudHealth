package com.xzh.common.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 人群分类对应的实体类
 */
@Data
public class PeopleClass implements Serializable {
    private String fileName;//档案号
    private String name;//会员姓名
    private String sex;//性别
}
