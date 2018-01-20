<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<title>角色权限管理</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath %>css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath %>css/uniform.css" />
<link rel="stylesheet" href="<%=basePath %>css/select2.css" />
<link rel="stylesheet" href="<%=basePath %>css/maruti-style.css" />
<link rel="stylesheet" href="<%=basePath %>css/maruti-media.css" class="skin-color" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/sweet-alert.css">
<script src="<%=basePath %>js/sweet-alert.min.js"></script>
</head>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="#">角色权限管理</a></h1>
</div>
<!--close-Header-part--> 

<!--top-Header-messaages-->
<div class="btn-group rightzero"> <a class="top_message tip-left" title="Manage Files"><i class="icon-file"></i></a> <a class="top_message tip-bottom" title="Manage Users"><i class="icon-user"></i></a> <a class="top_message tip-bottom" title="Manage Comments"><i class="icon-comment"></i><span class="label label-important">5</span></a> <a class="top_message tip-bottom" title="Manage Orders"><i class="icon-shopping-cart"></i></a> </div>
<!--close-top-Header-messaages--> 

<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li class="" ><a title="" href="<%=basePath%>user/get.do?uId=${loginUser.uId}"><i class="icon icon-user"></i> <span class="text">管理员信息</span></a></li>
    <li class=" dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">管理员消息</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#">公司总部</a></li>
        <li><a class="sInbox" title="" href="#">财务部</a></li>
        <li><a class="sOutbox" title="" href="#">人事部</a></li>
        <li><a class="sTrash" title="" href="#">市场部</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">系统设置</span></a></li>
    <li class=""><a title="" href="login.html"><i class="icon icon-share-alt"></i> <span class="text">退出登录</span></a></li>
  </ul>
</div>
<div id="search">
  <input type="text" placeholder="搜索..."/>
  <button type="submit" class="tip-left" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-Header-menu-->

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
    <div id="breadcrumb"> <a href="<%=basePath %>view/admin/admin.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首 页</a> <a href="#" class="current">角色权限管理</a> </div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
      	
      	${role.roName }
        <div class="widget-box">
          <div class="widget-title">
             <span class="icon"><i class="icon-th"></i></span> 
            <h5>角色权限列表</h5>
          </div>
          <div class="widget-content nopadding">
          	<form action="<%=basePath%>rolePower/addChildPower.do" method="post">
	            <table class="table table-bordered data-table">
	              <thead>
	                <tr>
	                  	<th>权限编号</th>
	                  	<th>权限名</th>
	                  	<th>操 作</th>
	                </tr>
	              </thead>
	              <tbody>
	              	<c:forEach items="${clist }" var="item"><!-- 该角色的已选子权限,item是权限对象 -->
		                <tr class="gradeX">
		                  	<td>${item.poId }</td>
		                  	<td>${item.poName }</td>
		                  	<td class="center">
		                  		<input type="button" class="btn btn-danger" onclick="delete_shop('${item.poId }','${role.roId }')" value="删除" />
		                  	</td>
		                </tr>
	               	</c:forEach>
	              </tbody>
	            </table>
	            <input type="hidden" name="poId" value="${fpower.poId }">
		        <input type="hidden" name="roId" value="${role.roId }">
            	<input class="btn" type="submit" value="添加子权限">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row-fluid">
  <div id="footer" class="span12"> 2012 &copy; Marutii Admin. More Templates </div>
</div>
<script src="<%=basePath %>js/jquery.min.js"></script> 
<script src="<%=basePath %>js/jquery.ui.custom.js"></script> 
<script src="<%=basePath %>js/bootstrap.min.js"></script> 
<script src="<%=basePath %>js/jquery.uniform.js"></script> 
<script src="<%=basePath %>js/select2.min.js"></script> 
<script src="<%=basePath %>js/jquery.dataTables.min.js"></script> 
<script src="<%=basePath %>js/maruti.js"></script> 
<script src="<%=basePath %>js/maruti.tables.js"></script>
<script type="text/javascript">
			function delete_shop(pid,rid) {
				swal({
					title: "确定删除?",
					text: "删除前请确认信息!",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "是的,删除!"
					
				},
				function(){
					window.location.href="<%=basePath%>rolePower/delete.do?poId="+pid+"&roId="+rid;
				}
				);
			};
</script>
</body>
</html>
