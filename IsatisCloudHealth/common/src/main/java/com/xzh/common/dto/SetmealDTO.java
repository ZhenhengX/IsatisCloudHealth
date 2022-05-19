package com.xzh.common.dto;

import com.xzh.common.pojo.Setmeal;
import lombok.Data;

import java.io.Serializable;

@Data
public class SetmealDTO implements Serializable {

    private Setmeal setmeal;
    private Integer[] checkgroupIds;
    private String tempImgId;

    public SetmealDTO(Setmeal setmeal, Integer[] checkgroupIds, String tempImgId) {
        this.setmeal = setmeal;
        this.checkgroupIds = checkgroupIds;
        this.tempImgId = tempImgId;
    }

    public SetmealDTO(Setmeal setmeal, Integer[] checkgroupIds) {
        this.setmeal = setmeal;
        this.checkgroupIds = checkgroupIds;
    }

    public SetmealDTO() {
    }
}
