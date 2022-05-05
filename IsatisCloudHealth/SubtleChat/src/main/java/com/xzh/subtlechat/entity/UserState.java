package com.xzh.subtlechat.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * (UserState)实体类
 *
 * @author makejava
 * @since 2020-06-16 11:36:02
 */
@Data
public class UserState implements Serializable {
    private static final long serialVersionUID = -38130170610280885L;

    private Integer id;
    /**
     * 状态名
     */
    private String name;

}