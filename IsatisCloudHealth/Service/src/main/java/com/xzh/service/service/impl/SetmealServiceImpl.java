package com.xzh.service.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Setmeal;
import com.xzh.common.utils.AliyunOssUtils;
import com.xzh.service.dao.SetmealDao;
import com.xzh.service.service.SetmealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SetmealServiceImpl extends ServiceImpl<SetmealDao, Setmeal> implements SetmealService {

    @Autowired
    private SetmealDao setmealDao;

    //新增
    @Override
    public void add(Setmeal setmeal, Integer[] checkgroupIds) {
        //新增套餐
        setmealDao.insert(setmeal);
        //获取SetmealId
        Integer setmealId = setmeal.getId();
        //调用新增关联关系方法
        this.setSetmealIdAndCheckGroupId(setmealId, checkgroupIds);
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
        if (setMealId != null) {
            // 删除OSS图片
            if (setmealDao.selectById(setMealId).getImg() != null) {
                AliyunOssUtils.delete(setmealDao.selectById(setMealId).getImg());
            }

            // 先删除关联关系
            setmealDao.deleteSetmealAndCheckgroup(setMealId);
            // 根据id删除套餐
            setmealDao.deleteById(setMealId);
        }
    }

    // 存储setMeal和checkGroup的关联关系
    public void setSetmealIdAndCheckGroupId(Integer setmealId, Integer[] checkgroupIds) {
        if (checkgroupIds != null && checkgroupIds.length > 0) {
            for (Integer checkgroupId : checkgroupIds) {
                Map<String, Integer> map = new HashMap<>();
                map.put("setMealId", setmealId);
                map.put("checkGroupId", checkgroupId);
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
