package com.xzh.subtlechat.utils;

import com.xzh.subtlechat.entity.User;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author Zhenheng.Xie
 * @date 2020/6/16 - 22:56
 * 用户工具类
 */
public class UserUtil {
    /**
     * 获取当前登录用户实体
     *
     * @return
     */
    public static User getCurrentUser() {
        return ((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
    }
}
