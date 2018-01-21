<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单类型列表</title>
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
			<a href="<%=request.getContextPath()%>/good/list.action?dto.status=1" class="my_a">返回</a>
		</div>
		<table width="60%" border="1" class="tablelist">
			<tr>
				<th>编号</th>
				<th>创建时间</th>
				<th>用户</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${list }" var="item">
				<tr>
					<td>${item.id }</td>
					<td>${item.time }</td>
					<td>${item.customer.name }</td>
					<td>
						<c:if test="${item.status eq 0 }">
						<%-- <a href="<%=request.getContextPath()%>/order/qxsj.action?dto.id=${item.id}">未确认</a> --%>
						未确认
						<a href="<%=request.getContextPath()%>/sell/delete.action?dto.id=${item.id}" class="my_a">删除</a>
						</c:if>
						<c:if test="${item.status eq 1 }">
						已确认
						</c:if>
						<a href="<%=request.getContextPath()%>/sell/listSellinfo.action?dto.id=${item.id}" class="my_a">详情</a>
						
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>