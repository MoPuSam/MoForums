package com.cn.hnust.service.impl;

import com.cn.hnust.dao.IPategoryDao;
import com.cn.hnust.pojo.Pategory;
import com.cn.hnust.service.IPategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 170904 on 2018/2/22.
 */
@Service("pategoryService")
public class PategoryServiceImpl implements IPategoryService{
    @Resource
    private IPategoryDao dao;
    @Override
    public List<Pategory> getPateList(Integer gcId) {
        return dao.getPateList(gcId);
    }
}
