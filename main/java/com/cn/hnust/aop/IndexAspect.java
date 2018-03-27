package com.cn.hnust.aop;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * Created by 170904 on 2018/2/19.
 */
@Aspect
@Component
public class IndexAspect {
    /*private Logger logger = LoggerFactory.getLogger(IndexAspect.class);
    public final static String HOST = "127.0.0.1";
    public final static int PORT = 9200; //http请求的端口是9200，客户端是9300
    private TransportClient client = null;
    @Before("execution(* com.cn.hnust.service.impl.IndexServiceImpl.*(..))")
     public void getConnect() throws UnknownHostException {
                 client = new PreBuiltTransportClient(Settings.EMPTY).addTransportAddresses(
                                  new InetSocketTransportAddress(InetAddress.getByName(HOST),PORT));
                 logger.info("连接信息:" + client.toString());
             }

     *//**
       * 关闭连接
       * @Title: closeConnect
       * @author sunt
       * @date 2017年11月23日
       * @return void
       *//*
     @After("execution(* com.cn.hnust.service.impl.IndexServiceImpl.*(..))")
     public void closeConnect() {
         if (null != client) {
             logger.info("执行关闭连接操作...");
             client.close();
         }
     }*/
}
