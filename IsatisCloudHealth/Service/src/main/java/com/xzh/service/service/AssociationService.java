package com.xzh.service.service;

import com.xzh.common.pojo.CheckGroup;
import com.xzh.common.pojo.CheckItem;

import java.util.List;

public interface AssociationService {

    List<CheckGroup> findCheckGroupsBySetMealId(Integer setMealId);

    List<CheckItem> findCheckItemsByCheckGroupId(Integer checkGroupId);

}
