<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

	<head>
		<title>Maruti Admin</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath %>css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="<%=basePath %>css/uniform.css" />
		<link rel="stylesheet" href="<%=basePath %>css/select2.css" />
		<link rel="stylesheet" href="<%=basePath %>css/maruti-style.css" />
		<link rel="stylesheet" href="<%=basePath %>css/maruti-media.css" class="skin-color" />
		<link rel="stylesheet" href="<%=basePath %>css/mycss.css" />
		<script type="text/javascript" src="<%=basePath %>js/jquery.reveal.js"></script>
		<link rel="stylesheet" href="<%=basePath %>css/reveal.css">
		
		<!-- Attach necessary scripts -->
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/jquery.reveal.js"></script>
		
	</head>

<body>
	<!--Header-part-->
	<div id="header">
		<div style="padding-left: 20px;padding-top: 20px;font-family: '微软雅黑';font-size: 24px;color: ghostwhite;">
			商城后台管理系统首页
		</div>
	</div>
	<!--close-Header-part-->

	<!--top-Header-messaages-->
	<div class="btn-group rightzero"> <a class="top_message tip-left" title="Manage Files"><i class="icon-file"></i></a> <a class="top_message tip-bottom" title="Manage Users"><i class="icon-user"></i></a> <a class="top_message tip-bottom" title="Manage Comments"><i class="icon-comment"></i><span class="label label-important">5</span></a>			<a class="top_message tip-bottom" title="Manage Orders"><i class="icon-shopping-cart"></i></a> </div>
	<!--close-top-Header-messaages-->

	<!--top-Header-menu-->
	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav">
			<li class=""><a title="" href="#"><i class="icon icon-user"></i> <span class="text">管理员信息</span></a></li>
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
			<div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首 页</a> <a href="#" class="current">投诉管理</a> </div>
			
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i></span>
							<div class="btn-group" role="group" style="height: 40px;">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="height: 36px;font-family: '微软雅黑';width: 80px">
  									选项
  									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="<%=basePath%>complaint/list.do">全部投诉</a></li>
									<li><a href="<%=basePath%>complaint/list.do?coState=0">未审核投诉</a></li>
									<li><a href="<%=basePath%>complaint/list.do?coState=1">审核中投诉</a></li>
									<li><a href="<%=basePath%>complaint/list.do?coState=2">未通过审核</a></li>
									<li><a href="<%=basePath%>complaint/list.do?coState=3">已处理审核</a></li>
								</ul>
							</div>
							
						</div>
						<div class="widget-content nopadding">
							<table class="table table-bordered data-table">
								<thead>
									<tr>
										<th>投诉编号</th>
										<th>投诉标题</th>
										<th>被投诉人</th>
										<th>投诉创建时间</th>
										<th>投诉人</th>
										<th>状态</th>
										<th>操 作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="item">
										<tr class="gradeX">
											<td style="vertical-align:middle;">${item.coId }</td>
											<td style="vertical-align:middle;">${item.coTitle }</td>
											<td style="vertical-align:middle;">${item.coUsername }</td>
											<td style="vertical-align:middle;">${item.coCreattime }</td>
											<td style="vertical-align:middle;">
											<c:forEach items="${ulist }" var="uitem">
												<c:if test="${uitem.uId == item.coUserid}">
													${uitem.uName }
												</c:if>
												<div id="myModal${item.coId }" class="reveal-modal" align="center">
													<h3 align="center">投诉详情</h3>
													<form action="<%=basePath%>complaint/shenhe.do" method="post">
														投诉编号:${item.coId }&nbsp;&nbsp;
														投诉人:${uitem.uName }&nbsp;&nbsp;
														被投诉人:${item.coUsername }&nbsp;&nbsp;
														创建时间:${item.coCreattime }
														<br>
														投诉标题:<input type="text" value="${item.coTitle}" readonly="readonly"><br>
														投诉内容:<textarea rows="5" cols="10" readonly="readonly">${item.coContent}</textarea>
														<input type="hidden" name="coId" value="${item.coId}">
														<input type="hidden" name="coState" value="${item.coState}">
														<br>
														<c:if test="${item.coState==0 }">
														<input type="submit" value="确认审核">
														</c:if>
														<c:if test="${item.coState==1 }">
														<input type="submit" value="完成处理">
														<input type="button" value="驳回投诉" onclick="window.location.href='<%=basePath%>complaint/shenhe.do?coId=${item.coId}&coState=2'">
														</c:if>
													</form>
													<a class="close-reveal-modal">&#215;</a>
												</div>
											</c:forEach>
											
											</td>
											<td style="vertical-align:middle;">
											<c:if test="${item.coState == 0}">
												未审核
											</c:if>
											<c:if test="${item.coState == 1}">
												审核中
											</c:if>
											<c:if test="${item.coState == 2}">
												未通过
											</c:if>
											<c:if test="${item.coState == 3}">
												已处理
											</c:if>
											</td>
											
											<td>
												<button class="btn" data-reveal-id="myModal${item.coId }" data-animation="fade">查看详情</button>
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
		
		<div id="footer" class="span12"> 2012 &copy; Marutii Admin. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> </div>
	</div>

	<script src="<%=basePath %>js/jquery-3.0.0.js"type="text/javascript"></script>
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