package com.xzh.view.controller;


import com.xzh.common.constant.MessageConstant;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.Address;
import com.xzh.common.utils.AliyunOssUtils;
import com.xzh.view.openFeign.AddressFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/address")
public class AddressController {

    @Autowired
    private AddressFeign addressFeign;

    //文件上传
    @RequestMapping("/upload")
    public Result upload(@RequestParam("imgFile") MultipartFile imgFile) {
        //获取图片上传原始文件名称
        String originalFilename = imgFile.getOriginalFilename();
        //读取文件后缀名称
        assert originalFilename != null;
        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        //使用UUID创建随机不重复的文件名称加上后缀名称存入数据库
        String imgName = UUID.randomUUID() + extension;

        try {
            AliyunOssUtils.upload(imgFile.getBytes(), imgName);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.PIC_UPLOAD_FAIL);
        }
        //释放资源
        return new Result(true, MessageConstant.PIC_UPLOAD_SUCCESS, imgName);
    }

    //分页查询所有机构信息
    @RequestMapping("/findPage")
    public PageResult findPage(@RequestBody QueryPageBean queryPageBean) {
        return addressFeign.findPage(queryPageBean);
    }

    //查询所有体检机构信息
    @RequestMapping("/findAll")
    public Result findAll() {
        try {
            List<Address> addressList = addressFeign.findAll();
            return new Result(true, MessageConstant.QUERY_ADDRESS_LIST_SUCCESS, addressList);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_ADDRESS_LIST_FAIL);
        }
    }

    //添加体检机构功能
    @RequestMapping("/add")
    public Result add(@RequestBody Address address) {
        try {
            addressFeign.add(address);
            return new Result(true, MessageConstant.ADD_ADDRESS_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.ADD_ADDRESS_FAIL);
        }
    }

    //删除体检机构功能
    @RequestMapping("/delete")
    public Result delete(Integer id) {
        try {
            //判断中间关联表   t_order_address  中是否存在该机构编号的引用
            long num = addressFeign.findByAddressId(id);
            if (num > 0) {
                return new Result(false, MessageConstant.DELETE_ADDRESS_AND_FAIL);
            } else {
                addressFeign.delete(id);
                return new Result(true, MessageConstant.DELETE_ADDRESS_SUCCESS);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.DELETE_ADDRESS_FAIL);
        }
    }


    //根据机构id查询信息进行回显
    @RequestMapping("/findUpdate")
    public Result findUpdate(Integer id) {
        try {
            Address address = addressFeign.findUpdate(id);
            return new Result(true, MessageConstant.GET_ADDRESS_SUCCESS, address);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_ADDRESS_FAIL);
        }
    }


    //修改机构功能
    @RequestMapping("/edit")
    public Result edit(@RequestBody Address address) {
        try {
            addressFeign.edit(address);
            return new Result(true, MessageConstant.EDIT_ADDRESS_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.EDIT_ADDRESS_FAIL);
        }
    }
}
