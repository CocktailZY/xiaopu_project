<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<title>注册店铺</title>
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
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="<%=basePath %>css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="<%=basePath %>js/jquery-2.2.3.min.js"></script> 
<script src="<%=basePath %>js/jquery-scrolltofixed-min.js" type="text/javascript"></script><!-- fixed nav js -->
<script>
    $(document).ready(function() {

        // Dock the header to the top of the window when scrolled past the banner. This is the default behaviour.

        $('.header-two').scrollToFixed();  
        // previous summary up the page.

        var summaries = $('.summary');
        summaries.each(function(i) {
            var summary = $(summaries[i]);
            var next = summaries[i + 1];

            summary.scrollToFixed({
                marginTop: $('.header-two').outerHeight(true) + 10, 
                zIndex: 999
            });
        });
    });
</script>
<!-- //js --> 
<!-- web-fonts -->
<%--<link href='http://fonts.useso.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Lovers+Quarrel' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Offside' rel='stylesheet' type='text/css'>--%>  
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="<%=basePath %>js/move-top.js"></script>
<script type="text/javascript" src="<%=basePath %>js/easing.js"></script>	
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
</script>
<!-- //end-smooth-scrolling -->
<!-- smooth-scrolling-of-move-up -->
	<script type="text/javascript">
		$(document).ready(function() {
		
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->
</head>
<body>
	<!-- header -->
	<div class="header">
		<div class="w3ls-header">
		</div>
		<div class="header-two"><!-- header-two -->
			<div class="container">
				<div class="header-logo">
					<h1><a href="index.html"><span>S</span>mart <i>Bazaar</i></a></h1>
					<h6>Your stores. Your place.</h6> 
				</div>	
			</div>		
		</div>
		<div>
			 
		</div>
		<div class="header-three">
			<div class="container">
				<div class="menu" style="height: 50px;">	 
				</div>
			</div>
		</div>
	</div>
	<!-- //header --> 	
		<!-- 注册的各种验证 -->
	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
	<script type="text/javascript">
	var flag = false;
	var i = 1;
	function checkUsername(){
		if($("#uName").val().length>0){
			$.ajax({
				type:"post",
				async:true,
				url:"<%=basePath%>user/findByName.do",
				dataType:"json",
				data:{
					uName:$("#uName").val(),
				},
				success:function(data){
					$("#span1").html(data.mes);
					if(data.flag){
						i++;
					}else{
						i--;
					}
					
				},
				error:function(){
					alert("出现异常");
				}
			});
		}else{
			$("#span1").html("<font></font>");
		}
	}
 	function tip1(){
		$("#span1").html("<font color='black'>支持中文、字母、数字、“-”“_”的组合，4-16 个字符</font>");
	}
	

	function checkForm(){
		if(i>0){
			return true;
		}else{
			alert("有规范不合格的信息，请重新输入！");
			return false;
		}
	}

	
	
	
	
	</script>
	<!-- sign up-page -->
	<div class="login-page">
		<div class="container"> 
			<h3 class="w3ls-title w3ls-title1"style="font-family: '微软雅黑';color: slategray;font-size: 35px;">注册店铺</h3>  
			<div class="login-body">
				<form action="<%=basePath%>shop/addSell.do" method="post"  onsubmit="return checkForm();">
					
					<span id="span1"></span>
					<input type="text" class="sName" id="sName" name="sName" placeholder="输入店铺名称" required=""><!--  onblur="checkUsername()" onclick="tip1()" -->
					<span id="span3"></span>
					<input type="text" class="sUserid" id="sUserid" name="sUserid" placeholder="用户ID" required="">
					<span id="span4"></span>
					<select name="Shoptype" id="Shoptype">
					<option>--请选择店铺类型--</option>
					<c:forEach items="${shopType}" var="type">
					
					<option value="${type.shId }">${type.shName }———————应交付的定金为：${type.shDeposit }</option>
					</c:forEach>
					</select>
					
					<br><br>
					<span id="span5"></span>
					<table align="center">
					<tr>
					<td align="center" valign="middle" id="shDeposit" class="shDeposit"><span id="shopType"></span>&nbsp; </td>
					</tr>
					</table>
					
					<input type="submit" value="提交申请">
					
				</form>
			</div>  
		</div>
	</div>
	<!-- //sign up-page --> 
	
	<!-- 底部广告和功能菜单 -->
	<div class="footer">
		<div class="container">
			<div class="footer-info w3-agileits-info">
				<div class="col-md-4 address-left agileinfo">
					<div class="footer-logo header-logo">
						<h2><a href="index.html"><span>S</span>mart <i>Bazaar</i></a></h2>
						<h6>Your stores. Your place.</h6>
					</div>
					<ul>
						<li><i class="fa fa-map-marker"></i>光明路1号, 昆山  苏州市  江苏省 中国.</li>
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
	<!-- 底部结尾 -->
	<div class="copy-right"> 
		<div class="container">
			<p>Copyright &copy; 2018.解忧小铺  All rights reserved.</p>
		</div>
	</div>
	<!-- 底部结尾结束 --> 
	 
	<!-- menu js aim -->
	<script src="js/jquery.menu-aim.js"> </script>
	<script src="js/main.js"></script> <!-- Resource jQuery -->
	<!-- //menu js aim --> 
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"></script>
</body>
</html>