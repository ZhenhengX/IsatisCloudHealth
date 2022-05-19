package com.xzh.wechat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import redis.clients.jedis.JedisPool;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
public class WeChatApplication {

    public static void main(String[] args) {
        SpringApplication.run(WeChatApplication.class, args);
    }

}
