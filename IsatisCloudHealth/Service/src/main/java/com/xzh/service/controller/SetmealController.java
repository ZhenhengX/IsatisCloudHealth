package com.xzh.service.controller;

import com.xzh.common.dto.SetmealDTO;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Setmeal;
import com.xzh.service.service.SetmealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("Service/setmeal")
public class SetmealController {

    @Autowired
    private SetmealService setmealService;

    //新增
    @PostMapping("add")
    public void add(@RequestBody SetmealDTO setmealDTO) {
        setmealService.add(setmealDTO.getSetmeal(), setmealDTO.getCheckgroupIds());
    }

    //分页查询
    @GetMapping("findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return setmealService.findPage(queryPageBean);
    }

    //查询所有套餐
    @GetMapping("findAll")
    public List<Setmeal> findAll() {
        return setmealService.findAll();
    }

    //根据id查询套餐数据
    @GetMapping("findById/{id}")
    public Setmeal findById(@PathVariable int id) {
        return setmealService.findById(id);
    }

    //获取套餐预约占比
    @GetMapping("findSetmealCount")
    public List<Map<String, Object>> findSetmealCount() {
        return setmealService.findSetmealCount();
    }

    //根据检查组Id查询检查项Id
    @GetMapping("findIdInMiddleTable/{setMealId}")
    public List<String> findIdInMiddleTable(@PathVariable String setMealId) {
        return setmealService.findIdInMiddleTable(setMealId);
    }

    //编辑套餐
    @PutMapping("edit")
    public void edit(@RequestBody SetmealDTO setmealDTO) {
        setmealService.edit(setmealDTO.getSetmeal(), setmealDTO.getCheckgroupIds(), setmealDTO.getTempImgId());
    }

    //删除套餐
    @DeleteMapping("delete/{setMealId}/{imgId}")
    public void delete(@PathVariable Integer setMealId, @PathVariable String imgId) {
        setmealService.delete(setMealId, imgId);
    }

    //不带分页的查询所有
    @GetMapping("findAllSetmeal")
    public List<Setmeal> findAllSetmeal() {
        return setmealService.findAllSetmeal();
    }
}
