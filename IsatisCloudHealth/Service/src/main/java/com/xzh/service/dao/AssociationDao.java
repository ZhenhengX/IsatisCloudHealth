package com.xzh.service.dao;

import com.xzh.common.pojo.CheckGroup;
import com.xzh.common.pojo.CheckItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 多表关联查询
 */
@Mapper
public interface AssociationDao {

    @Select("select hcg.* " +
            "from h_setmeal_checkgroup hsc left join h_check_group hcg on hsc.checkgroup_id = hcg.id " +
            "where hsc.setmeal_id = #{setMealId}")
    List<CheckGroup> findCheckGroupsBySetMealId(Integer setMealId);

    @Select("select hci.* " +
            "from h_checkgroup_checkitem hcc left join h_check_item hci on hcc.checkitem_id = hci.id " +
            "where hcc.checkgroup_id = #{checkGroupId}")
    List<CheckItem> findCheckItemsByCheckGroupId(Integer checkGroupId);

}
