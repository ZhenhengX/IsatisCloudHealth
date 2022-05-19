package com.xzh.common.dto;

import com.xzh.common.pojo.Role;
import lombok.Data;

import java.io.Serializable;

@Data
public class RoleDTO implements Serializable {

    private Integer[] permissionIds;
    private Integer[] menuIds;
    private Role role;

    public RoleDTO() {
    }

    public RoleDTO(Integer[] permissionIds, Integer[] menuIds, Role role) {
        this.permissionIds = permissionIds;
        this.menuIds = menuIds;
        this.role = role;
    }
}
