package com.xzh.view.controller;

import com.xzh.common.constant.MessageConstant;
import com.xzh.common.constant.RedisConstant;
import com.xzh.common.dto.SetmealDTO;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Setmeal;
import com.xzh.common.utils.QiniuUtils;
import com.xzh.view.openFeign.SetmealFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import redis.clients.jedis.JedisPool;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/setmeal")
public class SetmealController {
    @Autowired
    private SetmealFeign setmealService;
    //使用JedisPool操作Redis服务
    @Autowired
    private JedisPool jedisPool;

    @RequestMapping("upload")
    public Result upload(@RequestParam("imgFile") MultipartFile imgFile) {
        String originalFilename = imgFile.getOriginalFilename();
        int index = originalFilename.lastIndexOf(".");
        String pn = originalFilename.substring(index - 1);//.jpg
        String fileName = UUID.randomUUID() + pn;
        try {
            //将图片存入七牛云
            QiniuUtils.upload2Qiniu(imgFile.getBytes(), fileName);
            //将图片上传到七牛云的同时将图片名称存入Redis大集合中
            jedisPool.getResource().sadd(RedisConstant.SETMEAL_PIC_RESOURCES, fileName);
        } catch (IOException e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.PIC_UPLOAD_FAIL);
        }
        return new Result(true, MessageConstant.PIC_UPLOAD_SUCCESS, fileName);
    }

    //新增
    @PreAuthorize("hasAuthority('SETMEAL_ADD')")//权限校验
    @RequestMapping("/add")
    public Result add(@RequestBody Setmeal setmeal, Integer[] checkgroupIds) {
        try {
            SetmealDTO setmealDTO = new SetmealDTO(setmeal, checkgroupIds);
            setmealService.add(setmealDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.ADD_SETMEAL_FAIL);
        }
        return new Result(true, MessageConstant.ADD_SETMEAL_SUCCESS);
    }

    //查询所有(分页查询)
    @PreAuthorize("hasAuthority('SETMEAL_QUERY')")//权限校验
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return setmealService.findPage(queryPageBean);
    }

    //根据套餐id查询检查组ids
    @RequestMapping("/findIdInMiddleTable")
    public Result findIdInMiddleTable(String setMealId) {
        try {
            List<String> checkgroupIds = setmealService.findIdInMiddleTable(setMealId);
            return new Result(true, MessageConstant.QUERY_CHECKGROUP_SUCCESS, checkgroupIds);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_CHECKGROUP_FAIL);
        }
    }

    //修改
    @PreAuthorize("hasAuthority('SETMEAL_EDIT')")//权限校验
    @RequestMapping("/edit")
    public Result edit(@RequestBody Setmeal setmeal, Integer[] checkgroupIds, String tempImgId) {
        try {
            SetmealDTO setmealDTO = new SetmealDTO(setmeal, checkgroupIds, tempImgId);
            setmealService.edit(setmealDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.EDIT_SETMEAL_FAIL);
        }
        return new Result(true, MessageConstant.EDIT_SETMEAL_SUCCESS);
    }

    //删除
    @PreAuthorize("hasAuthority('SETMEAL_DELETE')")//权限校验
    @RequestMapping("/delete")
    public Result delete(Integer setMealId, String imgId) {
        try {
            setmealService.delete(setMealId, imgId);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.DELETE_SETMEAL_FAIL);
        }
        return new Result(true, MessageConstant.DELETE_SETMEAL_SUCCESS);
    }

    @RequestMapping("/findAllSetmeal")
    public Result findAllSetmeal() {
        try {
            List<Setmeal> list = setmealService.findAllSetmeal();
            return new Result(true, MessageConstant.QUERY_SETMEALLIST_SUCCESS, list);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_SETMEALLIST_FAIL);
        }
    }
}
