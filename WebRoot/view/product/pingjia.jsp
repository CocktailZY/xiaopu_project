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
	  	function setCookie(name,value,time)
		{ 
		    var strsec = getsec(time); 
		    var exp = new Date(); 
		    exp.setTime(exp.getTime() + strsec*1); 
		    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
		} 
		function getsec(str)
		{ 
		    
		   var str1=str.substring(1,str.length)*1; 
		   var str2=str.substring(0,1); 
		   if (str2=="s")
		   { 
		        return str1*1000; 
		   }
		   else if (str2=="h")
		   { 
		       return str1*60*60*1000; 
		   }
		   else if (str2=="d")
		   { 
		       return str1*24*60*60*1000; 
		   } 
		}   
	  </script>
	  <script type="text/javascript">
	  	function getCookie(name) 
		{ 
		    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
		 
		    if(arr=document.cookie.match(reg))
		 
		        return unescape(arr[2]); 
		    else 
		        return null; 
		} 
	  
	</script>
	<script type="text/javascript">
    	function paging(pageNum){
			document.getElementById("pageNum").value = pageNum;
			document.getElementById("findFrom").submit();
		}
    </script>
    <script type="text/javascript">
    	$(function(){
    		var xingji = '${xingji }';
    		if(xingji !="" && parseInt(xingji) < 3 && parseInt(xingji) > -3){
    			$("#xingji").val(xingji);
    		
    		}
    	
    	
    	});
    </script>
	<script type="text/javascript">
		function tijiao(id){
			if($("#yincang"+id).val() == ""){
				alert("还没写内容！！");
				return;
			
			}else{
				$("#zhangguihuifuid").val(id);
				$("#zhezhezhe").val($("#yincang"+id).val());
				$("#findFrom").submit();
				alert("回复成功！！");
			}
		
		
		}
	</script>
	<script type="text/javascript">
		function quxiao(id){
			if($("#yincang"+id).val() == ""){
				//$("#myModal"+id).style.display="none";
			
			}else{
				setCookie("huifu"+id,$("#yincang"+id).val(),"h1");
				alert("已保存草稿，有效时间1小时哦！");
				//$("#myModal"+id).style.display="none";
			}
		
		}
	</script>
	<script type="text/javascript">
		function haha(id){
			$("#yincang"+id).val(getCookie("huifu"+id));
		
		}
	
	</script>
  </head>
  
  <body>
	<form action="<%=basePath%>product/productevaluate.do" method="post" id="findFrom">
		
		<!-- 将当前页数放到隐藏域中，并传回后台 -->
    	<input type="hidden" id="pageNum" name="pageNum">
  	<div>
  		评论：
  		<select name="xingji" id="xingji">
  			<option value="-3">全部</option>
  			<option value="-2">一星</option>
  			<option value="-1">二星</option>
  			<option value="0">三星</option>
  			<option value="1">四星</option>
  			<option value="2">五星</option>
  		</select>
  		评价时间：<input type="text" name="xTime" value="${xTime }" onfocus="laydate()" />
    		-<input type="text" name="yTime" value="${yTime }" onfocus="laydate()"/>
    	<input type="submit" value="查询">	
  	</div>
  	
    <table border="1" align="center" class="table table-bordered data-table">
    	<tr>
    		<td>评论内容</td>
    		<td>评价人</td>
    		<td>星级</td>
    		<td>宝贝信息</td>
    		<td>操作</td>
    	</tr>
    	<c:forEach begin="0" end="${commentssize-1 }" var="i">
	    	<tr>
	    		<td>
	    		买家评价：${pingjiaList[i].commContent }<br>
	    		<c:if test="${zhuijiaList[i].commContent != null}">
	    			追加评价：${zhuijiaList[i].commContent }<br>
	    		</c:if>
	    		<c:if test="${huifuList[i].commContent != null}">
	    			掌柜回复：${huifuList[i].commContent }<br>
	    		</c:if>
	    		评论时间：${commentsList[i].commTime }
	    		</td>
	    		<td>${users[i].uName }</td>
	    		<td>${commentsList[i].commStar+3 }颗星</td>
	    		<td>${productss[i].pName }</td>
	    		<td>
	    			<c:if test="${huifuList[i].commContent == null}">
	    				<button data-reveal-id="myModal${commentsList[i].commId }" name="huifu" data-animation="fade" onclick="haha('${commentsList[i].commId }')">回复</button>
	    			</c:if> 
	    			<div id="myModal${commentsList[i].commId }" class="reveal-modal" align="center">
				    		<p align="center">评价回复</p>
							<textarea id="yincang${commentsList[i].commId }" name="zhangguihuifu" style="width: 400px;height: 150px;"></textarea><br>
							
							<input type="button" value="回复" onclick="tijiao('${commentsList[i].commId }')">
							<input type="button" value="取消" onclick="quxiao('${commentsList[i].commId }')">
					</div>
	    			
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
	<input type="hidden" id="zhangguihuifuid" name="zhangguihuifuid" value="">
	<input type="hidden" id="zhezhezhe" name="zhezhezhe" value="">
    </form>
  </body>
</html>
