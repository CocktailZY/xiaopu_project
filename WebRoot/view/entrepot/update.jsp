<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改仓库信息</title>
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
		<a href="<%=request.getContextPath()%>/supplier/list.action" class="my_a">返回</a>
	</div>
	<table border="1" class="tablelist">
		<form id="myForm" action="<%=request.getContextPath() %>/entrepot/save.action" method="post">
			<tr>
				<td>名称</td>
				<td>
					<input type="text" name="dto.entrepotName" value="${dto.entrepotName }">
					<input type="hidden" name="dto.id" value="${dto.id }">
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
