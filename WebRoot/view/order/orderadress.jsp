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
<title>订单处理</title>
	 <script type="text/javascript" src='<%=basePath%>/js/jquery-2.2.3.min.js'></script>
		<script type="text/javascript">
		$(function() {
			setTimeout("changeDivStyle();", 100); // 0.1秒后展示结果，因为HTML加载顺序，先加载脚本+样式，再加载body内容。所以加个延时
		});
		function changeDivStyle(){
		//		var o_status = $("#o_status").val();	//获取隐藏框值
			var o_status =0;
			if(o_status==0){
				$('#create').css('background', '#DD0000');
				$('#createText').css('color', '#DD0000');
			}else if(o_status==1||o_status==2){
				$('#check').css('background', '#DD0000');
				$('#checkText').css('color', '#DD0000');
			}else if(o_status==3){
				$('#produce').css('background', '#DD0000');
				$('#produceText').css('color', '#DD0000');
			}else if(o_status==4){
				$('#delivery').css('background', '#DD0000');
				$('#deliveryText').css('color', '#DD0000');
			}else if(o_status>=5){
				$('#received').css('background', '#DD0000');
				$('#receivedText').css('color', '#DD0000');
			}
		}
		</script>
		
		<style type="text/css">
		*{margin:0;padding:0;list-style-type:none;}
		a,img{border:0;}
		body{background:#f2f2f2;font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
		/* stepInfo 
			border-radius：0为正方形，0~N，由正方形向圆形转化，N越大越圆。
			padding：图形的内边距
			background：图形背景色
			text-align：文本对齐
			line-height：行高
			color：文字颜色
			position：定位
			width：宽度
			height：高度
		*/
		.stepInfo{position:relative;background:#f2f2f2;margin:20px auto 0 auto;width:500px;}
		.stepInfo li{float:left;width:48%;height:0.15em;background:#bbb;}
		.stepIco{border-radius:1em;padding:0.03em;background:#bbb;text-align:center;line-height:1.5em;color:#fff; position:absolute;width:1.4em;height:1.4em;}
		.stepIco1{top:-0.7em;left:-1%;}
		.stepIco2{top:-0.7em;left:21%;}
		.stepIco3{top:-0.7em;left:46%;}
		.stepIco4{top:-0.7em;left:71%;}
		.stepIco5{top:-0.7em;left:95%;}
		.stepText{color:#666;margin-top:0.2em;width:4em;text-align:center;margin-left:-1.4em;}
		</style>
	 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	 <meta name="description" content=""/>
	 <meta name="format-detection" content="telephone=no" />
	 <meta name=""/>
 
	 <link rel="stylesheet" href="<%=basePath%>css/tasp.css" />
	 <link href="<%=basePath%>css/orderconfirm.css" rel="stylesheet" />
	
	<style>
		#page{width:auto;}
		#comm-header-inner,#content{width:950px;margin:auto;}
		#logo{padding-top:26px;padding-bottom:12px;}
		#header .wrap-box{margin-top:-67px;}
		#logo .logo{position:relative;overflow:hidden;display:inline-block;width:140px;height:35px;font-size:35px;line-height:35px;color:#f40;}
		#logo .logo .i{position:absolute;width:140px;height:35px;top:0;left:0;background:url(http://a.tbcdn.cn/tbsp/img/header/logo.png);}
	</style>

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
		
		<input type="hidden" value=${detailorder.status } id="o_status" /><!--后台传到页面的数据-->
		
		<div class="stepInfo">
			<ul>
				<li></li>
				<li></li>
			</ul>
			<div class="stepIco stepIco1" id="create">1
				<div class="stepText" id="createText">创建订单</div>
			</div>
			<div class="stepIco stepIco2" id="check">2
				<div class="stepText" id="checkText">审核订单</div>
			</div>
			<div class="stepIco stepIco3" id="produce">3
				<div class="stepText" id="produceText">生产</div>
			</div>
			<div class="stepIco stepIco4" id="delivery">4
				<div class="stepText" id="deliveryText">配送</div>
			</div>
			<div class="stepIco stepIco5" id="received">5
				<div class="stepText" id="receivedText">签收</div>
			</div>
		</div>
		<br><br><br><br>
	<div id="page">
	 <div id="content" class="grid-c">
	  <div id="address" class="address" style="margin-top: 20px;" data-spm="2">
		<form name="addrForm" id="addrForm" action="#">
		<h3>确认收货地址
	 <span class="manage-address">
	 <a href="http://member1.taobao.com/member/fresh/deliver_address.htm" target="_blank" title="管理我的收货地址"
	 class="J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.7">管理收货地址</a>
	 </span>
	 </h3>
	 <ul id="address-list" class="address-list">
	 	 <li class="J_Addr J_MakePoint clearfix  J_DefaultAddr "  data-point-url="http://log.mmstat.com/buy.1.20">
	 <s class="J_Marker marker"></s>
	 <span class="marker-tip">寄送至</span>
	   <div class="address-info">
	 <a href="#" class="J_Modify modify J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.21">修改本地址</a>
	 <input name="address"
	 class="J_MakePoint "
	 type="radio"
	 value="674944241"
	 id="addrId_674944241"
	 data-point-url="http://log.mmstat.com/buy.1.20"
	 ah:params="id=674944241^^stationId=0^^address=湖北民族学院（信息工程学院）  男生宿舍楼5栋102^^postCode=445000^^addressee=朱万雄^^phone=^^mobile=18727717260^^areaCode=422801"
	  checked="checked" >
	 <label for="addrId_674944241" class="user-address">
			 湖北省 恩施土家族苗族自治州 恩施市 湖北民族学院（信息工程学院）  男生宿舍楼235栋2323102 (某某 收) <em>18427717260</em>
	   </label>
	 <em class="tip" style="display: none">默认地址</em>
	 <a class="J_DefaultHandle set-default J_MakePoint" href="/auction/update_address_selected_status.htm?addrid=674944241" style="display: none" data-point-url="http://log.mmstat.com/buy.1.18">设置为默认收货地址</a>
	 </div>
		 </li>
		 <li class="J_Addr J_MakePoint clearfix"
	 data-point-url="http://log.mmstat.com/buy.1.20" >
	 <s class="J_Marker marker"></s>
	 <span class="marker-tip">寄送至</span>
	   <div class="address-info">
	 <a href="#" class="J_Modify modify J_MakePoint" data-point-url="#">修改本地址</a>
	 <input name="address"
	 class="J_MakePoint"
	 type="radio"
	 value="594209677"
	 id="addrId_594209677"
	 data-point-url="#"
	 ah:params="#"
	 >
	 <label for="addrId_594209677" class="user-address">
		   湖北省 恩施土家族苗族自治州 恩施市 某某某 (某某某 收) <em>1342407681</em></label><em class="tip" style="display: none">默认地址</em>
	   <a class="J_DefaultHandle set-default J_MakePoint" style="display: none" data-point-url="#" href="#">设置为默认收货地址</a>
	 </div>
	   </li>
		 </ul>
	<ul id="J_MoreAddress" class="address-list hidden">
		 
	 </ul>

	<div class="address-bar">
	 <a href="#" class="new J_MakePoint" id="J_NewAddressBtn">使用新地址</a>
	 </div>

	</form>
	</div>
	<form id="J_Form" name="J_Form" action="<%=basePath%>orderInfo/addOrder.do" method="post">
	 <input name='_tb_token_' type='hidden' value='IZpONoL2bm'>
	 <input type="hidden" name="action" value="order/confirmOrderAction" />
	 <input type="hidden" name="event_submit_do_confirm" value="1" />
	 <input type="hidden" id="J_InsuranceDatas" name="insurance_datas" value="" />
	 <input type="hidden" id="J_InsuranceParamCheck" name="insurance_param_check" value="" />
	 <input type="hidden" name="" id="J_checkCodeUrl" value="/auction/order/check_code.htm"/>
	   <input type="hidden"   name="need_not_split_sellers"  value="" />
	   <input type="hidden"   name="from"  value="cart" />
	   <input type="hidden"   name="cnData"  value="" />
	   <input type="hidden"   name="shop_id"  value="0"  class="J_FareParam" />
	   <input type="hidden"   name="cartShareTag"  value="" />
	   <input type="hidden"   name="flushingPictureServiceId"  value="" />
	   <input type="hidden"  id="J_channelUrl"   name="channel"  value="no-detail"  class="J_FareParam" />
	   <input type="hidden"   name="cinema_id"  value="" />
	   <input type="hidden"  id="item"   name="item"  value="35612993875_19614514619_1_31175333266_1704508670_0_0_0_cartCreateTime~1380269540000" />
	   <input type="hidden"  id="cartId"   name="cartId"  value="35612993875" />
	   <input type="hidden"  id="verticalParams"   name="verticalParams"  value="" />
	   <input type="hidden"   name="cross_shop_ids"  value="" />
	   <input type="hidden"   name="tmall_cross_shop_ids"  value="NULL" />
	   <input type="hidden"   name="buyer_from"  value="cart"  class="J_FareParam" />
	   <input type="hidden"   name="tbsc_channel_id"  value="0" />
	   <input type="hidden"   name="checkCodeIds"  value="35612993875_19614514619_1_31175333266_1704508670_0_0_0_cartCreateTime~1380269540000" />
	   <input type="hidden"  id="J_OrderInfoString"   name="orderInfoString"  value="1704508670:2:19614514619:31175333266:" />
	   <input type="hidden"  id="J_OrderInfoStringForCod"   name="orderInfoStringForCod"  value="1704508670_2,19614514619:31175333266:35612993875" />
	   <input type="hidden"   name="encryptString"  value="0A04F3D8F7EEDC813AFF8711BE47B9E5E96F6E86A391A4C2" />
	   <input type="hidden"   name="secondDivisionCode"  value="422801" />
	   <input type="hidden"   name="use_cod"  value="false"  class="J_FareParam" />
	   <input type="hidden"   name="1704508670:2|seq"  value="b_47285539868" />
	   <input type="hidden"   name="n_area"  value="422801" />
	   <input type="hidden"   name="n_city"  value="422800" />
	   <input type="hidden"   name="n_prov"  value="420000" />
	   <input type="hidden"   name="n_state"  value="0" />
	   <input type="hidden"   name="n_country"  value="1" />
	   <input type="hidden"  id="defaultId"   name="defaultId"  value="674944241" />
	   <input type="hidden"   name="postCode"  value="445000" />
	   <input type="hidden"   name="deliverAddr"  value="湖北民族学院（信息工程学院）  男生宿舍楼5栋102" />
	   <input type="hidden"   name="addressId"  value="674944241" />
	   <input type="hidden"   name="deliverMobile"  value="18727717260" />
	   <input type="hidden"   name="deliverName"  value="朱万雄" />
	   <input type="hidden"   name="deliverPhone"  value="" />
	   <input type="hidden"  id="divisionCode"   name="divisionCode"  value="422801" />
	   <input type="hidden"  id="J_CodAction"   name="CodAction"  value="http://delivery.taobao.com/cod/cod_payway.htm" />
	   <input type="hidden"  id="event_submit_do_cod_switcher"   name="event_submit_do_cod_switcher"  value="1" />
	   <input type="hidden"  id="J_CodActionNew"   name="CodActionNew"  value="cod/codOrder_switcher_action" />
	   <input type="hidden"   name="guest_buyer"  value="false" />
		 <input type="hidden" id="J_sid" name="sid" value="32457704949"/>
	 <input type="hidden" id="J_gmtCreate" name="gmtCreate" value="1380270550897"/>
	 <input type="hidden" name="secStrNoCCode" value="6dd2fa5d614e2ced1d3189b0c2da09c0"/>

	 <input type="hidden" id="J_TransferWarehouseId" name="overseasWarehouseId" value="" />
	 <input type="hidden" id="J_TransferWarehouseDivisionId" name="overseasWarehouseDivisionId" value="" />

	   <input type="hidden" id="paramString" value="tuan_type=0&use_cod=false&shop_id=0&item=35612993875_19614514619_1_31175333266_1704508670_0_0_0_cartCreateTime~1380269540000&buyer_from=cart&isRepost=true&"/>
	 <input type="hidden" id="J_StepPayData" value='""'/>
	 
	   <input type="hidden" name="unity" value="1" />

	<input type="hidden" name="buytraceid" value="" />
	<input type="hidden" name="activity" value="" />
	<input type="hidden" name="bankfrom" value="" />
	<input type="hidden" name="yfx315" value="" />

	<input type="hidden" id="J_channelUrl" name="channel" value="no-detail" class="J_FareParam"/>
	   <input type="hidden" id="J_actId" name="actId" value="" />
	   <input type="hidden" name="etkv" value=""/>
	   <input type="hidden" name="havePremium" value="false" />
	 <input type="hidden" name="cartShareTag" value="" />
	 <input type="hidden" name="flushingPictureServiceId" value="" />
			   <div>
	 <h3 class="dib">确认订单信息</h3>
	 <table cellspacing="0" cellpadding="0" class="order-table" id="J_OrderTable" summary="统一下单订单信息区域">
	 <caption style="display: none">统一下单订单信息区域</caption>
	 <thead>
	 <tr>
	 <th class="s-title">店铺宝贝<hr/></th>
	 <th class="s-price">单价(元)<hr/></th>
	 <th class="s-amount">数量<hr/></th>
	 <th class="s-agio">优惠方式(元)<hr/></th>
	 <th class="s-total">小计(元)<hr/></th>
	 </tr>
	 </thead>
		 


	<tbody data-spm="3" class="J_Shop" data-tbcbid="0" data-outorderid="47285539868"  data-isb2c="false" data-postMode="2" data-sellerid="1704508670">
	<tr class="first"><td colspan="5"></td></tr>
	<tr class="shop blue-line">
	 <td colspan="3">
	   店铺：<a class="J_ShopName J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.6" href="http://store.taobao.com/shop/view_shop.htm?shop_id=104337282"
	 target="_blank" title="淘米魅">淘米魅</a>
		 <span class="seller">卖家：<a href="http://member1.taobao.com/member/user_profile.jhtml?user_id=ac5831c32f47bc9267fcb75b71b5eed6" target="_blank" class="J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.15">淘米魅</a></span>
		 <span class="J_WangWang"  data-nick="淘米魅"   data-display="inline" ></span>
		
		</td>
	 <td colspan="2" class="promo">
	 <div>
	   <ul class="scrolling-promo-hint J_ScrollingPromoHint">
		   </ul>
	   </div>
	 </td>
	</tr>
	 <tr class="item" data-lineid="19614514619:31175333266:35612993875" data-pointRate="0">
	 <td class="s-title">
	   <a href="#" target="_blank" title="Huawei/华为 G520新款双卡双待安卓系统智能手机4.5寸四核手手机" class="J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.5">
		 <img src="http://img03.taobaocdn.com/bao/uploaded/i3/18670026332876589/T1A4icFbNeXXXXXXXX_!!0-item_pic.jpg_60x60.jpg" class="itempic"><span class="title J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.5">Huawei/华为 G520新款双卡双待安卓系统智能手机4.5寸四核手手机</span></a>

	   <div class="props">
		 <span>机身颜色: 黑 </span>
	   <span>手机套餐: 套餐二 </span>
	   <span>机身内存: 4G </span>
	   <span>版本: 中国大陆 </span>
			 </div>
	 <a title="消费者保障服务，卖家承诺商品如实描述" href="#" target="_blank">
	<img src="http://img03.taobaocdn.com/tps/i3/T1bnR4XEBhXXcQVo..-14-16.png"/>
	</a>
		<div>
	 <span style="color:gray;">卖家承诺72小时内发货</span>
	 </div>
		 </td>
	 <td class="s-price">
	   
	  <span class='price '>
	 <em class="style-normal-small-black J_ItemPrice"  >630.00</em>
	  </span>
	<input type="hidden" name="costprice" value="630.00" class="J_CostPrice" />
	</td>
	 <td class="s-amount" data-point-url="">
			 <input type="hidden" class="J_Quantity" value="1" name="19614514619_31175333266_35612993875_quantity"/>1
	 
	 </td>
	 <td class="s-agio">
		   <div class="J_Promotion promotion" data-point-url="">无优惠</div>
	   </td>
	 <td class="s-total">
	   
	   <span class='price '>
	 <em class="style-normal-bold-red J_ItemTotal "  >630.00</em>
	  </span>
		<input id="furniture_service_list_b_47285539868" type="hidden" name="furniture_service_list_b_47285539868"/>
	 </td>
	</tr>



	<tr class="item-service">
	 <td colspan="5" class="servicearea" style="display: none"></td>
	</tr>

	<tr class="blue-line" style="height: 2px;"><td colspan="5"></td></tr>
	<tr class="other other-line">
	 <td colspan="5">
	 <ul class="dib-wrap">
	 <li class="dib user-info">
	 <ul class="wrap">
	 <li>
	  <div class="field gbook">
	   <label>给卖家留言：</label>
	   <textarea style="width:350px;height:80px;" title="选填：对本次交易的补充说明（建议填写已经和卖家达成一致的说明）" name=""></textarea>
	 </div>
	</li>
	   </ul>
	 </li>
	 <li class="dib extra-info">

	 <div class="shoparea">
	 <ul class="dib-wrap">
	 <li class="dib title">店铺优惠：</li>
	 <li class="dib sel"><div class="J_ShopPromo J_Promotion promotion clearfix" data-point-url="http://log.mmstat.com/buy.1.16"></div></li>
	 <li class="dib fee">  <span class='price '>
	 -<em class="style-normal-bold-black J_ShopPromo_Result"  >0.00</em>
	  </span>
	</li>
	 </ul>
	 </div>

	 <div class="shoppointarea"></div>

	   <div class="farearea">
	 <ul class="dib-wrap J_farearea">
	 <li class="dib title">运送方式：</li>
	 <li class="dib sel" data-point-url="http://log.mmstat.com/jsclick?cache=*&tyxd=wlysfs">
	 <input type="hidden" name="1704508670:2|actualPaidFee" value="0" class="J_ActualPaidFee" />
	 <input type="hidden" name="1704508670:2|codAllowMultiple" value="true"/>
	 <input type="hidden" name="1704508670:2|codSellerFareFee" value="" class="J_CodSellerFareFee"/>
	 <input type="hidden" name="1704508670:2|codServiceFeeRate" value="" class="J_CodServiceFeeRate"/>
	 <input type="hidden" name="1704508670:2|codPostFee" value="0" class="J_CodPostFee"/>
	   <select name="1704508670:2|post" class="J_Fare">
		 <option data-fare="1500" value=" 2 " data-codServiceType="2" data-level=""  selected="selected"  >
	 快递 15.00元 
	 </option>
		   <option data-fare="2500" value=" 7 " data-codServiceType="7" data-level=""  >
	 EMS 25.00元 
	 </option>
		   <option data-fare="1500" value=" 1 " data-codServiceType="1" data-level=""  >
	 平邮 15.00元 
	 </option>
		 </select>
	   <em tabindex="0" class="J_FareFree" style="display: none">免邮费</em>
		 </li>
	 <li class="dib fee">  <span class='price '>
	 <em class="style-normal-bold-red J_FareSum"  >30.00</em>
	  </span>
	</li>
	 </ul>
	 </div>
	   <div class="extra-area">
	 <ul class="dib-wrap">
	 <li class="dib title">发货时间：</li>
	 <li class="dib content">卖家承诺订单在买家付款后，72小时内<a href="#">发货</a></li>
	 </ul>
	 </div>
	   
	   <div class="servicearea" style="display: none"></div>
	 </li>
	 </ul>
	 </td>
	</tr>

	<tr class="shop-total blue-line">
	 <td colspan="5">店铺合计(<span class="J_Exclude" style="display: none">不</span>含运费<span class="J_ServiceText" style="display: none">，服务费</span>)：
	   <span class='price g_price '>
	 <span>&yen;</span><em class="style-middle-bold-red J_ShopTotal"  >630.00</em>
	  </span>
	  <input type="hidden" name="1704508670:2|creditcard" value="false" />
	<input type="hidden" id="J_IsLadderGroup" name="isLadderGroup" value="false"/>

	   </td>
	</tr>
	</tbody>
	  <tfoot>
	 <tr>
	 <td colspan="5">

	<div class="order-go" data-spm="4">
	<div class="J_AddressConfirm address-confirm">
	 <div class="kd-popup pop-back" style="margin-bottom: 40px;">
	 <div class="box">
	 <div class="bd">
	 <div class="point-in">
	   
	   <em class="t">实付款：</em>  <span class='price g_price '>
	 <span>&yen;</span><em class="style-large-bold-red"  id="J_ActualFee"  >630.00</em>
	  </span>
	</div>

	  <ul >
	 <li><em>寄送至:</em><span id="J_AddrConfirm" style="word-break: break-all;">
	   湖北省 恩施土家族苗族自治州 恩施市 湖北民族学院（信息工程学院）  男生宿舍楼235栋1234202
	   </span></li>
	 <li><em>收货人:</em><span id="J_AddrNameConfirm">某某某 18124317260 </span></li>
	 </ul>
		 </div>
	 </div>
		<a href="view/shop/card.jsp" class="back J_MakePoint" target="_top" data-point-url="">返回购物车</a>
		   <button id="J_Go" class=" btn-go"  data-point-url="" style="border:thin;"  tabindex="0" title="点击此按钮，提交订单。">提交订单<b class="dpl-button"></b></button>
	  </div>
	 </div>

	 <div class="J_confirmError confirm-error">
	 <div class="msg J_shopPointError" style="display: none;"><p class="error">积分点数必须为大于0的整数</p></div>
	 </div>


	 <div class="msg" style="clear: both;">
	 <p class="tips naked" style="float:right;padding-right: 0">若价格变动，请在提交订单后联系卖家改价，并查看已买到的宝贝</p>
	 </div>
	 </div>
	 </td>
	 </tr>
	 </tfoot>
	 </table>
	</div>
	  
	 <input type="hidden" id="J_useSelfCarry" name="useSelfCarry" value="false" />
	 <input type="hidden" id="J_selfCarryStationId" name="selfCarryStationId" value="0" />
	 <input type="hidden" id="J_useMDZT" name="useMDZT" value="false" />
	 <input type="hidden" name="useNewSplit" value="true" />
	 <input type="hidden" id="J_sellerIds" name="allSellIds" value="1704508670" />
	</form>
	</div>

	<div id="footer"></div>
	</div>
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

