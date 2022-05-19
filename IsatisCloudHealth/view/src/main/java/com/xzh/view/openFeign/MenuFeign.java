package com.xzh.view.openFeign;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Menu;
import com.xzh.common.pojo.Role;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@FeignClient(name = "Service", path = "Service/menu")
public interface MenuFeign {

    @GetMapping("findPage")
    PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    @GetMapping("findAllMenu")
    List<Map<String, Object>> findAllMenu();

    @GetMapping("findByNameAndLkurl/{name}/{linkUrl}")
    List<Menu> findByNameAndLkurl(@PathVariable("name") String name, @PathVariable("linkUrl") String linkUrl);

    @PostMapping("add")
    void add(@RequestBody Menu menu);

    @GetMapping("findById/{id}")
    Menu findById(@PathVariable("id") Integer id);

    @PutMapping("edit")
    void edit(@RequestBody Menu menu);

    @GetMapping("findRoleBymid/{id}")
    List<Role> findRoleBymid(@PathVariable("id") Integer id);

    @GetMapping("findmenuById/{id}")
    Menu findmenuById(@PathVariable("id") Integer id);

    @DeleteMapping("delete/{id}")
    void delete(@PathVariable("id") Integer id);

}
