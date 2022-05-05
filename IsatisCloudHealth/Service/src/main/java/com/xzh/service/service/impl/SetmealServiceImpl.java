package com.xzh.service.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xzh.common.constant.RedisConstant;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Setmeal;
import com.xzh.service.dao.SetmealDao;
import com.xzh.service.service.SetmealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.JedisPool;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SetmealServiceImpl extends ServiceImpl<SetmealDao, Setmeal> implements SetmealService {

    @Autowired
    private SetmealDao setmealDao;
    //注入JedisPool
    @Autowired
    private JedisPool jedisPool;

    //新增
    @Override
    public void add(Setmeal setmeal, Integer[] checkgroupIds) {
        //新增套餐
        setmealDao.insert(setmeal);
        //获取SetmealId
        Integer setmealId = setmeal.getId();
        //调用新增关联关系方法
        this.setSetmealIdAndCheckGroupId(setmealId, checkgroupIds);
        //获取图片名称
        String fileName = setmeal.getImg();
        if (fileName != null && !fileName.equals("")) {
            //新建套餐成功之后将图片名称存入Redis小集合中
            jedisPool.getResource().sadd(RedisConstant.SETMEAL_PIC_DB_RESOURCES, fileName);
        }
    }

    //分页查询
    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        //获取当前页，总页数，条件查询的参数
        Integer currentPage = queryPageBean.getCurrentPage();
        Integer pageSize = queryPageBean.getPageSize();
        String queryString = queryPageBean.getQueryString();
        //启动分页插件
        PageHelper.startPage(currentPage, pageSize);
        //调用持久层查询所有
        Page<Setmeal> page = setmealDao.selectByCondition(queryString);
        //获取总条目数
        long total = page.getTotal();
        //获取查询结果
        List<Setmeal> rows = page.getResult();
        return new PageResult(total, rows);
    }

    //查询所有套餐
    @Override
    public List<Setmeal> findAll() {
        return this.list();
    }

    //根据id查询套餐信息
    @Override
    public Setmeal findById(int id) {
        return setmealDao.selectById(id);
    }

    //套餐预约占比饼形图
    @Override
    public List<Map<String, Object>> findSetmealCount() {
        return setmealDao.findSetmealCount();
    }

    //根据套餐Id查询检查组id
    @Override
    public List<String> findIdInMiddleTable(String setMealId) {
        List<String> checkgroupIds = new ArrayList<>();
        if (setMealId != null && !setMealId.equals("")) {
            checkgroupIds = setmealDao.findCheckGroupIdsBySetMealId(setMealId);
        }
        return checkgroupIds;
    }

    //编辑套餐
    @Override
    public void edit(Setmeal setmeal, Integer[] checkgroupIds, String tempImgId) {
        //把Redis中小集合中存的图片名称替换
        if (tempImgId != null && !tempImgId.equals("")) {
            //清理Redis中小集合内的原图片名
            jedisPool.getResource().srem(RedisConstant.SETMEAL_PIC_DB_RESOURCES, tempImgId);
            //将更新后的图片名称存入Redis
            String fileName = setmeal.getImg();
            jedisPool.getResource().sadd(RedisConstant.SETMEAL_PIC_DB_RESOURCES, fileName);
        }
        //编辑套餐
        setmealDao.updateById(setmeal);
        //获取SetmealId
        Integer setmealId = setmeal.getId();
        //编辑套餐和检查组关联关系
        if (checkgroupIds != null && checkgroupIds.length > 0) {
            //先清空关联关系
            setmealDao.deleteSetmealAndCheckgroup(setmealId);
            this.setSetmealIdAndCheckGroupId(setmealId, checkgroupIds);
        }
    }

    //删除套餐
    @Override
    public void delete(Integer setMealId, String imgId) {
        //删除Redis中小集合中的图片
        if (imgId != null && !imgId.equals("")) {
            jedisPool.getResource().srem(RedisConstant.SETMEAL_PIC_DB_RESOURCES, imgId);
        }
        //删除操作
        if (setMealId != null) {
            //先删除关联关系
            setmealDao.deleteSetmealAndCheckgroup(setMealId);
            //根据id删除套餐
            setmealDao.deleteById(setMealId);
        }
    }

    //抽取的新增关联关系的方法
    public void setSetmealIdAndCheckGroupId(Integer setmealId, Integer[] checkgroupIds) {
        //判断检查项ids数组是否为空
        if (checkgroupIds != null && checkgroupIds.length > 0) {
            //不为空则遍历数组，用map存储CheckItemId和CheckGroupId
            for (Integer checkgroupId : checkgroupIds) {
                Map map = new HashMap<>();
                map.put("setmealId", setmealId);
                map.put("checkgroupId", checkgroupId);
                //新增关联关系
                setmealDao.setSetmealIdAndCheckGroupId(map);
            }
        }
    }

    //查询所有套餐，用于预约添加回显
    public List<Setmeal> findAllSetmeal() {
        return this.list();
    }
}
