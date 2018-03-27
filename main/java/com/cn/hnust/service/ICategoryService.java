package com.cn.hnust.service;

import com.cn.hnust.pojo.Category;

import java.util.List;

/**
 * Created by 170904 on 2018/2/21.
 */
public interface ICategoryService {
    public List<Category> getCatList();
    public List<Category> getSelectCatList();
}
