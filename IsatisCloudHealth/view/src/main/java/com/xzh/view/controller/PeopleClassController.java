package com.xzh.view.controller;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.view.openFeign.PeopleClassFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 人群分类
 */
@RestController
@RequestMapping("/peopleclass")
public class PeopleClassController {
    @Autowired
    private PeopleClassFeign peopleClassService;


    /**
     * 分页查询
     */
    @RequestMapping("/findPage")
    public PageResult PeopleClass(@RequestBody QueryPageBean queryPageBean) {

        return peopleClassService.findPage(queryPageBean);
    }

}
