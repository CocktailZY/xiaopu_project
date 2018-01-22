<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="<%=basePath%>css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style --> 
<link href="<%=basePath%>css/ken-burns.css" rel="stylesheet" type="text/css" media="all" /> <!-- banner slider --> 
<link href="<%=basePath%>css/animate.min.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="<%=basePath%>css/owl.carousel.css" rel="stylesheet" type="text/css" media="all"> <!-- carousel slider -->  
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="<%=basePath%>css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="<%=basePath%>js/jquery-2.2.3.min.js"></script> 
<!-- //js --> 

<script src="<%=basePath%>js/owl.carousel.js"></script>  
<script>
$(document).ready(function() { 
	$("#owl-demo").owlCarousel({ 
	  autoPlay: 3000, //Set AutoPlay to 3 seconds 
	  items :4,
	  itemsDesktop : [640,5],
	  itemsDesktopSmall : [480,2],
	  navigation : true
 
	}); 
}); 
</script>
<script src="<%=basePath%>js/jquery-scrolltofixed-min.js" type="text/javascript"></script>
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
<!-- 平滑滚动js -->
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
	<!-- 平滑滚动js结束 -->
<script src="<%=basePath%>js/bootstrap.js"></script>	
</head>
<body>
	
	<!-- 顶部head -->
	<div class="header">
		<!-- 顶部黑色 -->
		<div class="w3ls-header">
			<div class="w3ls-header-left">
				<ul>
					<li class="dropdown head-dpdn">
						<c:if test="${loginUser == null}">
							<a href="<%=basePath %>login.jsp" style="color: white;font-size: 12px;"><i class="fa fa-user" aria-hidden="true"></i> 
								请登录
							</a>
							<a href="<%=basePath %>view/user/signup.jsp" style="color: white;font-size: 12px;"><i class="fa fa-user" aria-hidden="true"></i> 
								免费注册
							</a>
						</c:if>
						<c:if test="${loginUser ne null}">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white;font-size: 12px;"><i class="fa fa-user" aria-hidden="true"></i> 
								${loginUser.uName }
								<span class="caret"></span>
							</a>
						<ul class="dropdown-menu row">
							<!-- 头像和个人信息 -->
							<div style="width: 140px;height: 100px;">
								<div style="height: 60px;width: 60px;background-color: black;margin: 5px;color: white;float: left;">	
									<img src="<%=basePath%>fileUpload/${loginUser.uHead}" style="height: 60px;width: 60px;"/>
								</div>
								<div style="height: 60px;width: 60px;background-color: red;border-radius: 2px;float: left;">
									<a href="<%=basePath%>view/user/personal_center.jsp">个人中心</a><br>
									<a href="">退出登录</a>
								</div>
								<div style="height: 30px;width: 130px;background-color: yellow;border-radius: 2px;clear:left;float: left;">
								这里是积分和等级神马的
								</div>
							</div>
						</ul>
						</c:if>
					
					</li>
				</ul>
			</div>
			<div class="w3ls-header-right">
				<ul>
					<li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user" aria-hidden="true"></i>我的账号<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.html">登 录</a></li>
							<li><a href="signup.html">注 册</a></li>
							<li><a href="login.html">注 销</a></li>
						</ul>
					</li> 
					<li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-tag" aria-hidden="true"></i>我的订单<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="offers.html">历史订单</a></li> 
							<li><a href="offers.html">已买商品</a></li>
							<li><a href="offers.html">订单投诉</a></li> 
						</ul> 
					</li> 
					<li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-folder-open" aria-hidden="true"></i>收藏夹<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="offers.html">收藏商品</a></li> 
							<li><a href="offers.html">收藏店铺</a></li>
						</ul>
					</li> 
					<li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-truck" aria-hidden="true"></i>卖家中心<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="offers.html">我要开店</a></li> 
							<li><a href="offers.html">我的店铺</a></li>
							<li><a href="offers.html">卖家培训</a></li>
						</ul>
					</li> 
					<li class="dropdown head-dpdn">
						<a href="card.html" class="dropdown-toggle"><i class="fa fa-comment" aria-hidden="true"></i>消息处理</a>
					</li> 
					<li class="dropdown head-dpdn">
						<a href="help.html" class="dropdown-toggle"><i class="fa fa-phone" aria-hidden="true"></i>联系客服</a>
					</li>
				</ul>
			</div>
			<div class="clearfix"> </div> 
		</div>
		<!-- 顶部黑色结束 -->
		<!-- Logo -->
		<div class="header-two">
			<div class="container">
				<div class="header-logo">
					<h1><a href="../"><span>S</span>mart <i>Bazaar</i></a></h1>
					<h6>Your stores. Your place.</h6> 
				</div>	
				<div class="header-search">
					<form action="#" method="post">
						<input type="search" name="Search" placeholder="搜索你想要的商品..." required="">
						<button type="submit" class="btn btn-default" aria-label="Left Align">
							<i class="fa fa-search" aria-hidden="true"> </i>
						</button>
					</form>
				</div>
				<div class="header-cart"> 
					<div class="my-account">
						<a href="contact.html"><i class="fa fa-map-marker" aria-hidden="true"></i>联系我们</a>						
					</div>
					<div class="cart"> 
						<form action="#" method="post" class="last"> 
							<input type="hidden" name="cmd" value="_cart" />
							<input type="hidden" name="display" value="1" />
							<button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
						</form>  
					</div>
					<div class="clearfix"></div>
				</div> 
				<div class="clearfix"></div>
			</div>		
		</div><!-- //header-two -->
		<!-- Logo结束 -->
		<!-- 中部蓝条 -->
		<div class="header-three">
			<div class="container">
				<div class="menu" style="height: 50px;">	 
				</div>
			</div>
		</div>
		<!-- 蓝条结束 -->
	</div>
	<!-- 顶部head结束 -->	
	<!-- services-page -->
	<div class="w3l-services">
		<div class="container"> 
			<h3 class="w3ls-title w3ls-title1">个人中心</h3>  
			<div class="services-row"> 
				<div class="col-md-3 services-grids">
					<a href="pc_message.jsp">
						<i class="fa fa-user" aria-hidden="true"></i>
						<h4>个人信息</h4>
					</a>
					<p>在这里你可以查看和修改自己的基本信息。</p>
				</div>
				<div class="col-md-3 services-grids">
					<a href="<%=basePath%>user/findById.do">
						<i class="fa fa-map-marker" aria-hidden="true"></i>
						<h4>收货地址</h4>
					</a>
					<p>在这里你可以管理自己的收货地址，不要把宝贝送给拜白白送给别人哦！</p>
				</div>
				<div class="col-md-3 services-grids">
					<i class="fa fa-lock" aria-hidden="true"></i>
					<h4>安全保护</h4>
					<p>设置属于你的专属密保，保护账号安全！</p>
				</div>
				<div class="col-md-3 services-grids">
					<i class="fa fa-bar-chart" aria-hidden="true"></i>
					<h4>我的交易记录</h4>
					<p>在这里你可以查看自己的交易信息，确保自己对每一个订单都了如指掌！</p>
				</div>
				<div class="col-md-3 services-grids services-grids-btm">
					<i class="fa fa-check-square-o" aria-hidden="true"></i>
					<h4>订单评价</h4>
					<p>对你的订单还满意么？赶快来评价吧亲！</p>
				</div>
				<div class="col-md-3 services-grids services-grids-btm">
					<i class="fa fa-shopping-cart" aria-hidden="true"></i>
					<h4>我的购物车</h4>
					<p>看看自己的购物车里还有哪些宝贝吧！</p>
				</div>
				<div class="col-md-3 services-grids services-grids-btm">
					<i class="fa fa-folder-open" aria-hidden="true"></i>
					<h4>我的收藏</h4>
					<p>哇！你的收藏夹收藏了好多宝贝呀！看来你的眼光还真是不错呢！</p>
				</div>
				<div class="col-md-3 services-grids services-grids-btm">
					<i class="fa fa-comments" aria-hidden="true"></i>
					<h4>问题反馈</h4>
					<p>亲！有问题就要向我们说哦~我们是你最贴心的管家！</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //services-page --> 
	<!-- 底部开头三个图标 -->
	<div class="w3agile-ftr-top">
		<div class="container">
			<div class="ftr-toprow">
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-truck" aria-hidden="true"></i>
					</div> 
					<div class="ftr-top-right">
						<h4>物流查询</h4>
						<p>最新最快的物流信息，让您实时掌握物流动态！</p>
					</div> 
					<div class="clearfix"> </div>
				</div> 
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-user" aria-hidden="true"></i>
					</div> 
					<div class="ftr-top-right">
						<h4>顾客关怀</h4>
						<p>在这里有最贴心的客服，为您排忧解难！</p>
					</div> 
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
					</div> 
					<div class="ftr-top-right">
						<h4>优质高效</h4>
						<p>我们致力于为您提供最高效的购物平台，最优质的商品，竭诚为您服务！</p>
					</div>
					<div class="clearfix"> </div>
				</div> 
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- 底部开头三个图标结束 --> 
	<!-- 底部友情链接和反馈 -->
	<div class="subscribe"> 
		<div class="container">
			<div class="col-md-6 social-icons w3-agile-icons">
				<h4>关注我们</h4>  
				<ul>
					<li><a href="#" class="fa fa-facebook icon facebook"> </a></li>
					<li><a href="#" class="fa fa-twitter icon twitter"> </a></li>
					<li><a href="#" class="fa fa-google-plus icon googleplus"> </a></li>
					<li><a href="#" class="fa fa-dribbble icon dribbble"> </a></li>
					<li><a href="#" class="fa fa-rss icon rss"> </a></li> 
				</ul> 
				<ul class="apps"> 
					<li><h4>下载我们的app : </h4> </li>
					<li><a href="#" class="fa fa-apple"></a></li>
					<li><a href="#" class="fa fa-windows"></a></li>
					<li><a href="#" class="fa fa-android"></a></li>
				</ul> 
			</div> 
			<div class="col-md-6 subscribe-right">
				<h4>验证你的邮箱账号，获得25%的优惠！</h4>  
				<form action="#" method="post"> 
					<input type="text" name="email" placeholder="输入你的邮箱..." required="">
					<input type="submit" value="邮箱验证">
				</form>
				<div class="clearfix"> </div> 
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!-- 底部友情链接和反馈结束 --> 
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
						<h3>付款方式</h3>
						<ul>
							<li><i class="fa fa-laptop" aria-hidden="true"></i>网上银行</li>
							<li><i class="fa fa-money" aria-hidden="true"></i>货到付款</li>
							<li><i class="fa fa-credit-card" aria-hidden="true"></i>信用卡</li>
							<li><i class="fa fa-gift" aria-hidden="true"></i>礼品兑换卷</li>
							<li><i class="fa fa-mobile" aria-hidden="true"></i>手机快捷支付</li>
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
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster --> 
</body>
</html>