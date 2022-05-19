package com.xzh.view.controller;

import com.xzh.common.entity.Conditions;
import com.xzh.common.entity.PageResult;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.CheckGroup;
import com.xzh.common.pojo.CheckItem;
import com.xzh.common.pojo.Order;
import com.xzh.view.openFeign.AssociationFeign;
import com.xzh.view.openFeign.OrderFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderFeign orderService;
    @Autowired
    private AssociationFeign associationFeign;


    //分页查询
    @RequestMapping("/findByPageAndCondition")
    public Result findByPageAndCondition(@RequestBody Conditions conditions) {
        PageResult result = orderService.findByPageAndCondition(conditions);
        return new Result(true, "查询成功", result);
    }

    //编辑操作，先查询点击对象的id
    @RequestMapping("/findOrderById")
    public Result findOrderById(Integer id) {
        try {
            Map map = orderService.findOrderById(id);
            return new Result(true, "查询成功", map);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "查询失败");
        }
    }

    //通过订单id查询套餐idq
    @RequestMapping("/findSetmealIdsByOrderId")
    public Result findSetmealIdsByOrderId(Integer id) {
        try {
            List<Integer> setmealIds = orderService.findSetmealIdsByOrderId(id);
            return new Result(true, "查询成功", setmealIds);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "查询失败");
        }
    }

    //保存编辑后的数据
    @RequestMapping("/edit")
    public Result edit(Integer setmealId, @RequestBody Map map) {
        try {
            orderService.edit(setmealId, map);
            return new Result(true, "编辑成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "编辑失败");
        }
    }


    //删除预约
    @RequestMapping("/delete")
    public Result delete(Integer id) {
        try {
            orderService.delete(id);
            return new Result(true, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "删除失败");
        }
    }

    //新增预约
    @RequestMapping("/addPhoneOrder")
    public Result addPhoneOrder(@RequestBody Map map) throws Exception {
        map.put("orderType", Order.ORDERTYPE_TELEPHONE);
        return orderService.addPhoneOrder(map);
    }

    //修改预约状态
    @RequestMapping("/statusEdit")
    public Result statusEdit(Integer id) {
        try {
            orderService.statusEdit(id);
            return new Result(true, "修改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "修改失败");
        }
    }

    /**
     * <p>根据orderId查询套餐下所有的检查项和检查组的名称</p>
     * 返回值形式 : {GroupName: {ItemName: "", ItemName: ""}}
     */
    @RequestMapping("findAllCheckByStMealId/{setmealId}")
    public Result findAllCheckByStMealId(@PathVariable Integer setmealId) {
        Map<String, Map<String, String>> checkNames = new HashMap<>();
        List<CheckGroup> checkGroups = associationFeign.findCheckGroupsBySetMealId(setmealId);
        for (CheckGroup checkGroup : checkGroups) {
            List<CheckItem> checkItems = associationFeign.findCheckItemsByCheckGroupId(checkGroup.getId());
            Map<String, String> checkItemNames = new HashMap<>();
            for (CheckItem checkItem : checkItems) {
                checkItemNames.put(checkItem.getName(), "");
            }
            checkNames.put(checkGroup.getName(), checkItemNames);
        }
        return new Result(true, checkNames);
    }

    /**
     * <p>根据orderId查询检查报告</p>
     */
    @RequestMapping("findCheckReportByOrderId/{orderId}")
    public Result findCheckReportByOrderId(@PathVariable Integer orderId) {
        Map<String, Map<String, String>> checkReport = orderService.findCheckReportByOrderId(orderId);
        if (checkReport != null && checkReport.size() > 0) {
            return new Result(true, checkReport);
        }
        return new Result(false);
    }

    /**
     * <p>根据orderId更新检查报告</p>
     */
    @RequestMapping("updateCheckReport/{orderId}")
    public Result updateCheckReport(@PathVariable Integer orderId, @RequestBody Map<String, Map<String, String>> checkReport) {
        return new Result(true, orderService.updateCheckReport(orderId, checkReport));
    }

}
