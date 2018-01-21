<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>增加商品</title>
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
	function submitForm(){
		$('#myForm')[0].submit();
	}
	function resetForm(){
		$('#myForm')[0].reset();
	}
</script>
</head>

<body>
<div align="center">
	<div class="uew-select" style="padding-top: 9px; padding-bottom: 9px; text-align: left;">
		<a href="<%=request.getContextPath()%>/good/list.action?dto.status=2" class="my_a">返回</a>
	</div>
	<table border="1" class="tablelist">
		<form id="myForm" action="<%=request.getContextPath() %>/good/save.action" method="post">
			<tr>
				<td>商品名称</td>
				<td><input type="text" name="dto.goodName" class="my_input"></td>
			</tr>
			<tr>
				<td>商品类型</td>
				<td>
					<select name="dto.goodType.id" class="my_select">
						<c:forEach items="${tlist }" var="item">
							<option value="${item.id }">${item.typeName }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr style="background-color: #f5f8fa;border-top: solid 1px #b6cad2;border-bottom: solid 1px #b6cad2;">
				<td colspan="2">
					<a href="javascript:submitForm()" class="my_a">提交</a>
					<a href="javascript:resetForm()" class="my_a">重置</a>
					<!-- <input type="submit" value="提交" class="my_input"> -->
					<!-- <input type="reset" value="重置" class="my_input"> -->
				</td>
			</tr>
		</form>
	</table>
	</div>
</body>
</html>
