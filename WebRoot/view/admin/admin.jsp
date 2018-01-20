<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<title>后台管理</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath %>css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath %>css/uniform.css" />
<link rel="stylesheet" href="<%=basePath %>css/select2.css" />
<link rel="stylesheet" href="<%=basePath %>css/maruti-style.css" />
<link rel="stylesheet" href="<%=basePath %>css/maruti-media.css" class="skin-color" />
</head>
<body>

<!--Header-part-->
<div id="header">
			<div style="padding-left: 20px;padding-top: 20px;font-family:'微软雅黑';font-size: 24px;color: ghostwhite;">
				商城后台管理系统首页
			</div>
		</div>
<!--close-Header-part--> 

<!--top-Header-messaages-->
<div class="btn-group rightzero"> <a class="top_message tip-left" title="Manage Files"><i class="icon-file"></i></a> <a class="top_message tip-bottom" title="Manage Users"><i class="icon-user"></i></a> <a class="top_message tip-bottom" title="Manage Comments"><i class="icon-comment"></i><span class="label label-important">5</span></a> <a class="top_message tip-bottom" title="Manage Orders"><i class="icon-shopping-cart"></i></a> </div>
<!--close-top-Header-messaages--> 

<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li class=""><a title="" href="<%=basePath%>user/getById.do?uId=${loginUser.uId}"><i class="icon icon-user"></i> <span class="text">管理员信息</span></a></li>
    <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">管理员消息</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#">公司总部</a></li>
        <li><a class="sInbox" title="" href="#">财务部</a></li>
        <li><a class="sOutbox" title="" href="#">人事部</a></li>
        <li><a class="sTrash" title="" href="#">市场部</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="<%=basePath%>"><i class="icon icon-cog"></i> <span class="text">系统前台</span></a></li>
    <li class=""><a title="" href="<%=basePath%>user/admin.do"><i class="icon icon-share-alt"></i> <span class="text">退出登录</span></a></li>
  </ul>
</div>

<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>系统首页</a>
  <ul>
	  <c:forEach items="${fplist }" var="fp">
	  		<c:if test="${fp.url == '#'}">
	    	 <li class=" dropdown" id="menu-messages"><a href="<%=basePath%>${fp.url}" data-toggle="dropdown"><i class="icon icon-${fp.icon }"></i><span>${fp.poName }</span></a>
		    </c:if>
		    <c:if test="${fp.url != '#'}">
	    	 <li class=" dropdown" id="menu-messages"><a href="<%=basePath%>${fp.url}/list.do"><i class="icon icon-${fp.icon }"></i><span>${fp.poName }</span></a>
		    </c:if>		
		    	<ul class="dropdown-menu">
	    			<c:forEach items="${cplist }" var="cp">
			    		<c:if test="${cp.parentid == fp.poId }">
				    		<li><a class="sAdd" title="" href="<%=basePath%>${cp.url }">${cp.poName }</a></li>
			        	</c:if>
	       			 </c:forEach>	
		        </ul>
		    </li>
	   </c:forEach>

  </ul>
</div>


<div id="content">
	<div id="content-header">
		<div id="breadcrumb"> <a href="#" title="返回首页" class="tip-bottom"><i class="icon-home"></i>首 页</a></div>
	</div>
	<img style="position: absolute;left:29%;top:22%;" src="<%=basePath %>img/111.jpg">
	<div style="height:75%;"></div>
</div>
<div style="color:white;background: black;width:100%;text-align: center;"> 2016 &copy; 安博实训A2小组</div>
<script src="<%=basePath %>js/jquery.min.js"></script> 
<script src="<%=basePath %>js/jquery.ui.custom.js"></script> 
<script src="<%=basePath %>js/bootstrap.min.js"></script>
<script src="<%=basePath %>js/jquery.uniform.js"></script> 
<script src="<%=basePath %>js/select2.min.js"></script> 
<script src="<%=basePath %>js/jquery.dataTables.min.js"></script> 
<script src="<%=basePath %>js/maruti.js"></script> 
<script src="<%=basePath %>js/maruti.tables.js"></script>
</body>
</html>
