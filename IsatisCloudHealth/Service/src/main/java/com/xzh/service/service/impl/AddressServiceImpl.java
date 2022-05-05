package com.xzh.service.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Address;
import com.xzh.service.dao.AddressDao;
import com.xzh.service.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AddressServiceImpl extends ServiceImpl<AddressDao, Address> implements AddressService {

    @Autowired
    private AddressDao AddressDao;

    /**
     * 分页查询所有机构信息功能
     */
    @Override
    public PageResult findPage(QueryPageBean queryPageBean) {
        //获取当前页的页码
        Integer currentPage = queryPageBean.getCurrentPage();
        //获取每页显示条目数
        Integer pageSize = queryPageBean.getPageSize();
        //获取查询条件
        String queryString = queryPageBean.getQueryString();
        PageHelper.startPage(currentPage, pageSize);
        Page<Address> addressPage;
        if (queryString != null && queryString.length() > 0) {
            //对查询条件进行 模糊查询
            queryString = "%" + queryString + "%";
            addressPage = AddressDao.findByCondition(queryString);
        } else {
            addressPage = AddressDao.findPage();
        }
        //获取集合
        List<Address> addressList = addressPage.getResult();
        //获取数据总条目数
        long total = addressPage.getTotal();
        return new PageResult(total, addressList);
    }

    /**
     * 新增体检机构
     */
    @Override
    public void add(Address address) {
        AddressDao.insert(address);
    }

    @Override
    public long findByAddressId(Integer id) {
        return AddressDao.selectCount(Wrappers.lambdaQuery(Address.class).eq(Address::getId, id));
    }

    @Override
    public void edit(Address address) {
        AddressDao.updateById(address);
    }

    @Override
    public void delete(Integer id) {
        AddressDao.deleteById(id);
    }

    @Override
    public Address findUpdate(Integer id) {
        return AddressDao.selectById(id);
    }

    @Override
    public List<Address> findAll() {
        return this.list();
    }

    @Override
    public Address findById(Integer addressId) {
        return AddressDao.selectById(addressId);
    }

    //通过用户id查询关联表获得对应的体检机构
    @Override
    public Address getByMemberId(Integer id) {
        return AddressDao.getByMemberId(id);
    }
}
