package com.xzh.service.service.impl;

import com.xzh.common.pojo.Food;
import com.xzh.common.pojo.Order;
import com.xzh.common.pojo.Sport;
import com.xzh.service.dao.AdviceDao;
import com.xzh.service.dao.FoodDao;
import com.xzh.service.dao.MemberDao;
import com.xzh.service.dao.SportDao;
import com.xzh.service.service.AdviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdviceServiceImpl implements AdviceService {
    @Autowired
    private AdviceDao adviceDao;
    @Autowired
    private FoodDao foodDao;
    @Autowired
    private SportDao sportDao;
    @Autowired
    private MemberDao memberDao;

    //添加
    @Override  //tempOrderId:预约表中的id值 suggestion：健康师的建议
    public void add(Integer tempOrderId, String[] foodIds, String[] sportIds, String username, String suggestion) {
        StringBuilder foodTemp = new StringBuilder();//定义一个food中间字符串接收 饮食的名称
        StringBuilder sportTemp = new StringBuilder();//定义一个字符串接受 运动的id数组信息

        for (String foodId : foodIds) {
            Integer foodid = Integer.parseInt(foodId.substring(1));//获取food的id值（去掉数a1 中的a）
            Food food_name = foodDao.selectById(foodid);//根据food的id值 获取到food
            String foodName = food_name.getFoodname();//获取food的名称属性
            foodTemp.append(foodName).append(",");//苹果，葡萄，
        }
        String food = foodTemp.substring(0, foodTemp.length() - 1);//去掉最后一个逗号 //苹果，葡萄

        for (String sportId : sportIds) {
            Integer sportid = Integer.parseInt(sportId.substring(1));
            Sport sport_name = sportDao.selectById(sportid);//根据sport的id值 获取到sport
            String sportName = sport_name.getSportname();//获取sport的名称属性
            sportTemp.append(sportName).append(",");//跑步，跳绳，
        }
        String sport = sportTemp.substring(0, sportTemp.length() - 1);//跑步，跳绳

        Order order = new Order();
        order.setId(tempOrderId);
        order.setFood(food);
        order.setSport(sport);
        order.setHealthName(username);
        order.setSuggestion(suggestion);

        //把健康管理师 添加到会员表中
        memberDao.update(tempOrderId, username);//把管理师姓名添加到会员表中

        adviceDao.updateById(order);//把预约订单的id值 饮食 运动 健康管理师 建议 保存到Order表中

    }
}
