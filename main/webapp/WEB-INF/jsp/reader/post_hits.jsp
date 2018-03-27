<%@ page import="org.elasticsearch.search.SearchHits" %>
<%@ page import="org.elasticsearch.search.SearchHit" %>
<%@ page import="java.util.Map" %>
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
</head>
<body>
<jsp:include page="../head.jsp"></jsp:include>
<div class="demo" style="margin-top: 6%">
    <form action="${pageContext.request.contextPath}/post/search" method="post" name="searchform" id="searchform" class="searchinfo">
        <ul>
            <li><input type="text" name="keyword" size="24" maxlength="255" value="${keyword}" id="keyword" class="text"></input></li>
            <li><input type="submit" value="搜索" class="button"></input></li>
        </ul>
    </form>
</div>
<div class="main layui-clear" style="margin-top: 10px">
    <div class="wrap">
        <div class="content" style="margin-right:0">
            <ul class="fly-list" id="plist" style="height: 600px;">
            <c:if test="${hits eq null}">
                <li class="fly-list-li" style="background-color: #FFFFFF;margin: 5px">
                    <h1 style="text-align: center">对不起，没有相关帖子</h1>
                </li>
            </c:if>
            <c:forEach items="${hits}" var="hit">
                <li class="fly-list-li" style="background-color: #FFFFFF;margin: 5px;">
                    <%--<a href="" class="fly-list-avatar">
                        <img src="res/images/uer.jpg" alt="">
                    </a>--%>
                    <h2 class="fly-tip">
                        <a href="${pageContext.request.contextPath}/post/view?pid=${hit.getSource().get("id")}"> ${hit.getSource().get("title")} </a>
                    </h2>
                    <p>
                            <%--${hit.highlightFields().get("text")}--%>
                                    <%--${hit.highlightFields() ne ""}--%>
                        <c:choose>
                            <c:when test="${fn:substringBefore(fn:substringAfter(hit.highlightFields().get('text'), '[['),']]') ne ''}">
                                ${fn:substringBefore(fn:substringAfter(hit.highlightFields().get("text"), "[["),"]]")}
                            </c:when>
                            <c:otherwise>
                                ${hit.getSource().get("text")}
                            </c:otherwise>
                        </c:choose>
                    </p>
                    <p>
                        <span><a href="">${hit.getSource().get("username")}</a></span>
                        <%--<span>${hit.getSource().get("updatetime")}</span>--%>
                        <span>${hit.getSource().get("tag")}</span>
                        <span class="fly-list-hint">
                         <span>${hit.getSource().get("updatetime")}</span>
                        </span>
                    </p>
                </li>
            </c:forEach>
            </ul>
            <div id="page" class="page_div"></div>
                <%--<input type="hidden" name="mySelect" id="mySelect"/>--%>
            </div>
        </div>
    </div>
</div>
</body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css">
<script src="${pageContext.request.contextPath}/js/paging.js"></script>
<script type="text/javascript">
    //分页
    $("#page").paging({
        totalPage: ${totalPage},
        totalSize: ${totalSize},
        callback: function(num) {
            window.location.href ="${pageContext.request.contextPath}/post/search?keyword="+$("#keyword").val()+"&page="+num;
        }
    })
</script>
</html>