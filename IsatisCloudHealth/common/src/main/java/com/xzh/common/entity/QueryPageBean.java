package com.xzh.common.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * 封装带条件的分页查询
 */
@Data
public class QueryPageBean implements Serializable {
    private Integer currentPage;//页码
    private Integer pageSize;//每页记录数
    private String queryString;//查询条件

    public QueryPageBean(Integer currentPage, Integer pageSize, String queryString) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.queryString = queryString;
    }

    public QueryPageBean() {
    }
}