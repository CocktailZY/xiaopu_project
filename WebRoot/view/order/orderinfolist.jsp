<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单详情信息</title>
    <link href="${ctx}/UiMaker/css/style.css" rel="stylesheet"
	type="text/css" />
	<script type="text/javascript" src="${ctx}/UiMaker/js/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/UiMaker/custom/checkForm.js"></script>
  </head>
  
  <body>
  <div align="center">
	<div class="uew-select" style="padding-top: 9px; padding-bottom: 9px; text-align: left;">
		<a href="<%=request.getContextPath()%>/order/list.action?dto.orderType.id=${orderdto.orderType.id}">返回</a>
	</div>
  	<form action="<%=request.getContextPath()%>/order/qxsj.action" method="post">
  		<table align="center"  border="1" class="tablelist">
  	
  		
  			<tr>
	  			<td>商品名称</td>
	  			<td>数量</td>
	  			<td>进价</td>
	  			<td>操作员</td>
	  			
  			</tr>
  			<c:forEach items="${requestScope.pageModel.items }" var="ord">
  				<!-- 订单编号 -->
  				<input type="hidden" name="dto.count" value="${ord.order.id}">
  				<!-- 数量 -->
  				<input type="hidden" name="orderinfoDto.count" value="${ord.count}">
  				<!-- 商品编号 -->
  				<input type="hidden" name="orderinfoDto.goods.goodsn" value="${ord.goods.id}">
  				<!-- 订单类型 -->
  				<input type="hidden" name="dto.orderTime" value="${orderdto.orderType.id}">
  				<!-- 商品进价 -->
  				<input type="hidden" name="dto.price" value="${ord.jprice }">
  				<tr>
	  				<td>${ord.goods.goodName }</td>
	  				<td>${ord.count }</td>
	  				<td>${ord.jprice }</td>
	  				<td>${ord.order.user.username }</td>
  				</tr>
  			</c:forEach>
  				<c:if test="${login_user.role.id == 4 || login_user.role.id == 1}">
  					<tr>
		  				<td colspan="4" align="center">
		  					<input type="submit" value="确认订单">
		  				</td>
  					</tr>
  				</c:if>
  			
  			</table>
  	</form>
  	</div>
  	<div class="pagin">
			<div class="message">
				共<i class="blue">${pageModel.pageCount}</i>页，当前显示第&nbsp;<i class="blue">${pageModel.page}&nbsp;</i>页
			</div>
			<ul class="paginList">
		<li class="paginItem"><a href="${ctx}/order/listOrderId.action?page=1">首页</a></li>
		<c:if test="${pageModel.page>1}">
			<li class="paginItem"><a href="${ctx}/order/listOrderId.action?page=${pageModel.prev}">上页</a></li>
		</c:if>

		<c:forEach var="pre" items="${pageModel.prevPages }">
			<li class="paginItem"><a href="${ctx}/order/listOrderId.action?page=${pre }">${pre}</a></li>
		</c:forEach>
		<li class="paginItem current"><a href="javascript:;">${pageModel.page }</a></li>
		<c:forEach var="next" items="${pageModel.nextPages }">
			<li class="paginItem"><a href="${ctx}/order/listOrderId.action?page=${next }">${next}</a></li>
		</c:forEach>

		<c:if test="${pageModel.page<pageModel.last}">
			<li class="paginItem"><a href="${ctx}/order/listOrderId.action?page=${pageModel.next}">下页</a></li>
		</c:if>
		<li class="paginItem"><a href="${ctx}/order/listOrderId.action?page=${pageModel.last}">尾页</a></li>
		</ul>
	</div>
  </body>
</html>