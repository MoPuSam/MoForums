<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%--网站标签图--%>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/iconfont/favicon.ico"/>
    <link rel="bookmark" href="${pageContext.request.contextPath}/iconfont/favicon.ico"/>
</head>
<body>
<%--<h2>Hello IDeal!</h2>
<a href="${pageContext.request.contextPath}/user/showUser?id=1">跳转demo</a><br/>
<a href="${pageContext.request.contextPath}/login/index">登陆页面</a>--%>
<jsp:include page="/login/index"/>
</body>
</html>
