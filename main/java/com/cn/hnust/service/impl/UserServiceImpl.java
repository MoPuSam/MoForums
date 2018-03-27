package com.cn.hnust.service.impl;

import com.cn.hnust.dao.IUserDao;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private IUserDao userDao;
	@Override
	public User getUserById(int userId) {
		return userDao.selectByPrimaryKey(userId);
	}
	@Override
	public  void insertUser(User user){
		userDao.insert(user);
	}

	@Override
	public User getUserByName(String name) {
		return userDao.getUserByName(name);
	}

	@Override
	public void updateUserHead(String uid, String headImgPath) {
		userDao.updateUserHead(uid, headImgPath);
	}

	@Override
	public void updatePassword(String password,int uid) {
		userDao.updatePassword(password,uid);
	}
}
