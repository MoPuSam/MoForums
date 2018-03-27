package com.cn.hnust.controller;

import com.cn.hnust.pojo.Article;
import com.cn.hnust.pojo.Information;
import com.cn.hnust.pojo.PateRank;
import com.cn.hnust.pojo.Post;
import com.cn.hnust.service.ICrawlerService;
import com.cn.hnust.service.IPostService;
import com.cn.hnust.service.IUserService;
import com.cn.hnust.service.InformationService;
import com.cn.hnust.util.CheckCodeUtil;
import com.cn.hnust.util.SendMobileMessageUtil;
import com.github.pagehelper.PageHelper;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Administrator on 2018/3/13.
 */
@Controller
@RequestMapping("/message")
public class MessageController {//首页资讯信息
    @Resource
    private InformationService infoService;
    @Resource
    private IPostService postService;
    @Resource
    private ICrawlerService crawService;
    /**
     * 从173173获取游戏资讯
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/info",method = RequestMethod.POST)
    @ResponseBody
    public List<Information> getInfo(HttpServletRequest request, HttpServletResponse response){
        List<Information> list = crawService.getInfoByURL("https://www.17173.com/");
        return list;
    }

    /**
     * 获取讨论热度排名
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/rank",method = RequestMethod.POST)
    @ResponseBody
    public List<PateRank> getRankList(HttpServletRequest request, HttpServletResponse response){
        PageHelper.startPage(1,10);
        List<PateRank> list = infoService.getRankList();
        return list;
    }

    /**
     * 获取公告列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/notice",method = RequestMethod.POST)
    @ResponseBody
    public List<Post> getNoticeList(HttpServletRequest request, HttpServletResponse response){
        PageHelper.startPage(1,7);
        List<Post> list = postService.getNoticeList();
        return list;
    }

    /**
     * 获取热帖列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/hot",method = RequestMethod.POST)
    @ResponseBody
    public List<Post> getHotList(HttpServletRequest request, HttpServletResponse response){
        PageHelper.startPage(1,7);
        List<Post> list = postService.getHotList();
        return list;
    }
    /**
     * 跳转至文章页
     */
    @RequestMapping("/article")
    public ModelAndView showArticle(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        String url = request.getParameter("url");
        Article article = crawService.getArticle(url);
        mv.addObject("article",article);
        mv.setViewName("reader/article");
        return mv;
    }
}
