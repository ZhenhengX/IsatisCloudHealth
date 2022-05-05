package com.xzh.service.config;

import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * <p>创建 MyBatis-Plus拦截器</p>
 */

@Configuration
public class MPConfig {

    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        // 创建拦截器对象
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        // 添加具体拦截实现（分页查询拦截）
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor());
        return interceptor;
    }

}
