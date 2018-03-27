package com.cn.hnust.controller;

import com.cn.hnust.pojo.Post;
import com.cn.hnust.pojo.PostIterm;
import com.cn.hnust.pojo.Reply;
import com.cn.hnust.service.*;
import com.cn.hnust.util.CurrentDayUtil;
import com.cn.hnust.util.UUIDUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.elasticsearch.search.SearchHits;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by 170904 on 2018/1/17.
 */
@Controller
@RequestMapping("/post")
public class PostController {
    @Resource
    private IUserService userService;
    @Resource
    private IPostService postService;
    @Resource
    private IndexService indexService;
    @Resource
    private IReplyService replyService;
    @Resource
    private IFileService fileService;
    @RequestMapping("/home")
    public ModelAndView toHomePage(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("home");
        return mv;
    }
    @RequestMapping("/view")
    public ModelAndView getPostDetail(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        String pid = request.getParameter("pid");
        Post post = postService.getPost(pid);
        Integer pId = Integer.valueOf(pid);
        postService.updateHit(pId);
        mv.addObject("post",post);
        String content = fileService.getFileContent(post.getpContent());
        mv.addObject("content",content);
        List<Reply> replyList = replyService.getReplysByPid(pid);
        mv.addObject("rlist",replyList);
        mv.setViewName("reader/post_detail");
        return mv;
    };
    @RequestMapping("/add")
    public ModelAndView addNewPost(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        /*int gcId = Integer.parseInt(request.getParameter("gcId"));
        mv.addObject("gcId",gcId);*/
        mv.setViewName("editor/post_add");
        return mv;
    };
    @RequestMapping("/list")
    public ModelAndView postListView(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        List<Post> plist = postService.getAllPost();
        mv.addObject("plist",plist);
        mv.setViewName("reader/post_category");
        return mv;
    };
    @RequestMapping(method = RequestMethod.POST,value = "/plist")
    @ResponseBody
    public List<PostIterm> getlist(HttpServletRequest request){
        String pid = request.getParameter("pId");
        int pId = 0;
        if(pid!=null&&!"".equals(pid)){
            pId = Integer.parseInt(pid);
        }
        //当前页码
        int num;
        String pageNum = request.getParameter("pagenum");
        if(pageNum == null){
            num = 1;
        }else{
            num=Integer.valueOf(pageNum);
        }
        //关键词
        String keyword = request.getParameter("keyword");
        List<PostIterm> plist;
        if(keyword!=null&&!"".equals(keyword)){
            PageHelper.startPage(num,7);
            plist = postService.seachPostItermByTitle(pId,keyword);
        }else {
            PageHelper.startPage(num,7);
            plist = postService.getPostItermByPid(pId);
        }
        /*PageHelper.startPage(num,7);
        List<PostIterm> plist = postService.getPostItermByPid(pId);*/
        return plist;
    }
    @RequestMapping(method = RequestMethod.POST,value = "/pageSize")
    @ResponseBody
    public int[] getPageSize(HttpServletRequest request){
        String pid = request.getParameter("pId");
        int pId = 0;
        if(pid!=null&&!"".equals(pid)){
            pId = Integer.parseInt(pid);
        }
        //总页数
        int totalPage;
        //总记录数
        long totalSize;
        //关键词
        String keyword = request.getParameter("keyword");
        List<PostIterm> plist;
        if(keyword!=null&&!"".equals(keyword)){
            plist = postService.seachPostItermByTitle(pId,keyword);
        }else {
            plist = postService.getPostItermByPid(pId);
        }
        PageInfo<PostIterm> p=new PageInfo<PostIterm>(plist);
        int more = plist.size()%7;
        if(more != 0){
            totalPage = plist.size()/7+1;
        }else {
            totalPage = plist.size()/7;
        }
        totalSize = p.getTotal();
        int[] array = new int[2];
        array[0] = totalPage;
        array[1] = (int) totalSize;
        return array;
    }
    @RequestMapping(method = RequestMethod.POST,value = "/addpost")
    @ResponseBody
    public String insertPost(HttpServletRequest request){
        HttpSession session = request.getSession();
        int author = (Integer) session.getAttribute("uid");
        String tags = request.getParameter("tags");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int category = Integer.valueOf(request.getParameter("pateId"));
        Post post = new Post();
        post.setpUid(author);
        post.setpTitle(title);
        post.setCategory(category);
        String contentPath = fileService.createArticleFile(content, UUIDUtil.getNextNum()+".html");
        post.setpContent(contentPath);
        post.setTags(tags);
        post.setUpdateTime(CurrentDayUtil.getUpdateTime());
        String username = userService.getUserById(author).getuNickname();
        postService.insertPost(post);
        Integer pId = post.getpId();
        //post.setpId(post.getpId());
        post.setpContent(content);
        indexService.addIndex(post,username);
        return "发布成功";
    }
    @RequestMapping(method = RequestMethod.POST,value = "/reply")
    @ResponseBody
    public String replyPost(HttpServletRequest request){
        HttpSession session = request.getSession();
        int author = (Integer)session.getAttribute("uid");
        String content = request.getParameter("content");
        String pid = request.getParameter("pid");
        Reply reply = new Reply();
       /* String contentPath = fileService.createArticleFile(content, UUIDUtil.getNextNum()+".html");*/
        reply.setrUid(author);
        reply.setrContent(content);
        reply.setpId(pid);
        replyService.insertReply(reply);
        return "回复成功";
    }
    /**
     * 帖子搜索
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/search")
    public ModelAndView getHits(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        String keyword = request.getParameter("keyword");
        String page = request.getParameter("page");
        Integer pageNum;
        if(page != null){
            pageNum = Integer.valueOf(page);
        }else{
            pageNum = 1;
        }
        SearchHits hits = indexService.getHits(keyword,pageNum);
        int totalSize = (int) hits.getTotalHits();
        int totalPage = totalSize%8==0?totalSize/8:totalSize/8+1;
       /* hits.getAt(0).highlightFields().get("text").getFragments();*/
       if(hits.getTotalHits()!=0) {
           mv.addObject("hits", hits.getHits());
       }else{
           mv.addObject("hits", null);
       }
       mv.addObject("currentPage",pageNum);
       mv.addObject("totalSize",totalSize);
       mv.addObject("totalPage",totalPage);
       mv.addObject("keyword",keyword);
        mv.setViewName("reader/post_hits");
        return mv;
    };
}
