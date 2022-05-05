package com.xzh.view.openFeign;

import com.xzh.common.dto.RoleDTO;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Menu;
import com.xzh.common.pojo.Permission;
import com.xzh.common.pojo.Role;
import com.xzh.common.pojo.User;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@FeignClient(name = "Service", path = "Service/role")
public interface RoleFeign {

    @GetMapping("findPage")
    PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    @GetMapping("findAllPermission")
    Set<Permission> findAllPermission();

    @GetMapping("findAllMenus")
    Set<Menu> findAllMenus();

    @GetMapping("findByName2Kd/{name}/{keyword}")
    List<Role> findByName2Kd(@PathVariable("name") String name, @PathVariable("keyword") String keyword);

    @PostMapping("add")
    void add(@RequestBody RoleDTO roleDTO);

    @GetMapping("findPermissionIdByrid/{rId}")
    List<Integer> findPermissionIdByrid(@PathVariable("rId") Integer rId);

    @GetMapping("findMenuIdByrid/{rId}")
    List<Integer> findMenuIdByrid(@PathVariable("rId") Integer rId);

    @PutMapping("edit")
    void edit(@RequestBody RoleDTO roleDTO);

    @GetMapping("findById/{id}")
    Role findById(@PathVariable("id") Integer id);

    @GetMapping("findPmByrId/{id}")
    Set<Permission> findPmByrId(@PathVariable("id") Integer id);

    @GetMapping("findMnByrId/{id}")
    Set<Menu> findMnByrId(@PathVariable("id") Integer id);

    @GetMapping("findUsById/{id}")
    List<User> findUsById(@PathVariable("id") Integer id);

    @DeleteMapping("deleterole/{id}")
    void deleterole(@PathVariable("id") Integer id);

}
