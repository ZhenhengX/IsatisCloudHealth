package com.xzh.view.openFeign;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Permission;
import com.xzh.common.pojo.Role;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@FeignClient(name = "Service", path = "Service/permission")
public interface PermissionFeign {

    @GetMapping("findPage")
    PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    @PostMapping("add")
    void add(@RequestBody Permission permission);

    @GetMapping("findByPmName2KeyWord/{name}/{keyword}")
    Permission findByPmName2KeyWord(@PathVariable("name") String name, @PathVariable("keyword") String keyword);

    @PutMapping("edit")
    void edit(@RequestBody Permission permission);

    @GetMapping("findRolesByPmId/{id}")
    List<Role> findRolesByPmId(@PathVariable("id") Integer id);

    @DeleteMapping("delete/{id}")
    void delete(@PathVariable("id") Integer id);

    @GetMapping("findAllPermissionZF")
    List<Permission> findAllPermissionZF();

}
