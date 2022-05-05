package com.xzh.subtlechat.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.xzh.subtlechat.entity.RespBean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author Zhenheng.Xie
 * @date 2020/6/19 - 13:18
 */
@Configuration
public class MyLogoutSuccessHandler implements LogoutSuccessHandler {

    @Override
    public void onLogoutSuccess(HttpServletRequest req, HttpServletResponse resp, Authentication authentication) throws IOException, ServletException {
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.write(new ObjectMapper().writeValueAsString(RespBean.ok("成功退出！")));
        out.flush();
        out.close();
    }
}
