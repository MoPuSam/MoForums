<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>问答系统首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="stylesheet" href="/res/layui/css/layui.css">
    <link rel="stylesheet" href="/res/css/global.css">
    <script src="/res/layui/layui.js"></script>

    <script src="/js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/jquery-tab.js"></script>
    <link type="text/css" href="/css/jquery.autocomplete.css" rel="stylesheet" />
    <script type="text/javascript" src="/js/jquery.autocomplete.js"></script>
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
    </style>
</head>
<body>
<jsp:include page="../head.jsp"></jsp:include>
<div class="demo" style="margin-top: 6%">
    <form action="${pageContext.request.contextPath}/post/search" method="post" name="searchform" id="searchform" class="searchinfo">
        <ul>
            <li><input type="text" name="keyword" size="24" maxlength="255" value="" id="keyword" class="text"></input></li>
            <li><input type="submit" value="搜索" class="button"/></li>
        </ul>
    </form>
</div>
<div class="main layui-clear">
    <div class="wrap">
        <div class="content" style="margin-right:0">
            <div class="tab-group">
                <ul id="mySelect" class="tab-nav">
                <c:forEach items="${patelist}" var="pate">
                        <li name="selectTab" value="${pate.pId}" onclick="showPatelist(this)"><a href="#">${pate.pType}</a></li>
                    <%--<section id="tab${pate.pId}" title="${pate.pType}">
                    </section>--%>
                </c:forEach>
                </ul>
                <div class="fly-tab" style="margin-top:25px">
                    <form action="" class="fly-search">
                        <i class="iconfont icon-sousuo" onclick="search()"></i>
                        <input class="layui-input" autocomplete="off" id="keyword2" placeholder="搜索内容" type="text" value="" name="q"/>
                    </form>
                    <a href="${pageContext.request.contextPath}/post/add" class="layui-btn jie-add">发布帖子</a>
                </div>
                <jsp:include page="post_list.jsp"></jsp:include>
                </div>
                <%--<input type="hidden" name="mySelect" id="mySelect"/>--%>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    /*$(function(){
        $('.tab-group').tabify();
    })*/
    var pId;
    var keyword;
    function search(){
       // alert(pId);
        keyword = $("#keyword2").val();
        //alert("aaa"+keyword);
        getPateList(pId,keyword);
        //alert(window.location.href);
        //window.location.href ="${pageContext.request.contextPath}/category/patelist?gcId="+${gcId}+"&keyword="+$("#keyword").value;
    }
    $(document).ready(function () {
        $("li[name='selectTab']")[0].click();
    })
    function showPatelist(obj){
        //alert(obj.value);
        //obj.removeAttribute("class");
        var selects = $("li[name='selectTab']");
        for(var i = 0;i<selects.length;i++){
           selects[i]. removeAttribute("class");
        }
        obj.setAttribute("class","active");
        getPateList(obj.value,"");
        pId = obj.value;
    }
</script>
</html>