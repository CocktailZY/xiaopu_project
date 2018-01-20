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
    
    <title>My JSP 'maijaProductList.jsp' starting page</title>
    
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>/laydate/laydate.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-3.0.0.js"></script>
	<script type="text/javascript">
		$(function(){
			if($("#cxpSpecial").val() != "404"){
				$("input[name=cxpSpecial]").val($("#cxpSpecial").val());
				$("input[name=cxpSpecial]").attr("checked","checked");
			
			}
			if($("#cxpNew").val() != "404"){
				$("input[name=cxpNew]").val($("#cxpNew").val());
				$("input[name=cxpNew]").attr("checked","checked");
			
			}
			var begin = '${begin }';
			if(begin != ""){
				$("#haha").remove();
			}else{
				$("#heihei").remove();
				
			}
			
			
		}) 
		
	</script>
	
	<script type="text/javascript">
    	function paging(pageNum){
			document.getElementById("pageNum").value = pageNum;
			document.getElementById("findFrom").submit();
		}
    </script>
	<script type="text/javascript">
		function Operation(fangfa,pid){
			$("#pId").val(pid);
			if(fangfa=="part"){
				
				$("#tiaozhuanForm").attr("action","<%=basePath%>product/productpart.do");
				$("#tiaozhuanForm").submit();
			
			}
			if(fangfa=="update"){
				
				$("#tiaozhuanForm").attr("action","<%=basePath%>product/productupdate.do");
				$("#tiaozhuanForm").submit();
			
			}
			if(fangfa=="del"){
				if(window.confirm('你确定要删除吗？')){
			                
			        $("#tiaozhuanForm").attr("action","<%=basePath%>product/productdel.do");
					$("#tiaozhuanForm").submit();
			     }else{
			          return false;
			     }
				
			
			}
			if(fangfa=="evaluate"){
				
				$("#tiaozhuanForm").attr("action","<%=basePath%>product/productevaluate.do");
				$("#tiaozhuanForm").submit();
			
			}
			
		
		}
	
	</script>
	<script type="text/javascript">
		function chaxunleixing(){
			$("#findFrom").submit();
			
		}
	
	</script>
  </head>
  
  <body>
  	
  
  
    <form action="<%=basePath%>product/productList.do" method="post" id="findFrom">
    	<!-- 将当前页数放到隐藏域中，并传回后台 -->
    	<input type="hidden" id="pageNum" name="pageNum">
    	<!-- 模糊查询： 开始 -->
    	<div align="right">
    		商品名：<input type="text" name="cxpName" value="${cxpName }"/>
    		上架时间区间：<input type="text" name="xTime" value="${xTime }" onfocus="laydate()" />
    		-<input type="text" name="yTime" value="${yTime }" onfocus="laydate()"/>
    		
    		特价商品：<input type="checkbox" name="cxpSpecial" value="1" />
    				<input type="hidden" id="cxpSpecial" value="${cxpSpecial }">
    		新品：<input type="checkbox" name="cxpNew" value="1"/>
    			<input type="hidden" id="cxpNew" value="${cxpNew }">
    		<input type="submit" class="btn btn-success" value="查询"/><br>
    		类型：
    			<select id="cxptName" name="cxptName" onchange="chaxunleixing()">
    					<option value="0">全部</option>
    				<c:forEach items="${productTypes }" var="pt">
    					<c:choose>
	    					<c:when test="${cxptId == pt.ptId}">
	    						<option value="${pt.ptId }" selected="selected">${pt.ptName }</option>
	    					</c:when>
	    					<c:otherwise>
	    						<option value="${pt.ptId }">${pt.ptName }</option>
	    					</c:otherwise>
    					</c:choose>
    				</c:forEach>
    			</select>
    	</div>
    	<!-- 模糊查询： 结束 -->
    	<span id="haha">
    	<table align="center" border="1" class="table table-bordered data-table">
    		<tr>
    			<td style="width: 5%">序号</td>
    			<td style="width: 20%">商品名称</td>
    			<td style="width: 20%">类型</td>
    			<!-- <td style="width: 13%">品牌</td> -->
    			<td style="width: 30%">描述</td>
    			<td style="width: 25%">操作</td><!--查看详情，修改，删除，查看评价  -->
    			
    		</tr>
    		<c:forEach items="${generals }" var="gs" varStatus="vs">
    			<tr>
    				<td>${vs.index + 1}</td>
    				<td>
    				<c:if test="${gs.product.pSpecial == 1 }">
    					(特)
    				</c:if>
    				<c:if test="${gs.product.pNew == 1 }">
    					(新)
    				</c:if>
    						${gs.product.pName }
    				
    				</td>
    				<td>${gs.productType.ptName }</td>
    				<%-- <td>${gs.brand.bName }</td> --%>
    				<td>${gs.product.pContent }</td>
    				<td>
    					<button type="button" class="btn btn-primary" 
    						onclick="Operation('part','${gs.product.pId }')">查看详情</button>
    					<button type="button" class="btn btn-warning" 
    						onclick="Operation('update','${gs.product.pId }')">修改</button>
    					<button type="button" class="btn btn-danger" 
    						onclick="Operation('del','${gs.product.pId }')">删除</button>
    					<button type="button" class="btn btn-info" 
    						onclick="Operation('evaluate','${gs.product.pId }')">查看评价</button>
    					
    				
    				</td>
    				
    			</tr>
    		</c:forEach>
    		<!-- <tr>
    			<td>规格</td>
    			<td>规格详情</td>
    			<td>单价</td>
    			<td>数量</td>
    			<td>颜色</td>
    			<td>图片</td>
    		</tr> -->
    	</table>
    	</span>
    	<span id="heihei">
    		<table align="center" border="1" class="table table-bordered data-table">
	    		<tr>
	    			<td style="width: 5%">序号</td>
	    			<td style="width: 20%">商品名称</td>
	    			<td style="width: 20%">类型</td>
	    			<!-- <td style="width: 13%">品牌</td> -->
	    			<td style="width: 30%">描述</td>
	    			<td style="width: 25%">操作</td><!--查看详情，修改，删除，查看评价  -->
	    			
	    		</tr>
	    		<c:forEach begin="${begin }" end="${end }" var="i" varStatus="vs">
	    			<tr>
	    				<td>${vs.index + 1}</td>
	    				<td>
	    				<c:if test="${generals[i].product.pSpecial == 1 }">
	    					(特)
	    				</c:if>
	    				<c:if test="${generals[i].product.pNew == 1 }">
	    					(新)
	    				</c:if>
	    						${generals[i].product.pName }
	    				
	    				</td>
	    				<td>${generals[i].productType.ptName }</td>
	    				<%-- <td>${gs.brand.bName }</td> --%>
	    				<td>${generals[i].product.pContent }</td>
	    				<td>
	    					<button type="button" class="btn btn-primary" 
	    						onclick="Operation('part','${generals[i].product.pId }')">查看详情</button>
	    					<button type="button" class="btn btn-warning" 
	    						onclick="Operation('update','${generals[i].product.pId }')">修改</button>
	    					<button type="button" class="btn btn-danger" 
	    						onclick="Operation('del','${generals[i].product.pId }')">删除</button>
	    					<button type="button" class="btn btn-info" 
	    						onclick="Operation('evaluate','${generals[i].product.pId }')">查看评价</button>
	    					
	    				
	    				</td>
	    				
	    			</tr>
	    		</c:forEach>
	    		<!-- <tr>
	    			<td>规格</td>
	    			<td>规格详情</td>
	    			<td>单价</td>
	    			<td>数量</td>
	    			<td>颜色</td>
	    			<td>图片</td>
	    		</tr> -->
	    	</table>
    	
    	
    	</span>
    	<div align="right">
	    	 <button type="button" class="btn btn-success">共${page.rowCount}条数据</button>
	    	 <button type="button" class="btn btn-success">第${page.pageNum}页</button>
	    	 <button type="button" class="btn btn-success">共${page.pageCount}页</button>
	    	 <button type="button" class="btn btn-success" onclick="paging('1')">首页</button>
	    	 <button type="button" class="btn btn-success" onclick="paging('${page.pageNum - 1}')">上一页</button>
	    	 <button type="button" class="btn btn-success" onclick="paging('${page.pageNum + 1}')">下一页</button>
	    	 <button type="button" class="btn btn-success" onclick="paging('${page.pageCount}')">尾页</button>
		</div>
    </form>
    <form action="" method="post" id="tiaozhuanForm" name="tiaozhuanForm">
    	<input type="hidden" name="pId" id="pId" value="">
    </form>
   
   
   	<script src="<%=basePath%>js/maruti.js"></script>
	<script src="<%=basePath%>js/maruti.tables.js"></script>
   
  </body>
</html>
