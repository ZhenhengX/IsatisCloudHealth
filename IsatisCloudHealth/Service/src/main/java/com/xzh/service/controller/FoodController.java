package com.xzh.service.controller;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Food;
import com.xzh.service.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("Service/food")
public class FoodController {

    @Autowired
    private FoodService foodService;

    @GetMapping("findById/{id}")
    public Food findById(@PathVariable Integer id) {
        return foodService.findById(id);
    }

    @GetMapping("findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return foodService.findPage(queryPageBean);
    }

    @PostMapping("add")
    public void add(@RequestBody Food food) {
        foodService.add(food);
    }

    @DeleteMapping("delete/{id}")
    public void delete(@PathVariable Integer id) {
        foodService.delete(id);
    }

    @PutMapping("edit")
    public void edit(@RequestBody Food food) {
        foodService.edit(food);
    }

    @PostMapping("save")
    public void save(@RequestBody List<Food> foods) {
        foodService.save(foods);
    }

    @GetMapping("findAll")
    public List<Food> findAll() {
        return foodService.findAll();
    }

}
