<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>
<link href="${ctx}/UiMaker/css/style.css" rel="stylesheet"
	type="text/css" />
<script language="JavaScript" src="${ctx}/UiMaker/js/jquery.js"></script>
<script src="${ctx}/UiMaker/js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		});
		if ('${mes}' != null && '${mes}' != "") {
		alert('${mes}');

		}
		
		
	});
	
</script>

</head>

<body
	style="background-color:#1c77ac; background-image:url(${ctx}/UiMaker/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">

	<form action="${ctx}/user/login.action" method="post">

		<div id="mainBody">
			<div id="cloud1" class="cloud"></div>
			<div id="cloud2" class="cloud"></div>
		</div>


		<div class="logintop">
			<span>欢迎登录后台管理界面平台</span>
			<ul>
				<li><a href="#">回首页</a>
				</li>
				<li><a href="#">帮助</a>
				</li>
				<li><a href="#">关于</a>
				</li>
			</ul>
		</div>

		<div class="loginbody">

			<span class="systemlogo"></span>

			<div class="loginbox">
				<input type="hidden" name="loginFrom" value="${param.loginFrom}" />
				<ul>
					<li><input name="dto.username" id="username" type="text" class="loginuser"
						value="" onclick="JavaScript:this.value=''" /><label id="message"></label>
					</li>
					<li><input name="dto.password" id="password" type="password" class="loginpwd"
						value="" onclick="JavaScript:this.value=''" />
					</li>
					<li><input name="btnLogin" type="submit" class="loginbtn"
						value="登录" onclick="javascript:window.location='main.html'" /> <label><input
							name="" type="checkbox" value="" checked="checked" />记住密码</label><label><a
							href="#">忘记密码？</a>
					</label>
					</li>
				</ul>


			</div>

		</div>

	</form>
</body>
</html>