package com.xzh.common.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class AdviceDTO implements Serializable {
    private Integer tempOrderId;
    private String[] foodIds;
    private String[] sportIds;
    private String username;
    private String suggestion;

    public AdviceDTO(Integer tempOrderId, String[] foodIds, String[] sportIds, String username, String suggestion) {
        this.tempOrderId = tempOrderId;
        this.foodIds = foodIds;
        this.sportIds = sportIds;
        this.username = username;
        this.suggestion = suggestion;
    }

    public AdviceDTO() {
    }
}
