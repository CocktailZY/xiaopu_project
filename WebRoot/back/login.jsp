<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>后台登录页面</title>
		<!-- Custom Theme files -->
		<link href="css/login.css" rel="stylesheet" type="text/css" media="all"/>
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all"/>
		<link rel="icon" type="image/png" sizes="130x150" href="<%=basePath %>back/assets/img/title.jpg">
		<!-- Custom Theme files -->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<script src="js/jquery.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="login">
			<h2>后台管理系统登录</h2>
			<div class="login-top">
				<h1>Admin Login</h1>
				<form id="adminloginform" action="<%=basePath%>admin/login.do" method="post">
					<input type="text" placeholder="管理员名" id="aName" name="aName" onblur="checkInputName(this)">
					<div id="checkAdminName" class="alert alert-danger" style="display:none;">请输入管理员名</div>
					<input type="password" placeholder="管理员密码" name="aPwd" onblur="checkInputPwd(this)">  
					<div id="checkAdminPwd" class="alert alert-danger" style="display:none;">请输入管理员密码</div>
					<div class="forgot">
			    		<a href="#">忘记密码</a>
			    		<input type="submit" value="登 录" >
			    	</div>
			    </form> 
			</div>
			<div class="login-bottom">
				<h3>智能停车管理系统</h3>
			</div>
		</div>	
		<div class="copyright">
			<p>&copy;Copyright <script>document.write(new Date().getFullYear())</script> by 解忧小铺</a> All Rights Reserved</p>
		</div>
	</body>
	<!-- 验证输入的管理员名 -->
	<script type="text/javascript">
		function checkInputName(target){
			var name=target.value;
			var long=name.length;
			if(name == "admin" && long != 0){
				document.getElementById("checkAdminName").style.display="block";
				$("#checkAdminName").removeClass();
              	$("#checkAdminName").addClass("alert alert-success");
               	$("#checkAdminName").html("管理员名正确正确！");
			}else if(name != 'admin' && long != 0){
				document.getElementById("checkAdminName").style.display="block";
				$("#checkAdminName").removeClass();
              	$("#checkAdminName").addClass("alert alert-danger");
               	$("#checkAdminName").html("管理员名错误！");
			}else if(long == 0){
				document.getElementById("checkAdminName").style.display="block";
				$("#checkAdminName").removeClass();
              	$("#checkAdminName").addClass("alert alert-warning");
               	$("#checkAdminName").html("请输入管理员名！");
			}
		}
	</script>
	<!-- 验证输入的密码 -->
	<script type="text/javascript">
		function checkInputPwd(target){
			var pwd=target.value;
			var long=pwd.length;
			if(pwd == "admin" && long != 0){
				document.getElementById("checkAdminPwd").style.display="block";
				$("#checkAdminPwd").removeClass();
              	$("#checkAdminPwd").addClass("alert alert-success");
               	$("#checkAdminPwd").html("管理员密码正确！");
			}else if(name != 'admin' && long != 0){
				document.getElementById("checkAdminPwd").style.display="block";
				$("#checkAdminPwd").removeClass();
              	$("#checkAdminPwd").addClass("alert alert-danger");
               	$("#checkAdminPwd").html("密码错误！");
			}else if(long == 0){
				document.getElementById("checkAdminPwd").style.display="block";
				$("#checkAdminPwd").removeClass();
              	$("#checkAdminPwd").addClass("alert alert-warning");
               	$("#checkAdminPwd").html("请输入管理员密码！");
			}
		}
	</script>
</html>