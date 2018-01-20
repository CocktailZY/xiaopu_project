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
<title>购物车</title>
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
	<script type="text/javascript">
		var total=0;
		var sum=0;
		function jisuan(id){
			var checkbox_name = document.getElementById("checkbox_name"+id);
				if(checkbox_name.checked==true){
					 var price=$("#smallPrice"+id).html();
					 total=parseInt(total)+parseInt(price);
        			 var num=document.getElementById("cNum"+id).value;
        			 sum=parseInt(sum)+parseInt(num);
				}else if(checkbox_name.checked==false){
					 var price=$("#smallPrice"+id).html();
					 total=parseInt(total)-parseInt(price);
        			 var num=document.getElementById("cNum"+id).value;
        			 sum=parseInt(sum)-parseInt(num);	
				} 
				
			$("#priceTotal").text(total);
			$("#selectedTotal").text(sum);
        };
        
        function jisuanjia(id){
        	 var cNum=document.getElementById("cNum"+id).value;
        	 cNum = parseInt(cNum)+1;
        	 document.getElementById("cNum"+id).value=cNum;
        	 var spPrice=$("#spPrice"+id).html();
        	 var smallPrice=(parseInt(cNum))*parseInt(spPrice);
        	 $("#smallPrice"+id).text(smallPrice);
        }
        
        function jisuanjian(id){
        	 var cNum=document.getElementById("cNum"+id).value;
        	 cNum = parseInt(cNum)-1;
        	 document.getElementById("cNum"+id).value=cNum;
        	 var spPrice=$("#spPrice"+id).html();
        	 var smallPrice=(parseInt(cNum))*parseInt(spPrice);
        	 $("#smallPrice"+id).text(smallPrice);
        }
	</script>

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

	</div>
	<!-- //header -->
	<!-- card-page -->
	<div class="card-page">
		<div class="container">
			<!-- <h3 class="w3ls-title w3ls-title1" style="border-style:double;"></h3> -->
			<div class="header-logo">
					<h1>
						<a><span>购物车</span><i></i></a>
					</h1>
			</div>
			<table id="cartTable" class="cart table table-condensed" style="border-style: solid;">
				<thead>
					<tr>
						<th style="width:60px;"><label>
						<input class="check-all check" type="checkbox" name="checkedAll" id="checkedAll" />全选</label>
	<script type="text/javascript">
 		$("#checkedAll").click(function () {
 			var total=0;
			var sum=0;
			var id=document.getElementById("id").value;
            if ($(this).is(":checked")) {
                $("[name=items]:checkbox").prop("checked", true);
                	 /* var price=$("#smallPrice"+id).html();
					 total=parseInt(total)+parseInt(price);
        			 var num=document.getElementById("cNum"+id).value;
        			 sum=parseInt(sum)+parseInt(num); */
        			 countjia();
        			 
            } else {
                $("[name=items]:checkbox").prop("checked", false);
                	 /* var price=$("#smallPrice"+id).html();
					 total=parseInt(total)-parseInt(price);
        			 var num=document.getElementById("cNum"+id).value;
        			 sum=parseInt(sum)-parseInt(num);	 */
        			 countjian();
            }
           /*  $("#priceTotal").text(total); 
			$("#selectedTotal").text(sum);*/
        });
        
        function countjia(){
			var checks = document.getElementsByName("items");
			var	cc =0;
			var bb=0;
			for ( var i = 0; i < checks.length; i++) {
				if (checks[i].checked == true) {
				var price=$("#smallPrice"+checks[i].value).html();	
				var num=document.getElementById("cNum"+checks[i].value).value;
					cc += parseFloat(price);
					bb += parseFloat(num);
				}
				if (checks[i].checked == false){
				 $("#priceTotal").text(cc);
				 $("#selectedTotal").text(bb);
				 }
			}
				$("#priceTotal").text(cc);
				$("#selectedTotal").text(bb);
		}
		function countjian(){
			var checks = document.getElementsByName("items");
			var	cc =0;
			var bb=0;
			for ( var i = 0; i < checks.length; i++) {
				if (checks[i].checked == true) {
				var price=$("#smallPrice"+checks[i].value).html();
				var num=document.getElementById("cNum"+checks[i].value).value;	
					cc -= parseFloat(price);
					bb -= parseFloat(num);
				}
				if (checks[i].checked == false){
				 $("#priceTotal").text(cc);
				 $("#selectedTotal").text(bb);
				 }
			}
				$("#priceTotal").text(cc);
				$("#selectedTotal").text(bb);
		}
		
		function jiesuan(){
			/* $.ajax({
					type : "POST",
					url : "",
					data : "name=John&location=Boston",
					success : function(msg) {
						alert("Data Saved: " + msg);
					}
				}); */
				var value = $("pid"+id).html().trim();
				alert(value);
			}
			
	</script>
					</th>
					<th>
					<label>图片</label>
					</th>
					<th>
					<label>商品名</label>
					</th>
					<th ><label>规格</label>
					</th>
					<th ><label>单价</label>
					</th>
					<th ><label>数量</label>
					</th>
					<th ><label>小计</label>
					</th>
					<th><label>操作</label>
					</th>
					<th><label>店铺名称</label>
					</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${generalList }" var="gen">
					<tr>
						<td>
							<input class="check-one check" type="checkbox" id="checkbox_name${gen.cart.cId }" name="items" onclick="jisuan('${gen.cart.cId }')" value="${gen.cart.cId }"/>
							<input type="hidden" id="id" value="${gen.cart.cId }"/>
						</td>
						<td class="goods"><label>图片</label></td>
						<td class="goods"><label id="pid${gen.cart.cId }">${gen.product.pName }</label></td>
						<td class="goods"><label>规格</label></td>
						<td class="number small-bold-red">
							<span id="spPrice${gen.cart.cId}">${gen.specs.spPrice}</span>
						</td>
						<td class="input-group">
							<span class="input-group-addon minus" onclick="jisuanjian('${gen.cart.cId }')">-</span>
							<input type="text" class="number form-control input-sm" id="cNum${gen.cart.cId }" value="${gen.cart.cNum}"/>
							<span class="input-group-addon plus" onclick="jisuanjia('${gen.cart.cId }')">+</span>
						</td>
						<td class="subtotal number small-bold-red"><label><span id="smallPrice${gen.cart.cId }" class="large-bold-red">${gen.specs.spPrice *  gen.cart.cNum}</span></label></td>
						<td class="operation">
							<span class="delete btn btn-xs btn-warning">
								<a href="<%=basePath %>cart/deleteCart.do?cid=${gen.cart.cId}">删除</a>
							</span>
						</td>
						<td>
							<span class="delete btn btn-xs">
								<a href="">${gen.shop.sName }</a>
							</span>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="cart-foot row">
			<div class="col-md-1 checkall">
			</div>
			<div class="col-md-4 smessage">
			</div>
			<div class="col-md-3 smessage">
			</div>
			<div class="col-md-2 do">
			</div>
			<div class="col-md-2">
				<div style="background-color:white;margin-right: 0px;text-align: center;line-height: 
				59px;color: white;font-family: '微软雅黑';font-size: 20px;">
				<input type="button" value="结算" style="background: coral;width:150px; height: 60px" style="border-style:solid;" style="color:black" onclick="jiesuan()"/>
				</div>
			</div>
		</div>
			<div class="row">
				<div class="col-md-12 col-lg-12 col-sm-12">
					<div style="border-top:1px solid gray;padding:4px 10px;">
						<div style="margin-left:20px;" class="pull-right total">
							<label>金额合计:<span class="currency">￥</span><span id="priceTotal" class="large-bold-red">0.00</span>
							</label>
						</div>
						<div class="pull-right" id="selected">
							<label>已选商品<span id="selectedTotal" class="large-bold-red" style="margin:0 4px;">0</span>件
							</label>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- //card-page -->
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

