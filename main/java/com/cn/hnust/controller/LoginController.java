package com.cn.hnust.controller;

import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IUserService;
import com.cn.hnust.util.CheckCodeUtil;
import com.cn.hnust.util.Crypt;
import com.cn.hnust.util.SendMobileMessageUtil;
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
import java.io.OutputStream;

/**
 * Created by 170904 on 2018/1/10.
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @Resource
    private IUserService userService;

    @RequestMapping("/index")
    public String toLoginPage(){
        return "login";
    }
    @RequestMapping("/regist")
    public String toRegistPage(){
        return "regist";
    }
    @RequestMapping("/out")
    public String toLoginOut(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("uid");
        session.removeAttribute("nickname");
        return "login";
    }
    @RequestMapping("/home")
    public ModelAndView toHomePage(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        User user = userService.getUserByName(username);
        if(user==null){
            mv.addObject("message","不存在该用户");
            mv.setViewName("login");
            return mv;
        }
        String password = request.getParameter("password");
        boolean ispass = false;
        if(password!=null&&!"".equals(password)){
           String encode = user.getuPassword();
            ispass = password.equals(Crypt.unencrype(encode));
        }
        if(ispass){
            session.setAttribute("uid",user.getuId());
            session.setAttribute("nickname",user.getuNickname());
            mv.addObject("gcId",0);
            mv.setViewName("home");
        }else{
            mv.addObject("message","密码错误");
            mv.setViewName("login");
            return mv;
        }
        String validate = (String)session.getAttribute("validate");
        String uValidate = request.getParameter("checkcode");
        boolean isCheck = validate.equals(uValidate);
        if(!isCheck&&ispass){
            mv.addObject("message","验证码错误");
            mv.setViewName("login");
            return mv;
        }
        return mv;
        //return mv;
    }
    @RequestMapping("/checkcode")
    public void getCheckCode(HttpServletRequest request , HttpServletResponse response) throws IOException {
        // 获得 当前请求 对应的 会话对象
        HttpSession session = request.getSession();

        // 从请求中获得 URI ( 统一资源标识符 )
        String uri = request.getRequestURI();
        System.out.println("hello : " + uri);

        final int width = 120; // 图片宽度
        final int height = 50; // 图片高度
        final String imgType = "jpeg"; // 指定图片格式 (不是指MIME类型)
        final OutputStream output = response.getOutputStream(); // 获得可以向客户端返回图片的输出流
        // (字节流)
        // 创建验证码图片并返回图片上的字符串
        String code = CheckCodeUtil.create(width, height, imgType, output);
        System.out.println("验证码内容: " + code);

        // 建立 uri 和 相应的 验证码 的关联 ( 存储到当前会话对象的属性中 )
        session.setAttribute("validate", code);

        System.out.println(session.getAttribute("validate"));

    }
    @RequestMapping(value = "/send",method = RequestMethod.POST)
    public @ResponseBody String sendMessage(HttpServletRequest request, HttpServletResponse response){
        String phone = request.getParameter("phone");
        String validate = String.valueOf(CheckCodeUtil.getMessageValidate());
        HttpSession session = request.getSession();
        session.setAttribute("validate",validate);
        SendMobileMessageUtil.sendMessage(phone,validate);
        return validate;
    }
}
