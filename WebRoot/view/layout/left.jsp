<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" ></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${ctx}/UiMaker/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${ctx}/UiMaker/js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$(".menuson li .menuson li").click(function(){
		$(".menuson li .menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>
</head>
<body style="background: #f0f9fd;">
	<div class="lefttop">
		<span></span>进销存
	</div>
	<dl class="leftmenu">
		<c:if test="${login_user.role.id == 1 }">
		<dd>
			<div class="title">
				<span><img src="${ctx}/UiMaker/images/leftico01.png" /></span>系统管理
			</div>
			<ul class="menuson">
				<li><cite></cite><a href="${ctx}/good/list.action?dto.status=2" target="rightFrame">商品管理</a><i></i></li>
				<li><cite></cite><a href="${ctx}/goodType/list.action" target="rightFrame">商品类型管理</a><i></i></li>
				<li><cite></cite><a href="${ctx}/supplier/list.action" target="rightFrame">供应商管理</a><i></i></li>
				<li><cite></cite><a href="${ctx}/role/list.action" target="rightFrame">角色管理</a><i></i></li>
				<li><cite></cite><a href="${ctx}/user/list.action" target="rightFrame">用户管理</a><i></i></li>
			</ul>
		</dd>
		</c:if>
		<c:if test="${login_user.role.id == 3 }">
			<dd>
				<div class="title">
					<span><img src="${ctx}/UiMaker/images/leftico01.png" /></span>商品管理
				</div>
				<ul class="menuson">
					<li><cite></cite><a href="${ctx}/good/list.action?dto.status=2" target="rightFrame">商品信息管理</a><i></i></li>
				</ul>
			</dd>
		</c:if>
		<c:if test="${login_user.role.id == 4 || login_user.role.id == 1 }">
		<dd>
			<div class="title">
				<span><img src="${ctx}/UiMaker/images/leftico02.png" /></span>仓库管理
			</div>
			<ul class="menuson">
				<li><cite></cite><a href="${ctx}/entrepot/list.action" target="rightFrame">仓库信息管理</a><i></i></li>
				<li><cite></cite><a href="${ctx}/inventory/list.action" target="rightFrame">库存管理</a><i></i></li>
				<li><cite></cite><a href="${ctx}/purchase/addcg.action" target="rightFrame">填写采购单</a><i></i></li>
				<li><cite></cite><a href="${ctx}/purchase/list.action" target="rightFrame">查看采购单</a><i></i></li>
			</ul>
		</dd>
		</c:if>
		<c:if test="${login_user.otherId != 0 }">
		<dd>
			<div class="title">
				<span><img src="${ctx}/UiMaker/images/leftico04.png" /></span>供货管理
			</div>
			<ul class="menuson">
				<li><cite></cite><a href="${ctx}/gonghuo/listAll.action" target="rightFrame">供应商查看管理</a><i></i></li>
				<li><cite></cite><a href="${ctx}/gonghuo/add.action" target="rightFrame">供应商添加商品</a><i></i></li>
			</ul>
		</dd>
		</c:if>
		<c:if test="${login_user.otherId == 0 }">
		<dd>
			<div class="title">
				<span><img src="${ctx}/UiMaker/images/leftico04.png" /></span>订单管理
			</div>
			<ul class="menuson">
					<c:if test="${login_user.role.id == 2 }">
					<li><cite></cite><a href="${ctx}/purchase/list.action" target="rightFrame">查看采购单</a><i></i></li>
					<li><cite></cite><a href="${ctx}/purchase/addcg.action" target="rightFrame">填写采购单</a><i></i></li>
						<li><cite></cite><a href="${ctx}/order/list.action?dto.orderType.id=2" target="rightFrame">出库单</a><i></i></li>
					</c:if>
					<c:if test="${login_user.role.id == 3 }">
						<li><cite></cite><a href="${ctx}/purchase/addcg.action" target="rightFrame">填写采购单</a><i></i></li>
						<li><cite></cite><a href="${ctx}/order/list.action?dto.orderType.id=2" target="rightFrame">出库单</a><i></i></li>
					</c:if>
				<c:if test="${login_user.role.role_name eq '系统管理员' or login_user.role.role_name eq '仓库管理员'}">
					<li><cite></cite><a href="${ctx}/order/list.action?dto.orderType.id=1" target="rightFrame">入库单</a><i></i></li>
					<li><cite></cite><a href="${ctx}/order/list.action?dto.orderType.id=2" target="rightFrame">出库单</a><i></i></li>
					<li><cite></cite><a href="${ctx}/orderType/list.action" target="rightFrame">订单类型管理</a><i></i></li>
				</c:if>
			</ul>
		</dd>
		<dd>
			<div class="title">
				<span><img src="${ctx}/UiMaker/images/leftico04.png" /></span>顾客管理
			</div>
			<ul class="menuson">
				<li><cite></cite><a href="${ctx}/customer/customerAction_list.action" target="rightFrame">顾客信息管理</a><i></i></li>
			</ul>
		</dd>
		</c:if>
		<c:if test="${login_user.role.role_name eq '批发商' }">
		<dd>
			<div class="title">
				<span><img src="${ctx}/UiMaker/images/leftico04.png" /></span>批发商
			</div>
			<ul class="menuson">
				<li><cite></cite><a href="${ctx}/purchase/addcg.action" target="rightFrame">批发商品</a><i></i></li>
			</ul>
		</dd>
		</c:if>
		
	</dl>
</body>
</html>
