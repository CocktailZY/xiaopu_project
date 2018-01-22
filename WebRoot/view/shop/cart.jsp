<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<title>商品详情页面</title>
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
<link href="<%=basePath %>css/cartcss.css" rel="stylesheet"> 
<!-- js -->
<script src="<%=basePath %>js/jquery-2.2.3.min.js"></script>
<script type="text/javascript">
	function firm() {  
	    if (confirm("确定添加购物车吗？")) {
	    	var pid=$("#productId").val();
	    	$.ajax({
	    		   type: "POST",
	    		   url: "<%=basePath %>/cart/addCart.do",
	    		   data: {"pid":pid},
	    		   success: function(msg){
	    			 if(msg!=null){
	    				alert("添加成功"); 
	    			 }  
	    		   }
	    		});
	    }  
	    else {  
	        alert("放弃");  
	    }  
	
	} 
</script>
<!-- //js --> 

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
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: white;font-size: 12px;"><i class="fa fa-user" aria-hidden="true"></i> 用户名<span class="caret"></span></a>
						<ul class="dropdown-menu row">
							<div style="width: 140px;height: 100px;">
								<div style="height: 60px;width: 60px;background-color: black;border-radius: 5px;margin: 10px;color: white;">	
									这里是萌萌的用户头像
								</div>
								<div style="height: 25px;width: 25px;background-color: red;border-radius: 2px;float: right;">
									
								</div>
							</div>
						</ul>
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
					<h1><a href="index.html"><span>S</span>mart <i>Bazaar</i></a></h1>
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
		<!-- 蓝色菜单和滚动条 -->
		<div class="header-three">
			<div class="container" style="height: 50px;">
			</div>
		</div>
		<!-- 蓝色菜单和滚动条结束 -->
	</div>
	<!-- 顶部head结束 -->	
	<!-- 页面主体 -->
	<div class="cbody">
		<div class="cart-top row">
			<div class="col-md-2 checkall">
			</div>
			<div class="col-md-2 smessage">
				商品信息
			</div>
			<div class="col-md-2 smessage">
				规 格
			</div>
			<div class="col-md-1 menoy">
				单 价
			</div>
			<div class="col-md-1 allmenoy">
				金 额
			</div>
			<div class="col-md-2 do">
				操 作
			</div>
		</div>
		<div class="cart-body">
			<div class="shopname">
			</div>
			<div class="eachproduct">
				<div class="product-title">
					商品的图片
				</div>
				<div class="product-body row">
					<div class="col-md-2 pic">
						<div style="height: 110px;width: 150px;background-color: #A9A9A9;margin-top: 10px;margin-left: 10px;"></div>
					</div>
					<div class="col-md-2 pmess">
						商品是纯棉制品
					</div>
					<div class="col-md-2 pstyle">
						<input type="hidden" name="productId" id="pid" value="${product.pid}"/><%--产品ID--%>
						颜色<br/>
						大小<br/>
						款式<br/>
					</div>
					<div class="col-md-1 money">
						100元
					</div>
					<div class="col-md-1 allmoney">
						100元
					</div>
					<div class="col-md-2 caozuo">
						<a onclick="firm()">加入购物车</a><br/>
						<a href="<%=basePath %>/cart/findAllCart.do">查看购物车</a><br/>
						<a href="">加入收藏夹</a><br/>
						<a href="">删除</a><br/>
					</div>
				</div>
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
	<!-- 购物车-js -->
	<script src="<%=basePath %>js/minicart.js"></script>
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