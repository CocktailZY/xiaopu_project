<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="${ctx}/UiMaker/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${ctx}/UiMaker/js/jquery.js"></script>
</head>
<body style="background: url(${ctx}/UiMaker/images/topbg.gif) repeat-x;">
	<div class="topleft">
		<%-- <a href="main.jsp" target="_parent"><img src="${ctx}/UiMaker/images/logo.png"
			title="系统首页" /></a> --%>
	</div>
	<div class="topright">
		<ul>
			<li><a href="${ctx}/user/logout.action" target="_parent">退出</a></li>
		</ul>
		<div class="user">
			<span>欢迎您，${login_user.role.role_name},${login_user.username}</span>
		</div>
	</div>
</body>
</html>

