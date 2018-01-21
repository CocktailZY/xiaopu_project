<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>采购信息</title>
    <link href="${ctx}/UiMaker/css/style.css" rel="stylesheet"
	type="text/css" />
	<script type="text/javascript" src="${ctx}/UiMaker/js/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/UiMaker/custom/checkForm.js"></script>
	<script type="text/javascript">
	</script>
	
  </head>
  
  <body>
  	<form action="${ctx}/order/saveOrder.action" method="post">
  	<table align="center"  border="1" class="tablelist">
  		
  			<tr>
	  			<td>商品名称</td>
	  			<td>数量</td>
	  			<td>操作员</td>
  			</tr>
  			<c:forEach items="${requestScope.pageModel.items }" var="dto">
  				<tr>
	  				<td><a href="<%=request.getContextPath() %>/gonghuo/listAll.action?goodDto.id=${dto.goods.id }&num=${dto.num}">${dto.goods.goodName }</a></td>
	  				<td>${dto.num }</td>
	  				<td>${dto.user.username }</td>
	  				
  				</tr>
  			</c:forEach>
  			
  			<tr>
			  		<c:if test="${login_user.role.id eq 2}">
							<input type="hidden" name="dto.orderType.id" value="1">
							<div class="rightinfo">
								<input type="submit" value="点击生成入库单" >
							</div>
							
					</c:if>
					<c:if test="${login_user.role.id eq 3}">
						<input type="hidden" name="dto.orderType.id" value="2">
						<div class="rightinfo">
							<input type="submit" value="点击生成出库单">
						</div>
					</c:if>
			</tr>
  	</table>
  	</form>
  		<div class="pagin">
			<div class="message">
				共<i class="blue">${pageModel.pageCount}</i>页，当前显示第&nbsp;<i class="blue">${pageModel.page}&nbsp;</i>页
			</div>
			<ul class="paginList">
		<li class="paginItem"><a href="${ctx}/purchase/list.action?page=1">首页</a></li>
		<c:if test="${pageModel.page>1}">
			<li class="paginItem"><a href="${ctx}/purchase/list.action?page=${pageModel.prev}">上页</a></li>
		</c:if>

		<c:forEach var="pre" items="${pageModel.prevPages }">
			<li class="paginItem"><a href="${ctx}/purchase/list.action?page=${pre }">${pre}</a></li>
		</c:forEach>
		<li class="paginItem current"><a href="javascript:;">${pageModel.page }</a></li>
		<c:forEach var="next" items="${pageModel.nextPages }">
			<li class="paginItem"><a href="${ctx}/purchase/list.action?page=${next }">${next}</a></li>
		</c:forEach>

		<c:if test="${pageModel.page<pageModel.last}">
			<li class="paginItem"><a href="${ctx}/purchase/list.action?page=${pageModel.next}">下页</a></li>
		</c:if>
		<li class="paginItem"><a href="${ctx}/purchase/list.action?page=${pageModel.last}">尾页</a></li>
		</ul>
	</div>
  </body>
</html>