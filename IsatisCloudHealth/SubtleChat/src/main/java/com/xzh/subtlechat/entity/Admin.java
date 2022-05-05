package com.xzh.subtlechat.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;

/**
 * (Admin)实体类
 *
 * @author makejava
 * @since 2020-06-16 11:35:56
 */
@Data
public class Admin implements Serializable, UserDetails {
    private static final long serialVersionUID = -75235725571250857L;

    private Integer id;
    /**
     * 登录账号
     */
    private String username;
    /**
     * 昵称
     */
    private String nickname;
    /**
     * 密码
     */
    private String password;
    /**
     * 管理员头像
     */
    private String userProfile;

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }


}
