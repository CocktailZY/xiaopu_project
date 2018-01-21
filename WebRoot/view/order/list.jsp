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
		<table width="60%" border="1" class="tablelist">
		<c:if test="${requestScope.pageModel.items.size() > 0}">
			<tr>
				<th>编号</th>
				<th>创建时间</th>
				<th>操作员</th>
				<th>订单类型</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${requestScope.pageModel.items }" var="item">
				<tr>
					<td>${item.id }</td>
					<td>${item.orderTime }</td>
					<td>${item.user.username }</td>
					<td>${item.orderType.typeName }</td>
					<td>
						<c:if test="${item.status eq 0 }">未确认</c:if>
						<c:if test="${item.status eq 1 }">已确认</c:if>
					</td>
					<td>
						<c:if test="${item.status eq 0 }">
						<a href="<%=request.getContextPath()%>/order/delete.action?dto.id=${item.id}" class="my_a">删除</a>
						</c:if>
						<a href="<%=request.getContextPath()%>/order/listOrderId.action?dto.id=${item.id}" class="my_a">详情</a>
						
					</td>
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${requestScope.pageModel.items.size() <= 0}">
  				<tr>
	  				<td colspan="4">暂无数据</td>
  				</tr>
  			</c:if>
		</table>
	</div>
	<div class="pagin">
			<div class="message">
				共<i class="blue">${pageModel.pageCount}</i>页，当前显示第&nbsp;<i class="blue">${pageModel.page}&nbsp;</i>页
			</div>
			<ul class="paginList">
		<li class="paginItem"><a href="${ctx}/order/list.action?page=1">首页</a></li>
		<li class="paginItem"><a href="${ctx}/order/list.action?page=${pageModel.prev}">上页</a></li>

<%-- 		<c:forEach var="pre" items="${pageModel.prevPages }">
			<li class="paginItem"><a href="${ctx}/order/list.action?page=${pre }">${pre}</a></li>
		</c:forEach>
		<li class="paginItem current"><a href="javascript:;">${pageModel.page }</a></li>
		<c:forEach var="next" items="${pageModel.nextPages }">
			<li class="paginItem"><a href="${ctx}/order/list.action?page=${next }">${next}</a></li>
		</c:forEach>

 --%>		
		<li class="paginItem"><a href="${ctx}/order/list.action?page=${pageModel.next}">下页</a></li>
		<li class="paginItem"><a href="${ctx}/order/list.action?page=${pageModel.last}">尾页</a></li>
		</ul>
	</div>
	
</body>
</html>