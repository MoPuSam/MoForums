<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>问答系统首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/css/global.css">
    <script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>

    <script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js" type="text/javascript"></script>
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
    </style>
</head>
<body>
<jsp:include page="head.jsp"></jsp:include>
<div class="demo" style="margin-top: 6%">
    <form action="${pageContext.request.contextPath}/post/search" method="post" name="searchform" id="searchform" class="searchinfo">
        <ul>
            <li><input type="text" name="keyword" size="24" maxlength="255" value="" id="keyword" class="text"></input></li>
            <li><input type="submit" value="搜索" class="button"></input></li>
        </ul>
    </form>
</div>
<div class="main layui-clear" style="margin-top: 40px">
    <div class="wrap">
        <div class="content detail">
            <div class="fly-panel detail-box">
                <dl class="fly-panel fly-list-one" id="notice">
                    <dt class="fly-panel-title"><h1>公告</h1></dt>
                    <%--<dd>
                        <a href="">使用 layui 秒搭后台大布局（基本结构）</a> <span><i
                            class="iconfont">&#xe60b;</i> 6087</span>
                    </dd>
                    <dd>
                        <a href="">Java实现LayIM后端的核心代码</a> <span><i class="iconfont">&#xe60b;</i>
						767</span>
                    </dd>
                    <dd>
                        <a href="">使用 layui 秒搭后台大布局（基本结构）</a> <span><i
                            class="iconfont">&#xe60b;</i> 6087</span>
                    </dd>
                    <dd>
                        <a href="">Java实现LayIM后端的核心代码</a> <span><i class="iconfont">&#xe60b;</i>
						767</span>
                    </dd>
                    <dd>
                        <a href="">使用 layui 秒搭后台大布局（基本结构）</a> <span><i
                            class="iconfont">&#xe60b;</i> 6087</span>
                    </dd>
                    <dd>
                        <a href="">Java实现LayIM后端的核心代码</a> <span><i class="iconfont">&#xe60b;</i>
						767</span>
                    </dd>
                    <dd>
                        <a href="">使用 layui 秒搭后台大布局（基本结构）</a> <span><i
                            class="iconfont">&#xe60b;</i> 6087</span>
                    </dd>
                    <dd>
                        <a href="">Java实现LayIM后端的核心代码</a> <span><i class="iconfont">&#xe60b;</i>
						767</span>
                    </dd>--%>
                </dl>
            </div>

            <div class="fly-panel detail-box">
                <dl class="fly-panel fly-list-one" id="info">
                    <dt class="fly-panel-title"><h1>最近资讯</h1></dt>

                </dl>
            </div>
        </div>
    </div>

    <div class="edge">
        <dl class="fly-panel fly-list-one" id="hotlist">
            <dt class="fly-panel-title">最近热帖</dt>

        </dl>

        <dl class="fly-panel fly-list-one" id="rankList">
            <dt class="fly-panel-title">游戏讨论排行</dt>

        </dl>
    </div>
</div>
</body>
<script type="text/javascript">
    /*$(document).ready(function () {
        $("span[name='cate']")[0].click();
    })*/
    $(document).ready(function(){
        jQuery.ajax({
            type: "post",
            cache: false,
            url:'${pageContext.request.contextPath}/message/info',
            dataType: "json",
            success: function(rt){
                $.each( rt, function(i, n){
                    var href = "${pageContext.request.contextPath}/message/article?url="+n.href;
                    var url = encodeURI(href);
                    $("#info").append('<dd><a href="'+url+'">'+n.content+'</a></dd>');
                });
            },
            error: function(rt){}
        });
    })
    $(document).ready(function(){
        jQuery.ajax({
            type: "post",
            cache: false,
            url:'${pageContext.request.contextPath}/message/rank',
            dataType: "json",
            success: function(rt){
                $.each( rt, function(i, n){
                    var rank = i+1;
                    $("#rankList").append('<dd><span style="width:20px;text-align:center;font-size: 10px;color: #FFFFFF;border-radius: 50%;background-color: #c9302c">'+rank+'</span>&nbsp;<a href="'+n.pId+'" target="_blank">'+n.pType+'</a> <span><i name="talkNum">&#xe60c;</i> '+n.num+'</span></dd>');
                });
                $("i[name='talkNum']").addClass("iconfont");
            },
            error: function(rt){}
        });
            jQuery.ajax({
                type: "post",
                cache: false,
                url:'${pageContext.request.contextPath}/message/notice',
                dataType: "json",
                success: function(rt){
                    $.each( rt, function(i, n){
                        $("#notice").append('<dd><a href="${pageContext.request.contextPath}/post/view?pid='+n.pId+'">'+n.pTitle+'</a> <span><i name="talkNum">&#xe60b;</i> '+n.hits+'</span></dd>');
                    });
                    $("i[name='talkNum']").addClass("iconfont");
                },
                error: function(rt){}
            });
        jQuery.ajax({
            type: "post",
            cache: false,
            url:'${pageContext.request.contextPath}/message/hot',
            dataType: "json",
            success: function(rt){
                $.each( rt, function(i, n){
                    $("#hotlist").append('<dd><a href="${pageContext.request.contextPath}/post/view?pid='+n.pId+'">'+n.pTitle+'</a> <span><i name="talkNum">&#xe60b;</i> '+n.hits+'</span></dd>');
                });
                $("i[name='talkNum']").addClass("iconfont");
            },
            error: function(rt){}
        });
    })
</script>
</html>