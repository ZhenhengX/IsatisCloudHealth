package com.xzh.subtlechat.entity;

import lombok.Data;

import java.util.List;

/**
 * @author luo
 * @date 2020/6/22 - 19:18
 */
@Data
public class RespPageBean {
    private Long total;//数据总数
    private List<?> data;//数据实体列表
}
