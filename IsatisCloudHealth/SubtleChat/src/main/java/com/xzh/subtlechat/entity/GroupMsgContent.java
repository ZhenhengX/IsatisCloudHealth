package com.xzh.subtlechat.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * (GroupMsgContent)实体类
 *
 * @author makejava
 * @since 2020-06-17 10:46:50
 */
@Data
public class GroupMsgContent implements Serializable {
    private static final long serialVersionUID = 980328865610261046L;
    /**
     * 消息内容编号
     */
    private Integer id;
    /**
     * 发送者的编号
     */
    private Integer fromId;
    /**
     * 发送者的昵称
     */
    private String fromName;
    /**
     * 发送者的头像
     */
    private String fromProfile;
    /**
     * 消息发送时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
    /**
     * 消息内容
     */
    private String content;
    /**
     * 消息类型编号
     */
    private Integer messageTypeId;


}
