<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>增加用户</title>
<link href="${ctx}/UiMaker/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ctx}/UiMaker/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/UiMaker/custom/checkForm.js"></script>
<script type="text/javascript">
	var mark = true;
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
	
	$(function(){
		$("#username").blur(function(){
			if(mark){
				$.ajax({
					type:"post",
					async:true,
					
					url:"../login/loginajax.action",
					dataType:"json",
					data:{
						aaa:$("#username").val(),
					},
					success:function(j){
						$("#message").html(j.mes);
						mark = true;
					}
				});
			}
			
		});
	});
	function submitForm(){
		$('#myForm')[0].submit();
	}
	function resetForm(){
		mark = false;
		$("#message").html('');
		$('#myForm')[0].reset();
	}
</script>
</head>

<body>
<div align="center">
	<div class="uew-select" style="padding-top: 9px; padding-bottom: 9px; text-align: left;">
		<a href="<%=request.getContextPath()%>/user/list.action" class="my_a">返回</a>
	</div>
		<form id="myForm" action="<%=request.getContextPath() %>/user/save.action" method="post">
		<table border="1" class="tablelist">
			<tr>
				<td>用户名</td>
				<td><input type="text" id="username" name="dto.username" class="my_input">
					<label id="message" style="color: red; font-size: 3px"></label>
				</td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="text" name="dto.password" class="my_input"></td>
			</tr>
			<tr>
				<td>用户角色</td>
				<td>
					<select name="dto.role.id" class="my_select">
						<c:forEach items="${list }" var="item">
						<option value="${item.id }">${item.role_name }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr style="background-color: #f5f8fa;border-top: solid 1px #b6cad2;border-bottom: solid 1px #b6cad2;">
				<td colspan="2">
					<a href="javascript:submitForm()" class="my_a">提交</a>
					<a href="javascript:resetForm()" class="my_a">重置</a>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>
