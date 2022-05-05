package com.xzh.subtlechat.config;

import lombok.Data;
import lombok.Getter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author Zhenheng.Xie
 * @program: SubtleChat
 * @description:
 * @create 2021/12/5 - 19:25
 **/
@Data
@Component
public class AliyunOssConfig {
    private String endpoint = "oss-cn-beijing.aliyuncs.com";
    private String keyid = "LTAI5tSoWiZt24zivA4xbkVw";
    private String keysecret = "g3wWgz1XXjeOi96xtl3yd1W608FCeZ";
    private String bucketname = "isatis";
}
