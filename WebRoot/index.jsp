<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<title>主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="<%=basePath %>css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="<%=basePath %>css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style --> 
<link href="<%=basePath %>css/ken-burns.css" rel="stylesheet" type="text/css" media="all" /> <!-- banner slider --> 
<link href="<%=basePath %>css/animate.min.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="<%=basePath %>css/owl.carousel.css" rel="stylesheet" type="text/css" media="all"> <!-- carousel slider -->  
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="<%=basePath %>css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="<%=basePath %>js/jquery-2.2.3.min.js"></script> 
<!-- //js --> 
<!-- web-fonts 

<!-- web-fonts 
<!-- <link href='http://fonts.useso.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

<link href='http://fonts.useso.com/css?family=Lovers+Quarrel' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Offside' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'> -->
<script src="<%=basePath %>js/owl.carousel.js"></script>  
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
<script src="<%=basePath %>js/jquery-scrolltofixed-min.js" type="text/javascript"></script>
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
<!-- 蓝色滚动js -->
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
<!-- 蓝色滚动js结束 -->
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
<script src="<%=basePath %>js/bootstrap.js"></script>	
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
									<a href="<%=basePath%>user/loginout.do">退出登录</a>
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
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-tag" aria-hidden="true"></i>我的订单<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<%=basePath %>orderInfo/orderInfoLogin.do">历史订单</a></li> 
							<li><a href="">订单投诉</a></li> 
						</ul> 
					</li>
					<li class="dropdown head-dpdn">
						<a href="<%=basePath %>cart/cartLogin.do" class="dropdown-toggle"><i class="fa fa-folder-open" aria-hidden="true"></i>购物车<span class="caret"></span></a>
					</li><%-- 
					<li class="dropdown head-dpdn">
						<a href="<%=basePath %>/favorites/favourite.do" class="dropdown-toggle"><i class="fa fa-folder-open" aria-hidden="true"></i>收藏夹</a>
					</li>
					--%><li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-folder-open" aria-hidden="true"></i>收藏夹<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<%=basePath %>/favorites/favourite.do">商品收藏</a></li> 
							<li><a href="<%=basePath %>/favorites/favourite.do">店铺收藏</a></li>
						</ul> 
					</li>
					<li class="dropdown head-dpdn">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-truck" aria-hidden="true"></i>卖家中心<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<%=basePath %>/shopType/typeSel.do">我要开店</a></li> 
							<li><a href="<%=basePath %>view/shop/shop_center.jsp">我的店铺</a></li>
							<li><a href="#">卖家培训</a></li>
						</ul>
					</li> 
					<li class="dropdown head-dpdn">
						<a href="card.html" class="dropdown-toggle"><i class="fa fa-comment" aria-hidden="true"></i>我的消息</a>
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
					<h1><a href="<%=basePath %>index.html"><span>S</span>mart <i>Bazaar</i></a></h1>
					<h6>Your stores. Your place.</h6> 
				</div>	
				<div class="header-search">
					<form action="<%=basePath %>product/getAllProductByPage.do" method="post">
						<input type="search" name="Search" placeholder="搜索你想要的商品..." required="" value="${Search}">
						<button type="submit" class="btn btn-default" aria-label="Left Align">
							<i class="fa fa-search" aria-hidden="true"> </i>
						</button>
					</form>
				</div>
				<div class="header-cart"> 
					<div class="my-account">
						<a href="<%=basePath %>contact.html"><i class="fa fa-map-marker" aria-hidden="true"></i>联系我们</a>						
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
		<!-- 蓝色菜单和滚动条 -->
		<div class="header-three">
			<div class="container">
				<div class="menu">
					<div class="cd-dropdown-wrapper">
						<a class="cd-dropdown-trigger" href="#0">所有商品分类</a>
						<nav class="cd-dropdown"> 
							<a href="#0" class="cd-close">关闭</a>
							<ul class="cd-dropdown-content"> 
								<li><a href="offers.html">今日特价</a></li>
								<li class="has-children">
									<a href="#">服装</a> 
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products.html">所有服装</a></li>
										<!--这个has-children用在有下一级菜单的分类上-->
										<li class="has-children"><a href="#">男装</a>  
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Electronics</a></li> 
												<!--这个has-children用在有下一级菜单的分类上-->
												<li class="has-children"><a href="#0">外套</a> 
													<ul class="is-hidden"> 
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="products.html">夹克</a></li>
														<li><a href="products.html">西服</a></li>
														<li><a href="products.html">休闲</a></li>
													</ul>
												</li>
												<li> <a href="products.html">T恤</a> </li>
												<li><a href="products.html">卫衣</a></li>
												<li><a href="products.html">针织衫</a></li>
												<li><a href="products.html">衬衫</a></li> 
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">女装</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">外套</a></li>
												<li><a href="products.html">T恤</a></li> 
												<li><a href="products.html">连衣裙</a></li>
												<li><a href="products.html">衬衣</a></li>
												<li><a href="products.html">卫衣</a></li>
												<li><a href="products.html">还有啥我就不知道了</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">男裤</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">牛仔裤</a></li>
												<li><a href="products.html">小脚裤</a></li>
												<li><a href="products.html">休闲裤</a></li>
												<li><a href="products.html">短裤</a></li>
												<li><a href="products.html">哈伦裤</a></li>
												<li><a href="#">西服裤</a></li> 
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">女裤</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#0">All Electronics </a></li>
												<li class="has-children"><a href="#">牛仔裤</a>
													<ul class="is-hidden">
														<li class="go-back"><a href="#0"> </a></li>
														<li><a href="products.html">短裤</a></li>
														<li><a href="products.html">休闲裤</a></li>
														<li><a href="products.html">Grinder</a></li>
														<li><a href="products.html">Blenders & Choppers</a></li>
														<li><a href="products.html">Microwave Oven</a></li>
														<li><a href="products.html">Food Processors</a></li>
													</ul>
												</li>
												<li><a href="products.html">Purifiers</a></li>
												<li><a href="products.html">Geysers</a></li>
												<li><a href="products.html">Gas Stove</a></li>
												<li><a href="products.html">Vacuum Cleaner</a></li>
												<li><a href="products.html">Sewing Machine</a></li> 
												<li><a href="products.html">Heaters & Fans</a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">男鞋</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#0">All Electronics </a></li>
												<li><a href="products.html">Wifi Dongle</a></li>
												<li><a href="products.html">Router & Modem</a></li>
												<li class="has-children"><a href="#">Storage Devices</a>
													<ul class="is-hidden">
														<li class="go-back"><a href="#0"> </a></li>
														<li><a href="products.html">Cloud Storage</a></li>
														<li><a href="products.html">Hard Disk</a></li>
														<li><a href="products.html">SSD</a></li>
														<li><a href="products.html">Pen Drive</a></li>
														<li><a href="products.html">Memory card</a></li> 
														<li><a href="products.html">Security Devices</a></li> 
													</ul>
												</li> 
												<li><a href="products.html">Office Supplies</a></li>
												<li><a href="products.html">Cut the Cable</a></li>
												<li><a href="products.html">Auto Electronics</a></li>  
											</ul>
										</li>
										<li class="has-children">
											<a href="#">女鞋</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#0">All Electronics </a></li>
												<li><a href="products.html">Epilator</a></li> 
												<li><a href="products.html">Hair Styler</a></li>
												<li><a href="products.html">Trimmer & Shaver</a></li>
												<li><a href="products.html">Health Care</a></li> 
												<li><a href="products.html">cables</a></li>
											</ul>
										</li>
									</ul> <!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children -->
								<li class="has-children">
									<a href="#">食品</a> 
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products1.html">所有食品</a></li>
										<li class="has-children">
											<a href="#">零食</a> 
											<ul class="is-hidden">  
												<li class="go-back"><a href="#">All Fashion Stores</a></li>
												<li><a href="products1.html">Ethnic wear </a></li>
												<li><a href="products1.html">Maternity wear</a></li>
												<li><a href="products1.html">inner & nightwear </a></li>
												<li><a href="products1.html">casual wear </a></li>
												<li><a href="products1.html">formal wear</a></li>
												<li><a href="products1.html">Sports wear</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">酒水</a> 
											<ul class="is-hidden">  
												<li class="go-back"><a href="#">All Fashion Stores</a></li>
												<li><a href="products1.html">Jeans</a></li>  
												<li><a href="products1.html">Casual wear</a></li> 
												<li><a href="products1.html">Shorts</a></li> 
												<li><a href="products1.html">T-Shirts & Polos</a></li> 
												<li><a href="products1.html">Trousers & Chinos</a></li> 
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">水果</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#">All Fashion Stores</a></li>
												<li><a href="products1.html">Blazers</a></li>
												<li><a href="products1.html">Bomber jackets</a></li>
												<li><a href="products1.html">Denim Jackets</a></li>
												<li><a href="products1.html">Duffle Coats</a></li>
												<li><a href="products1.html">Leather Jackets</a></li>
												<li><a href="products1.html">Parkas</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">蔬菜</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Fashion Stores</a></li>
												<li><a href="products1.html">Watches </a></li>
												<li><a href="products1.html">Eyewear </a></li>
												<li><a href="products1.html">Jewellery </a></li>
												<li class="has-children">
													<a href="#">Footwear </a>  
													<ul class="is-hidden">
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="products1.html">Ethnic</a></li>  
														<li><a href="products1.html">Casual wear</a></li>
														<li><a href="products1.html">Sports Shoes</a></li>
														<li><a href="products1.html">Boots</a></li>
													</ul> 
												</li> 
												<li><a href="products1.html">Stoles & Scarves</a></li>
												<li><a href="products1.html">Handbags</a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">粮油</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#">所有食品</a></li>
												<li><a href="products1.html">Perfumes & Deos</a></li>
												<li><a href="products1.html">Lipsticks & Nail Polish</a></li>
												<li><a href="products1.html">Beauty Gift Hampers</a></li> 
												<li><a href="products1.html">Personal Grooming</a></li>
												<li><a href="products1.html">Travel bags</a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="products1.html">生鲜食品</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">所有食品</a></li>
												<li><a href="products1.html">Face Care</a></li>
												<li><a href="products1.html">Nail Care</a></li>
												<li><a href="products1.html">Hair Care</a></li>
												<li><a href="products1.html">Body Care</a></li>
												<li><a href="products1.html">Bath & Spa</a></li>   
											</ul>
										</li>
									</ul> <!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children -->
								<li class="has-children">
									<a href="products2.html">Kids Fashion & Toys</a> 
									<ul class="cd-secondary-dropdown is-hidden"> 
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products2.html">All Kids Fashions</a></li>
										<li class="has-children">
											<a href="products2.html">KIDS CLOTHING</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Kids Fashions</a></li>
												<li><a href="products2.html">Ethnic wear </a></li> 
												<li><a href="products2.html">inner & Sleepwear </a></li>
												<li><a href="products2.html">Dresses & Frocks </a></li>
												<li><a href="products2.html">Winter wear</a></li>
												<li><a href="products2.html">Diaper & Accessories</a></li>
											</ul>
										</li> 
										<li class="has-children"><a href="#">KIDS FASHION</a>
											<ul class="is-hidden">  
												<li class="go-back"><a href="#">All Kids Fashions</a></li>
												<li><a href="products2.html">Footwear</a></li> 
												<li><a href="products2.html">Sunglasses </a></li>
												<li><a href="products2.html">School & Stationery</a></li>
												<li><a href="products2.html">Jewellery</a></li>
												<li><a href="products2.html">Hair bands & Clips</a></li>
											</ul>
										</li>
										<li class="has-children"><a href="#">Baby Care</a>
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Kids Fashions</a></li>
												<li><a href="products2.html">Lotions, Oil & Powder </a></li> 
												<li><a href="products2.html">Soaps, Shampoo </a></li>
												<li><a href="products2.html">Bath Towels</a></li> 
												<li class="has-children">
													<a href="#">Feeding</a> 
													<ul class="is-hidden">
														<li class="go-back"><a href="#"> </a></li> 
														<li><a href="products2.html">Baby Food </a></li>
														<li><a href="products2.html">Bottle Feeding </a></li>
														<li><a href="products2.html">Breast Feeding</a></li>  
													</ul>
												</li>  
												<li><a href="products2.html">Toddlers' Rooms</a></li> 	
											</ul><!-- .cd-secondary-dropdown --> 
										</li> <!-- .has-children -->								
										<li class="has-children"><a href="#">TOYS & GAMES </a>
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#">All Kids Fashions</a></li>
												<li><a href="products2.html">Art & Crafts</a></li> 
												<li><a href="products2.html">Educational Toys </a></li>
												<li><a href="products2.html">Baby Toys</a></li> 
												<li><a href="products2.html">Outdoor Play </a></li> 
												<li><a href="products2.html">Musical Instruments</a></li>
											</ul>
										</li>
										<li> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#">All Kids Fashions</a></li>
												<li><a href="products2.html">Toy Tips & Trends</a></li> 
												<li><a href="products2.html">Preschool Toys</a></li>
												<li><a href="products2.html">Musical Instruments</a></li> 
												<li><a href="products2.html">Bikes & Ride-Ons</a></li>
												<li><a href="products2.html">Video Games</a></li>
												<li><a href="products2.html">PC & Digital Gaming</a></li>
											</ul>	
										</li> 
									</ul><!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children --> 
								<li class="has-children">
									<a href="#">Home, Furniture & Patio</a> 
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products3.html">All Products</a></li>
										<li class="has-children">
											<a href="#">Kitchen Uses</a> 
											<ul class="is-hidden">  
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products3.html">Dinner Sets </a></li> 
												<li><a href="products3.html">Cookware & Bakeware </a></li>
												<li><a href="products3.html">Containers & Jars </a></li>
												<li><a href="products3.html">Kitchen Tools </a></li>
												<li><a href="products3.html">Food Storage</a></li>
												<li><a href="products3.html">Casseroles</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Furniture </a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products3.html">Bedroom </a></li> 
												<li><a href="products3.html">Dining Room </a></li>
												<li><a href="products3.html">Kids' Furniture </a></li>
												<li><a href="products3.html">Living Room</a></li>
												<li><a href="products3.html">Office</a></li>
												<li><a href="products3.html">Mattresses</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Home Decor </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products3.html">Lighting</a></li> 
												<li><a href="products3.html">Painting</a></li>
												<li><a href="products3.html">Curtains & Blinds</a></li>
												<li><a href="products3.html">Patio Furniture</a></li>
												<li><a href="products3.html">Wardrobes & Cabinets</a></li>
												<li><a href="products3.html">Mattresses</a></li>
											</ul>
										</li>  
										<li class="has-children">
											<a href="#">Gardening & Lawn </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"> </a></li>  
												<li><a href="products3.html">Gardening </a></li> 
												<li><a href="products3.html">Landscaping </a></li>
												<li><a href="products3.html">Sheds</a></li>
												<li><a href="products3.html">Outdoor Storage  </a></li>
												<li><a href="products3.html">Garden & Ideas </a></li>
												<li><a href="products3.html">Patio Tips</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Garage Storage</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products3.html">Baskets & Bins </a></li> 
												<li><a href="products3.html">Garage Door Openers</a></li>
												<li><a href="products3.html">Free Standing Shelves </a></li>
												<li><a href="products3.html">Floor cleaning</a></li>
												<li><a href="products3.html">Tool Kits</a></li>
											</ul>
										</li>  
									</ul><!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children -->  
								<li class="has-children">
									<a href="#">Sports, Fitness & Outdoor</a>
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products4.html">All Products</a></li>
										<li class="has-children">
											<a href="#">Single Sports </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products4.html">Bikes </a></li> 
												<li><a href="products4.html">Fishing  </a></li>
												<li><a href="products4.html">Cycling </a></li>
												<li><a href="products4.html">Musical Instruments</a></li>
												<li><a href="products4.html">Archery </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Team Sports</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products4.html">Cricket </a></li> 
												<li><a href="products4.html">Badminton </a></li>
												<li><a href="products4.html">Swimming Gear </a></li>
												<li><a href="products4.html">Sports Apparel </a></li>
												<li><a href="products4.html">Indoor games</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Fitness </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products4.html">Fitness Accessories </a></li> 
												<li><a href="products4.html">Exercise Machines </a></li>
												<li><a href="products4.html">Ellipticals </a></li>
												<li><a href="products4.html">Home Gyms</a></li> 
												<li><a href="products4.html">Exercise Bikes</a></li> 
											</ul>
										</li>
										<li class="has-children">
											<a href="#">Camping </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products4.html"> Airbeds</a></li> 
												<li><a href="products4.html">Tents </a></li>
												<li><a href="products4.html">Gazebo's & Shelters</a></li>
												<li><a href="products4.html">Coolers </a></li>
												<li><a href="products4.html">Canopies</a></li>
												<li><a href="products4.html">Sleeping Bags</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Camping Tools</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products4.html">Shooting </a></li> 
												<li><a href="products4.html">Knives & Tools </a></li>
												<li><a href="products4.html">Optics & Binoculars </a></li>
												<li><a href="products4.html">Lights & Lanterns </a></li>
												<li><a href="products4.html">Hunting Clothing </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Other</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products4.html">Riding Gears & More </a></li> 
												<li><a href="products4.html">Body Massagers </a></li>
												<li><a href="products4.html">Health Monitors </a></li>
												<li><a href="products4.html">Health Drinks </a></li> 
											</ul>
										</li> 	
									</ul><!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children -->  
								<li class="has-children">
									<a href="#">Grocery store</a>
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products5.html">All Products</a></li>
										<li class="has-children">
											<a href="#">Veggies & Fruits </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products5.html">Vegetables </a></li> 
												<li><a href="products5.html">Fruits </a></li>
												<li><a href="products5.html">Dry Fruits</a></li> 
												<li><a href="products5.html">Snacks & Cookies </a></li>
												<li><a href="products5.html">Breakfast & Cereal</a></li> 
											</ul> 
										</li> 
										<li class="has-children">
											<a href="#">Packet Food</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products5.html">Beverages </a></li> 
												<li><a href="products5.html">Baking </a></li>
												<li><a href="products5.html">Emergency Food </a></li>
												<li><a href="products5.html">Candy & Gum </a></li>
												<li><a href="products5.html">Meals & Pasta </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Shop All Pets </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products5.html">Dogs </a></li>  
												<li><a href="products5.html">Fish </a></li>												
												<li><a href="products5.html">Cats</a></li>
												<li><a href="products5.html">Birds </a></li>
												<li><a href="products5.html">Pet Food </a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">Household Essentials </a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products5.html">Laundry Room </a></li> 
												<li><a href="products5.html">Paper & Plastic</a></li>
												<li><a href="products5.html">Pest Control </a></li>
												<li><a href="products5.html">Batteries </a></li> 
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Food Shops </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products5.html">Fresh Food</a></li> 
												<li><a href="products5.html">Food Gifts </a></li>
												<li><a href="products5.html">Frozen Food </a></li>
												<li><a href="products5.html">Organic </a></li>
												<li><a href="products5.html">Gluten Free </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Tips </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products5.html">Pets Growth</a></li> 
												<li><a href="products5.html">Recipes </a></li>
												<li><a href="products5.html">Snacks</a></li>
												<li><a href="products5.html">Nutrition</a></li> 
											</ul>
										</li> 
									</ul><!-- .cd-secondary-dropdown --> 
								</li> <!-- .has-children -->  
								<li class="has-children">
									<a href="#">Photo, Gifts & Office Supplies</a>
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products6.html">All Products</a></li>
										<li class="has-children">
											<a href="#">Trending Now </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products6.html">Best Priced</a></li> 
												<li><a href="products6.html">Chocolates </a></li>
												<li><a href="products6.html">Gift Cards </a></li>
												<li><a href="products6.html">Fashion & Accessories </a></li>
												<li><a href="products6.html">Decorative Plants </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Photos </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products6.html">Shelf animation </a></li> 
												<li><a href="products6.html">3D-rendered </a></li>
												<li><a href="products6.html">gift builder </a></li>
												<li><a href="products6.html">Frames</a></li>
												<li><a href="products6.html">Wall Decor</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Gifts </a> 
											<ul class="is-hidden">	
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products6.html">Personalized Gifts </a></li> 
												<li><a href="products6.html">Flowers </a></li>
												<li><a href="products6.html">Cards & Toys</a></li>
												<li><a href="products6.html">Show pieces </a></li>
												<li><a href="products6.html">Photo Books</a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">Favourite Brands </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products6.html">Archies </a></li> 
												<li><a href="products6.html">Jewel Fuel </a></li>
												<li><a href="products6.html">Ferns N Petals </a></li>
												<li><a href="products6.html">Happily Unmarried</a></li>
												<li><a href="products6.html">Chumbak</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Office</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products6.html">Calendars</a></li> 
												<li><a href="products6.html">Mousepads</a></li>
												<li><a href="products6.html">Phone Cases</a></li>
												<li><a href="products6.html">Tablet & Laptop Cases</a></li>
												<li><a href="products6.html">Mounted Photos</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Combos </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products6.html">Chocolates </a></li> 
												<li><a href="products6.html">Dry Fruits</a></li>
												<li><a href="products6.html">Sweets</a></li>
												<li><a href="products6.html">Snacks</a></li>
												<li><a href="products6.html">Cakes</a></li>
											</ul>
										</li> 
									</ul><!-- .cd-secondary-dropdown --> 
								</li> 
								<li class="has-children">
									<a href="#">Health, Beauty & Pharmacy</a>
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products7.html">All Products</a></li>
										<li class="has-children">
											<a href="#">Health</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products7.html">Home Health Care </a></li> 
												<li><a href="products7.html">Sports Nutrition </a></li>
												<li><a href="products7.html">Vision </a></li>
												<li><a href="products7.html">Vitamins </a></li>
												<li><a href="products7.html">Diet & Nutrition </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Health Tips</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products7.html">Diet</a></li> 
												<li><a href="products7.html">Exercise Tips  </a></li>
												<li><a href="products7.html">Vitamin Balance</a></li>
												<li><a href="products7.html">Health Insurance</a></li>
												<li><a href="products7.html">Funeral</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Beauty </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products7.html">Massage & Spa </a></li> 
												<li><a href="products7.html">Face Wash</a></li>
												<li><a href="products7.html">Facial Cleanser</a></li>
												<li><a href="products7.html">Makeup </a></li>
												<li><a href="products7.html">Beauty Tips</a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">Pharmacy </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products7.html">Home Delivery </a></li> 
												<li><a href="products7.html">History & Reports </a></li>
												<li><a href="products7.html">Transfer Prescriptions </a></li>
												<li><a href="products7.html">Health CheckUp</a></li>
												<li><a href="products7.html">Mobile App</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Pharmacy Center </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products7.html">Diabetes Shop </a></li> 
												<li><a href="products7.html">Medicine Cabinet </a></li>
												<li><a href="products7.html">Vitamin Selector</a></li>
												<li><a href="products7.html">Pharmacy Help</a></li> 
											</ul>
										</li>  
									</ul><!-- .cd-secondary-dropdown --> 
								</li>
								<li class="has-children">
									<a href="#">Automotive</a>
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products8.html">All Products</a></li>
										<li class="has-children">
											<a href="#">All Motors </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products8.html">Bikes </a></li> 
												<li><a href="products8.html">Yachts </a></li>
												<li><a href="products8.html">Scooters </a></li>
												<li><a href="products8.html">Autos</a></li>
												<li><a href="products8.html">Bus</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Accessories </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products8.html">Vehicle Electronics</a></li> 
												<li><a href="products8.html">Stereos & Monitors</a></li>
												<li><a href="products8.html">Bluetooth Devices</a></li>
												<li><a href="products8.html">GPS Navigation</a></li>
												<li><a href="products8.html">Speakers & Tweeters</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Safety & Security </a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products8.html">Anti-Theft Devices </a></li> 
												<li><a href="products8.html">Helmets</a></li>
												<li><a href="products8.html">Sensors</a></li>
												<li><a href="products8.html">Auto Repair Tools </a></li>
												<li><a href="products8.html">Antifreeze & Coolants </a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">Car Interiors</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products8.html">Stereos </a></li> 
												<li><a href="products8.html">Floor Mats </a></li>
												<li><a href="products8.html">Seat Covers</a></li>
												<li><a href="products8.html">Chargers </a></li>
												<li><a href="products8.html">Audio Finder </a></li>
											</ul>
										</li>  
										<li class="has-children">
											<a href="#">Exterior Accessories </a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products8.html">Wheel covers </a></li> 
												<li><a href="products8.html">Car Lighting </a></li>
												<li><a href="products8.html">Polish & Waxes</a></li>
												<li><a href="products8.html">Cargo Management</a></li>
												<li><a href="products8.html">Car Decoration </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Car Care</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products8.html">Auto Tips & Advice </a></li> 
												<li><a href="products8.html">Car Washes & Cleaners </a></li>
												<li><a href="products8.html">Car Wax & Polish</a></li>
												<li><a href="products8.html">Cleaning Tools</a></li>
												<li><a href="products8.html">Detailing Kits </a></li>
											</ul>
										</li> 
									</ul><!-- .cd-secondary-dropdown --> 
								</li>
								<li class="has-children">
									<a href="#">Books, Music & Movies</a>
									<ul class="cd-secondary-dropdown is-hidden">
										<li class="go-back"><a href="#">Menu</a></li>
										<li class="see-all"><a href="products9.html">All Products</a></li>
										<li class="has-children">
											<a href="#">Books</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li class="has-children"><a href="#">Exam books </a>
													<ul class="is-hidden">
														<li class="go-back"><a href="#"> </a></li>
														<li><a href="products9.html">CAT/MAT/XAT</a></li>
														<li><a href="products9.html">Civil Services</a></li>
														<li><a href="products9.html">AFCAT</a></li>
														<li><a href="products9.html">New Releases</a></li>
													</ul>												
												</li>
												<li><a href="products9.html">Academic Text </a></li>
												<li><a href="products9.html">Romance Books </a></li>
												<li><a href="products9.html">Journals </a></li>
												<li><a href="products9.html">Children's & Teen Books </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Music</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products9.html">New Releases </a></li> 
												<li><a href="products9.html">Country Music </a></li>
												<li><a href="products9.html">Musical Instruments </a></li>
												<li><a href="products9.html">Collections</a></li>
												<li><a href="products9.html">Boxed Sets </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Music Combo</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products9.html">Pop </a></li> 
												<li><a href="products9.html">Preorders </a></li>
												<li><a href="products9.html">Album Songs</a></li>
												<li><a href="products9.html">Top 50 CDs </a></li>
												<li><a href="products9.html">Music DVDs </a></li>
											</ul>
										</li>
										<li class="has-children">
											<a href="#">Movies</a> 
											<ul class="is-hidden"> 
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products9.html">New Releases </a></li> 
												<li><a href="products9.html">Children & Family </a></li>
												<li><a href="products9.html">Action</a></li>
												<li><a href="products9.html">Classic Movies </a></li>
												<li><a href="products9.html">Bollywood Movies </a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">Movies Combo</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products9.html">Hollywood Movies </a></li> 
												<li><a href="products9.html">Digital Movies </a></li>
												<li><a href="products9.html">Boxed Sets</a></li>
												<li><a href="products9.html">Animated</a></li>
												<li><a href="products9.html">Adventure</a></li>
											</ul>
										</li> 
										<li class="has-children">
											<a href="#">TV Shows</a> 
											<ul class="is-hidden">
												<li class="go-back"><a href="#"></a></li>
												<li><a href="products9.html">Serials</a></li> 
												<li><a href="products9.html">Best Programs</a></li>
												<li><a href="products9.html">Celebrations</a></li>
												<li><a href="products9.html">Top Shows</a></li> 
											</ul>
										</li> 
									</ul><!-- .cd-secondary-dropdown --> 
								</li>  
								<li><a href="sitemap.html">Full Site Directory </a></li>  
							</ul> <!-- .cd-dropdown-content -->
						</nav> <!-- .cd-dropdown -->
					</div> <!-- .cd-dropdown-wrapper -->	 
				</div>
				<div class="move-text">
					
					<div class="marquee" id="abcd">
						<a href="#"><span> 商城全部商品空运免运费15天，活动正在进行中，快来剁手！！！</span></a>
						<a href="#"><span> 商城全部商品空运免运费15天，活动正在进行中，快来剁手！！！</span></a>
					</div>
					<script type="text/javascript" src="<%=basePath %>js/jquery.marquee.min.js"></script>
					<script >
					$(document).ready(function(){
						  $.ajax({
							type:"post",
							async:false,
							url:"<%=basePath%>bulletion/bulletionListByShop.do",
							dataType:"json",
							data:{
							
							},
							success:function(data){
								var dataObj=eval(data);
								for(var i=0;i<dataObj.length;i++){
									$("#abcd").append("<a href='"+dataObj[i].buShopId+"'><span>"+dataObj[i].buContent+"</span></a>");
								}
								
							},
							error:function(){
								alert("没有公告");
							}
					  });
					  $('.marquee').marquee({ pauseOnHover: true });
					});
					  //@ sourceURL=pen.js
					</script>
					<!-- 蓝色滚动js (放在这里的原因是要先等ajax同步加载玩数据库中公告信息再给样式)-->
					<script type="text/javascript" src="<%=basePath %>js/move-top.js"></script>
				</div>
			</div>
		</div>
		<!-- 蓝色菜单和滚动条结束 -->
	</div>
	<!-- 顶部head结束 -->	
	<!-- 页面主体banner -->
	<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			type:"post",
			async:false,
			url:"<%=basePath%>bulletion/bulletionListByMall.do",
			dataType:"json",
			data:{
			
			},
			success:function(data){
				var dataObj=eval(data);
				for(var i=0;i<dataObj.length;i++){
					var id = "bm"+dataObj[i].buId+"";
					$("#buMall").append("<div class='item'><img src='images/8.jpg' alt='' class='img-responsive' /><div  id='"+id+"' class='carousel-caption kb_caption kb_caption_right'></div></div>");
					$("#"+id).append("<h3 data-animation='animated fadeInDown'>"+dataObj[i].bulls[0]+"</h3>");
					for(var j=1;j<dataObj[i].count;j++){
						$("#"+id).append("<h4 data-animation='animated fadeInUp'>"+dataObj[i].bulls[j]+"</h4>");	
					}
					
				}
				
			},
			error:function(){
				alert("没有公告");
			}
	  });
	});
	</script>
	<div class="banner">
		<div id="kb" class="carousel kb_elastic animate_text kb_wrapper" data-ride="carousel" data-interval="6000" data-pause="hover">
			<!-- 滚动的广告 -->
            <div id="buMall" class="carousel-inner" role="listbox">  
                <div class="item active"><!-- 第一个广告 -->
                    <img src="images/5.jpg" alt="" class="img-responsive" />
                    <div class="carousel-caption kb_caption kb_caption_right">
                        <h3 data-animation="animated flipInX">全场最低<span>50%</span>折扣</h3>
                        <h4 data-animation="animated flipInX">只为您优选最好的商品！！</h4>
                        <h4 data-animation="animated flipInX">只为您提供最合适的价格！！</h4>
                    </div>
                </div>  
                

            </div> 
            <!-- 滚动的广告结束 -->
            <!-- 向左的按钮 -->
            <a class="left carousel-control kb_control_left" href="#kb" role="button" data-slide="prev">
				<span class="fa fa-angle-left kb_icons" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a> 
            <!-- 向右的按钮 -->
            <a class="right carousel-control kb_control_right" href="#kb" role="button" data-slide="next">
                <span class="fa fa-angle-right kb_icons" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a> 
        </div>
		<script src="js/custom.js"></script>
	</div>
	<!-- 页面主体banner结束 -->  
	<!-- 页面主体商品滚动展示 -->
	<div class="welcome"> 
		<div class="container"> 
			<div class="welcome-info">
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class=" nav-tabs" role="tablist">
						<li role="presentation"><a href="<%=basePath%>product/queryAll.do" id="home-tab" role="tab" >
							<i class="fa fa-laptop" aria-hidden="true"></i> 
							<h5>全部商品</h5>
						</a></li>
						<li role="presentation"><a href="#carl" role="tab" id="carl-tab" data-toggle="tab"> 
							<i class="fa fa-female" aria-hidden="true"></i>
							<h5>魅力时尚</h5>
						</a></li>
						<li role="presentation"><a href="#james" role="tab" id="james-tab" data-toggle="tab"> 
							<i class="fa fa-gift" aria-hidden="true"></i>
							<h5>精美礼品</h5>
						</a></li>
						<li role="presentation"><a href="#decor" role="tab" id="decor-tab" data-toggle="tab"> 
							<i class="fa fa-home" aria-hidden="true"></i>
							<h5>家居必备</h5>
						</a></li>
						<li role="presentation"><a href="#sports" role="tab" id="sports-tab" data-toggle="tab"> 
							<i class="fa fa-motorcycle" aria-hidden="true"></i>
							<h5>户外运动</h5>
						</a></li> 
					</ul>
					<div class="clearfix"> </div>
					<h3 class="w3ls-title"><span style="color: red;">特</span><span style="color:coral;">色</span><span style="color:forestgreen;">商</span><span style="color:dodgerblue;">品</span></h3>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
							<div class="tabcontent-grids">  
								<div id="owl-demo" class="owl-carousel"> 
									<c:forEach items="${generalList }" var="g" begin="0" end="6">
									<div class="item">
									
										<div class="glry-w3agile-grids agileits">
											<div class="new-tag">
											<c:if test="${g.product.pNew==1 }">
												<h6>NEW</h6>
											</c:if>
											<c:if test="${g.product.pNew==0 }">
												<h6><span id="oldDiscount"><fmt:formatNumber type="number" value="${g.product.pDiscount * 100 }" /></span><br>折</h6>
											</c:if>
											</div>
											<a href="products.html"><img src="<%=basePath %>fileUpload/${g.images.imAddress}" alt="img"></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="products.html">${g.product.pName }</a></h4>
												<p>${g.product.pContent }</p> 
												<h5>
													<c:if test="${g.product.pNew==0 }"> 
													$${g.product.pDiscount * g.productSpecs.psPrice }
													</c:if>
													<c:if test="${g.product.pNew==1 }">
													$${g.productSpecs.psPrice }
													</c:if>
												</h5>
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="${g.product.pName }" /> 
													<c:if test="${g.product.pNew==0 }"> 
													<input type="hidden" name="amount" value="${g.product.pDiscount * g.productSpecs.psPrice }" />
													</c:if>
													<c:if test="${g.product.pNew==1 }">
													<input type="hidden" name="amount" value="${g.productSpecs.psPrice }" />
													</c:if>
													<button type="submit" class="w3ls-cart " ><i class="fa fa-cart-plus" aria-hidden="true"></i>加入购物车</button>
												</form>
											</div>       
										</div>  
										
									</div>
									</c:forEach>
									
								</div> 
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="carl" aria-labelledby="carl-tab">
							<div class="tabcontent-grids">
								<script>
									$(document).ready(function() { 
										$("#owl-demo1").owlCarousel({
									 
										  autoPlay: 3000, //Set AutoPlay to 3 seconds
									 
										  items :4,
										  itemsDesktop : [640,5],
										  itemsDesktopSmall : [414,4],
										  navigation : true
									 
										});
										
									}); 
								</script>
								
									
								</div>    
							</div>
						</div> 
					</div>   
				</div>  
			</div>  	
		</div>  	
	 
	<!-- 页面主体商品滚动展示结束 -->
	<!-- 打折商品展示 -->
	<div class="add-products"> 
		<div class="container">  
			<div class="add-products-row">
				<div class="w3ls-add-grids">
					<a href="products1.html"> 
						<h4>前十名购买者！<span>20%</span>优惠！</h4>
						<h6>立即购买！<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h6>
					</a>
				</div>
				<div class="w3ls-add-grids w3ls-add-grids-mdl">
					<a href="products1.html"> 
						<h4>假日促销！！全部商品降价！ <span>40%</span>大促销！！</h4>
						<h6>立即购买！<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h6>
					</a>
				</div>
				<div class="w3ls-add-grids w3ls-add-grids-mdl1">
					<a href="products.html"> 
						<h4>最懂你的私人定制！！！<span> Come On !</span></h4>
						<h6>立即购买！<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h6>
					</a>
				</div>
				<div class="clerfix"> </div>
			</div>  	
		</div>  	
	</div>
	<!-- 打折商品展示结束 -->
	<!-- 活动通知 -->
	<div class="soon">
		<div class="container">
			<h3>商城活动周正在进行中！！！</h3>
			<h4>活动倒计时：</h4>  
			<div id="countdown1" class="ClassyCountdownDemo"></div>
		</div> 
	</div>
	<!-- 活动通知结束 -->
	<!-- 商品分类大图标-->
	<div class="deals"> 
	
		<div class="container"> 
			<h3 class="w3ls-title">商品分类</h3>
			<div class="deals-row">
			<c:forEach items="${generalList1 }" var="g" begin="0" end="3">
			
				<div class="col-md-3 focus-grid"> 
					<a href="<%=basePath %>product/typeSelect.do?id=${g.productType.ptId }" class="${g.color }"> 
						<div class="focus-image">
							<i class="fa fa-${g.pic }"></i>
						</div>
						<h4 class="clrchg">${g.productType.ptName }</h4> 
					</a>
				</div>
			</c:forEach>
			<c:forEach items="${generalList1 }" var="g" begin="4" end="9"> 
			<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="products9.html" class="${g.color }"> 
						<div class="focus-image"><i class="fa fa-${g.pic }"></i></div>
						<h4 class="clrchg">${g.productType.ptName }</h4> 
					</a>
				</div>
			</c:forEach>
			<c:forEach items="${generalList1 }" var="g" begin="10" end="13"> 
				<div class="col-md-3 focus-grid"> 
					<a href="products.html" class="${g.color }"> 
						<div class="focus-image">
							<i class="fa fa-${g.pic }"></i>
						</div>
						<h4 class="clrchg">${g.productType.ptName }</h4> 
					</a>
				</div>
			</c:forEach>
			
				 <div class="col-md-3 focus-grid">
					<a href="products.html" class="wthree-btn wthree1"> 
						<div class="focus-image"><i class="fa fa-laptop"></i></div>
						<h4 class="clrchg">电子数码</h4> 
					</a>
				</div>
	<!--<div class="col-md-3 focus-grid">
					<a href="products4.html" class="wthree-btn wthree2"> 
						<div class="focus-image"><i class="fa fa-wheelchair"></i></div>
						<h4 class="clrchg">器材用品</h4>
					</a>
				</div> 
				<div class="col-md-3 focus-grid"> 
					<a href="products3.html" class="wthree-btn wthree3"> 
						<div class="focus-image"><i class="fa fa-home"></i></div>
						<h4 class="clrchg">家居用品</h4>
					</a>
				</div> 
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="products9.html" class="wthree-btn wthree3"> 
						<div class="focus-image"><i class="fa fa-book"></i></div>
						<h4 class="clrchg">图书</h4> 
					</a>
				</div>
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="products1.html" class="wthree-btn wthree4"> 
						<div class="focus-image"><i class="fa fa-asterisk"></i></div>
						<h4 class="clrchg">时尚</h4>
					</a>
				</div>
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="products2.html" class="wthree-btn wthree2"> 
						<div class="focus-image"><i class="fa fa-gamepad"></i></div>
						<h4 class="clrchg">游戏周边</h4>
					</a>
				</div> 
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="products5.html" class="wthree-btn wthree"> 
						<div class="focus-image"><i class="fa fa-shopping-basket"></i></div>
						<h4 class="clrchg">超级市场</h4>
					</a>
				</div> 
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="products7.html" class="wthree-btn wthree5"> 
						<div class="focus-image"><i class="fa fa-medkit"></i></div>
						<h4 class="clrchg">医疗药品</h4> 
					</a>
				</div> 
				<div class="col-md-2 focus-grid w3focus-grid-mdl"> 
					<a href="products8.html" class="wthree-btn wthree1"> 
						<div class="focus-image"><i class="fa fa-car"></i></div>
						<h4 class="clrchg">交通出行</h4> 
					</a>
				</div>
				<div class="col-md-3 focus-grid"> 
					<a href="products5.html" class="wthree-btn wthree2"> 
						<div class="focus-image"><i class="fa fa-cutlery"></i></div>
						<h4 class="clrchg">美食</h4> 
					</a>
				</div>
				<div class="col-md-3 focus-grid"> 
					<a href="products4.html" class="wthree-btn wthree5"> 
						<div class="focus-image"><i class="fa fa-futbol-o"></i></div>
						<h4 class="clrchg">户外运动</h4> 
					</a>
				</div> 
				<div class="col-md-3 focus-grid"> 
					<a href="products2.html" class="wthree-btn wthree3"> 
						<div class="focus-image"><i class="fa fa-github-alt"></i></div>
						<h4 class="clrchg">儿童玩具</h4> 
					</a>
				</div> 
				<div class="col-md-3 focus-grid"> 
					<a href="products6.html" class="wthree-btn "> 
						<div class="focus-image"><i class="fa fa-gift"></i></div>
						<h4 class="clrchg">礼品</h4> 
					</a>
				</div>  -->
				<div class="clearfix"> </div>
			</div>  	
		</div>  	
	</div> 
	<!-- 商品分类大图标结束 --> 
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
			<p>Copyright &copy; 2016.实训第二组  All rights reserved.</p>
		</div>
	</div>
	<!-- 底部结尾结束 -->
	<!-- 购物车-js -->
	<script src="js/minicart.js"></script>
	<script>
        w3ls.render();

        w3ls.cart.on('w3sb_checkout', function (evt) {
        	var items, len, i;

        	if (this.subtotal() > 0) {
        		items = this.items();

        		for (i = 0, len = items.length; i < len; i++) {
        			items[i].set('shipping', 0);
        			items[i].set('shipping2', 0);
        		}
        	}
        });
    </script>  
	<!-- 购物车-js-结束 -->	
	<!-- 时间计数.js -->	
	<script src="<%=basePath %>js/jquery.knob.js"></script>
	<script src="<%=basePath %>js/jquery.throttle.js"></script>
	<script src="<%=basePath %>js/jquery.classycountdown.js"></script>
		<script>
			$(document).ready(function() {
				$('#countdown1').ClassyCountdown({
					end: '1388268325',
					now: '1387999995',
					labels: true,
					style: {
						element: "",
						textResponsive: .5,
						days: {
							gauge: {
								thickness: .10,
								bgColor: "rgba(0,0,0,0)",
								fgColor: "#1abc9c",
								lineCap: 'round'
							},
							textCSS: 'font-weight:300; color:#fff;'
						},
						hours: {
							gauge: {
								thickness: .10,
								bgColor: "rgba(0,0,0,0)",
								fgColor: "#05BEF6",
								lineCap: 'round'
							},
							textCSS: ' font-weight:300; color:#fff;'
						},
						minutes: {
							gauge: {
								thickness: .10,
								bgColor: "rgba(0,0,0,0)",
								fgColor: "#8e44ad",
								lineCap: 'round'
							},
							textCSS: ' font-weight:300; color:#fff;'
						},
						seconds: {
							gauge: {
								thickness: .10,
								bgColor: "rgba(0,0,0,0)",
								fgColor: "#f39c12",
								lineCap: 'round'
							},
							textCSS: ' font-weight:300; color:#fff;'
						}

					},
					onEndCallback: function() {
						console.log("活动结束！！!");
					}
				});
			});
		</script>
	<!-- 时间计数.js-结束 -->
	<!-- 菜单 js  -->
	<script src="<%=basePath %>js/jquery.menu-aim.js"> </script>
	<script src="<%=basePath %>js/main.js"></script> <!-- Resource jQuery -->
	<!-- 菜单 js 结束 --> 
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster --> 
</body>
</html>