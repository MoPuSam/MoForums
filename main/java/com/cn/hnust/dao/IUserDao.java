package com.cn.hnust.dao;

import com.cn.hnust.pojo.User;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public interface IUserDao {
    int deleteByPrimaryKey(String uId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User getUserByName(String name);

    void updateUserHead(String uid, String headImgPath);

    void updatePassword(String password,int uid);
}