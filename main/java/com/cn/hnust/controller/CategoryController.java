package com.cn.hnust.controller;

import com.cn.hnust.pojo.Category;
import com.cn.hnust.pojo.Pategory;
import com.cn.hnust.pojo.PostIterm;
import com.cn.hnust.service.ICategoryService;
import com.cn.hnust.service.IPategoryService;
import com.cn.hnust.service.IPostService;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 170904 on 2018/2/21.
 */
@Controller
@RequestMapping("/category")
public class CategoryController {
    @Resource
    private ICategoryService categoryService;
    @Resource
    private IPategoryService pategoryService;
    @Resource
    private IPostService postService;
    /**
     * 获取分区
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST,value = "/list")
    @ResponseBody
    public List<Category> getlist(HttpServletRequest request){
        List<Category> list = categoryService.getCatList();
        return list;
    }

    /**
     * 发帖时加载分区种类数据
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST,value = "/select")
    @ResponseBody
    public List<Category> getSelectList(HttpServletRequest request){
        List<Category> list = categoryService.getSelectCatList();
        return list;
    }

    /**
     * 获取子分类
     * @param request
     * @return
     */
    @RequestMapping("/patelist")
    public ModelAndView postListView(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        int gcId = Integer.valueOf(request.getParameter("gcId"));
        if(gcId==0){
            mv.setViewName("home");
            List<Pategory> patelist = pategoryService.getPateList(gcId);
            mv.addObject("patelist",patelist);
            mv.addObject("gcId",gcId);
            return mv;
        }
        List<Pategory> patelist = pategoryService.getPateList(gcId);
        mv.addObject("patelist",patelist);
        mv.addObject("gcId",gcId);
        mv.setViewName("reader/post_category");
        return mv;
    };
}
