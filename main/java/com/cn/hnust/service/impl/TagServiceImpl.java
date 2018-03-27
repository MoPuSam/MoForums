package com.cn.hnust.service.impl;

import com.cn.hnust.dao.ITagDao;
import com.cn.hnust.pojo.Tag;
import com.cn.hnust.service.ITagService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/3/9.
 */
@Service("tagService")
public class TagServiceImpl implements ITagService{
    @Resource
    private ITagDao dao;
    @Override
    public List<Tag> getAllTag() {
        return dao.getTagList();
    }
}
