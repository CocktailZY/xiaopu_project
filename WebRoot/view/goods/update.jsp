<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改商品信息</title>
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
	}function submitForm(){
		$('#myForm')[0].submit();
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
		<a href="<%=request.getContextPath()%>/good/list.action" class="my_a">返回</a>
	</div>
	<table border="1" class="tablelist">
		<form id="myForm" action="<%=request.getContextPath() %>/good/save.action" method="post">
		<input type="hidden" name="dto.id" value="${dto.id }">
			<tr>
				<td>商品名称</td>
				<td><input type="text" name="dto.goodName" value="${dto.goodName }" class="my_input"></td>
			</tr>
			<tr>
				<td>售价</td>
				<td><input type="text" name="dto.price" value="${dto.price }" class="my_input"></td>
			</tr>
			<tr>
				<td>上架数量</td>
				<td><input type="text" name="dto.onNum" value="${dto.onNum }" class="my_input"></td>
			</tr>
			<tr>
				<td>折扣</td>
				<td><input type="text" name="dto.discount" value="${dto.discount }" class="my_input"></td>
			</tr>
			<tr>
				<td>商品类型</td>
				<td>
					<select name="dto.goodType.id" class="my_select">
						<c:forEach items="${tlist }" var="item">
						<c:choose>
							<c:when test="${dto.goodType.id eq item.id }">
								<option value="${item.id }" selected="selected">${item.typeName }</option>
							</c:when>
							<c:otherwise>
								<option value="${item.id }">${item.typeName }</option>
							</c:otherwise>
						</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<%-- <tr>
				<td>供应商</td>
				<td>
					<select name="dto.supplier.supId">
						<c:forEach items="${suplist }" var="item">
						<option value="${item.id }">${item.supName }</option>
						</c:forEach>
					</select>
				</td>
			</tr> --%>
			<tr>
				<td>商品状态</td>
				<td>
					<input type="hidden" name="dto.status" value="${dto.status }" class="my_input">
					<c:if test="${dto.status eq 0 }">
					未上架
					</c:if>
					<c:if test="${dto.status eq 1 }">
					已上架
					</c:if>
				</td>
			</tr>
			<tr style="background-color: #f5f8fa;border-top: solid 1px #b6cad2;border-bottom: solid 1px #b6cad2;">
				<td colspan="2">
					<a href="javascript:submitForm()" class="my_a">提交</a>
				</td>
			</tr>
		</form>
	</table>
	</div>
</body>
</html>
