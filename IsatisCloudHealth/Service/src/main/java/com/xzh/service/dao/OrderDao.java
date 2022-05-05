package com.xzh.service.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.xzh.common.pojo.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Mapper
public interface OrderDao extends BaseMapper<Order> {

    @Select("<script>" +
            "select * from t_order" +
            "        <where>" +
            "            <if test=\"id != null\">" +
            "                and id = #{id}" +
            "            </if>" +
            "            <if test=\"memberId != null\">" +
            "                and member_id = #{memberId}" +
            "            </if>" +
            "            <if test=\"orderDate != null\">" +
            "                and orderDate = #{orderDate}" +
            "            </if>" +
            "            <if test=\"orderType != null\">" +
            "                and orderType = #{orderType}" +
            "            </if>" +
            "            <if test=\"orderStatus != null\">" +
            "                and orderStatus = #{orderStatus}" +
            "            </if>" +
            "            <if test=\"setmealId != null\">" +
            "                and setmeal_id = #{setmealId}" +
            "            </if>" +
            "        </where>" +
            "</script>")
    List<Order> findByCondition(Order order);

    @Select("select m.name member ,s.name setmeal,o.orderDate orderDate,o.orderType orderType" +
            "        from" +
            "        t_order o," +
            "        t_member m," +
            "        t_setmeal s" +
            "        where o.member_id=m.id and o.setmeal_id=s.id and o.id=#{id}")
    Map findById4Detail(Integer id);

    @Select("select count(id) from t_order where orderDate = #{date}")
    Integer findOrderCountByDate(String date);

    @Select("select count(id) from t_order where orderDate >= #{date}")
    Integer findOrderCountAfterDate(String date);

    @Select("select count(id) from t_order where orderDate = #{date} and orderStatus = '已到诊'")
    Integer findVisitsCountByDate(String date);

    @Select("select count(id) from t_order where orderDate >= #{date} and orderStatus = '已到诊'")
    Integer findVisitsCountAfterDate(String date);

    @Select("select s.name, count(o.id) setmeal_count, count(o.id) / (select count(id) from t_order) proportion" +
            "        from t_order o" +
            "                 inner join t_setmeal s on s.id = o.setmeal_id" +
            "        group by o.setmeal_id" +
            "        order by setmeal_count desc" +
            "        limit 0,4")
    List<Map> findHotSetmeal();

    @Select("SELECT * FROM t_order" +
            "        WHERE" +
            "        member_id=#{memberId}" +
            "        GROUP BY" +
            "        orderStatus")
    List<Order> findByMemberIdWithCondition(Integer memberId);

    @Select("select * from t_order where member_id=#{id}")
    List<Order> findOrderById(Integer id);

    @Select("SELECT" +
            "        t_order.id AS orderId," +
            "        t_order.orderDate AS orderDate," +
            "        t_order.orderStatus AS orderStatus," +
            "        t_setmeal.id AS setmealId," +
            "        t_setmeal.img AS setmealImg," +
            "        t_setmeal.name AS setmealName," +
            "        t_setmeal.remark AS setmealRemark," +
            "        t_setmeal.sex AS setmealSex," +
            "        t_setmeal.age AS setmealAge" +
            "        FROM" +
            "        t_order" +
            "        INNER JOIN t_setmeal ON t_order.setmeal_id = t_setmeal.id" +
            "        WHERE" +
            "        t_order.member_id = #{memberId}" +
            "        GROUP BY" +
            "        t_order.orderStatus")
    List<Map> findAll4OrderAndSetmeal(Integer memberId);

    @Select("SELECT" +
            "        t_order.id AS orderId," +
            "        t_order.orderDate AS orderDate," +
            "        t_order.orderStatus AS orderStatus," +
            "        t_setmeal.id AS setmealId," +
            "        t_setmeal.img AS setmealImg," +
            "        t_setmeal.name AS setmealName," +
            "        t_setmeal.remark AS setmealRemark," +
            "        t_setmeal.sex AS setmealSex," +
            "        t_setmeal.age AS setmealAge" +
            "        FROM" +
            "        t_order" +
            "        INNER JOIN t_setmeal ON t_order.setmeal_id = t_setmeal.id" +
            "        WHERE" +
            "        t_order.member_id = #{memberId} AND" +
            "        t_order.orderDate BETWEEN #{startDate} AND #{endDate} AND" +
            "        t_setmeal.name LIKE #{setmealName}" +
            "        GROUP BY" +
            "        t_order.orderStatus")
    List<Map> findSetmealByIdAndDate(@Param("memberId") Integer memberId, @Param("startDate") String startDate, @Param("endDate") String endDate, @Param("setmealName") String setmealName);

    @Select("SELECT" +
            "        t_order.id AS orderId," +
            "        t_order.orderDate AS orderDate," +
            "        t_order.orderStatus AS orderStatus," +
            "        t_setmeal.id AS setmealId," +
            "        t_setmeal.img AS setmealImg," +
            "        t_setmeal.name AS setmealName," +
            "        t_setmeal.remark AS setmealRemark," +
            "        t_setmeal.sex AS setmealSex," +
            "        t_setmeal.age AS setmealAge" +
            "        FROM" +
            "        t_order" +
            "        INNER JOIN t_setmeal ON t_order.setmeal_id = t_setmeal.id" +
            "        WHERE" +
            "        t_order.member_id = #{memberId} AND" +
            "        t_order.orderDate BETWEEN #{startDate} AND #{endDate}" +
            "        GROUP BY" +
            "        t_order.orderStatus")
    List<Map> findSetmealByIdAndDateWithoutName(@Param("memberId") Integer memberId, @Param("startDate") String startDate, @Param("endDate") String endDate);

    @Select("SELECT" +
            "        t_order.id AS orderId," +
            "        t_order.healthName AS healthName," +
            "        t_order.suggestion AS suggestion," +
            "        t_order.sport AS sport," +
            "        t_order.food AS food," +
            "        t_order.orderDate AS orderDate," +
            "        t_member.name AS name," +
            "        t_member.remark AS remark," +
            "        t_member.sex AS sex," +
            "        t_setmeal.age AS age," +
            "        t_setmeal.name AS setmealName" +
            "        FROM" +
            "        t_order" +
            "        INNER JOIN t_member ON t_order.member_id = t_member.id" +
            "        INNER JOIN t_setmeal ON t_order.setmeal_id = t_setmeal.id" +
            "        WHERE" +
            "        t_order.id =#{orderId}")
    Map findAllDataByOrderId(Integer orderId);

    //分页查询
    @Select("<script>" +
            "SELECT" +
            "        m.`name` memberName," +
            "        m.`phoneNumber` ," +
            "        o.`orderDate`," +
            "        o.`id`," +
            "        o.`orderType`," +
            "        o.`orderStatus`," +
            "        s.`name` setmealName" +
            "        FROM" +
            "        t_member m , t_order o , t_setmeal s" +
            "        WHERE" +
            "        o.`setmeal_id` = s.`id`" +
            "        AND" +
            "        m.`id`=o.`member_id`" +
            "        <if test=\"queryString != null and queryString.length > 0\">" +
            "            and (m.name like concat(\"%\",#{queryString},\"%\")" +
            "            or m.phoneNumber like concat(\"%\",#{queryString},\"%\"))" +
            "        </if>" +
            "        <if test=\"startDate != null and endDate != null\">" +
            "            and (o.orderDate between #{startDate} and #{endDate})" +
            "        </if>" +
            "        <if test=\"queryOrderType != null\">" +
            "            and o.orderType = #{queryOrderType}" +
            "        </if>" +
            "        <if test=\"queryOrderStatus != null\">" +
            "            and o.orderStatus = #{queryOrderStatus}" +
            "        </if>" +
            "</script>")
    Page<Order> findByPageAndCondition(@Param("queryString") String queryString, @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("queryOrderStatus") String queryOrderStatus, @Param("queryOrderType") String queryOrderType);

    //编辑操作，先查询点击对象的id
    @Select("SELECT" +
            "        m.`name` memberName," +
            "        m.`phoneNumber` ," +
            "        o.`orderDate`," +
            "        o.`id`," +
            "        o.`orderType`," +
            "        o.`orderStatus`," +
            "        s.`name` setmealName" +
            "        FROM" +
            "        t_member m , t_order o , t_setmeal s" +
            "        WHERE" +
            "        o.`setmeal_id` = s.`id`" +
            "        AND" +
            "        m.`id`=o.`member_id`" +
            "        AND" +
            "        o.`id` = #{o.id}")
    Map findOrderById1(Integer id);

    //通过订单id查询套餐id
    @Select("select setmeal_id from t_order where id = #{id}")
    List<Integer> findSetmealIdsByOrderId(Integer id);

    //查询就诊状态
    @Select("select * from t_order where id = #{id}")
    Order findOrderStatesById(Integer id);

    //改为未到诊
    @Update("update t_order set orderStatus = '未到诊' where id = #{id}")
    void editStatus(Integer id);

    //改为已到诊
    @Update("update t_order set orderStatus='已到诊' where id = #{id}")
    void editStatusTo(Integer id);

    @Select("SELECT t_order.food,t_order.sport,t_order.suggestion,t_order.healthName FROM t_order WHERE id =#{id};")
    Order findHealtMessageById(Integer id);

    @Update("update t_order set orderStatus=#{orderStatus} where id = #{id}")
    void update1(@Param("orderStatus") String orderStatus, @Param("id") Integer orderId);
}
