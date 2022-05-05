package com.xzh.common.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * 干预方案对应的实体类
 */
@Data
public class Scheme implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;//主键
    private String title;//标题
    private String keyword;//关键词
    private String people;//人群
    private String goal;//方案目标
    private Integer statue;//状态
    private String remarks;//备注
}
