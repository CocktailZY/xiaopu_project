<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>客户列表</title>
      <link href="<%=request.getContextPath() %>/UiMaker/css/style.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
	<div align="center">
	  	<div class="uew-select" style="padding-top: 9px; padding-bottom: 9px; text-align: left;">
			<a href="<%=request.getContextPath() %>/view/customer/addcustomer.jsp" class="my_a">添加客户</a>
		</div>
		<table width="60%" border="1" class="tablelist">
			<tr>
				<th>客户姓名</th>
				<th>联系方式</th>
				<th>地址</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${list }" var="customer">
			<tr>
				<td>${customer.name }</td>
				<td>${customer.phone }</td>
				<td>${customer.address }</td>
				<td>
					<a href="<%=request.getContextPath() %>/customer/customerAction_delete.action?customerid=${customer.id}" class="my_a">删除</a>
					<a href="<%=request.getContextPath() %>/customer/customerAction_edit.action?customerid=${customer.id}" class="my_a">修改</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
  </body>
</html>
