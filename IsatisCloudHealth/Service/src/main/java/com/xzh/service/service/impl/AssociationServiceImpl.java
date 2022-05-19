package com.xzh.service.service.impl;

import com.xzh.common.pojo.CheckGroup;
import com.xzh.common.pojo.CheckItem;
import com.xzh.service.dao.AssociationDao;
import com.xzh.service.service.AssociationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AssociationServiceImpl implements AssociationService {

    @Autowired
    private AssociationDao associationDao;
    
    public List<CheckGroup> findCheckGroupsBySetMealId(Integer setMealId) {
        return associationDao.findCheckGroupsBySetMealId(setMealId);
    }

    public List<CheckItem> findCheckItemsByCheckGroupId(Integer checkGroupId) {
        return associationDao.findCheckItemsByCheckGroupId(checkGroupId);
    }

}
