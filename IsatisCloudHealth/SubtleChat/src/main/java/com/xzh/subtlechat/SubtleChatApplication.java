package com.xzh.subtlechat;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
@MapperScan("com.xzh.subtlechat.dao")
public class SubtleChatApplication {

    public static void main(String[] args) {
        SpringApplication.run(SubtleChatApplication.class, args);
    }

}
