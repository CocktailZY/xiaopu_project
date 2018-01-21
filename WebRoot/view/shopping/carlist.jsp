<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
    <link href="${ctx}/UiMaker/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/UiMaker/js/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/UiMaker/custom/checkForm.js"></script>
	<script type="text/javascript">
	function save(){
		$("#idform").submit();
	}

</script>
  </head>
  
  <body>
  <div align="center">
  	<center><h3>购物车</h3></center>
	<div class="uew-select" style="padding-top: 9px; padding-bottom: 9px; text-align: left;">
		<a href="<%=request.getContextPath()%>/good/list.action?dto.status=1" class="my_a">返回</a>
	</div>
	<c:if test="${list.size() > 0 }">
		<form action="${ctx}/sell/save.action" method="post" id="idform">
		<!-- 商品id -->
			<input type="hidden" name="dto.goodsn" id="ids" value="${ids }">
			<input type="hidden" name="dto.nums" id="total" value="${numms }">
			<input type="hidden" name="numm" id="numm" value="${nums }">
			<input type="hidden" name="ccid" id="ccid" value="${purchs }">
			<input type="hidden" name="dto.allprice" id="allprice" value="${total }">
		</form>
	  	<table border="1" class="tablelist">
	  			<tr>
		  			<td>商品名称</td>
		  			<td>购买数量</td>
		  			<td>价钱</td>
		  			<td>用户</td>
		  			<td>操作</td>
	  			</tr>
	  			<c:forEach items="${list }" var="purchase">
	  				<tr>
		  				<td>${purchase.goods.goodName }</td>
		  				<td>${purchase.num }</td>
		  				<td>${purchase.jprice }</td>
		  				<td>${purchase.customer.name }</td>
		  				<td><a href="${ctx }/sell/deletecar.action?carDto.id=${purchase.id}" class="my_a">删除</a></td>
	  				</tr>
	  			</c:forEach>
	  	</table>
	  	<div style="height:1px; width:100%; background-color:floralwhite;"></div>
	  	<table align="center" border="1" class="tablelist" >
			<tr>
				<td>姓名:</td>
				<td><input type="text" class="bot_in my_input" id="name" value="${customer.name }"/></td>
			</tr>
			<tr>
				<td>联系方式:</td>
				<td><input type="text" class="bot_in my_input" id="tele" value="${customer.phone }"/></td>
			</tr>
			<tr>
				<td>地址:</td>
				<td><input type="text" class="bot_in my_input" id="address" value="${customer.address }"/></td>
			</tr>
			<tr style="background-color: #f5f8fa;border-top: solid 1px #b6cad2;border-bottom: solid 1px #b6cad2;">
				<td colspan="2">
				总计：<input type="text" id="count" value="${total }" readonly="readonly">
					<a href="javascript:save()" class="my_a">生成订单</a>
				</td>
			</tr>
		</table>
  	</c:if>
  	<c:if test="${list.size() <= 0 }">
  		<p>购物车空空如也！</p>
  	</c:if>
	
  	</div>
  </body>
</html>