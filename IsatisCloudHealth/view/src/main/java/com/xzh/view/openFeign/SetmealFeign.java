package com.xzh.view.openFeign;

import com.xzh.common.dto.SetmealDTO;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Setmeal;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@FeignClient(name = "Service", path = "Service/setmeal")
public interface SetmealFeign {

    //新增
    @PostMapping("add")
    void add(@RequestBody SetmealDTO setmealDTO);

    //分页查询
    @GetMapping("findPage")
    PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    //查询所有套餐
    @GetMapping("findAll")
    List<Setmeal> findAll();

    //根据id查询套餐数据
    @GetMapping("findById/{id}")
    Setmeal findById(@PathVariable("id") int id);

    //获取套餐预约占比
    @GetMapping("findSetmealCount")
    List<Map<String, Object>> findSetmealCount();

    //根据检查组Id查询检查项Id
    @GetMapping("findIdInMiddleTable/{setMealId}")
    List<String> findIdInMiddleTable(@PathVariable("setMealId") String setMealId);

    //编辑套餐
    @PutMapping("edit")
    void edit(@RequestBody SetmealDTO setmealDTO);

    //删除套餐
    @DeleteMapping("delete/{setMealId}/{imgId}")
    void delete(@PathVariable("setMealId") Integer setMealId, @PathVariable("imgId") String imgId);

    //不带分页的查询所有
    @GetMapping("findAllSetmeal")
    List<Setmeal> findAllSetmeal();

}
