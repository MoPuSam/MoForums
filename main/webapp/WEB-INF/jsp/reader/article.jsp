<%--
  Created by IntelliJ IDEA.
  User: 170904
  Date: 2018/2/24
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/common.css" />
    <link rel="stylesheet" href="/css/shopsManager.css" />
</head>
<body>
<jsp:include page="../head.jsp"></jsp:include>
<!-- 内容  开始-->
<div class="wrap">
    <div class="vip_cont c100 clearfix" style="margin-top: 5%;">
    ${article.title}
        <hr/>
    ${article.content}
    </div>
</div>
</body>
</html>
