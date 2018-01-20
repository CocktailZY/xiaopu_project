<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<title>类型规格管理</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/uniform.css" />
<link rel="stylesheet" href="<%=basePath%>css/select2.css" />
<link rel="stylesheet" href="<%=basePath%>css/maruti-style.css" />
<link rel="stylesheet" href="<%=basePath%>css/maruti-media.css" class="skin-color" />
<link rel="stylesheet" href="<%=basePath%>css/reveal.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/sweet-alert.css">
<script src="<%=basePath%>js/sweet-alert.min.js"></script>
<style type="text/css">
	.yincang{
		display: none;
	}
</style>


</head>
<body>

	<!--Header-part-->
	<div id="header">
		<h1>
			<a href="dashboard.html">类型规格管理</a>
		</h1>
	</div>
	<!--close-Header-part-->

	<!--top-Header-messaages-->
	<div class="btn-group rightzero">
		<a class="top_message tip-left" title="Manage Files"><i
			class="icon-file"></i>
		</a> <a class="top_message tip-bottom" title="Manage Users"><i
			class="icon-user"></i>
		</a> <a class="top_message tip-bottom" title="Manage Comments"><!-- <i
			class="icon-comment"></i><span class="label label-important">5</span> -->
		</a> <a class="top_message tip-bottom" title="Manage Orders"><i
			class="icon-shopping-cart"></i>
		</a>
	</div>
	<!--close-top-Header-messaages-->

	<!--top-Header-menu-->
		<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li class=""><a title="" href="<%=basePath%>user/get.do?uId=${loginUser.uId}"><i class="icon icon-user"></i> <span class="text">管理员信息</span></a></li>
    <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">管理员消息</span> <span class="label label-important">5</span> <b class="caret"></b></a>
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
			<div id="breadcrumb">
				<a href="<%=basePath%>view/admin/admin.jsp" title="Go to Home"
					class="tip-bottom"><i class="icon-home"></i>首 页</a> <a href="#"
					class="current">类型规格管理</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">

						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i>
							</span>
							<h5>类型列表</h5>
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered data-table">
								<thead>
									<tr>
										<th>类型编号</th>
										<th>类型名称</th>
										<th>操 作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="item">
										<tr class="gradeX">
											<td>${item.ptId }</td>
											<td><a href="javascript:serch('${item.ptId }')">${item.ptName}</a>
											</td>
											<td class="center">
												<button class="btn" data-reveal-id="myModal${item.ptId }" data-animation="fade" onclick="window.location.href='<%=basePath%>typeSpecs/listSpecs.do?tsProducttypeid=${item.ptId }'">规格列表</button>
												<%-- <button class="btn btn-danger" onclick="delete_shop('${item.ptId }','${item.parentid }')">删除</button> --%>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div id="footer" class="span12">2012 &copy; Marutii Admin. More
			Templates</div>
	</div>
	<script src="<%=basePath%>js/jquery.min.js"></script>
	<script src="<%=basePath%>js/jquery.ui.custom.js"></script>
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/jquery.uniform.js"></script>
<%-- 	<script src="<%=basePath%>js/select2.min.js"></script> --%>
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/maruti.js"></script>
	<script src="<%=basePath%>js/maruti.tables.js"></script>
	<script src="<%=basePath%>js/jquery.reveal.js"></script>
</body>
</html>
