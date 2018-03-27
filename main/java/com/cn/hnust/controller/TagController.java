package com.cn.hnust.controller;

import com.cn.hnust.pojo.Tag;
import com.cn.hnust.service.ITagService;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2018/3/9.
 */
@Controller
@RequestMapping("/tag")
public class TagController {
    @Resource
    private ITagService tagService;
    @RequestMapping(method = RequestMethod.POST,value = "/list")
    @ResponseBody
    public List<Tag> getlist(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PageHelper.startPage(1,10);
        List<Tag> list = tagService.getAllTag();
        return list;
    }
}
