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
	$(document).ready(function() {
		$(".click").click(function() {
			$(".tip").fadeIn(200);
		});

		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

	});

	function aa() {
		if ("${goods.pagenum}" == 1) {
			alert("没有上一页！");
		}
	}
</script>
<style type="text/css">
	a{
		text-decoration: none;
	}
</style>
</head>
<body>
	<div align="center">
	<div class="uew-select" style="padding-top: 9px; padding-bottom: 9px; text-align: left;">
		<a href="<%=request.getContextPath()%>/supplier/add.action" class="my_a">添加供应商</a>
	</div>
		<table width="60%" border="1" class="tablelist">
			<tr>
				<th>编号</th>
				<th>供应商名称</th>
				<th>联系电话</th>
				<th>联系地址</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${list }" var="item">
				<tr>
					<td>${item.id }</td>
					<td>${item.supName }</td>
					<td>${item.tel }</td>
					<td>${item.address }</td>
					<td>
						<a href="<%=request.getContextPath()%>/supplier/update.action?dto.id=${item.id}" class="my_a">修改</a>
						<a href="<%=request.getContextPath()%>/supplier/delete.action?dto.id=${item.id}" class="my_a">删除</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>