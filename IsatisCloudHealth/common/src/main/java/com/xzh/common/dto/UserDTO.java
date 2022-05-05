package com.xzh.common.dto;

import com.xzh.common.pojo.User;
import lombok.Data;

import java.io.Serializable;

@Data
public class UserDTO implements Serializable {

    private Integer[] roleIds;
    private User user;

    public UserDTO(Integer[] roleIds, User user) {
        this.roleIds = roleIds;
        this.user = user;
    }
}
