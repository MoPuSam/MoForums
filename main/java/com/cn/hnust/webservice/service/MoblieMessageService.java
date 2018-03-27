package com.cn.hnust.webservice.service;

import javax.jws.WebMethod;
import javax.jws.WebService;

/**
 * Created by 170904 on 2018/1/18.
 */
@WebService
public interface MoblieMessageService {
    @WebMethod
    public void sendMessage(String phone,String code);
}
