package com.xzh.subtlechat.controller;

import com.xzh.subtlechat.entity.UserState;
import com.xzh.subtlechat.service.UserStateService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * (UserState)表控制层
 *
 * @author makejava
 * @since 2020-06-16 11:36:02
 */
@RestController
@RequestMapping("userState")
public class UserStateController {
    /**
     * 服务对象
     */
    @Resource
    private UserStateService userStateService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public UserState selectOne(Integer id) {
        return this.userStateService.queryById(id);
    }

}