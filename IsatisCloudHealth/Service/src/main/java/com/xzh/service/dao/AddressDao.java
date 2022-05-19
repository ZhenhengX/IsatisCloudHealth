package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.xzh.common.pojo.Address;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AddressDao extends BaseMapper<Address> {

    @Select("select * from h_address")
    Page<Address> findPage();

    @Select("select h_address.id, h_address.addressName, h_address.telephone, h_address.lngAndLat, h_address.img, h_address.map, h_address.detailaddress" +
            " from h_address where addressName like #{queryString} or detailaddress like #{queryString}")
    Page<Address> findByCondition(String queryString);

    @Select("SELECT  a.addressName,a.detailaddress " +
            "FROM  ( SELECT * FROM h_order WHERE h_order.member_id = #{id} ) o " +
            "INNER JOIN h_address a ON o.address_id = a.id")
    Address getByMemberId(Integer id);


}
