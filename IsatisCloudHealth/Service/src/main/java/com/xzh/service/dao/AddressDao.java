package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.xzh.common.pojo.Address;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AddressDao extends BaseMapper<Address> {

    @Select("select * from t_address")
    Page<Address> findPage();

    @Select("select t_address.id, t_address.addressName, t_address.telephone, t_address.lngAndLat, t_address.img, t_address.map, t_address.detailaddress" +
            " from t_address where addressName like #{queryString} or detailaddress like #{queryString}")
    Page<Address> findByCondition(String queryString);

    @Select("SELECT  a.addressName,a.detailaddress " +
            "FROM  ( SELECT * FROM t_order WHERE t_order.member_id = #{id} ) o " +
            "INNER JOIN t_address a ON o.address_id = a.id")
    Address getByMemberId(Integer id);


}
