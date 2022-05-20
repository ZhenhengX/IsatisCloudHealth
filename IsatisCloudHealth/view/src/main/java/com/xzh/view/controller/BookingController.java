package com.xzh.view.controller;

import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.QueryPageBean;
import com.xzh.common.entity.Result;
import com.xzh.view.openFeign.BookingFeign;
import com.xzh.view.openFeign.OrderFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 后台预约管理 -后台预约信息管理
 */
@RestController
@RequestMapping("/booking")
public class BookingController {
    @Autowired
    private BookingFeign bookingService;
    @Autowired
    private OrderFeign orderService;

    /**
     * 分页查询
     *
     * @param queryPageBean 前端的数据信息
     * @return 返回查询结果 和分页的数据
     */
    @RequestMapping("/findPage")
    public Result findPage(@RequestBody QueryPageBean queryPageBean) {
        try {
            //查询成功
            PageResult pageResult = bookingService.findPage(queryPageBean);
            return new Result(true, "分页查询成功", pageResult);
        } catch (Exception e) {
            //失败给出提示信息
            e.printStackTrace();
            return new Result(false, "查询失败");
        }
    }


    /**
     * 改变就诊状态
     *
     * @param orderStatusId 0:已到诊 1: 未到诊
     * @param orderId       预约订单id值
     * @return 返回改变就诊状态的信息
     */
    @PostMapping("/statusEdit/{orderStatusId}/{orderId}")
    public Result statusEdit(@PathVariable Integer orderStatusId, @PathVariable Integer orderId) {
        try {
            orderService.statusEdit(orderStatusId, orderId);
            return new Result(true, "更改就诊状态成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "更改就诊状态失败");
        }
    }
}
