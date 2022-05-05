package com.xzh.view.openFeign;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.pojo.Address;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@FeignClient(name = "Service", path = "Service/address")
public interface AddressFeign {

    @GetMapping("findPage")
    PageResult findPage(@RequestBody QueryPageBean queryPageBean);

    @PostMapping("add")
    void add(@RequestBody Address address);

    @GetMapping("findByAddressId/{id}")
    long findByAddressId(@PathVariable("id") Integer id);

    @PutMapping("edit")
    void edit(@RequestBody Address address);

    @DeleteMapping("delete/{id}")
    void delete(@PathVariable("id") Integer id);

    @GetMapping("findUpdate/{id}")
    Address findUpdate(@PathVariable("id") Integer id);

    @GetMapping("findAll")
    List<Address> findAll();

    @GetMapping("findById/{addressId}")
    Address findById(@PathVariable("addressId") Integer addressId);

    @GetMapping("getByMemberId/{id}")
    Address getByMemberId(@PathVariable("id") Integer id);

}
