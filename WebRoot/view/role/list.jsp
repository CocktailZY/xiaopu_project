<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>角色列表</title>
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
		<a href="<%=request.getContextPath()%>/view/role/add.jsp" style="text-decoration: none" class="my_a">添加角色</a>
	</div>
		<table width="60%" border="1" class="tablelist">
			<tr>
				<th>角色名称</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${requestScope.pageModel.items }" var="item">
				<tr>
					<td>${item.role_name }</td>
					<td>
						<a href="<%=request.getContextPath()%>/role/update.action?dto.id=${item.id}" style="text-decoration: none" class="my_a">修改</a>
						<a href="<%=request.getContextPath()%>/role/delete.action?dto.id=${item.id}" style="text-decoration: none" class="my_a">删除</a>
						<%-- <a href="<%=request.getContextPath()%>/common/Resource_listByRole.action?name=${item.id}" style="text-decoration: none">菜单管理</a> --%>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="pagin">
			<div class="message">
				共<i class="blue">${pageModel.pageCount}</i>页，当前显示第&nbsp;<i class="blue">${pageModel.page}&nbsp;</i>页
			</div>
			<ul class="paginList">
		<li class="paginItem"><a href="${ctx}/role/list.action?page=1">首页</a></li>
		<%-- <c:if test="${pageModel.page>1}"> --%>
			<li class="paginItem"><a href="${ctx}/role/list.action?page=${pageModel.prev}">上页</a></li>
		<%-- </c:if> --%>

		<%-- <c:forEach var="pre" items="${pageModel.prevPages }">
			<li class="paginItem"><a href="${ctx}/role/list.action?page=${pre }">${pre}</a></li>
		</c:forEach>
		<li class="paginItem current"><a href="javascript:;">${pageModel.page }</a></li>
		<c:forEach var="next" items="${pageModel.nextPages }">
			<li class="paginItem"><a href="${ctx}/role/list.action?page=${next }">${next}</a></li>
		</c:forEach> --%>

		<%-- <c:if test="${pageModel.page<pageModel.last}"> --%>
			<li class="paginItem"><a href="${ctx}/role/list.action?page=${pageModel.next}">下页</a></li>
		<%-- </c:if> --%>
		<li class="paginItem"><a href="${ctx}/role/list.action?page=${pageModel.last}">尾页</a></li>
		</ul>
	</div>
</body>
</html>