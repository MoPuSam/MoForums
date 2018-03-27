package com.cn.hnust.service;


import com.cn.hnust.pojo.User;

public interface IUserService {
	public User getUserById(int userId);
	public void insertUser(User user);
	public User getUserByName(String name);
    public void updateUserHead(String uid, String headImgPath);

    void updatePassword(String password,int uid);
}
