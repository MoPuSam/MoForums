package com.cn.hnust.service.impl;

import com.cn.hnust.dao.ICategoryDao;
import com.cn.hnust.pojo.Category;
import com.cn.hnust.service.ICategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 170904 on 2018/2/21.
 */
@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService{
    @Resource
    private ICategoryDao dao;
    @Override
    public List<Category> getCatList() {
        return dao.getCatList();
    }

    @Override
    public List<Category> getSelectCatList() {
        return dao.getSelectCatList();
    }
}
