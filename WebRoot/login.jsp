<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<title>用户登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->

<link href="<%=basePath %>css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="<%=basePath %>css/animate.min.css" rel="stylesheet" type="text/css" media="all" /><!-- animation -->
<link href="<%=basePath %>css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style -->   

<link href="<%=basePath %>css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="<%=basePath %>css/animate.min.css" rel="stylesheet" type="text/css" media="all" /><!-- animation -->
<link href="<%=basePath %>css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style -->

<!-- //Custom Theme files -->
<!-- font-awesome icons -->

<link href="<%=basePath %>css/font-awesome.css" rel="stylesheet"> 

<link href="<%=basePath %>css/font-awesome.css" rel="stylesheet">

<!-- //font-awesome icons -->
<!-- js -->
<script src="<%=basePath %>js/jquery-2.2.3.min.js"></script> 

<!-- //js --> 
<!-- web-fonts -->
<!-- <link href='http://fonts.useso.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Lovers+Quarrel' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Offside' rel='stylesheet' type='text/css'>  -->
<!-- web-fonts -->  

</head>

<body>
	<!-- header -->
	<div class="header">
		<div class="w3ls-header" style="height: 36px">
			<div class="w3ls-header-left">
				<div class="header-logo">
					<h3><a href="<%=basePath %>index.jsp"><span>S</span>mart <i>Bazaar</i></a></h3>
					<h6>Your stores. Your place.</h6> 
				</div>
			</div>
			<div class="w3ls-header-right">
				<ul>
					<li class="dropdown head-dpdn">
						<a href="<%=basePath %>user/admin.do" class="dropdown-toggle">进入后台</a>
					</li>
				</ul>
			</div>
		</div>
		<%-- <div class="header-two"><!-- header-two -->
			<div class="container">
				<div class="header-logo">
					<h1><a href="<%=basePath %>index.jsp"><span>S</span>mart <i>Bazaar</i></a></h1>
					<h6>Your stores. Your place.</h6> 
				</div>	
			</div>		
		</div> --%>
		<div>
			 
		</div>
		<div class="header-three">
			<!-- <div class="container">
				<div class="menu" style="height: 50px;">	 
				</div>
			</div> -->
		</div>
	</div>
	<!-- //header --> 	
	<!-- login-page -->
	<div class="login-page">
		<div class="container">
			<h3 class="w3ls-title w3ls-title1" style="font-family: '微软雅黑';color: slategrey;">欢迎登录</h3>  
			<div class="login-body">
				<form action="<%=basePath%>user/login.do" method="post">
					<input type="text" class="user" name="uName" placeholder="输入你的账号" required="">
					<input type="password" name="uPwd" class="lock" placeholder="密码" required="">
					<input type="hidden" name="uRoleId" value="2" required="">
					<input type="submit" value="登 录">
					<!-- <div class="forgot-grid">
						<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>记住账号</label>
						<div class="forgot">
							<a href="#">忘记密码？</a>
						</div>
						<div class="clearfix"> </div>
					</div> -->
				</form>
				<h6>还没有账号？<a href="<%=basePath %>/view/user/signup.jsp">马上注册 »»</a> </h6> 
			</div>
		</div>
	</div>
	<!-- //login-page --> 
	<!-- 底部广告和功能菜单 -->
	<div class="footer">
		<div class="container">
			<div class="footer-info w3-agileits-info">
				<div class="col-md-4 address-left agileinfo">
					<div class="footer-logo header-logo">
						<h2><a href="index.jsp"><span>S</span>mart <i>Bazaar</i></a></h2>
						<h6>Your stores. Your place.</h6>
					</div>
					<ul>
						<li><i class="fa fa-map-marker"></i>红山区  赤峰市  内蒙古 中国</li>
						<li><i class="fa fa-mobile"></i> 333 222 3333 </li>
						<li><i class="fa fa-phone"></i> +222 11 4444 </li>
						<li><i class="fa fa-envelope-o"></i> <a href="mailto:example@mail.com"> mail@example.com</a></li>
					</ul> 
				</div>
				<div class="col-md-8 address-right">
					<div class="col-md-4 footer-grids">
						<h3>消费者保障</h3>
						<ul>
							<li><a href="about.html">保障范围</a></li>
							<li><a href="marketplace.html">退货退款流程</a></li>  
							<li><a href="values.html">投诉举报</a></li>  
							<li><a href="privacy.html">人工服务</a></li>
						</ul>
					</div>
					<div class="col-md-4 footer-grids">
						<h3>新手上路</h3>
						<ul>
							<li><a href="contact.html">新手须知</a></li>
							<li><a href="login.html">消费警示</a></li> 
							<li><a href="faq.html">交易安全</a></li>
							<li><a href="sitemap.html">开店流程</a></li>
							<li><a href="login.html">在线帮助</a></li>
						</ul> 
					</div>
					<div class="col-md-4 footer-grids">
						<h3>关于我们</h3>
						<ul>
							<li><a href="contact.html">关于商城</a></li>
							<li><a href="login.html">合作伙伴</a></li> 
							<li><a href="faq.html">网站地图</a></li>
							<li><a href="sitemap.html">诚征英才</a></li>
							<li><a href="login.html">法律声明</a></li>
						</ul> 
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- 底部广告和功能菜单结束 -->		
	<div class="copy-right"> 
		<div class="container">
			<p>Copyright &copy; 2018 解忧小铺 All rights reserved.</p>
		</div>
	</div> 

	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"></script>
</body>
</html>