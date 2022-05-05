package com.xzh.view.controller;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.view.openFeign.Intervention_controlFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 干预控制台
 */
@RestController
@RequestMapping("/intervention_control")
public class Intervention_control {
    @Autowired
    private Intervention_controlFeign intervention_controlService;

    /**
     * 分页查询
     *
     * @param queryPageBean 前端的数据信息
     * @return 返回查询结果 和分页的数据
     */
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return intervention_controlService.findPage(queryPageBean);
    }
}
