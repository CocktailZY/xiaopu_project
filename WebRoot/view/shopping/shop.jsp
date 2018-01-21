<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品列表</title>
<link href="${ctx}/UiMaker/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ctx}/UiMaker/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/UiMaker/custom/checkForm.js"></script>
<script type="text/javascript">
	function save(){
		var ids = '';
		var num = '';
		var checks = document.getElementsByName("checks");
		var nums = document.getElementsByName("nums");
		for ( var i = 0; i < checks.length; i++) {
			if (checks[i].checked == true) {
				ids = ids + checks[i].value + ",";
				num = num +nums[i].value+",";
			}
		}
		document.getElementById("ids").value = ids;
		document.getElementById("num").value = num;
		document.getElementById("idform").submit();
	}
	
	function onCheckall() {
		var checkall = document.getElementById("checkall");
		var checks = document.getElementsByName("checks");
		if (checkall.checked == true) {
			for ( var i = 0; i < checks.length; i++) {
				checks[i].checked = true;

			}
		} else {
			for ( var i = 0; i < checks.length; i++) {
				checks[i].checked = false;
			}
		}
	}
	

</script>
</head>
<body>
	<center><h3>商品选购列表</h3></center>
	<div align="center">
	<div class="uew-select" style="padding-top: 9px; padding-bottom: 9px; text-align: left;">
		<a href="${ctx}/user/logout.action" class="my_a">退出</a>
		<a href="${ctx}/customer/customerAction_edit.action?customerid=${login_user.otherId}" class="my_a">修改个人信息</a>
		<a href="${ctx}/sell/list.action?flag=1" class="my_a">我的订单</a>
		<a href="${ctx}/sell/list.action?flag=2" class="my_a">我的购物车</a>
	</div>
	<form action="${ctx}/sell/addCar.action" method="post" id="idform">
		<!-- 商品id -->
		<input type="hidden" name="dto.goodsn" id="ids">
		<input type="hidden" name="dto.nums" id="num">
		<table width="60%" border="1" class="tablelist">
			<tr>
					<th>
    					<input type="checkbox" id="checkall" onclick="onCheckall()">
					</th>
				<th>编号</th>
				<th>商品名称</th>
				<th>零售单价</th>
				<th>商品类型</th>
				<th>购买数量</th>
			</tr>
			<c:forEach items="${list }" var="item">
				<tr>
					
					<td><input type="checkbox" name="checks" value="${item.id }"></td>
					<td>
						${item.id }
					</td>
					<td>${item.goodName }</td>
					<td>
						${item.price }
					</td>
					<td>${item.goodType.typeName }</td>
					<td><input type="text" name="nums" value="1" id="num" class="my_input"></td>
				</tr>
					
			</c:forEach>
			<tr style="background-color: #f5f8fa;border-top: solid 1px #b6cad2;border-bottom: solid 1px #b6cad2;">
				<td colspan="6">
					<a href="javascript:save()" class="my_a">生成订单</a>
				</td>
			</tr>
			
		</table>
	</form>
	</div>
	<div class="pagin">
		<div class="message">
			共<i class="blue">${page.pageCount}</i>页，当前显示第&nbsp;<i class="blue">${page.pageNum}&nbsp;</i>页
		</div>
		<ul class="paginList">
			<li class="paginItem"><a href="<%=request.getContextPath()%>/good/list.action?dto.status=1&pageNum=1">首页</a></li>
				<li class="paginItem"><a href="<%=request.getContextPath()%>/good/list.action?dto.status=1&pageNum=${page.pageNum - 1}">上页</a></li>
	
				<li class="paginItem"><a href="<%=request.getContextPath()%>/good/list.action?dto.status=1&pageNum=${page.pageNum + 1}">下页</a></li>
			<li class="paginItem"><a href="<%=request.getContextPath()%>/good/list.action?dto.status=1&pageNum=${page.pageCount}">尾页</a></li>
		</ul>
	</div>
</body>
</html>