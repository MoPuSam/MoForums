<%--
  Created by IntelliJ IDEA.
  User: 170904
  Date: 2018/2/24
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <style>
        #loading {
            width:170px;
            height:26px;
            border:3px solid #C3DAF9;
            position:absolute;
            left: 43%;
            top: 50%;
            margin-top: -85px;    /* 高度的一半 */
            margin-left: -13px;   /* 宽度的一半 */
            z-index:10000;
            background-color:#F7F9FC;
            line-height:25px;
            vertical-align:middle;
            font-size:11pt;
            display:none;
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css">
    <script src="${pageContext.request.contextPath}/js/paging.js"></script>
</head>
<body>
<div id="loading"><img src="${pageContext.request.contextPath}/images/loading.gif" alt=""/>正在加载数据,请稍候...</div>

<ul class="fly-list" id="plist" style="height: 800px;">

</ul>

<div id="page" class="page_div"></div>
</body>
<script>
    //显示加载数据
    function ShowDiv() {
        $("#loading").show();
    }
    //隐藏加载数据
    function HiddenDiv() {
        $("#loading").hide();
    }
    function getPateList(pId,keyword){
        //alert(pId);
        //alert(keyword);
        $.ajax({
            type: "post",
            cache: false,
            url:'${pageContext.request.contextPath}/post/pageSize',
            data:"pId="+pId+"&keyword="+keyword,
            dataType: "json",
            success: function(rt){
                //分页
                $("#page").paging({
                    totalPage: rt[0],
                    totalSize: rt[1],
                    callback: function(num) {
                        //alert(num);
                        $.ajax({
                            async: true,
                            beforeSend: function () {
                                ShowDiv();
                            },
                            complete: function () {
                                HiddenDiv();
                            },
                            type : 'POST' ,
                            url : '${pageContext.request.contextPath}/post/plist',
                            data:"pagenum="+num+"&pId="+pId+"&keyword="+keyword,
                            dataType: "json",
                            success: function (rt) {
                                $("#plist").empty();
                                $.each( rt, function(i, n){
                                    $("#plist").append('<li style="border-bottom:1px solid #ccc;box-sizing:border-box;">' +
                                        '<img style="height: 85px;width: 85px;text-align:left;margin-right: 3%" src="'+n.photo+'"/>'+
                                        ' <a href="${pageContext.request.contextPath}/post/view?pid='+n.pId+'"style="color:#369;vertical-align:middle;font-size: 20px">'+n.pTitle+'</a> <br />' +
                                        ' <div style="clear:both;font-size:12px;padding-top: 5px;text-align:right;">' +
                                        ' <a href="liebiao.html" style="background-position:-195px -39px;display:inline-block;height:18px;padding-left:16px;color:#999;vertical-align:middle;background-size:210px 99px;">发帖者:'+n.uNickname+'</a> ' +
                                        '<span style="background-position:-195px -19px;display:inline-block;height:18px;padding-left:16px;color:#999;vertical-align:middle;background-size:210px 99px;">回贴数:'+n.rCount+'</span>&nbsp;&nbsp;' +
                                        '<span style="background-position:-195px 1px;display:inline-block;height:18px;padding-left:16px;color:#999;vertical-align:middle;background-size:210px 99px;">'+n.updateTime+'</span> </div> </li>');
                                })
                            }
                        });
                    }
                })
            },
            error: function(rt){}
        });
        $.ajax({
            async: true,
            beforeSend: function () {
                ShowDiv();
            },
            complete: function () {
                HiddenDiv();
            },
            type : 'POST' ,
            url : '${pageContext.request.contextPath}/post/plist',
            data:"pId="+pId+"&keyword="+keyword,
            dataType: "json",
            success: function (rt) {
                $("#plist").empty();
                $.each( rt, function(i, n){
                    $("#plist").append('<li style="border-bottom:1px solid #ccc;box-sizing:border-box;">' +
                        '<img style="height: 85px;width: 85px;text-align:left;margin-right: 3%" src="'+n.photo+'"/>'+
                        ' <a href="${pageContext.request.contextPath}/post/view?pid='+n.pId+'"style="color:#369;vertical-align:middle;font-size: 20px">'+n.pTitle+'</a> <br />' +
                        ' <div style="clear:both;font-size:12px;padding-top: 5px;text-align:right;">' +
                        ' <a href="liebiao.html" style="background-position:-195px -39px;display:inline-block;height:18px;padding-left:16px;color:#999;vertical-align:middle;background-size:210px 99px;">发帖者:'+n.uNickname+'</a> ' +
                        '<span style="background-position:-195px -19px;display:inline-block;height:18px;padding-left:16px;color:#999;vertical-align:middle;background-size:210px 99px;">回贴数:'+n.rCount+'</span>&nbsp;&nbsp;' +
                        '<span style="background-position:-195px 1px;display:inline-block;height:18px;padding-left:16px;color:#999;vertical-align:middle;background-size:210px 99px;">'+n.updateTime+'</span> </div> </li>');
            })
            }
        });
    }
</script>

</html>
