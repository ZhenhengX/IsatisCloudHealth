package com.xzh.wechat.openFeign;

import com.xzh.common.pojo.CheckGroup;
import com.xzh.common.pojo.CheckItem;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@FeignClient(name = "Service", path = "Service/association")
public interface AssociationFeign {

    @GetMapping("findCheckGroupsBySetMealId/{setMealId}")
    List<CheckGroup> findCheckGroupsBySetMealId(@PathVariable(value = "setMealId") Integer setMealId);

    @GetMapping("findCheckItemsByCheckGroupId/{checkGroupId}")
    List<CheckItem> findCheckItemsByCheckGroupId(@PathVariable(value = "checkGroupId") Integer checkGroupId);

}
