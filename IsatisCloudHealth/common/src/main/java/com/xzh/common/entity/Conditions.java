package com.xzh.common.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Conditions extends QueryPageBean {
    private Date[] queryDate;
    private String queryOrderType;
    private String queryOrderStatus;

    public Conditions(Date[] queryDate, String queryOrderType, String queryOrderStatus) {
        this.queryDate = queryDate;
        this.queryOrderType = queryOrderType;
        this.queryOrderStatus = queryOrderStatus;
    }

    public Conditions() {
    }
}
