<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>采购 列表</title>
    <link href="${ctx}/UiMaker/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/UiMaker/js/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/UiMaker/custom/checkForm.js"></script>

  </head>
  
  <body>
  
  	<table border="1" class="tablelist">
  		<c:if test="${requestScope.pageModel.items.size() > 0}">
  			<tr>
	  			<td>商品名称</td>
	  			<td>采购数量</td>
	  			<td>采购员</td>
	  			<td>操作</td>
  			</tr>
  			
	  			<c:forEach items="${requestScope.pageModel.items }" var="purchase">
	  				<tr>
		  				<td>${purchase.goods.goodName }</td>
		  				<td>${purchase.num }</td>
		  				<td>${purchase.user.username }</td>
		  				<td><a href="${ctx }/purchase/delete.action?dto.id=${purchase.id}">删除</a></td>
	  				</tr>
	  			</c:forEach>
  			</c:if>
  			<c:if test="${requestScope.pageModel.items.size() <= 0}">
  				<tr>
	  				<td colspan="4">暂无数据</td>
  				</tr>
  			</c:if>
  	</table>
  	<c:if test="${requestScope.pageModel.items.size() > 0}">
	  	<div class="pagin">
			<div class="message">
				共<i class="blue">${pageModel.pageCount}</i>页，当前显示第&nbsp;<i class="blue">${pageModel.page}&nbsp;</i>页
			</div>
			<ul class="paginList">
				<li class="paginItem"><a href="${ctx}/purchase/list.action?page=1">首页</a></li>
				<li class="paginItem"><a href="${ctx}/purchase/list.action?page=${pageModel.prev}">上页</a></li>
				<li class="paginItem"><a href="${ctx}/purchase/list.action?page=${pageModel.next}">下页</a></li>
				<li class="paginItem"><a href="${ctx}/purchase/list.action?page=${pageModel.last}">尾页</a></li>
			</ul>
		</div>
	</c:if>
  </body>
</html>