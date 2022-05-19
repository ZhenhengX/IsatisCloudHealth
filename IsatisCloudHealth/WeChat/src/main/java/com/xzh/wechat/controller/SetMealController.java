package com.xzh.wechat.controller;

import com.xzh.common.constant.MessageConstant;
import com.xzh.common.entity.Result;
import com.xzh.common.pojo.CheckGroup;
import com.xzh.common.pojo.CheckItem;
import com.xzh.common.pojo.Member;
import com.xzh.common.pojo.Setmeal;
import com.xzh.wechat.openFeign.AssociationFeign;
import com.xzh.wechat.openFeign.SetmealFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/setmeal")
public class SetMealController {

    @Autowired
    private SetmealFeign setmealFeign;
    @Autowired
    private AssociationFeign associationFeign;

    @RequestMapping("/getSetmeal")
    public Result getSetmeal() {
        try {
            List<Setmeal> setMealList = setmealFeign.findAll();
            return new Result(true, MessageConstant.GET_SETMEAL_LIST_SUCCESS, setMealList);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.GET_SETMEAL_LIST_FAIL);
        }
    }

    /**
     * 返回套餐详情和手机号用于回显
     *
     * @param id      套餐id
     * @param request 用于获取存储在session中的member对象
     */
    @RequestMapping("/findById")
    public Result findById(Integer id, HttpServletRequest request) {
        try {
            //获取套餐对象
            Setmeal setmeal = setmealFeign.findById(id);
            List<CheckGroup> checkGroups = associationFeign.findCheckGroupsBySetMealId(setmeal.getId());
            for (int i = 0; i < checkGroups.size(); i++) {
                CheckGroup checkGroup = checkGroups.get(i);
                List<CheckItem> checkItems = associationFeign.findCheckItemsByCheckGroupId(checkGroup.getId());
                checkGroup.setCheckItems(checkItems);
                checkGroups.set(i, checkGroup);
            }
            setmeal.setCheckGroups(checkGroups);

            //获取存储在session中的member对象
            Member member = (Member) request.getSession().getAttribute("MemberMessage");
            HashMap dataMap = new HashMap();
            if (member != null) {
                // 把套餐对象和电话号码封装进map集合中
                if (member.getName() != null && member.getName().length() > 0) {
                    dataMap.put("memberName", member.getName());
                }
                dataMap.put("phoneNumber", member.getPhoneNumber());
            }

            dataMap.put("setmeal", setmeal);
            return new Result(true, MessageConstant.QUERY_SETMEAL_SUCCESS, dataMap);
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, MessageConstant.QUERY_SETMEAL_FAIL);
        }
    }
}
