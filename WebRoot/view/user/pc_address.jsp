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
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
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
<link href="<%=basePath%>css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/addstyle.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"> 
<script src="<%=basePath%>js/jquery-3.0.0.js" type="text/javascript"></script>
<script src="<%=basePath%>AmazeUI-2.4.2/assets/js/amazeui.js"></script>
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
	<!-- <script type="text/javascript">
		$(document).ready(function() {
		
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script> -->
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
									<img src="<%=basePath%>fileUpload/${loginUser.uHead}" style="height: 60px;width: 60px;" />
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
			<div class="container1">
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
			<h3 class="w3ls-title w3ls-title1">个人信息</h3>  
				<div class="center">
				<div class="col-main">
					<div class="main-wrap" style="width:80%;">

					<div class="user-address">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
						</div>
						<hr/>
						<!-- 作用：1：修改默认地址2：根据传出的地址id回调地址信息 -->
						<script type="text/javascript">
							function defaul(addId){
								$.ajax({
									type:"post",
									async:true,
									url:"<%=basePath%>address/changeAddState.do",
									dataType:"json",
									data:{
										addId:addId,
									},
								});
							}
							
							function change(addId){
								$.ajax({
									type:"post",
									async:true,
									url:"<%=basePath%>address/findById.do",
									dataType:"json",
									data:{
										addId:addId,
									},
									success:function(data){
										var dataObj=eval(data);
										new PCAS('location_p', 'location_c', 'location_a',data.shen, data.shi, data.xian);
										$("#location_x").text(data.jie);
										$("#addId").val(data.addr.addId);
										$("#addName").val(data.addr.addName);
										$("#addState").val(data.addr.addState);
										$("#tel").val(data.addr.addTel);
									},
									error:function(){
										alert("出现异常");
									}
							});
							}
						</script>
						<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
							<c:forEach items="${addList}" var="list">
								<c:choose>
									<c:when test="${list.addState == 1}">
										<li class="user-addresslist defaultAddr">
									</c:when>
									<c:otherwise>
										<li class="user-addresslist">
									</c:otherwise>
								</c:choose>
									<span class="new-option-r" onclick="defaul('${list.addId}')"><i class="am-icon-check-circle" ></i>默认地址</span>
									<p class="new-tit new-p-re">
										<span class="new-txt">${list.addName}</span>
										<span class="new-txt-rd2">${list.addTel}</span>
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="title">${list.address}</span>
										</p>
									</div>
									<div class="new-addr-btn">
										<a href="javascript:change(${list.addId})"><i class="am-icon-edit"></i>编辑</a>
										<span class="new-addr-bar">|</span>
										<a href="<%=basePath%>address/deleteById.do?addId=${list.addId}" onClick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
									</div>
								</li>
							</c:forEach>
							
						</ul>
						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<!-- 作用：1，新增 2，修改  3，删除  4，检查 -->
									<script type="text/javascript">
										var flag1;
										var flag2;
										function emp(){
											document.getElementById("f2").reset();
											new PCAS('location_p', 'location_c', 'location_a','${shen}', '${shi}', '${xian}');
											$("#addName").val('');
											$("#tel").val('');
											$("#location_x").empty();
											$("#addId").val('');
											$("#addState").val('');
										}
										function tip1(){
											$("#span1").html("<font color='black'>支持2-6个中文组成</font>");
										}
										function checkAddname(){
											var x = 0;
											if($("#addName").val().length>0){
												var addName = $("#addName").val();
												var regStr = /[\u4E00-\u9FA5]{2,6}/g;
												if(regStr.test(addName)){
													$("#span1").html("<font color='green'>收货人姓名合格</font>");
													flag1 = true;
												}else{
													$("#span1").html("<font color='red'>收货人姓名不符合规则</font>");
													flag1 = false;
												}
												
											}else{
												$("#span1").html("<font color='red'>收货人姓名不得为空</font>");
												flag1 = false;
											}
										}
										
										function tip2(){
											$("#span2").html("<font color='black'>输入常用手机号码</font>");
										}
										function checkAddNumber(){
											var y = 0;
											if($("#tel").val().length>0){
												var tel = $("#tel").val();
												var regStr =/^1[3|4|5|7|8]\d{9}$/;
												if(regStr.test(tel)){
													$("#span2").html("<font color='green'>手机号码合格</font>");
													flag2 = true;
												}else{
													$("#span2").html("<font color='red'>手机号码不合格，请重填</font>");
													flag2 = false;
												}
												
											}else{
												$("#span2").html("<font color='red'>手机号码不得为空</font>");
												flag12 = false;
											}
										}
										
										function checkX(){
											if($("#location_x").val().length>0){
												$("#span3").html("<font color='green'>请尽量填写详细</font>");
											}else{
												$("#span3").html("<font color='red'>详细地址不得为空</font>");
											}
										}
										
										function sub(){
											if($("#addName").val().length>0){
												if($("#tel").val().length>0){
													if($("#location_x").val().length>0){
														if(flag1){
															if(flag2){
																$("#f2").submit();
															}else{
																$("#span2").html("<font color='red'>手机号码不合格，请重填</font>");
															}
														}else{
															$("#span1").html("<font color='red'>收货人姓名不符合规则</font>");
														}
													}else{
														$("#span3").html("<font color='red'>详细地址不得为空</font>");
													}
												}else{
													$("#span2").html("<font color='red'>手机号码不得为空</font>");
												}
												
											}else{
												$("#span1").html("<font color='red'>收货人姓名不得为空</font>");
											}
										}
									</script>
									<form id="f2" class="am-form am-form-horizontal" action="<%=basePath%>address/saveAdd.do" method="post">

										<div class="am-form-group">
											<label for="user-name" class="am-form-label" >收货人</label>
											<div class="am-form-content">
												<!-- 地址id -->
												<input type="hidden" id="addId" name="addId" value=""/>
												<!-- 地址状态 -->
												<input type="hidden" id="addState" name="addState" value=""/>
												<span id="span1" style=""></span>
												<input type="text" id="addName" name="addName" placeholder="收货人" onblur="checkAddname()" onclick="tip1()">
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-phone" class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<span id="span2" style=""></span>
												<input type="text" id="tel" name="addTel" placeholder="手机号必填" value="" onblur="checkAddNumber()" onclick="tip2()">
											</div>
										</div>
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">所在地</label>
											<div class="am-form-content address">
												<!-- 这里有个样式， data-am-selected，有时间就改-->
												<select name="location_p" id="location_p"></select>
												<select name="location_c" id="location_c"></select>
												<select name="location_a" id="location_a"></select>
												<script type="text/javascript" src="<%=basePath%>js/region_select.js"></script>
												<script type="text/javascript">
													new PCAS('location_p', 'location_c', 'location_a','${shen}', '${shi}', '${xian}');
												</script>
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<span id="span3" style=""></span>
												<textarea class="" rows="3" id="location_x" name="location_x" placeholder="输入详细地址" value="" onblur="checkX()""></textarea>
												<small>30字以内写出你的详细地址...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<a href="javascript:sub()" class="am-btn am-btn-danger">保存</a>
												<%--<a href="javascript:emp()" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>--%>
												<input type="button" value="取消" class="am-close am-btn am-btn-danger" data-am-modal-close onclick="javascript:emp()">
											</div>
										</div>
									</form>
								</div>

							</div>

						</div>

					</div>

					<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent(".user-addresslist").addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						})
					</script>

					<div class="clear"></div>

				</div>
				</div>
				
				
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
			<p>Copyright &copy; 2016.实训第二组  All rights reserved.</p>
		</div>
	</div>
	<!-- 底部结尾结束 -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster --> 
</body>
</html>