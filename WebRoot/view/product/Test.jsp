<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
 <head> 
  <title>图片上传预览</title> 
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
	   alert(str); 
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
  	function ss(){
  		
  		setCookie("name",$("#a").val(),"h10");
  		
  	}
  </script>
  <script type="text/javascript">
  	function huixian(){
  		$("#b").val(getCookie("name")); 
		alert(getCookie("name")); 
  	}
  	
  </script>
 </head> 
 <body> 
  cookie测试<input type="text" id="a" value=""><br>
  <input type="button" value="存到cooike" onclick="ss()"><br>
  cookie测试回显<input type="text" id="b" value=""><br>
  <input type="button" value="回显" onclick="huixian()"><br>
 </body> 
</html> 
