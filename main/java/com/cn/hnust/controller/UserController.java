package com.cn.hnust.controller;

import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IPostService;
import com.cn.hnust.service.IUserService;
import com.cn.hnust.util.Crypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private IUserService userService;
	@Resource
	private IPostService postService;

	@RequestMapping("/checkUsername")
	public String checkUsername(HttpServletRequest request){
		return "login";
	}
	@RequestMapping("/center")
	public ModelAndView personCenter(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		int uid = (Integer)session.getAttribute("uid");
		User user = userService.getUserById(uid);
		mv.addObject("user",user);
		String headPath = user.getPhoto();
		System.out.println(headPath);
		mv.setViewName("person");
		return mv;
	}
	@RequestMapping(method = RequestMethod.POST,value = "/regist")
	public ModelAndView toAddUser(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		password = Crypt.encrype(password);
		String phone = request.getParameter("phone");
		String checkcode = request.getParameter("checkcode");
		String validate = (String)session.getAttribute("validate");
		boolean isCheck = validate.equals(checkcode);
		if(isCheck) {
			User user = new User();
			user.setuNickname(username);
			user.setuPassword(password);
			user.setuPhone(phone);
			userService.insertUser(user);
			mv.addObject("message","注册成功");
			mv.setViewName("login");
		}else{
			mv.addObject("message","验证码错误");
			mv.setViewName("regist");
		}
			return mv;
		/*}else{
			model.addAttribute("warm","验证码输入不正确");
			return "regist";
		}*/
	}
	@RequestMapping("/showUser")
	public String toIndex(HttpServletRequest request,Model model){
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = this.userService.getUserById(userId);
		model.addAttribute("user", user);
		return "showUser";
	}
	@RequestMapping(method = RequestMethod.POST,value = "/postNum")
	@ResponseBody
	public Integer getPostCountByUid(HttpServletRequest request){
		String uid = request.getParameter("uid");
		int id = Integer.valueOf(uid);
		Integer num = postService.getPostCountByUid(id);
		return num;
	}
	@RequestMapping(method = RequestMethod.POST,value = "/updatePassword")
	@ResponseBody
	public String ring(HttpServletRequest request){
		HttpSession session = request.getSession();
		String oldpassword = request.getParameter("oldpassword");
		String newpassword1 = request.getParameter("newpassword1");
		String newpassword2 = request.getParameter("newpassword2");
		int userId = (Integer) session.getAttribute("uid");
		User user = this.userService.getUserById(userId);
		if(oldpassword!=null&&!oldpassword.equals(Crypt.unencrype(user.getuPassword()))){
			return "原密码输入错误";
		}
		if(!newpassword1.equals(newpassword2)){
			return "2次密码输入不一致";
		}
		userService.updatePassword(Crypt.encrype(newpassword1),userId);
		return "修改成功";
	}
}
