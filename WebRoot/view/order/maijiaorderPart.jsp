<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pingjia.jsp' starting page</title>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.css" type="text/css" />
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/example.css">
    <script type="text/javascript" src="<%=basePath%>/laydate/laydate.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.reveal.js"></script>
	<link rel="stylesheet" href="<%=basePath%>css/reveal.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/sweet-alert.css">
	<script src="<%=basePath%>js/sweet-alert.min.js"></script>
  </head>
  
  <body>
    <table border="1" align="center" class="table table-bordered data-table">
    	<tr>
    		<td>订单详情编号</td>
    		<td>订单编号</td>
    		<td>商品名</td>
    		<td>规格</td>
    		<td>购买数量</td>
    		<td>星级</td>
    		<td>总价</td>
    	</tr>
    	<c:forEach begin="0" end="${end-1 }" var="i">
	    	<tr>
	    		<td>${orderDetails[i].odId }</td>
	    		<td>${partid }</td>
	    		<td>${products[i].pName }</td>
	    		<td>${typeSpecss[i].tsTitle }--${specss[i].spFications }</td>
	    		<td>${orderDetails[i].odNum }</td>
	    		<td>
	    			<c:if test="${orderDetails[i].commState == -2 }">
	    				一颗星
	    			</c:if>
	    			<c:if test="${orderDetails[i].commState == -1 }">
	    				二颗星
	    			</c:if>
	    			<c:if test="${orderDetails[i].commState == 0 }">
	    				三颗星
	    			</c:if>
	    			<c:if test="${orderDetails[i].commState == 1 }">
	    				四颗星
	    			</c:if>
	    			<c:if test="${orderDetails[i].commState == 2 }">
	    				五颗星
	    			</c:if>
	    		</td>
	    		<td>${orderDetails[i].odTotal }</td>
	    		
	    	</tr>
    	</c:forEach>
    </table>
    
   
    </form>
  </body>
</html>
