package com.xzh.common.dto;

import com.xzh.common.pojo.CheckGroup;
import lombok.Data;

import java.io.Serializable;

@Data
public class CheckGroupDTO implements Serializable {

    private CheckGroup checkGroup;
    private Integer[] checkitemIds;

    public CheckGroupDTO(CheckGroup checkGroup, Integer[] checkitemIds) {
        this.checkGroup = checkGroup;
        this.checkitemIds = checkitemIds;
    }
}
