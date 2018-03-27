package com.cn.hnust.webservice;

import com.cn.hnust.webservice.service.impl.MoblieMessageServiceImpl;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.xml.ws.Endpoint;

/**
 * Created by 170904 on 2018/1/18.
 */
public class WebServicePublish{

    public static void main(String[]args){
        //WebService的发布地址
        String address = "http://0.0.0.0:50001/WS_Server/WebService";
        //发布WebService，WebServiceImpl类是WebServie接口的具体实现类
        Endpoint.publish(address , new MoblieMessageServiceImpl());
        System.out.println("使用WebServicePublishListener发布webservice成功!");
    }
 }
