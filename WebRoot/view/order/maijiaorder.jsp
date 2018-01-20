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
	<script type="text/javascript">
    	function paging(pageNum){
			document.getElementById("pageNum").value = pageNum;
			document.getElementById("findFrom").submit();
		}
    </script>
    <script type="text/javascript">
    	$(function(){
    		var zhuangtai = '${zhuangtai }';
    		if(zhuangtai !="" && parseInt(zhuangtai) < 3 && parseInt(zhuangtai) > -1){
    			$("#zhuangtai").val(zhuangtai);
    		
    		}
    	
    	
    	});
    </script>	
	<script type="text/javascript">
		function xiugai(id){
			$("#zheshiid").val(id);
			$("#findFrom").submit();
		}
	
	</script>
	<script type="text/javascript">
		function xiangqing(id){
			$("#partid").val(id);
			$("#findFromPart").submit();
		}
	
	</script>
  </head>  
  <body>
  	<form action="<%=basePath%>orderInfo/maijiaorderListPart.do" method="post" id="findFromPart">
  		<input type="hidden" id="partid" name="partid" value="">
  	</form>
	<form action="<%=basePath%>orderInfo/maijiaorderList.do" method="post" id="findFrom">
		
		<!-- 将当前页数放到隐藏域中，并传回后台 -->
    	<input type="hidden" id="pageNum" name="pageNum">
    	<input type="hidden" id="zheshiid" name="zheshiid" value="">
  	<div>
  		订单状态：
  		<select name="zhuangtai" id="zhuangtai">
  			<option value="-1">全部</option>
  			<option value="0">商家未确认</option>
  			<option value="1">客户未确认</option>
  			<option value="2">订单已完成</option>
  		</select>
  		
    	<input type="submit" value="查询">	
  	</div>
  	
    <table border="1" align="center" class="table table-bordered data-table">
    	<tr>
    		<td>订单编号</td>
    		<td>用户名</td>
    		<td>店铺名</td>
    		<td>总价</td>
    		<td>生成时间</td>
    		<td>完成时间</td>
    		<td>订单状态</td>
    		<td>操作</td>
    	</tr>
    	<c:forEach begin="${begin }" end="${end }" var="i">
	    	<tr>
	    		<td>${orderInfos[i].oId }</td>
	    		<td>${users[i].uName }</td>
	    		<td>${shop.sName }</td>
	    		<td>${orderInfos[i].oTotal }</td>
	    		<td>${orderInfos[i].oStime }</td>
	    		<td>${orderInfos[i].oFtime }</td>
	    		<td>
	    		<c:if test="${orderInfos[i].oState == 0 }">
	    			商家未确认
	    		</c:if>
	    		<c:if test="${orderInfos[i].oState == 1 }">
	    			客户未确认
	    		</c:if>
	    		<c:if test="${orderInfos[i].oState == 2 }">
	    			订单已完成
	    		</c:if>
	    		</td>
	    		<td>
	    			<button type="button" class="btn btn-primary" onclick="xiangqing('${orderInfos[i].oId }')">查看详情</button>
	    			<c:if test="${orderInfos[i].oState == 0 }">
	    				<button type="button" class="btn btn-warning" onclick="xiugai('${orderInfos[i].oId }')">确认</button>
					</c:if>
	    		</td>
	    	</tr>
    	</c:forEach>
    </table>
    
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
  </body>
</html>
