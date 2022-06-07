package com.xzh.wechat.controller;

import com.xzh.common.constant.MessageConstant;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Member;
import com.xzh.common.utils.MD5Utils;
import com.xzh.wechat.openFeign.MemberFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberFeign memberFeign;

    /**
     * <p>注册</p>
     */
    @RequestMapping("/register")
    public Result register(@RequestBody Map<String, String> dataMap) {
        String telephone = dataMap.get("phoneData");
        // 查询该手机号是否已注册
        Member member = memberFeign.findByTelephone(telephone);
        if (member != null) {
            return new Result(false, "该手机号已注册");
        }
        member = new Member();
        member.setPhoneNumber(telephone);
        member.setPassword(MD5Utils.md5(dataMap.get("passData")));
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            member.setRegTime(dateFormat.parse(dateFormat.format(new Date())));
        } catch (ParseException e) {
            e.printStackTrace();
            return new Result(false, "服务器异常");
        }
        memberFeign.add(member);
        return new Result(true, "注册成功");
    }

    /**
     * <p>登录</p>
     */
    @RequestMapping("/login")
    public Result login(HttpServletRequest request, HttpServletResponse response, @RequestBody Map<String, String> dataMap) {
        //获取前端输入的手机号
        String telephone = dataMap.get("phoneData");
        //获取前端输入的密码
        String password = dataMap.get("passData");
        String md5_password = MD5Utils.md5(password);
        //根据邮箱和加密后的密码查找用户
        Member member = memberFeign.findByTelephoneAndPassword(telephone, md5_password);
        //当前用户存在
        if (member != null) {
            //向客户端浏览器写入cookie用于追踪用户,里面存储该用户的手机号和密码
            Cookie cookie = new Cookie("login_member_telandpwd", telephone + "&" + password);
            //设置路径 "/"下的路径都带着cookie
            cookie.setPath("/");
            //cookie的保存时间
            cookie.setMaxAge(60 * 60 * 24 * 30);
            response.addCookie(cookie);
            //将会员信息保存到session中用于追踪
            HttpSession session = request.getSession();
            session.setAttribute("MemberMessage", member);
            return new Result(true, MessageConstant.LOGIN_SUCCESS, member);
        } else {
            // 密码错误
            return new Result(false, MessageConstant.PASSWORD_ERROR);
        }
    }

    /**
     * 退出登录
     */
    @RequestMapping("/logout")
    public Result logout(HttpServletRequest request, HttpServletResponse response) {
        //清除session中存储的会员的信息
        request.getSession().removeAttribute("MemberMessage");
        //得到该请求携带的所有cookie
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            //遍历cookies集合
            for (Cookie cookie : cookies) {
                if ("login_member_telandpwd".equals(cookie.getName())) {
                    //清除这个cookie,以下步骤缺一不可
                    cookie.setValue("");
                    cookie.setPath("/");
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
        }
        return new Result(true);
    }

    /**
     * 修改会员信息
     */
    @RequestMapping("/editMember")
    public Result editMember(@RequestBody Member member, HttpServletRequest request) {
        try {
            //更新数据库中的会员信息
            memberFeign.editMember(member);

            //获取存储在session中的会员信息并更新
            request.getSession().setAttribute("MemberMessage", member);

            //把member对象返回给前端用于数据回显
            return new Result(true, "修改成功", member);
        } catch (Exception e) {
            return new Result(false, "修改失败");
        }
    }
}
