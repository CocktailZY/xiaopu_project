<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<title>主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 


</script>
<!-- Custom Theme files -->
<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="<%=basePath%>css/menu.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- menu style -->
<link href="<%=basePath%>css/ken-burns.css" rel="stylesheet"
	type="text/css" media="all" />
<!-- banner slider -->
<link href="<%=basePath%>css/animate.min.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="<%=basePath%>css/owl.carousel.css" rel="stylesheet"
	type="text/css" media="all">
<!-- carousel slider -->
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="<%=basePath%>css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!-- js -->
<script src="<%=basePath%>js/jquery-2.2.3.min.js"></script>
<!-- //js -->
<!-- web-fonts 

<!-- web-fonts 
<!-- <link href='http://fonts.useso.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

<link href='http://fonts.useso.com/css?family=Lovers+Quarrel' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Offside' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'> -->
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
<script src="<%=basePath%>js/jquery-scrolltofixed-min.js"
	type="text/javascript"></script>
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
<script type="text/javascript" src="<%=basePath%>js/move-top.js"></script>
<script type="text/javascript" src="<%=basePath%>js/easing.js"></script>
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
			getType();
			getBull1();
			getBull2();
			
		});
		
		function getType(){
			$.ajax({
				type:"get",
				async:false,
				dataType:"json",
				url:"<%=basePath%>productType/index.do",
				data: {
					
				},
				success:function(data){ 		
			    	var json = eval(data);
					if(json.length != 0){
						var html = "";
						for(var i=0;i<json.length;i++){
							var item = json[i];
							if(item.childs && item.childs.length > 0){
								html += '<li class="has-children">';
								html += '<a href="#">'+item.ptName+'</a>';
								html += '<ul class="cd-secondary-dropdown is-hidden">';
								html += '<li class="go-back"><a href="#">Menu</a></li>';
								for(var j=0;j<item.childs.length;j++){
									var jtem = item.childs[j];
									if(jtem.childs && jtem.childs.length > 0){
										html += '<li class="has-children">';
										html += '<a href="#">'+jtem.ptName+'</a>';
										html += '<ul class="is-hidden">';
										/* html += '<li class="go-back"><a href="#">All Electronics</a></li>'; */
										for(var c=0;c<jtem.childs.length;c++){
											var ctem = jtem.childs[c];
											html += '<li>';
											html += '<a href="#">'+ctem.ptName+'</a>';
											html += '</li>';
										}
										html += '</ul>';
										html += '</li>';
									}else{
										html += '<li><a href="#">'+jtem.ptName+'</a></li>';
									}
								}
								html += '</ul>';
								html += '</li>';
							}else{
								html += '<li><a href="#">'+item.ptName+'</a></li>';
							}
						}
						console.log(html);
						$('#type_tree').empty().html(html);
					}else{
						alert("没有获取到商品类型");
					}
		        },
		        error:function(){				
		        	alert("出现异常");

				}
			});
		}
		function getBull1(){
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
						$("#abcd").empty().append("<a href='"+dataObj[i].buShopId+"'><span>"+dataObj[i].buContent+"</span></a>");
					}
					
				},
				error:function(){
					alert("没有公告");
				}
		  });
		  $('.marquee').marquee({ pauseOnHover: true });
		}
		function getBull2(){
			$.ajax({
				type:"post",
				async:false,
				url:"<%=basePath%>bulletion/bulletionListByMall.do",
					dataType : "json",
					data : {

					},
					success : function(data) {
						var dataObj = eval(data);
						for (var i = 0; i < dataObj.length; i++) {
							var id = "bm" + dataObj[i].buId+ "";
							if(i == 0){
								$("#buMall").empty().append("<div class='item active'><img src='../images/8.jpg' alt='' class='img-responsive' /><div  id='"+id+"' class='carousel-caption kb_caption kb_caption_right'></div></div>");
							}else{
								$("#buMall").append("<div class='item'><img src='../images/8.jpg' alt='' class='img-responsive' /><div  id='"+id+"' class='carousel-caption kb_caption kb_caption_right'></div></div>");
							}
							$("#" + id).append("<h3 data-animation='animated fadeInDown'>"+ dataObj[i].bulls[0]+ "</h3>");
							for (var j = 1; j < dataObj[i].count; j++) {
								$("#" + id).append("<h4 data-animation='animated fadeInUp'>"+ dataObj[i].bulls[j]+ "</h4>");
							}
						}

					},
					error : function() {
						alert("没有公告");
					}
				});
		}
		function getProductType(){
			$.ajax({
				type:"get",
				async:false,
				dataType:"json",
				url:"<%=basePath%>product/queryAll1.do",
				data: {
					
				},
				success:function(){
					console.log('success');
		        },
		        error:function(){				
		        	alert("出现异常");
				}
			});
		}
		
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
				<ul style="list-style: none;">
					<li class="dropdown head-dpdn"><c:if
							test="${loginUser == null}">
							<a href="<%=basePath%>login.jsp"
								style="color: white; font-size: 12px;"><i class="fa fa-user"
								aria-hidden="true"></i> 请登录 </a>
							<a href="<%=basePath%>view/user/signup.jsp"
								style="color: white; font-size: 12px;"><i class="fa fa-user"
								aria-hidden="true"></i> 免费注册 </a>
						</c:if> <c:if test="${loginUser ne null}">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"
								style="color: white; font-size: 12px;"><i class="fa fa-user"
								aria-hidden="true"></i> ${loginUser.uName } <span class="caret"></span>
							</a>
							<ul class="dropdown-menu row">
								<!-- 头像和个人信息 -->
								<div style="width: 140px; height: 100px;">
									<div
										style="height: 60px; width: 60px; background-color: black; margin: 5px; color: white; float: left;">
										<img src="<%=basePath%>fileUpload/${loginUser.uHead}"
											style="height: 60px; width: 60px;" />
									</div>
									<div
										style="height: 60px; width: 60px; background-color: red; border-radius: 2px; float: left;">
										<a href="<%=basePath%>view/user/personal_center.jsp">个人中心</a><br>
										<a href="<%=basePath%>user/loginout.do">退出登录</a>
									</div>
									<div
										style="height: 30px; width: 130px; background-color: yellow; border-radius: 2px; clear: left; float: left;">
										这里是积分和等级神马的</div>
								</div>
							</ul>
						</c:if></li>
				</ul>
			</div>
			<div class="w3ls-header-right">
				<ul>
					<li class="dropdown head-dpdn"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-tag" aria-hidden="true"></i>我的订单<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<%=basePath%>orderInfo/orderInfoLogin.do">历史订单</a></li>
							<li><a href="">订单投诉</a></li>
						</ul></li>
					<li class="dropdown head-dpdn"><a
						href="<%=basePath%>cart/cartLogin.do" class="dropdown-toggle"><i
							class="fa fa-folder-open" aria-hidden="true"></i>购物车<span
							class="caret"></span></a></li>
					<%-- 
					<li class="dropdown head-dpdn">
						<a href="<%=basePath %>/favorites/favourite.do" class="dropdown-toggle"><i class="fa fa-folder-open" aria-hidden="true"></i>收藏夹</a>
					</li>
					--%>
					<li class="dropdown head-dpdn"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-folder-open" aria-hidden="true"></i>收藏夹<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<%=basePath%>/favorites/favourite.do">商品收藏</a></li>
							<li><a href="<%=basePath%>/favorites/favourite.do">店铺收藏</a></li>
						</ul></li>
					<li class="dropdown head-dpdn"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-truck" aria-hidden="true"></i>卖家中心<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<%=basePath%>/shopType/typeSel.do">我要开店</a></li>
							<li><a href="<%=basePath%>view/shop/shop_center.jsp">我的店铺</a></li>
							<li><a href="#">卖家培训</a></li>
						</ul></li>
					<!-- <li class="dropdown head-dpdn">
						<a href="card.html" class="dropdown-toggle"><i class="fa fa-comment" aria-hidden="true"></i>我的消息</a>
					</li> 
					<li class="dropdown head-dpdn">
						<a href="help.html" class="dropdown-toggle"><i class="fa fa-phone" aria-hidden="true"></i>联系客服</a>
					</li> -->
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- 顶部黑色结束 -->
		<!-- Logo -->
		<div class="header-two">
			<div class="container">
				<div class="header-logo">
					<h1>
						<a href="<%=basePath%>index.html"><span>S</span>mart <i>Bazaar</i></a>
					</h1>
					<h6>Your stores. Your place.</h6>
				</div>
				<div class="header-search">
					<form action="<%=basePath%>product/getAllProductByPage.do"
						method="post">
						<input type="search" name="Search" placeholder="搜索你想要的商品..."
							required="" value="${Search}">
						<button type="submit" class="btn btn-default"
							aria-label="Left Align">
							<i class="fa fa-search" aria-hidden="true"> </i>
						</button>
					</form>
				</div>
				<%-- <div class="header-cart"> 
					<div class="my-account">
						<a href="<%=basePath %>contact.html"><i class="fa fa-map-marker" aria-hidden="true"></i>联系我们</a>						
					</div>
					<div class="cart" style="border:0 !important;"> 
						<form action="#" method="post" class="last"> 
							<input type="hidden" name="cmd" value="_cart" />
							<input type="hidden" name="display" value="1" />
							<button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
							<!-- <%=basePath %>cart/cartLogin.do -->
						</form>  
					</div>
					<div class="clearfix"></div>
				</div>  --%>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- //header-two -->
		<!-- Logo结束 -->
		<!-- 蓝色菜单和滚动条 -->
		<div class="header-three">
			<div class="container">
				<div class="menu">
					<div class="cd-dropdown-wrapper">
						<a class="cd-dropdown-trigger" href="#0">所有商品分类</a>
						<nav class="cd-dropdown"> <a href="#0" class="cd-close">关闭</a>
						<ul class="cd-dropdown-content" id="type_tree">
						</ul>
						</nav>
						<!-- .cd-dropdown -->
					</div>
					<!-- .cd-dropdown-wrapper -->
				</div>
				<div class="move-text">

					<div class="marquee" id="abcd">
						<a href="#"><span> 商城全部商品空运免运费15天，活动正在进行中，快来剁手！！！</span></a> <a
							href="#"><span> 商城全部商品空运免运费15天，活动正在进行中，快来剁手！！！</span></a>
					</div>
					<script type="text/javascript"
						src="<%=basePath%>js/jquery.marquee.min.js"></script>
					<!-- 蓝色滚动js (放在这里的原因是要先等ajax同步加载玩数据库中公告信息再给样式)-->
					<script type="text/javascript" src="<%=basePath%>js/move-top.js"></script>
				</div>
			</div>
		</div>
		<!-- 蓝色菜单和滚动条结束 -->
	</div>
	<!-- 顶部head结束 -->
	<!-- 页面主体banner -->
	<div class="banner">
		<div id="kb" class="carousel kb_elastic animate_text kb_wrapper"
			data-ride="carousel" data-interval="6000" data-pause="hover">
			<!-- 滚动的广告 -->
			<div id="buMall" class="carousel-inner" role="listbox">
				<div class="item active">
					<!-- 第一个广告 -->
					<img src="<%=basePath%>images/5.jpg" alt="" class="img-responsive" />
					<div class="carousel-caption kb_caption kb_caption_right">
						<h3 data-animation="animated flipInX">
							全场最低<span>50%</span>折扣
						</h3>
						<h4 data-animation="animated flipInX">只为您优选最好的商品！！</h4>
						<h4 data-animation="animated flipInX">只为您提供最合适的价格！！</h4>
					</div>
				</div>


			</div>
			<!-- 滚动的广告结束 -->
			<!-- 向左的按钮 -->
			<a class="left carousel-control kb_control_left" href="#kb"
				role="button" data-slide="prev"> <span
				class="fa fa-angle-left kb_icons" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a>
			<!-- 向右的按钮 -->
			<a class="right carousel-control kb_control_right" href="#kb"
				role="button" data-slide="next"> <span
				class="fa fa-angle-right kb_icons" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<script src="<%=basePath%>js/custom.js"></script>
	</div>
	<!-- 页面主体banner结束 -->
	<!-- 页面主体商品滚动展示 -->
	<div class="welcome">
		<div class="container">
			<div class="welcome-info">
				<div class="bs-example bs-example-tabs" role="tabpanel"
					data-example-id="togglable-tabs">
					<ul id="myTab" class=" nav-tabs" role="tablist">
						<li role="presentation"><a
							href="<%=basePath%>product/queryAll.do" id="home-tab" role="tab">
								<i class="fa fa-laptop" aria-hidden="true"></i>
								<h5>全部商品</h5>
						</a></li>
						<li role="presentation"><a href="#carl" role="tab"
							id="carl-tab" data-toggle="tab"> <i class="fa fa-female"
								aria-hidden="true"></i>
								<h5>魅力时尚</h5>
						</a></li>
						<li role="presentation"><a href="#james" role="tab"
							id="james-tab" data-toggle="tab"> <i class="fa fa-gift"
								aria-hidden="true"></i>
								<h5>精美礼品</h5>
						</a></li>
						<li role="presentation"><a href="#decor" role="tab"
							id="decor-tab" data-toggle="tab"> <i class="fa fa-home"
								aria-hidden="true"></i>
								<h5>家居必备</h5>
						</a></li>
						<li role="presentation"><a href="#sports" role="tab"
							id="sports-tab" data-toggle="tab"> <i
								class="fa fa-motorcycle" aria-hidden="true"></i>
								<h5>户外运动</h5>
						</a></li>
					</ul>
					<div class="clearfix"></div>
					<h3 class="w3ls-title">
						<span style="color: red;">特</span><span style="color: coral;">色</span><span
							style="color: forestgreen;">商</span><span
							style="color: dodgerblue;">品</span>
					</h3>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="home"
							aria-labelledby="home-tab">
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
														<h6>
															<span id="oldDiscount"><fmt:formatNumber
																	type="number" value="${g.product.pDiscount * 100 }" /></span><br>折
														</h6>
													</c:if>
												</div>
												<a href="products.html"><img
													src="<%=basePath %>fileUpload/${g.images.imAddress}"
													alt="img"></a>
												<div class="view-caption agileits-w3layouts">
													<h4>
														<a href="products.html">${g.product.pName }</a>
													</h4>
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
														<input type="hidden" name="cmd" value="_cart" /> <input
															type="hidden" name="add" value="1" /> <input
															type="hidden" name="w3ls_item"
															value="${g.product.pName }" />
														<c:if test="${g.product.pNew==0 }">
															<input type="hidden" name="amount"
																value="${g.product.pDiscount * g.productSpecs.psPrice }" />
														</c:if>
														<c:if test="${g.product.pNew==1 }">
															<input type="hidden" name="amount"
																value="${g.productSpecs.psPrice }" />
														</c:if>
														<button type="submit" class="w3ls-cart ">
															<i class="fa fa-cart-plus" aria-hidden="true"></i>加入购物车
														</button>
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

											autoPlay : 3000, //Set AutoPlay to 3 seconds

											items : 4,
											itemsDesktop : [ 640, 5 ],
											itemsDesktopSmall : [ 414, 4 ],
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
	<!-- <div class="add-products">
		<div class="container">
			<div class="add-products-row">
				<div class="w3ls-add-grids">
					<a href="products1.html">
						<h4>
							前十名购买者！<span>20%</span>优惠！
						</h4>
						<h6>
							立即购买！<i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
						</h6>
					</a>
				</div>
				<div class="w3ls-add-grids w3ls-add-grids-mdl">
					<a href="products1.html">
						<h4>
							假日促销！！全部商品降价！ <span>40%</span>大促销！！
						</h4>
						<h6>
							立即购买！<i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
						</h6>
					</a>
				</div>
				<div class="w3ls-add-grids w3ls-add-grids-mdl1">
					<a href="products.html">
						<h4>
							最懂你的私人定制！！！<span> Come On !</span>
						</h4>
						<h6>
							立即购买！<i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
						</h6>
					</a>
				</div>
				<div class="clerfix"></div>
			</div>
		</div>
	</div> -->
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
						<a
							href="<%=basePath %>product/typeSelect.do?id=${g.productType.ptId }"
							class="${g.color }">
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
							<div class="focus-image">
								<i class="fa fa-${g.pic }"></i>
							</div>
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

				<!-- <div class="col-md-3 focus-grid">
					<a href="products.html" class="wthree-btn wthree1">
						<div class="focus-image">
							<i class="fa fa-laptop"></i>
						</div>
						<h4 class="clrchg">电子数码</h4>
					</a>
				</div> -->
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
				<div class="clearfix"></div>
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
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-user" aria-hidden="true"></i>
					</div>
					<div class="ftr-top-right">
						<h4>顾客关怀</h4>
						<p>在这里有最贴心的客服，为您排忧解难！</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="col-md-4 ftr-top-grids">
					<div class="ftr-top-left">
						<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
					</div>
					<div class="ftr-top-right">
						<h4>优质高效</h4>
						<p>我们致力于为您提供最高效的购物平台，最优质的商品，竭诚为您服务！</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- 底部开头三个图标结束 -->
	<!-- 底部友情链接和反馈 -->
	<!-- <div class="subscribe">
		<div class="container">
			<div class="col-md-6 social-icons w3-agile-icons">
				<h4>关注我们</h4>
				<ul>
					<li><a href="#" class="fa fa-facebook icon facebook"> </a></li>
					<li><a href="#" class="fa fa-twitter icon twitter"> </a></li>
					<li><a href="#" class="fa fa-google-plus icon googleplus">
					</a></li>
					<li><a href="#" class="fa fa-dribbble icon dribbble"> </a></li>
					<li><a href="#" class="fa fa-rss icon rss"> </a></li>
				</ul>
				<ul class="apps">
					<li><h4>下载我们的app :</h4></li>
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
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div> -->
	<!-- 底部友情链接和反馈结束 -->
	<!-- 底部广告和功能菜单 -->
	<div class="footer">
		<div class="container">
			<div class="footer-info w3-agileits-info">
				<div class="col-md-4 address-left agileinfo">
					<div class="footer-logo header-logo">
						<h2>
							<a href="index.html"><span>S</span>mart <i>Bazaar</i></a>
						</h2>
						<h6>Your stores. Your place.</h6>
					</div>
					<ul>
						<li><i class="fa fa-map-marker"></i>光明路1号, 昆山 苏州市 江苏省 中国.</li>
						<li><i class="fa fa-mobile"></i> 333 222 3333</li>
						<li><i class="fa fa-phone"></i> +222 11 4444</li>
						<li><i class="fa fa-envelope-o"></i> <a
							href="mailto:example@mail.com"> mail@example.com</a></li>
					</ul>
				</div>
				<div class="col-md-8 address-right">
					<div class="col-md-4 footer-grids">
						<h3>消费者保障</h3>
						<ul>
							<li><a>保障范围</a></li>
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
			<p>Copyright &copy; 2018.解忧小铺 All rights reserved.</p>
		</div>
	</div>
	<!-- 底部结尾结束 -->
	<!-- 购物车-js -->
	<%-- <script src="<%=basePath%>js/minicart.js"></script>
	<script>
		w3ls.render();

		w3ls.cart.on('w3sb_checkout', function(evt) {
			var items, len, i;

			if (this.subtotal() > 0) {
				items = this.items();

				for (i = 0, len = items.length; i < len; i++) {
					items[i].set('shipping', 0);
					items[i].set('shipping2', 0);
				}
			}
		});
	</script> --%>
	<!-- 购物车-js-结束 -->
	<!-- 时间计数.js -->
	<script src="<%=basePath%>js/jquery.knob.js"></script>
	<script src="<%=basePath%>js/jquery.throttle.js"></script>
	<script src="<%=basePath%>js/jquery.classycountdown.js"></script>
	<script>
		$(document).ready(function() {
			$('#countdown1').ClassyCountdown({
				end : '1388268325',
				now : '1387999995',
				labels : true,
				style : {
					element : "",
					textResponsive : .5,
					days : {
						gauge : {
							thickness : .10,
							bgColor : "rgba(0,0,0,0)",
							fgColor : "#1abc9c",
							lineCap : 'round'
						},
						textCSS : 'font-weight:300; color:#fff;'
					},
					hours : {
						gauge : {
							thickness : .10,
							bgColor : "rgba(0,0,0,0)",
							fgColor : "#05BEF6",
							lineCap : 'round'
						},
						textCSS : ' font-weight:300; color:#fff;'
					},
					minutes : {
						gauge : {
							thickness : .10,
							bgColor : "rgba(0,0,0,0)",
							fgColor : "#8e44ad",
							lineCap : 'round'
						},
						textCSS : ' font-weight:300; color:#fff;'
					},
					seconds : {
						gauge : {
							thickness : .10,
							bgColor : "rgba(0,0,0,0)",
							fgColor : "#f39c12",
							lineCap : 'round'
						},
						textCSS : ' font-weight:300; color:#fff;'
					}

				},
				onEndCallback : function() {
					console.log("活动结束！！!");
				}
			});
		});
	</script>
	<!-- 时间计数.js-结束 -->
	<!-- 菜单 js  -->
	<script src="<%=basePath%>js/jquery.menu-aim.js">
		
	</script>
	<script src="<%=basePath%>js/main.js"></script>
	<!-- Resource jQuery -->
	<!-- 菜单 js 结束 -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>