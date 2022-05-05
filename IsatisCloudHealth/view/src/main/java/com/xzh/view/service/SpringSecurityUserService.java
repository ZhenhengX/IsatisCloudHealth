package com.xzh.view.service;

import com.xzh.common.pojo.Permission;
import com.xzh.common.pojo.Role;
import com.xzh.common.pojo.User;
import com.xzh.view.openFeign.UserFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Component
public class SpringSecurityUserService implements UserDetailsService {
    @Autowired
    private UserFeign userService;

    //根据用户名查询数据库获取用户信息
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userService.findByUsername(username);
        if (user == null) {
            return null;
        }
        Set<Role> roles = user.getRoles();
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        if (roles != null && roles.size() > 0) {
            for (Role role : roles) {
                authorities.add(new SimpleGrantedAuthority(role.getKeyword()));
                Set<Permission> permissions = role.getPermissions();
                if (permissions != null && permissions.size() > 0) {
                    for (Permission permission : permissions) {
                        authorities.add(new SimpleGrantedAuthority(permission.getKeyword()));
                    }
                }
            }
        }
        return new org.springframework.security.core.userdetails.User(username, user.getPassword(), authorities);
    }
}
