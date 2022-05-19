package com.xzh.wechat.controller;

import com.xzh.common.constant.MessageConstant;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Address;
import com.xzh.wechat.openFeign.AddressFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/address")
public class AddressController {

    @Autowired
    private AddressFeign addressFeign;


    //查询所有体检机构信息
    @RequestMapping("/findAllAddress")
    public Result findAllAddress() {
        try {
            List<Address> addressList = addressFeign.findAll();
            return new Result(true, MessageConstant.QUERY_ADDRESS_LIST_SUCCESS, addressList);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_ADDRESS_LIST_FAIL);
        }
    }


    @RequestMapping("/findByAddressId")
    public Result findByAddressId(Integer addressId) {
        Address address = addressFeign.findById(addressId);
        return new Result(true, MessageConstant.GET_ADDRESS_SUCCESS, address);
    }

}
