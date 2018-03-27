package org.zsl.testfile;

import com.cn.hnust.service.impl.FileServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by 170904 on 2018/1/19.
 */
/*@RunWith(SpringJUnit4ClassRunner.class)		//表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mvc.xml"})*/
public class TestFileCreate {
    /*@Test
    public void test(){
        FileServiceImpl service = new FileServiceImpl();
        //文件目录
        StringBuffer path = new StringBuffer(200);
        path.append(service.getRootPath()).append(service.getArticlePath());
        System.out.println(path);
        //文件名
        String fileName  = "11.html";
        //文件内容
        String content = "fasdjjfallaf";
        service.createDir(path.toString());
        service.createFile(content,path,fileName);
    }*/
}
