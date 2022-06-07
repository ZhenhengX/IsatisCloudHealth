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
            "select * from h_order" +
            "        <where>" +
            "            <if test=\"id != null\">" +
            "                and id = #{id}" +
            "            </if>" +
            "            <if test=\"memberId != null\">" +
            "                and member_id = #{memberId}" +
            "            </if>" +
            "            <if test=\"idCard != null\">" +
            "                and id_card = #{idCard}" +
            "            </if>" +
            "            <if test=\"orderDate != null\">" +
            "                and orderDate = #{orderDate,jdbcType=DATE}" +
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
            "        order by orderDate DESC" +
            "</script>")
    List<Order> findByCondition(Order order);

    @Select("SELECT  " +
            " o.order_name AS member,  " +
            " s.NAME AS setmeal,  " +
            " o.orderDate AS orderDate,  " +
            " o.orderType AS orderType   " +
            "FROM  " +
            " h_order o,  " +
            " h_setmeal s   " +
            "WHERE  " +
            " o.setmeal_id = s.id   " +
            " AND o.id = #{id}")
    Map findById4Detail(Integer id);

    @Select("select count(id) from h_order where orderDate =  #{date,jdbcType=DATE}")
    Integer findOrderCountByDate(String date);

    @Select("select count(id) from h_order where orderDate >=  #{date,jdbcType=DATE}")
    Integer findOrderCountAfterDate(String date);

    @Select("select count(id) from h_order where orderDate =  #{date,jdbcType=DATE} and orderStatus = '已到诊'")
    Integer findVisitsCountByDate(String date);

    @Select("select count(id) from h_order where orderDate >=  #{date,jdbcType=DATE} and orderStatus = '已到诊'")
    Integer findVisitsCountAfterDate(String date);

    @Select("select s.name, count(o.id) setmeal_count, count(o.id) / (select count(id) from h_order) proportion" +
            "        from h_order o" +
            "                 inner join h_setmeal s on s.id = o.setmeal_id" +
            "        group by o.setmeal_id" +
            "        order by setmeal_count desc" +
            "        limit 0,4")
    List<Map> findHotSetmeal();

    @Select("SELECT * FROM h_order" +
            "        WHERE" +
            "        member_id=#{memberId}" +
            "        GROUP BY" +
            "        orderStatus")
    List<Order> findByMemberIdWithCondition(Integer memberId);

    @Select("select * from h_order where member_id=#{id}")
    List<Order> findOrderById(Integer id);

    @Select("SELECT" +
            "        h_order.id AS orderId," +
            "        h_order.orderDate AS orderDate," +
            "        h_order.orderStatus AS orderStatus," +
            "        h_setmeal.id AS setmealId," +
            "        h_setmeal.img AS setmealImg," +
            "        h_setmeal.name AS setmealName," +
            "        h_setmeal.remark AS setmealRemark," +
            "        h_setmeal.sex AS setmealSex," +
            "        h_setmeal.age AS setmealAge" +
            "        FROM" +
            "        h_order" +
            "        INNER JOIN h_setmeal ON h_order.setmeal_id = h_setmeal.id" +
            "        WHERE" +
            "        h_order.member_id = #{memberId}" +
            "        GROUP BY" +
            "        h_order.orderStatus")
    List<Map> findAll4OrderAndSetmeal(Integer memberId);

    @Select("SELECT" +
            "        h_order.id AS orderId," +
            "        h_order.orderDate AS orderDate," +
            "        h_order.orderStatus AS orderStatus," +
            "        h_setmeal.id AS setmealId," +
            "        h_setmeal.img AS setmealImg," +
            "        h_setmeal.name AS setmealName," +
            "        h_setmeal.remark AS setmealRemark," +
            "        h_setmeal.sex AS setmealSex," +
            "        h_setmeal.age AS setmealAge" +
            "        FROM" +
            "        h_order" +
            "        INNER JOIN h_setmeal ON h_order.setmeal_id = h_setmeal.id" +
            "        WHERE" +
            "        h_order.member_id = #{memberId} AND" +
            "        h_order.orderDate BETWEEN #{startDate,jdbcType=DATE} AND #{endDate,jdbcType=DATE} AND" +
            "        h_setmeal.name LIKE #{setmealName}" +
            "        GROUP BY" +
            "        h_order.orderStatus")
    List<Map> findSetmealByIdAndDate(@Param("memberId") Integer memberId, @Param("startDate") String startDate, @Param("endDate") String endDate, @Param("setmealName") String setmealName);

    @Select("SELECT" +
            "        h_order.id AS orderId," +
            "        h_order.orderDate AS orderDate," +
            "        h_order.orderStatus AS orderStatus," +
            "        h_setmeal.id AS setmealId," +
            "        h_setmeal.img AS setmealImg," +
            "        h_setmeal.name AS setmealName," +
            "        h_setmeal.remark AS setmealRemark," +
            "        h_setmeal.sex AS setmealSex," +
            "        h_setmeal.age AS setmealAge" +
            "        FROM" +
            "        h_order" +
            "        INNER JOIN h_setmeal ON h_order.setmeal_id = h_setmeal.id" +
            "        WHERE" +
            "        h_order.member_id = #{memberId} AND" +
            "        h_order.orderDate BETWEEN #{startDate,jdbcType=DATE} AND #{endDate,jdbcType=DATE}" +
            "        GROUP BY" +
            "        h_order.orderStatus")
    List<Map> findSetmealByIdAndDateWithoutName(@Param("memberId") Integer memberId, @Param("startDate") String startDate, @Param("endDate") String endDate);

    @Select("SELECT" +
            "        h_order.id AS orderId," +
            "        h_order.healthName AS healthName," +
            "        h_order.suggestion AS suggestion," +
            "        h_order.sport AS sport," +
            "        h_order.food AS food," +
            "        h_order.orderDate AS orderDate," +
            "        h_member.name AS name," +
            "        h_member.remark AS remark," +
            "        h_member.sex AS sex," +
            "        h_setmeal.age AS age," +
            "        h_setmeal.name AS setmealName" +
            "        FROM" +
            "        h_order" +
            "        INNER JOIN h_member ON h_order.member_id = h_member.id" +
            "        INNER JOIN h_setmeal ON h_order.setmeal_id = h_setmeal.id" +
            "        WHERE" +
            "        h_order.id =#{orderId}")
    Map findAllDataByOrderId(Integer orderId);

    //分页查询
    @Select("<script>" +
            "SELECT" +
            "        o.id as id, o.order_name as orderName, o.sex as sex, o.telephone as telephone, o.id_card as idCard, " +
            "        o.orderDate as orderDate, o.orderType as orderType, o.orderStatus as orderStatus," +
            "        o.setmeal_id as setmealId, o.food as food, o.sport as sport, o.healthName as healthName," +
            "        o.suggestion as suggestion ,s.`name` as setmealName" +
            "        FROM" +
            "        h_order o , h_setmeal s" +
            "        WHERE" +
            "        o.`setmeal_id` = s.`id`" +
            "        <if test=\"queryString != null and queryString.length > 0\">" +
            "            and (o.order_name like concat(\"%\",#{queryString},\"%\")" +
            "            or o.telephone like concat(\"%\",#{queryString},\"%\"))" +
            "        </if>" +
            "        <if test=\"startDate != null and endDate != null\">" +
            "            and (o.orderDate between #{startDate,jdbcType=DATE} and #{endDate,jdbcType=DATE})" +
            "        </if>" +
            "        <if test=\"queryOrderType != null\">" +
            "            and o.orderType = #{queryOrderType}" +
            "        </if>" +
            "        <if test=\"queryOrderStatus != null\">" +
            "            and o.orderStatus = #{queryOrderStatus}" +
            "        </if>" +
            "        order by orderDate DESC" +
            "</script>")
    Page<Order> findByPageAndCondition(@Param("queryString") String queryString, @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("queryOrderStatus") String queryOrderStatus, @Param("queryOrderType") String queryOrderType);

    //编辑操作，先查询点击对象的id
    @Select("SELECT" +
            "        o.`order_name` memberName," +
            "        o.`telephone` phoneNumber," +
            "        o.`orderDate`," +
            "        o.`id`," +
            "        o.`orderType`," +
            "        o.`orderStatus`," +
            "        s.`name` setmealName" +
            "        FROM" +
            "        h_order o , h_setmeal s" +
            "        WHERE" +
            "        o.`setmeal_id` = s.`id`" +
            "        AND" +
            "        o.`id` = #{o.id}")
    Map findOrderById1(Integer id);

    //通过订单id查询套餐id
    @Select("select setmeal_id from h_order where id = #{id}")
    List<Integer> findSetmealIdsByOrderId(Integer id);

    //查询就诊状态
    @Select("select * from h_order where id = #{id}")
    Order findOrderStatesById(Integer id);

    //改为未到诊
    @Update("update h_order set orderStatus = '未到诊' where id = #{id}")
    void editStatus(Integer id);

    //改为已到诊
    @Update("update h_order set orderStatus='已到诊' where id = #{id}")
    void editStatusTo(Integer id);

    @Select("SELECT h_order.food,h_order.sport,h_order.suggestion,h_order.healthName FROM h_order WHERE id =#{id};")
    Order findHealtMessageById(Integer id);

    @Update("update h_order set orderStatus=#{orderStatus} where id = #{id}")
    void update1(@Param("orderStatus") String orderStatus, @Param("id") Integer orderId);

    @Select("select o.id as orderId, o.orderDate as orderDate, o.order_name orderName, " +
            "s.name as setMealName, s.img as img " +
            "from h_order o left join h_setmeal s on s.id = o.setmeal_id " +
            "where o.member_id = #{id} " +
            "order by o.orderDate DESC")
    List<Map<String, Object>> findOrderByMemberId(Integer id);

}
