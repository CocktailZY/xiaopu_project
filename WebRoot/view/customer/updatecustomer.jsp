<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>修改客户</title>
      <link href="<%=request.getContextPath() %>/UiMaker/css/style.css" rel="stylesheet"
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

  </head>
  
  <body>
  <div align="center">
	<div class="uew-select" style="padding-top: 9px; padding-bottom: 9px; text-align: left;">
		<a href="<%=request.getContextPath()%>/customer/customerAction_list.action" class="my_a">返回</a>
	</div>
    	<form id="myForm" action="<%=request.getContextPath() %>/customer/customerAction_update.action" method="post">
    		<table class="tablelist">
    			<tr>
    				<td>客户姓名：</td>
    				<td><input type="text" name="customer.name" value="${customer.name }" class="my_input">
    				<input type="hidden" name="customer.id" value="${customer.id}">
    				</td>
    			</tr>
    			<tr>
    				<td>密码：</td>
    				<td><input type="text" name="user.password" value="${login_user.password }" class="my_input"></td>
    			</tr>
    			<tr>
    				<td>联系方式：</td>
    				<td><input type="text" name="customer.phone" value="${customer.phone }" class="my_input"></td>
    			</tr>
    			<tr>
    				<td>地址：</td>
    				<td><input type="text" name="customer.address" value="${customer.address }" class="my_input"></td>
    			</tr>
    			<tr style="background-color: #f5f8fa;border-top: solid 1px #b6cad2;border-bottom: solid 1px #b6cad2;">
					<td colspan="2">
						<a href="javascript:submitForm()" class="my_a">提交</a>
					</td>
				</tr>
    		</table>
    	
    	</form>
   	</div>
  </body>
</html>
