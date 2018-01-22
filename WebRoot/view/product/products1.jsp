<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>产品展示页面1</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	<script type="application/x-javascript">
		 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); }
	 </script>
	<!-- Custom Theme files -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" /> 
	<link href="css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style -->  
	<link href="css/animate.min.css" rel="stylesheet" type="text/css" media="all" />   
	<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all"> <!-- carousel slider -->  
	<!-- //Custom Theme files -->
	<!-- font-awesome icons -->
	<link href="css/font-awesome.css" rel="stylesheet"> 
	<!-- //font-awesome icons -->
	<!-- js -->
	<script src="js/jquery-2.2.3.min.js"></script> 
	<script src="js/owl.carousel.js"></script>
	<!-- //js --> 
	<!-- web-fonts -->
	<!-- <link href='http://fonts.useso.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.useso.com/css?family=Lovers+Quarrel' rel='stylesheet' type='text/css'>
	<link href='http://fonts.useso.com/css?family=Offside' rel='stylesheet' type='text/css'>
	<link href='http://fonts.useso.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'> -->
	<!-- web-fonts --> 
	<!-- scroll to fixed--> 
	<script src="js/jquery-scrolltofixed-min.js" type="text/javascript"></script>
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
<!-- //scroll to fixed-->
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- //end-smooth-scrolling -->
<!-- smooth-scrolling-of-move-up -->
<script type="text/javascript">
	$(document).ready(function() {

		var defaults = {
			containerID : 'toTop', // fading element id
			containerHoverID : 'toTopHover', // fading element hover id
			scrollSpeed : 1200,
			easingType : 'linear'
		};

		$().UItoTop({
			easingType : 'easeOutQuart'
		});

	});
</script>
<!-- //smooth-scrolling-of-move-up -->
<!-- the jScrollPane script -->
<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" id="sourcecode">
	$(function() {
		$('.scroll-pane').jScrollPane();
	});
</script>
<!-- //the jScrollPane script -->
<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
</head>

<body>
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
						<a href="index.html"><span>S</span>mart <i>Bazaar</i> </a>
					</h1>
					<h6>Your stores. Your place.</h6>
				</div>
				<div class="container">
					<div class="header-search">
						<form action="<%=basePath %>product/getAllProductByPage.do" method="post">
							<input type="search" name="Search" placeholder="搜索商品" required="" >
							<button type="submit" class="btn btn-default"
								aria-label="Left Align">
								<i class="fa fa-search" aria-hidden="true">搜索</i>
							</button>
						</form>
					</div>
					<div class="header-cart">
						<div class="my-account">
							<a href="contact.html"><i class="fa fa-map-marker"
								aria-hidden="true"></i> 联系我们</a>
						</div>
						<div class="cart">
							<form action="#" method="post" class="last">
								<input type="hidden" name="cmd" value="_cart" /> <input
									type="hidden" name="display" value="1" />
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
						<ul class="cd-dropdown-content">
							<li><a href="offers.html">今日提供</a>
							</li>
							<li class="has-children"><a href="#">数码产品</a>
								<ul class="cd-secondary-dropdown is-hidden">
									<li class="go-back"><a href="#">菜单</a>
									</li>
									<li class="see-all"><a href="products.html">所有的电子产品</a>
									</li>
									<li class="has-children"><a href="#">手机</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Electronics</a>
											</li>
											<li class="has-children"><a href="#0">SmartPhones</a>
												<ul class="is-hidden">
													<li class="go-back"><a href="#"> </a>
													</li>
													<li><a href="products.html">Android</a>
													</li>
													<li><a href="products.html">Windows</a>
													</li>
													<li><a href="products.html">Black berry</a>
													</li>
												</ul></li>
											<li><a href="products.html">IPhones</a></li>
											<li><a href="products.html">Tablets</a>
											</li>
											<li><a href="products.html">IPad</a>
											</li>
											<li><a href="products.html">Feature Phones</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">LARGE APPLIANCES</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Electronics </a>
											</li>
											<li><a href="products.html">Refrigerators</a>
											</li>
											<li><a href="products.html">Washing Machine</a>
											</li>
											<li><a href="products.html">Office Technology</a>
											</li>
											<li><a href="products.html">Air conditioner</a>
											</li>
											<li><a href="products.html">Home Automation</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">ENTERTAINMENT</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Electronics</a>
											</li>
											<li><a href="products.html">Tv & Accessories</a>
											</li>
											<li><a href="products.html">Digital Camera</a>
											</li>
											<li><a href="products.html">Gaming</a>
											</li>
											<li><a href="products.html">Home Audio & Theater</a>
											</li>
											<li class="has-children"><a href="#">Computer</a>
												<ul class="is-hidden">
													<li class="go-back"><a href="#"> </a>
													</li>
													<li><a href="products.html">Laptop </a>
													</li>
													<li><a href="products.html">Gaming PC</a>
													</li>
													<li><a href="products.html">Monitors</a>
													</li>
													<li><a href="products.html">Networking</a>
													</li>
													<li><a href="products.html">Printers & Supplies</a>
													</li>
													<li><a href="products.html">Accessories</a>
													</li>
												</ul></li>
										</ul></li>
									<li class="has-children"><a href="#">HOME APPLIANCES</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#0">All Electronics </a>
											</li>
											<li class="has-children"><a href="#">Kitchen
													appliances</a>
												<ul class="is-hidden">
													<li class="go-back"><a href="#0"> </a>
													</li>
													<li><a href="products.html">Rice Cookers</a>
													</li>
													<li><a href="products.html">Mixer Juicer</a>
													</li>
													<li><a href="products.html">Grinder</a>
													</li>
													<li><a href="products.html">Blenders & Choppers</a>
													</li>
													<li><a href="products.html">Microwave Oven</a>
													</li>
													<li><a href="products.html">Food Processors</a>
													</li>
												</ul></li>
											<li><a href="products.html">Purifiers</a>
											</li>
											<li><a href="products.html">Geysers</a>
											</li>
											<li><a href="products.html">Gas Stove</a>
											</li>
											<li><a href="products.html">Vacuum Cleaner</a>
											</li>
											<li><a href="products.html">Sewing Machine</a>
											</li>
											<li><a href="products.html">Heaters & Fans</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">SMALL DEVICES</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#0">All Electronics </a>
											</li>
											<li><a href="products.html">Wifi Dongle</a>
											</li>
											<li><a href="products.html">Router & Modem</a>
											</li>
											<li class="has-children"><a href="#">Storage Devices</a>
												<ul class="is-hidden">
													<li class="go-back"><a href="#0"> </a>
													</li>
													<li><a href="products.html">Cloud Storage</a>
													</li>
													<li><a href="products.html">Hard Disk</a>
													</li>
													<li><a href="products.html">SSD</a>
													</li>
													<li><a href="products.html">Pen Drive</a>
													</li>
													<li><a href="products.html">Memory card</a>
													</li>
													<li><a href="products.html">Security Devices</a>
													</li>
												</ul></li>
											<li><a href="products.html">Office Supplies</a>
											</li>
											<li><a href="products.html">Cut the Cable</a>
											</li>
											<li><a href="products.html">Auto Electronics</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">PERSONAL CARE</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#0">All Electronics </a>
											</li>
											<li><a href="products.html">Epilator</a>
											</li>
											<li><a href="products.html">Hair Styler</a>
											</li>
											<li><a href="products.html">Trimmer & Shaver</a>
											</li>
											<li><a href="products.html">Health Care</a>
											</li>
											<li><a href="products.html">cables</a>
											</li>
										</ul></li>
								</ul> <!-- .cd-secondary-dropdown --></li>
							<!-- .has-children -->
							<li class="has-children"><a href="#">时装店</a>
								<ul class="cd-secondary-dropdown is-hidden">
									<li class="go-back"><a href="#">Menu</a>
									</li>
									<li class="see-all"><a href="products1.html">All
											Fashion Stores</a>
									</li>
									<li class="has-children"><a href="#">GIRLS' CLOTHING</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Fashion Stores</a>
											</li>
											<li><a href="products1.html">Ethnic wear </a>
											</li>
											<li><a href="products1.html">Maternity wear</a>
											</li>
											<li><a href="products1.html">inner & nightwear </a>
											</li>
											<li><a href="products1.html">casual wear </a>
											</li>
											<li><a href="products1.html">formal wear</a>
											</li>
											<li><a href="products1.html">Sports wear</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">BOYS' CLOTHING</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Fashion Stores</a>
											</li>
											<li><a href="products1.html">Jeans</a>
											</li>
											<li><a href="products1.html">Casual wear</a>
											</li>
											<li><a href="products1.html">Shorts</a>
											</li>
											<li><a href="products1.html">T-Shirts & Polos</a>
											</li>
											<li><a href="products1.html">Trousers & Chinos</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">JACKETS</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Fashion Stores</a>
											</li>
											<li><a href="products1.html">Blazers</a>
											</li>
											<li><a href="products1.html">Bomber jackets</a>
											</li>
											<li><a href="products1.html">Denim Jackets</a>
											</li>
											<li><a href="products1.html">Duffle Coats</a>
											</li>
											<li><a href="products1.html">Leather Jackets</a>
											</li>
											<li><a href="products1.html">Parkas</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">ACCESSORIES </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Fashion Stores</a>
											</li>
											<li><a href="products1.html">Watches </a>
											</li>
											<li><a href="products1.html">Eyewear </a>
											</li>
											<li><a href="products1.html">Jewellery </a>
											</li>
											<li class="has-children"><a href="#">Footwear </a>
												<ul class="is-hidden">
													<li class="go-back"><a href="#"> </a>
													</li>
													<li><a href="products1.html">Ethnic</a>
													</li>
													<li><a href="products1.html">Casual wear</a>
													</li>
													<li><a href="products1.html">Sports Shoes</a>
													</li>
													<li><a href="products1.html">Boots</a>
													</li>
												</ul></li>
											<li><a href="products1.html">Stoles & Scarves</a>
											</li>
											<li><a href="products1.html">Handbags</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">BEAUTY</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Fashion Stores</a>
											</li>
											<li><a href="products1.html">Perfumes & Deos</a>
											</li>
											<li><a href="products1.html">Lipsticks & Nail Polish</a>
											</li>
											<li><a href="products1.html">Beauty Gift Hampers</a>
											</li>
											<li><a href="products1.html">Personal Grooming</a>
											</li>
											<li><a href="products1.html">Travel bags</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="products1.html">PERSONAL
											CARE</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Fashion Stores</a>
											</li>
											<li><a href="products1.html">Face Care</a>
											</li>
											<li><a href="products1.html">Nail Care</a>
											</li>
											<li><a href="products1.html">Hair Care</a>
											</li>
											<li><a href="products1.html">Body Care</a>
											</li>
											<li><a href="products1.html">Bath & Spa</a>
											</li>
										</ul></li>
								</ul> <!-- .cd-secondary-dropdown --></li>
							<!-- .has-children -->
							<li class="has-children"><a href="products2.html">儿童时尚与玩具</a>
								<ul class="cd-secondary-dropdown is-hidden">
									<li class="go-back"><a href="#">Menu</a>
									</li>
									<li class="see-all"><a href="products2.html">All Kids
											Fashions</a>
									</li>
									<li class="has-children"><a href="products2.html">KIDS
											CLOTHING</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Kids Fashions</a>
											</li>
											<li><a href="products2.html">Ethnic wear </a>
											</li>
											<li><a href="products2.html">inner & Sleepwear </a>
											</li>
											<li><a href="products2.html">Dresses & Frocks </a>
											</li>
											<li><a href="products2.html">Winter wear</a>
											</li>
											<li><a href="products2.html">Diaper & Accessories</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">KIDS FASHION</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Kids Fashions</a>
											</li>
											<li><a href="products2.html">Footwear</a>
											</li>
											<li><a href="products2.html">Sunglasses </a>
											</li>
											<li><a href="products2.html">School & Stationery</a>
											</li>
											<li><a href="products2.html">Jewellery</a>
											</li>
											<li><a href="products2.html">Hair bands & Clips</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Baby Care</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Kids Fashions</a>
											</li>
											<li><a href="products2.html">Lotions, Oil & Powder </a>
											</li>
											<li><a href="products2.html">Soaps, Shampoo </a>
											</li>
											<li><a href="products2.html">Bath Towels</a>
											</li>
											<li class="has-children"><a href="#">Feeding</a>
												<ul class="is-hidden">
													<li class="go-back"><a href="#"> </a>
													</li>
													<li><a href="products2.html">Baby Food </a>
													</li>
													<li><a href="products2.html">Bottle Feeding </a>
													</li>
													<li><a href="products2.html">Breast Feeding</a>
													</li>
												</ul></li>
											<li><a href="products2.html">Toddlers' Rooms</a>
											</li>
										</ul>
										<!-- .cd-secondary-dropdown --></li>
									<!-- .has-children -->
									<li class="has-children"><a href="#">TOYS & GAMES </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Kids Fashions</a>
											</li>
											<li><a href="products2.html">Art & Crafts</a>
											</li>
											<li><a href="products2.html">Educational Toys </a>
											</li>
											<li><a href="products2.html">Baby Toys</a>
											</li>
											<li><a href="products2.html">Outdoor Play </a>
											</li>
											<li><a href="products2.html">Musical Instruments</a>
											</li>
										</ul></li>
									<li>
										<ul class="is-hidden">
											<li class="go-back"><a href="#">All Kids Fashions</a>
											</li>
											<li><a href="products2.html">Toy Tips & Trends</a>
											</li>
											<li><a href="products2.html">Preschool Toys</a>
											</li>
											<li><a href="products2.html">Musical Instruments</a>
											</li>
											<li><a href="products2.html">Bikes & Ride-Ons</a>
											</li>
											<li><a href="products2.html">Video Games</a>
											</li>
											<li><a href="products2.html">PC & Digital Gaming</a>
											</li>
										</ul></li>
								</ul>
								<!-- .cd-secondary-dropdown --></li>
							<!-- .has-children -->
							<li class="has-children"><a href="#">家庭|家具|庭院</a>
								<ul class="cd-secondary-dropdown is-hidden">
									<li class="go-back"><a href="#">Menu</a>
									</li>
									<li class="see-all"><a href="products3.html">All
											Products</a>
									</li>
									<li class="has-children"><a href="#">Kitchen Uses</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products3.html">Dinner Sets </a>
											</li>
											<li><a href="products3.html">Cookware & Bakeware </a>
											</li>
											<li><a href="products3.html">Containers & Jars </a>
											</li>
											<li><a href="products3.html">Kitchen Tools </a>
											</li>
											<li><a href="products3.html">Food Storage</a>
											</li>
											<li><a href="products3.html">Casseroles</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Furniture </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products3.html">Bedroom </a>
											</li>
											<li><a href="products3.html">Dining Room </a>
											</li>
											<li><a href="products3.html">Kids' Furniture </a>
											</li>
											<li><a href="products3.html">Living Room</a>
											</li>
											<li><a href="products3.html">Office</a>
											</li>
											<li><a href="products3.html">Mattresses</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Home Decor </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products3.html">Lighting</a>
											</li>
											<li><a href="products3.html">Painting</a>
											</li>
											<li><a href="products3.html">Curtains & Blinds</a>
											</li>
											<li><a href="products3.html">Patio Furniture</a>
											</li>
											<li><a href="products3.html">Wardrobes & Cabinets</a>
											</li>
											<li><a href="products3.html">Mattresses</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Gardening & Lawn
									</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"> </a>
											</li>
											<li><a href="products3.html">Gardening </a>
											</li>
											<li><a href="products3.html">Landscaping </a>
											</li>
											<li><a href="products3.html">Sheds</a>
											</li>
											<li><a href="products3.html">Outdoor Storage </a>
											</li>
											<li><a href="products3.html">Garden & Ideas </a>
											</li>
											<li><a href="products3.html">Patio Tips</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Garage Storage</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products3.html">Baskets & Bins </a>
											</li>
											<li><a href="products3.html">Garage Door Openers</a>
											</li>
											<li><a href="products3.html">Free Standing Shelves </a>
											</li>
											<li><a href="products3.html">Floor cleaning</a>
											</li>
											<li><a href="products3.html">Tool Kits</a>
											</li>
										</ul></li>
								</ul>
								<!-- .cd-secondary-dropdown --></li>
							<!-- .has-children -->
							<li class="has-children"><a href="#">运动健身和户外</a>
								<ul class="cd-secondary-dropdown is-hidden">
									<li class="go-back"><a href="#">Menu</a>
									</li>
									<li class="see-all"><a href="products4.html">All
											Products</a>
									</li>
									<li class="has-children"><a href="#">Single Sports </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products4.html">Bikes </a>
											</li>
											<li><a href="products4.html">Fishing </a>
											</li>
											<li><a href="products4.html">Cycling </a>
											</li>
											<li><a href="products4.html">Musical Instruments</a>
											</li>
											<li><a href="products4.html">Archery </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Team Sports</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products4.html">Cricket </a>
											</li>
											<li><a href="products4.html">Badminton </a>
											</li>
											<li><a href="products4.html">Swimming Gear </a>
											</li>
											<li><a href="products4.html">Sports Apparel </a>
											</li>
											<li><a href="products4.html">Indoor games</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Fitness </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products4.html">Fitness Accessories </a>
											</li>
											<li><a href="products4.html">Exercise Machines </a>
											</li>
											<li><a href="products4.html">Ellipticals </a>
											</li>
											<li><a href="products4.html">Home Gyms</a>
											</li>
											<li><a href="products4.html">Exercise Bikes</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Camping </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products4.html"> Airbeds</a>
											</li>
											<li><a href="products4.html">Tents </a>
											</li>
											<li><a href="products4.html">Gazebo's & Shelters</a>
											</li>
											<li><a href="products4.html">Coolers </a>
											</li>
											<li><a href="products4.html">Canopies</a>
											</li>
											<li><a href="products4.html">Sleeping Bags</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Camping Tools</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products4.html">Shooting </a>
											</li>
											<li><a href="products4.html">Knives & Tools </a>
											</li>
											<li><a href="products4.html">Optics & Binoculars </a>
											</li>
											<li><a href="products4.html">Lights & Lanterns </a>
											</li>
											<li><a href="products4.html">Hunting Clothing </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Other</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products4.html">Riding Gears & More </a>
											</li>
											<li><a href="products4.html">Body Massagers </a>
											</li>
											<li><a href="products4.html">Health Monitors </a>
											</li>
											<li><a href="products4.html">Health Drinks </a>
											</li>
										</ul></li>
								</ul>
								<!-- .cd-secondary-dropdown --></li>
							<!-- .has-children -->
							<li class="has-children"><a href="#">杂货店</a>
								<ul class="cd-secondary-dropdown is-hidden">
									<li class="go-back"><a href="#">Menu</a>
									</li>
									<li class="see-all"><a href="products5.html">All
											Products</a>
									</li>
									<li class="has-children"><a href="#">Veggies & Fruits
									</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products5.html">Vegetables </a>
											</li>
											<li><a href="products5.html">Fruits </a>
											</li>
											<li><a href="products5.html">Dry Fruits</a>
											</li>
											<li><a href="products5.html">Snacks & Cookies </a>
											</li>
											<li><a href="products5.html">Breakfast & Cereal</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Packet Food</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products5.html">Beverages </a>
											</li>
											<li><a href="products5.html">Baking </a>
											</li>
											<li><a href="products5.html">Emergency Food </a>
											</li>
											<li><a href="products5.html">Candy & Gum </a>
											</li>
											<li><a href="products5.html">Meals & Pasta </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Shop All Pets </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products5.html">Dogs </a>
											</li>
											<li><a href="products5.html">Fish </a>
											</li>
											<li><a href="products5.html">Cats</a>
											</li>
											<li><a href="products5.html">Birds </a>
											</li>
											<li><a href="products5.html">Pet Food </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Household
											Essentials </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products5.html">Laundry Room </a>
											</li>
											<li><a href="products5.html">Paper & Plastic</a>
											</li>
											<li><a href="products5.html">Pest Control </a>
											</li>
											<li><a href="products5.html">Batteries </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Food Shops </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products5.html">Fresh Food</a>
											</li>
											<li><a href="products5.html">Food Gifts </a>
											</li>
											<li><a href="products5.html">Frozen Food </a>
											</li>
											<li><a href="products5.html">Organic </a>
											</li>
											<li><a href="products5.html">Gluten Free </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Tips </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products5.html">Pets Growth</a>
											</li>
											<li><a href="products5.html">Recipes </a>
											</li>
											<li><a href="products5.html">Snacks</a>
											</li>
											<li><a href="products5.html">Nutrition</a>
											</li>
										</ul></li>
								</ul>
								<!-- .cd-secondary-dropdown --></li>
							<!-- .has-children -->
							<li class="has-children"><a href="#">照片礼品及办公用品</a>
								<ul class="cd-secondary-dropdown is-hidden">
									<li class="go-back"><a href="#">Menu</a>
									</li>
									<li class="see-all"><a href="products6.html">All
											Products</a>
									</li>
									<li class="has-children"><a href="#">Trending Now </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products6.html">Best Priced</a>
											</li>
											<li><a href="products6.html">Chocolates </a>
											</li>
											<li><a href="products6.html">Gift Cards </a>
											</li>
											<li><a href="products6.html">Fashion & Accessories </a>
											</li>
											<li><a href="products6.html">Decorative Plants </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Photos </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products6.html">Shelf animation </a>
											</li>
											<li><a href="products6.html">3D-rendered </a>
											</li>
											<li><a href="products6.html">gift builder </a>
											</li>
											<li><a href="products6.html">Frames</a>
											</li>
											<li><a href="products6.html">Wall Decor</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Gifts </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products6.html">Personalized Gifts </a>
											</li>
											<li><a href="products6.html">Flowers </a>
											</li>
											<li><a href="products6.html">Cards & Toys</a>
											</li>
											<li><a href="products6.html">Show pieces </a>
											</li>
											<li><a href="products6.html">Photo Books</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Favourite Brands
									</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products6.html">Archies </a>
											</li>
											<li><a href="products6.html">Jewel Fuel </a>
											</li>
											<li><a href="products6.html">Ferns N Petals </a>
											</li>
											<li><a href="products6.html">Happily Unmarried</a>
											</li>
											<li><a href="products6.html">Chumbak</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Office</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products6.html">Calendars</a>
											</li>
											<li><a href="products6.html">Mousepads</a>
											</li>
											<li><a href="products6.html">Phone Cases</a>
											</li>
											<li><a href="products6.html">Tablet & Laptop Cases</a>
											</li>
											<li><a href="products6.html">Mounted Photos</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Combos </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products6.html">Chocolates </a>
											</li>
											<li><a href="products6.html">Dry Fruits</a>
											</li>
											<li><a href="products6.html">Sweets</a>
											</li>
											<li><a href="products6.html">Snacks</a>
											</li>
											<li><a href="products6.html">Cakes</a>
											</li>
										</ul></li>
								</ul>
								<!-- .cd-secondary-dropdown --></li>
							<li class="has-children"><a href="#">健康美容和药房</a>
								<ul class="cd-secondary-dropdown is-hidden">
									<li class="go-back"><a href="#">Menu</a>
									</li>
									<li class="see-all"><a href="products7.html">All
											Products</a>
									</li>
									<li class="has-children"><a href="#">Health</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products7.html">Home Health Care </a>
											</li>
											<li><a href="products7.html">Sports Nutrition </a>
											</li>
											<li><a href="products7.html">Vision </a>
											</li>
											<li><a href="products7.html">Vitamins </a>
											</li>
											<li><a href="products7.html">Diet & Nutrition </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Health Tips</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products7.html">Diet</a>
											</li>
											<li><a href="products7.html">Exercise Tips </a>
											</li>
											<li><a href="products7.html">Vitamin Balance</a>
											</li>
											<li><a href="products7.html">Health Insurance</a>
											</li>
											<li><a href="products7.html">Funeral</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Beauty </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products7.html">Massage & Spa </a>
											</li>
											<li><a href="products7.html">Face Wash</a>
											</li>
											<li><a href="products7.html">Facial Cleanser</a>
											</li>
											<li><a href="products7.html">Makeup </a>
											</li>
											<li><a href="products7.html">Beauty Tips</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Pharmacy </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products7.html">Home Delivery </a>
											</li>
											<li><a href="products7.html">History & Reports </a>
											</li>
											<li><a href="products7.html">Transfer Prescriptions
											</a>
											</li>
											<li><a href="products7.html">Health CheckUp</a>
											</li>
											<li><a href="products7.html">Mobile App</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Pharmacy Center </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products7.html">Diabetes Shop </a>
											</li>
											<li><a href="products7.html">Medicine Cabinet </a>
											</li>
											<li><a href="products7.html">Vitamin Selector</a>
											</li>
											<li><a href="products7.html">Pharmacy Help</a>
											</li>
										</ul></li>
								</ul>
								<!-- .cd-secondary-dropdown --></li>
							<li class="has-children"><a href="#">汽车</a>
								<ul class="cd-secondary-dropdown is-hidden">
									<li class="go-back"><a href="#">Menu</a>
									</li>
									<li class="see-all"><a href="products8.html">All
											Products</a>
									</li>
									<li class="has-children"><a href="#">All Motors </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products8.html">Bikes </a>
											</li>
											<li><a href="products8.html">Yachts </a>
											</li>
											<li><a href="products8.html">Scooters </a>
											</li>
											<li><a href="products8.html">Autos</a>
											</li>
											<li><a href="products8.html">Bus</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Accessories </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products8.html">Vehicle Electronics</a>
											</li>
											<li><a href="products8.html">Stereos & Monitors</a>
											</li>
											<li><a href="products8.html">Bluetooth Devices</a>
											</li>
											<li><a href="products8.html">GPS Navigation</a>
											</li>
											<li><a href="products8.html">Speakers & Tweeters</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Safety & Security
									</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products8.html">Anti-Theft Devices </a>
											</li>
											<li><a href="products8.html">Helmets</a>
											</li>
											<li><a href="products8.html">Sensors</a>
											</li>
											<li><a href="products8.html">Auto Repair Tools </a>
											</li>
											<li><a href="products8.html">Antifreeze & Coolants </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Car Interiors</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products8.html">Stereos </a>
											</li>
											<li><a href="products8.html">Floor Mats </a>
											</li>
											<li><a href="products8.html">Seat Covers</a>
											</li>
											<li><a href="products8.html">Chargers </a>
											</li>
											<li><a href="products8.html">Audio Finder </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Exterior
											Accessories </a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products8.html">Wheel covers </a>
											</li>
											<li><a href="products8.html">Car Lighting </a>
											</li>
											<li><a href="products8.html">Polish & Waxes</a>
											</li>
											<li><a href="products8.html">Cargo Management</a>
											</li>
											<li><a href="products8.html">Car Decoration </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Car Care</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products8.html">Auto Tips & Advice </a>
											</li>
											<li><a href="products8.html">Car Washes & Cleaners </a>
											</li>
											<li><a href="products8.html">Car Wax & Polish</a>
											</li>
											<li><a href="products8.html">Cleaning Tools</a>
											</li>
											<li><a href="products8.html">Detailing Kits </a>
											</li>
										</ul></li>
								</ul>
								<!-- .cd-secondary-dropdown --></li>
							<li class="has-children"><a href="#">书籍音乐和电影</a>
								<ul class="cd-secondary-dropdown is-hidden">
									<li class="go-back"><a href="#">Menu</a>
									</li>
									<li class="see-all"><a href="products9.html">All
											Products</a>
									</li>
									<li class="has-children"><a href="#">Books</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li class="has-children"><a href="#">Exam books </a>
												<ul class="is-hidden">
													<li class="go-back"><a href="#"> </a>
													</li>
													<li><a href="products9.html">CAT/MAT/XAT</a>
													</li>
													<li><a href="products9.html">Civil Services</a>
													</li>
													<li><a href="products9.html">AFCAT</a>
													</li>
													<li><a href="products9.html">New Releases</a>
													</li>
												</ul></li>
											<li><a href="products9.html">Academic Text </a>
											</li>
											<li><a href="products9.html">Romance Books </a>
											</li>
											<li><a href="products9.html">Journals </a>
											</li>
											<li><a href="products9.html">Children's & Teen Books
											</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Music</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products9.html">New Releases </a>
											</li>
											<li><a href="products9.html">Country Music </a>
											</li>
											<li><a href="products9.html">Musical Instruments </a>
											</li>
											<li><a href="products9.html">Collections</a>
											</li>
											<li><a href="products9.html">Boxed Sets </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Music Combo</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products9.html">Pop </a>
											</li>
											<li><a href="products9.html">Preorders </a>
											</li>
											<li><a href="products9.html">Album Songs</a>
											</li>
											<li><a href="products9.html">Top 50 CDs </a>
											</li>
											<li><a href="products9.html">Music DVDs </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Movies</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products9.html">New Releases </a>
											</li>
											<li><a href="products9.html">Children & Family </a>
											</li>
											<li><a href="products9.html">Action</a>
											</li>
											<li><a href="products9.html">Classic Movies </a>
											</li>
											<li><a href="products9.html">Bollywood Movies </a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">Movies Combo</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products9.html">Hollywood Movies </a>
											</li>
											<li><a href="products9.html">Digital Movies </a>
											</li>
											<li><a href="products9.html">Boxed Sets</a>
											</li>
											<li><a href="products9.html">Animated</a>
											</li>
											<li><a href="products9.html">Adventure</a>
											</li>
										</ul></li>
									<li class="has-children"><a href="#">TV Shows</a>
										<ul class="is-hidden">
											<li class="go-back"><a href="#"></a>
											</li>
											<li><a href="products9.html">Serials</a>
											</li>
											<li><a href="products9.html">Best Programs</a>
											</li>
											<li><a href="products9.html">Celebrations</a>
											</li>
											<li><a href="products9.html">Top Shows</a>
											</li>
										</ul></li>
								</ul>
								<!-- .cd-secondary-dropdown --></li>
							<li><a href="sitemap.html">完整网站目录</a>
							</li>
						</ul>
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
	<!-- products -->
	<div class="products">
		<div class="container">
			<div class="col-md-12 product-w3ls-right">
				<!-- breadcrumbs -->
				<ol class="breadcrumb breadcrumb1">
					<li><a href="index.html">主页</a>
					</li>
					<li class="active">产品</li>
				</ol>
				<div class="clearfix"></div>
				<!-- //breadcrumbs -->
				<div class="product-top">
					<h4>时尚商店</h4>
					<ul>
						<li class="dropdown head-dpdn"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown">排序方式<span
								class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#">按价格低到高</a>
								</li>
								<li><a href="#">按价格高到低</a>
								</li>
								<li><a href="#">按上最新架时间</a>
								</li>
								<li><a href="#">按销量进行排序</a>
								</li>
							</ul></li>
						<li class="dropdown head-dpdn"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown">品牌<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#">耐克</a>
								</li>
								<li><a href="#">阿迪达斯</a>
								</li>
								<li><a href="#">彪马</a>
								</li>
								<li><a href="#">爱马仕</a>
								</li>
							</ul></li>
					</ul>
					<div class="clearfix"></div>
				</div>

			

				<!-- 商品显示部分： 开始  -->

				<div class="products-row">
					
			<h4 class="w3ls-title">
				<span style="color:blue;">新</span>
				<span style="color:coral;">品</span>
				<span style="color:forestgreen;">区</span>
			</h4>
				
				
				<c:forEach items="${generalList2 }" var="g" begin="0" end="3">
					<div class="col-md-3 product-grids">
						<div class="agile-products">
							<div class="new-tag">
								<h6>
									NEW<br>
								</h6>
							</div>
							<a href="single.html"><img src="<%=basePath %>fileUpload/${g.images.imAddress}" class="img-responsive" alt="img"></a>
							<div class="agile-product-text">
								<h5>
									<a href="view/shop/cart.jsp">${g.product.pName }</a>
								</h5>
								<h6>
								
									$${g.productSpecs.psPrice }
								</h6>
								<form action="#" method="post">
									
									<input type="hidden" name="cmd" value="_cart" /> 
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="${g.product.pName }" /> 
									<input type="hidden" name="amount" value="${g.productSpecs.psPrice }" />
									<button type="submit" class="w3ls-cart pw3ls-cart">
										<i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车
									</button>
								</form>
							</div>
						</div>
					</div>
					</c:forEach>
				
				
					
					<div class="clearfix"></div>
				</div>
				<div class="products-row">
				
			<h4 class="w3ls-title">
				<span style="color:blue;">折</span>
				<span style="color:coral;">扣</span>
				<span style="color:forestgreen;">区</span>
			</h4>
				<c:forEach items="${generalList1 }" var="g"  begin="0" end="7" >
					<div class="col-md-3 product-grids">
						<div class="agile-products">
							<div class="new-tag">
								<h6>
									<span id="oldDiscount"><fmt:formatNumber type="number" value="${g.product.pDiscount * 100 }" /></span><br>折
								</h6>
							</div>
							<a href="single.html"><img src="<%=basePath %>fileUpload/${g.images.imAddress}" class="img-responsive" alt="img"></a>
							<div class="agile-product-text">
								<h5>
									<a href="view/shop/cart.jsp">${g.product.pName }</a>
								</h5>
								<h6>
								
									<del id="oldPrice">$${g.productSpecs.psPrice }</del><span>$<fmt:formatNumber type="number" value="${g.product.pDiscount*g.productSpecs.psPrice }" maxFractionDigits="2" /></span>
								</h6>
								<form action="#" method="post">
									
									<input type="hidden" name="cmd" value="_cart" /> 
									<input type="hidden" name="add" value="1" /> 
									<input type="hidden" name="w3ls_item" value="${g.product.pName }" /> 
									<input type="hidden" name="amount" value="${g.product.pDiscount*g.productSpecs.psPrice }" />
									<button type="submit" class="w3ls-cart pw3ls-cart">
										<i class="fa fa-cart-plus" aria-hidden="true"></i> 添加到购物车
									</button>
								</form>
							</div>
						</div>
					</div>
					</c:forEach>
			
					
					<div class="clearfix"></div>
				</div>

			<h4 class="w3ls-title">
				<span style="color:blue;">活</span>
				<span style="color:coral;">动</span>
				<span style="color:black;">专</span>
				<span style="color:forestgreen;">区</span>
			</h4>
				

				<!-- 商品显示部分： 结束  -->
				<!-- add-products -->

				<div class="w3ls-add-grids w3agile-add-products">
					<a href="#">
						<h4>
							挑你想挑的 选你想选的 我的就是你的!
						</h4>
						<h6>
							快点行动吧 <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
						</h6> </a>
				</div>
				
			</div>
			<div class="clearfix"></div>
			<!-- recommendations -->
			<div class="recommend">
				<!-- <h3 class="w3ls-title">Our Recommendations</h3> -->
				<script>
					$(document).ready(function() {
						$("#owl-demo5").owlCarousel({

							autoPlay : 3000, //Set AutoPlay to 3 seconds

							items : 4,
							itemsDesktop : [ 640, 5 ],
							itemsDesktopSmall : [ 414, 4 ],
							navigation : true

						});

					});
				</script>
				<div id="owl-demo5" class="owl-carousel">
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag">
								<h6>
									20% <br> Off
								</h6>
							</div>
							<a href="products1.html"><img src="images/f2.png" alt="img">
							</a>
							<div class="view-caption agileits-w3layouts">
								<h4>
									<a href="products1.html">Women Sandal</a>
								</h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$20</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" /> <input
										type="hidden" name="add" value="1" /> <input type="hidden"
										name="w3ls_item" value="Women Sandal" /> <input type="hidden"
										name="amount" value="20.00" />
									<button type="submit" class="w3ls-cart">
										<i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart
									</button>
								</form>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<a href="products.html"><img src="images/e4.png" alt="img">
							</a>
							<div class="view-caption agileits-w3layouts">
								<h4>
									<a href="products.html">Digital Camera</a>
								</h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$80</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" /> <input
										type="hidden" name="add" value="1" /> <input type="hidden"
										name="w3ls_item" value="Digital Camera" /> <input
										type="hidden" name="amount" value="100.00" />
									<button type="submit" class="w3ls-cart">
										<i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart
									</button>
								</form>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag">
								<h6>New</h6>
							</div>
							<a href="products4.html"><img src="images/s1.png" alt="img">
							</a>
							<div class="view-caption agileits-w3layouts">
								<h4>
									<a href="products4.html">Roller Skates</a>
								</h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$180</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" /> <input
										type="hidden" name="add" value="1" /> <input type="hidden"
										name="w3ls_item" value="Roller Skates" /> <input type="hidden"
										name="amount" value="180.00" />
									<button type="submit" class="w3ls-cart">
										<i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart
									</button>
								</form>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<a href="products1.html"><img src="images/f1.png" alt="img">
							</a>
							<div class="view-caption agileits-w3layouts">
								<h4>
									<a href="products1.html">T Shirt</a>
								</h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$10</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" /> <input
										type="hidden" name="add" value="1" /> <input type="hidden"
										name="w3ls_item" value="T Shirt" /> <input type="hidden"
										name="amount" value="10.00" />
									<button type="submit" class="w3ls-cart">
										<i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart
									</button>
								</form>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag">
								<h6>New</h6>
							</div>
							<a href="products6.html"><img src="images/p1.png" alt="img">
							</a>
							<div class="view-caption agileits-w3layouts">
								<h4>
									<a href="products6.html">Coffee Mug</a>
								</h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$14</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" /> <input
										type="hidden" name="add" value="1" /> <input type="hidden"
										name="w3ls_item" value="Coffee Mug" /> <input type="hidden"
										name="amount" value="14.00" />
									<button type="submit" class="w3ls-cart">
										<i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart
									</button>
								</form>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag">
								<h6>
									20% <br> Off
								</h6>
							</div>
							<a href="products6.html"><img src="images/p2.png" alt="img">
							</a>
							<div class="view-caption agileits-w3layouts">
								<h4>
									<a href="products6.html">Teddy bear</a>
								</h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$20</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" /> <input
										type="hidden" name="add" value="1" /> <input type="hidden"
										name="w3ls_item" value="Teddy bear" /> <input type="hidden"
										name="amount" value="20.00" />
									<button type="submit" class="w3ls-cart">
										<i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart
									</button>
								</form>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<a href="products4.html"><img src="images/s2.png" alt="img">
							</a>
							<div class="view-caption agileits-w3layouts">
								<h4>
									<a href="products4.html">Football</a>
								</h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$70</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" /> <input
										type="hidden" name="add" value="1" /> <input type="hidden"
										name="w3ls_item" value="Football" /> <input type="hidden"
										name="amount" value="70.00" />
									<button type="submit" class="w3ls-cart">
										<i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart
									</button>
								</form>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag">
								<h6>Sale</h6>
							</div>
							<a href="products3.html"><img src="images/h1.png" alt="img">
							</a>
							<div class="view-caption agileits-w3layouts">
								<h4>
									<a href="products3.html">Wall Clock</a>
								</h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$80</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart" /> <input
										type="hidden" name="add" value="1" /> <input type="hidden"
										name="w3ls_item" value="Wall Clock" /> <input type="hidden"
										name="amount" value="80.00" />
									<button type="submit" class="w3ls-cart">
										<i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //recommendations -->
		</div>
	</div>
	<!--//products-->
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
					<h1>
						<a href="index.html"><span>S</span>mart <i>Bazaar</i> </a>
					</h1>
					<h6>Your stores. Your place.</h6>
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
	<!-- cart-js -->
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
	<!-- //cart-js -->
	<!-- menu js aim -->
	<script src="js/jquery.menu-aim.js"> </script>
	<script src="js/main.js"></script>
	<!-- Resource jQuery -->
	<!-- //menu js aim -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/bootstrap.js"></script>
</body>
</html>
