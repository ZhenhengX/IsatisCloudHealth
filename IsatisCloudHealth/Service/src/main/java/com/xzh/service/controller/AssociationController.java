package com.xzh.service.controller;

import com.xzh.common.pojo.CheckGroup;
import com.xzh.common.pojo.CheckItem;
import com.xzh.service.service.AssociationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 多表关联查询
 */
@RestController
@RequestMapping("Service/association")
public class AssociationController {

    @Autowired
    private AssociationService associationService;

    @GetMapping("findCheckGroupsBySetMealId/{setMealId}")
    public List<CheckGroup> findCheckGroupsBySetMealId(@PathVariable Integer setMealId) {
        return associationService.findCheckGroupsBySetMealId(setMealId);
    }

    @GetMapping("findCheckItemsByCheckGroupId/{checkGroupId}")
    public List<CheckItem> findCheckItemsByCheckGroupId(@PathVariable Integer checkGroupId) {
        return associationService.findCheckItemsByCheckGroupId(checkGroupId);
    }

}
