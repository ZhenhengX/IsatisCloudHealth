package com.xzh.view.openFeign;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Food;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@FeignClient(name = "Service", path = "Service/food")
public interface FoodFeign {

    @GetMapping("findById/{id}")
    Food findById(@PathVariable("id") Integer id);

    @GetMapping("findPage")
    PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    @PostMapping("add")
    void add(@RequestBody Food food);

    @DeleteMapping("delete/{id}")
    void delete(@PathVariable("id") Integer id);

    @PutMapping("edit")
    void edit(@RequestBody Food food);

    @PostMapping("save")
    void save(@RequestBody List<Food> foods);

    @GetMapping("findAll")
    List<Food> findAll();

}
