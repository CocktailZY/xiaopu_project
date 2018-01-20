<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
<head>
<base href="<%=basePath%>">
<title>历史订单</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/animate.min.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- animation -->   
<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style -->   
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<script src="js/jquery-scrolltofixed-min.js" type="text/javascript"></script>
<!-- fixed nav js -->
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
				marginTop : $('.header-two').outerHeight(true) + 10,
				zIndex : 999
			});
		});
	});
</script>
<!-- //js --> 
<!-- web-fonts -->
<!-- <link
	href='http://fonts.useso.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Lovers+Quarrel'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Offside' rel='stylesheet'
	type='text/css'>  -->
<!-- web-fonts -->  
  </head>
<body>
	<!-- header -->
	<div class="header">
		<div class="w3ls-header">
			<!--header-one-->
			<div class="w3ls-header-left">
				<p>
					<a href="#">微星电脑6999元| 使用优惠劵 </a>
				</p>
			</div>
			<div class="w3ls-header-right">
				<ul>
					<li class="dropdown head-dpdn"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<i class="fa fa-user" aria-hidden="true"></i> 我的账户
					<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="login.html">登录</a>
							</li>
							<li><a href="signup.html">注册</a>
							</li>
							<li><a href="login.html">我的订单</a>
							</li>
							<li><a href="login.html">钱包</a>
							</li>
						</ul></li>
					<li class="dropdown head-dpdn"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-percent" aria-hidden="true"></i> 今日交易
					<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="offers.html">现金返还优惠</a>
							</li>
							<li><a href="offers.html">产品折扣</a>
							</li>
							<li><a href="offers.html">特别优惠</a>
							</li>
						</ul></li>
					<li class="dropdown head-dpdn">
					<a href="#"class="dropdown-toggle" data-toggle="dropdown">
					<i class="fa fa-gift" aria-hidden="true"></i> 礼品卡
					<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="offers.html">产品礼品卡</a>
							</li>
							<li><a href="offers.html">场合登记</a>
							</li>
							<li><a href="offers.html">查看余额</a>
							</li>
						</ul></li>
					<li class="dropdown head-dpdn"><a href="contact.html" class="dropdown-toggle"><i class="fa fa-map-marker" aria-hidden="true"></i> 商店搜索</a></li>
					<li class="dropdown head-dpdn"><a href="card.html" class="dropdown-toggle"><i class="fa fa-credit-card-alt" aria-hidden="true"></i> 信用卡</a></li>
					<li class="dropdown head-dpdn"><a href="help.html" class="dropdown-toggle"><i class="fa fa-question-circle" aria-hidden="true"></i> 帮助</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="header-two">
			<!-- header-two -->
			<div class="container">
				<div class="header-logo">
					<h1>
						<a href="index.html"><span>S</span>mart <i>Bazaar</i>
						</a>
					</h1>
					<h6>Your stores. Your place.</h6>
				</div>
				<div class="header-search">
					<form action="#" method="post">
						<input type="search" name="Search" placeholder="搜索商品" required="">
						<button type="submit" class="btn btn-default" aria-label="Left Align">
							<i class="fa fa-search" aria-hidden="true">搜索</i>
						</button>
					</form>
				</div>
				<div class="header-cart">
					<div class="my-account">
						<a href="contact.html"><i class="fa fa-map-marker" aria-hidden="true"></i> 联系我们</a>
					</div>
					<div class="cart">
						<form action="#" method="post" class="last">
							<input type="hidden" name="cmd" value="_cart" /> 
							<input type="hidden" name="display" value="1" />
							<button class="w3view-cart" type="submit" name="submit" value="">
								<i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
							</button>
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- //header-two -->
		<div class="header-three">
			<!-- header-three -->
			<div class="container">
				<div class="menu">
					<div class="cd-dropdown-wrapper">
						<a class="cd-dropdown-trigger" href="#0">所有商品</a>
						<nav class="cd-dropdown"> <a href="#0" class="cd-close">关闭</a>
						<!-- .cd-dropdown-content --> </nav>
						<!-- .cd-dropdown -->
					</div>
					<!-- .cd-dropdown-wrapper -->
				</div>
				<div class="move-text">
					<div class="marquee">
						<a href="offers.html">在这里有最新的商品 <span>最高可获得10%的优惠|没有额外的税 </span> <span>最高15天可以免费退货</span>
						</a>
					</div>
					<script type="text/javascript" src="js/jquery.marquee.min.js"></script>
					<script>
						$('.marquee').marquee({
							pauseOnHover : true
						});
						//@ sourceURL=pen.js
					</script>
				</div>
			</div>
		</div>
	</div>
	<!-- //header -->
	<!-- order-page -->
		<!-- On rows -->
		<c:forEach items="${shopList2 }" var="shop">
		
		<div class="panel panel-primary">
		
		   <div class="panel-heading">
		      <h3 class="panel-title">
			  	店铺名：${shop.sName }
			  </h3>
		   </div>
		   <c:forEach items="${order }" var="oil">
		 <c:if test="${shop.sId == oil.shop.sId }">
		   <div class="panel-body">
		   		<input type="checkbox" name="time" />&nbsp;${oil.orderInfo.oFtime }
			  	订单号：${oil.orderInfo.oId }
			   	<table class="table table-bordered">
			   		<tr class="active">
			   			<td width="200">图片</td>
			   			<td>规格</td>
			   			<td >
							<tt>${oil.product.pName}</tt>
							<tt>${oil.specs.spNum}</tt>
							<tt>${oil.specs.spPrice}</tt>
						</td>
			   		</tr>
			   	</table>
			</div>
			  </c:if>
			  </c:forEach>
		</div>
		
		
		</c:forEach>
<!-- 		<div class="panel panel-primary">
		   <div class="panel-heading">
		      <h3 class="panel-title">
			  	<input type="checkbox" name="time" value=""/>&nbsp;&nbsp;
			  	订单号：&nbsp;&nbsp;
			  	店铺名：
			  </h3>
		   </div>
		   <div class="panel-body">
		   	<table class="table table-bordered">
		   		<tr class="active">
		   			<td >
						<tt>图片</tt>
						<tt>名称</tt>
						<tt>数量</tt>
						<tt>价格</tt>
					</td>
		   		</tr>
		   	</table>
		</div>
		</div> -->
	<!-- //order-page -->
	<!-- footer-top -->
	<div class="w3agile-ftr-top">
		<div class="container">
			<div class="ftr-toprow">
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-truck" aria-hidden="true"></i>
					</div>
					<div class="ftr-top-right">
						<h4>免费送货</h4>
						<p>我们将提供最优质的送货上门服务</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-user" aria-hidden="true"></i>
					</div>
					<div class="ftr-top-right">
						<h4>客户关怀</h4>
						<p>感谢每一位客户对我们的关心，也希望大家可以给我们宝贵的意见</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
					</div>
					<div class="ftr-top-right">
						<h4>质量保障</h4>
						<p>我们将保证每一件商品的质量和售后服务</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //footer-top -->
	<!-- subscribe -->
	<div class="subscribe">
		<div class="container">
			<div class="col-md-6 social-icons w3-agile-icons">
				<h4>售后服务</h4>
				<ul>
					<li><a href="#" class="fa fa-facebook icon facebook"> </a>
					</li>
					<li><a href="#" class="fa fa-twitter icon twitter"> </a>
					</li>
					<li><a href="#" class="fa fa-google-plus icon googleplus">
					</a>
					</li>
					<li><a href="#" class="fa fa-dribbble icon dribbble"> </a>
					</li>
					<li><a href="#" class="fa fa-rss icon rss"> </a>
					</li>
				</ul>
				<ul class="apps">
					<li><h4>下载我们的APP</h4></li>
					<li><a href="#" class="fa fa-apple"></a>
					</li>
					<li><a href="#" class="fa fa-windows"></a>
					</li>
					<li><a href="#" class="fa fa-android"></a>
					</li>
				</ul>
			</div>
			<div class="col-md-6 subscribe-right">
				<h4>电子邮件注册</h4>
				<form action="#" method="post">
					<input type="text" name="email" placeholder="请输入您的邮箱地址...."
						required=""> <input type="submit" value="有本事你点我呀">
				</form>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //subscribe -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="footer-info w3-agileits-info">
				<div class="col-md-4 address-left agileinfo">
					<div class="footer-logo header-logo">
						<h2>
							<a href="index.html"><span>购</span>物车 <i></i>
							</a>
						</h2>
						<h6>你&nbsp;的&nbsp;地&nbsp;盘&nbsp;你&nbsp;做&nbsp;主！</h6>
					</div>
					<ul>
						<li><i class="fa fa-map-marker"></i> 
							中国制造</li>
						<li><i class="fa fa-mobile"></i> 0000-6666666</li>
						<li><i class="fa fa-phone"></i> 0000-800808820</li>
						<li><i class="fa fa-envelope-o"></i> <a
							href="mailto:example@mail.com"> www.hahah.com</a>
						</li>
					</ul>
				</div>
				<div class="col-md-8 address-right">
					<div class="col-md-4 footer-grids">
						<h3>公司</h3>
						<ul>
							<li><a href="about.html">关于我们</a>
							</li>
							<li><a href="marketplace.html">市场</a>
							</li>
							<li><a href="values.html">核心</a>
							</li>
							<li><a href="privacy.html">隐私|政策</a>
							</li>
						</ul>
					</div>
					<div class="col-md-4 footer-grids">
						<h3>服务</h3>
						<ul>
							<li><a href="contact.html">联系我们</a>
							</li>
							<li><a href="login.html">退换商品</a>
							</li>
							<li><a href="faq.html">常见问题解答</a>
							</li>
							<li><a href="sitemap.html">网站地图</a>
							</li>
							<li><a href="login.html">订单状态</a>
							</li>
						</ul>
					</div>
					<div class="col-md-4 footer-grids">
						<h3>付款方式</h3>
						<ul>
							<li><i class="fa fa-laptop" aria-hidden="true"></i>网络银行</li>
							<li><i class="fa fa-money" aria-hidden="true"></i> 货到付款</li>
							<li><i class="fa fa-pie-chart" aria-hidden="true"></i>分期付款</li>
							<li><i class="fa fa-gift" aria-hidden="true"></i>朋友代付</li>
							<li><i class="fa fa-credit-card" aria-hidden="true"></i>借记卡/信用卡</li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //footer -->
	<div class="copy-right">
		<div class="container">
<!-- 			<p>
				<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
			</p> -->
		</div>
	</div>
</body>
</html>

