<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'maijiaProductListPart.jsp' starting page</title>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.css" type="text/css" />
	<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
	<script type="text/javascript">
		function back(){
			$("#back").submit();
		}
	</script>

  </head>
  
  <body>
  	<div>
  		<button type="button" class="btn btn-success" onclick="back()">返回</button>
  		<form action="<%=basePath%>product/productList.do" id="back"></form>
  	
  	</div>
  	<!-- 商品的基本信息： 开始 -->
  	<table border="1" class="table table-hover">
  		<tr>
  			<td>商品名称</td>
  			<td>类型</td>
  			<!-- <td>品牌</td> -->
  			<td>折扣</td>
  			<td>描述</td>
  			<td>上架时间</td>
  		</tr>
  		<c:forEach items="${generals }" var="gs">
  			<tr>
    				<td>
    				<c:if test="${gs.product.pSpecial == 1 }">
    					(特)
    				</c:if>
    				<c:if test="${gs.product.pNew == 1 }">
    					(新)
    				</c:if>
    						${gs.product.pName }
    				
    				</td>
    				<td>
    					<c:if test="${leixing3 != null}">
    						${leixing3 }--
    					</c:if>
    					<c:if test="${leixing2 != null}">
    						${leixing2 }--
    					</c:if>
    					<c:if test="${leixing1 != null}">
    						${leixing1 }
    					</c:if>
    				
    				</td>
    				<%-- <td>${gs.brand.bName }</td> --%>
    				<td>${gs.product.pDiscount }</td>
    				<td>${gs.product.pContent }</td>
    				<td>${gs.product.pOntime }</td>
    				
    		</tr>
  		</c:forEach>
  	</table>
  	<!-- 商品的基本信息： 结束 -->
  	<!-- 商品的规格信息： 开始 -->
  	<table border="1" class="table table-hover">
  		<tr>
  			<c:forEach items="${guigeList }" var="gl">
	  			<td>
	  				<table border="1" class="table table-hover">
	  					<tr>
	  						<td>规格</td>
	  						<td>${gl.typeSpecs.tsTitle }</td>
	  					</tr>
	  					<tr>
	  						<td>规格详情</td>
	  						<td>${gl.specs.spFications }</td>
	  					</tr>
	  					<tr>
	  						<td>单价</td>
	  						<td>￥${gl.productSpecs.psPrice }元</td>
	  					</tr>
	  					<tr>
	  						<td>数量</td>
	  						<td>${gl.productSpecs.psNum }</td>
	  					</tr>
	  					<tr>
	  						<td>颜色</td>
	  						<td>${gl.productSpecs.psColor }</td>
	  					</tr>
	  				
	  				</table>
	  			
	  			</td>
  			</c:forEach>
  		</tr>
  	
  	</table>
  	<!-- 商品的规格信息： 结束 -->
  	<!-- 商品的图片信息： 开始 -->
  	<table>
  		<tr>
  			<c:forEach items="${imagesList }" var="il">
				<td><img alt="商品图片" src="<%=basePath %>fileUpload/${il.imAddress }" style="width: 300px;height: 150px;"></td>
			</c:forEach>	
  		</tr>
  	</table>
  	<!-- 商品的图片信息：结束 -->
  </body>
</html>
