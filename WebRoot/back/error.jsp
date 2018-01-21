<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="description" content="">
	    <meta name="author" content="">
	    <title>密码错误</title>
	    <!-- custom CSS here -->
	    <link rel="icon" type="image/png" sizes="130x150" href="<%=basePath %>back/assets/img/title.jpg">
	    <link href="<%=basePath %>back/css/style.css" rel="stylesheet" />
	</head>
	<body>
	    <div class="container">
	    	<div class="row pad-top text-center" style="margin-top:10%;">
	        	<div class="col-md-6 col-md-offset-3 text-center">
	            	<h1>  The password you entered is incorrect </h1>
	                <h2 style="font-family:'微软雅黑';"> 您输入的密码错误！</h2> 
	                <h2>! ERROR PASSWORD !</h2>
				</div>
	        </div>
	        <div class="row text-center">
	            <div class="col-md-8 col-md-offset-2">
	                <h3><i class="fa fa-lightbulb-o fa-5x"></i></h3>
	               	<a href="<%=basePath %>back/login.jsp" class="btn btn-primary" style="font-family:'微软雅黑';font-size:20px;">返回登录首页</a> 
	             	<br/><br/>
	             	<div style="margin-top:20%;">
	             		&copy;Copyright <script>document.write(new Date().getFullYear())</script> by 解忧小铺</a> All Rights Reserved
					</div>
				</div>
	        </div>
	    </div>
	</body>
</html>
