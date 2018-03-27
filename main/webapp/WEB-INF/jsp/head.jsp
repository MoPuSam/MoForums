<%--
  Created by IntelliJ IDEA.
  User: 170904
  Date: 2018/1/15
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <%--网站标签图--%>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/iconfont/favicon.ico"/>
    <link rel="bookmark" href="${pageContext.request.contextPath}/iconfont/favicon.ico"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/global.css">
    <script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var makeSearchUrl = function(o){

            var keys = o.keyword.value;

            if(keys == "" || keys == "请输入关键字"){
                alert("请输入关键字");
                o.keyword.focus();
                return true;
            }

            keys = encodeURIComponent(keys);
            var url = "/article-search-keyword-"+ keys+".html";
            window.open(url,'_self');
            return true;

        }
    </script>
    <script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-tab.js"></script>
    <link type="text/css" href="${pageContext.request.contextPath}/css/jquery.autocomplete.css" rel="stylesheet" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.autocomplete.js"></script>
    <style type="text/css">
        .cate{color: #FFFFFF;margin: 10px;font-family: "Adobe 黑体 Std R";font-size: large}
        *{margin:0;padding:0;list-style-type:none;}
        a,img{border:0;}
        .demo{width:720px;margin:10px auto;background-color: #FFFFFF}
        .demo h2{font-size:16px;color:#3366cc;height:30px;}
        .demo li{float:left;}
        .text,.button{background:url(http://su.bdimg.com/static/superpage/img/spis_031ddf34.png) no-repeat;}
        .text{width:529px;height:22px;padding:4px 7px;padding:6px 7px 2px\9;font:16px arial;border:1px solid #cdcdcd;border-color:#9a9a9a #cdcdcd #cdcdcd #9a9a9a;vertical-align:top;outline:none;margin:0 5px 0 0;background-color: #FFFFFF}
        .button{width:95px;height:32px;padding:0;padding-top:2px\9;border:0;background-position:0 -35px;background-color:#ddd;cursor:pointer}
    </style>
    <style type="text/css">
        .tab-group {
            position: relative;
            border: 1px solid #eee;
            margin-top: 2.5em;
            border-radius: 0 0 10px 10px;
        }
        .tab-group section {
            opacity: 0;
            height: 0;
            padding: 0 1em;
            overflow: hidden;
            transition: opacity 0.4s ease, height 0.4s ease;
        }
        .tab-group section.active {
            opacity: 1;
            height: auto;
            overflow: visible;
        }

        .tab-nav {
            list-style: none;
            margin: -2.5em -1px 0 0;
            padding: 0;
            height: 2.5em;
            overflow: hidden;
        }
        .tab-nav li {
            display: inline;
        }
        .tab-nav li a {
            top: 1px;
            position: relative;
            display: block;
            float: left;
            border-radius: 10px 10px 0 0;
            background: #eee;
            line-height: 2em;
            padding: 0 1em;
            text-decoration: none;
            color: grey;
            margin-top: .5em;
            margin-right: 1px;
            transition: background .2s ease, line-height .2s ease, margin .2s ease;
        }
        .tab-nav li.active a {
            background: #6d3c96;
            color: white;
            line-height: 2.5em;
            margin-top: 0;
        }
        .zone{
            background-color: rgba(0,0,0,.8);
            border-radius: 20%
        }
    </style>
</head>
<body>
<div class="header">
    <div class="main">
            <img style="margin-top: 1%" src="${pageContext.request.contextPath}/images/logo.png">
        <div class="nav" id="categories">
            <%--<span class="cate" name="cate"><a href="${pageContext.request.contextPath}/post/list">手机游戏</a></span>
            <span class="cate" name="cate"><a>单机游戏</a></span>
            <span class="cate" name="cate"><a>网络游戏</a></span>
            <span class="cate" name="cate"><a>棋牌游戏</a></span>--%>
        </div>
        <div class="nav-user">
            <a   class="iconfont icon-touxiang layui-hide-xs" style="margin-top: 4px; display: inline-block;">
            </a>
        <c:choose>
            <c:when test="${nickname ne null}">
                <div class="nav"  style="font-size:14px;color: white;margin-top: -5px;margin-left: 1px; "  />
                    您好,<a target="_parent" href="${pageContext.request.contextPath}/user/center">${nickname}</a>
                    &nbsp;&nbsp;<a target="_parent" href="${pageContext.request.contextPath}/login/out">退出</a>
                </div>
            </c:when>
            <c:otherwise>
            <div class="nav"  style="font-size:14px;color: white;margin-top: -5px;margin-left: 1px; "  />
                <a target="_parent" href="${pageContext.request.contextPath}/login/index">登录</a>
                <a  target="_parent" href="${pageContext.request.contextPath}/login/regist">注册</a>
            </div>
            </c:otherwise>
        </c:choose>
    </div>
    <%--<div class="demo">
        <form action="http://www.jsfoot.com/e/search/index.php" method="post" name="searchform" id="searchform" class="searchinfo">
            <ul>
                <li><input type="text" name="keyword" size="24" maxlength="255" value="" id="keyword" class="text"></input></li>
                <li><input type="submit" value="搜索" class="button"></input></li>
            </ul>
        </form>
    </div>--%>
</div>
</div>
</body>
<script>
    $(document).ready(function(){
        jQuery.ajax({
            type: "post",
            cache: false,
            url:'${pageContext.request.contextPath}/category/list',
            dataType: "json",
            success: function(rt){
                $.each( rt, function(i, n){
                    $("#categories").append("<span class='cate' name='cate'><a href='${pageContext.request.contextPath}/category/patelist?gcId="+n.gcId+"'>"+n.gcName+"</a></span>");
                });
                <c:if test="${gcId ne null}">
                var selects = $("span[name='cate']");
                selects[${gcId}].setAttribute("class","zone");
                </c:if>
            },
            error: function(rt){}
        });
    })
    //提示目前所在分区
    /*function showGc(gcId) {
        var selects = $("span[name='cate']");
        for(var i = 0;i<selects.length;i++){
            selects[i]. removeAttribute("class");
        }
        selects[gcId].setAttribute("class","zone");
    }*/
</script>
</html>