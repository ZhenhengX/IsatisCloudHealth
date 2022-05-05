package com.xzh.subtlechat.entity;

import lombok.Data;

import java.util.Date;

/**
 * 单聊的消息实体
 *
 * @author Zhenheng.Xie
 * @date 2020/6/25 - 19:32
 */
@Data
public class Message {
    private String from;
    private String to;
    private String content;
    private Date createTime;
    private String fromNickname;
    private String fromUserProfile;
    private Integer messageTypeId;
}
