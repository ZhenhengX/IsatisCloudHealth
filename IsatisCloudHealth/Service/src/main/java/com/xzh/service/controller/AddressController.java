package com.xzh.service.controller;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Address;
import com.xzh.service.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("Service/address")
public class AddressController {

    @Autowired
    private AddressService addressService;

    @GetMapping("findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return addressService.findPage(queryPageBean);
    }

    @PostMapping("add")
    public void add(@RequestBody Address address) {
        addressService.add(address);
    }

    @GetMapping("findByAddressId/{id}")
    public long findByAddressId(@PathVariable Integer id) {
        return addressService.findByAddressId(id);
    }

    @PutMapping("edit")
    public void edit(@RequestBody Address address) {
        addressService.edit(address);
    }

    @DeleteMapping("delete/{id}")
    public void delete(@PathVariable Integer id) {
        addressService.delete(id);
    }

    @GetMapping("findUpdate/{id}")
    public Address findUpdate(@PathVariable Integer id) {
        return addressService.findUpdate(id);
    }

    @GetMapping("findAll")
    public List<Address> findAll() {
        return addressService.findAll();
    }

    @GetMapping("findById/{addressId}")
    public Address findById(@PathVariable Integer addressId) {
        return addressService.findById(addressId);
    }

    @GetMapping("getByMemberId/{id}")
    public Address getByMemberId(@PathVariable Integer id) {
        return addressService.getByMemberId(id);
    }
}
