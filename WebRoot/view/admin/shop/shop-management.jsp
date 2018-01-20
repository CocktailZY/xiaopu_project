<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

	<head>
		<title>店铺信息管理</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath %>css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="<%=basePath %>css/uniform.css" />
		<link rel="stylesheet" href="<%=basePath %>css/select2.css" />
		<link rel="stylesheet" href="<%=basePath %>css/maruti-style.css" />
		<link rel="stylesheet" href="<%=basePath %>css/maruti-media.css" class="skin-color" />
		<link rel="stylesheet" href="<%=basePath %>css/mycss.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/sweet-alert.css">
		<script type="text/javascript" src="<%=basePath %>js/jquery.reveal.js"></script>
		<link rel="stylesheet" href="<%=basePath %>css/reveal.css">
		
		<script src="<%=basePath %>js/sweet-alert.min.js"></script>
	  	
		<!-- Attach necessary scripts -->
		<!-- <script type="text/javascript" src="jquery-1.4.4.min.js"></script> -->
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/jquery.reveal.js"></script>
		
	</head>

	<body>
		<div id="myModal" class="reveal-modal">
			<h1>警告信息</h1>
			<div class="add_view">
				店铺名称：<input class="form-control add_shop"/>
			</div>
			<div class="add_view">
				店铺编号：<input class="form-control add_shop"/>
			</div>
			<div class="add_view">
				店铺卖家：<input class="form-control add_shop"/>
			</div>
			<div class="add_view">
				警告内容：<textarea class="form-control add-shop" rows="5"></textarea>
			</div>
			
			<a class="close-reveal-modal">&#215;</a>
		</div>
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
				<div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首 页</a> <a href="#" class="current">店铺管理</a> </div>
				<h1>店铺管理</h1>
			</div>
			<div id="low-t" style="text-align: center;font-size: 24px;font-family: '微软雅黑';">低于警戒值的店铺</div>
			<div id="see-t" style="text-align: center;font-size: 24px;font-family: '微软雅黑';">处于观察期的店铺</div>
			<div id="apply-t" style="text-align: center;font-size: 24px;font-family: '微软雅黑';">新的店铺申请</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon"><i class="icon-th"></i></span>
								<div class="btn-group" role="group" style="height: 40px;">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="height: 36px;font-family: '微软雅黑';width: 80px">
	  									选 项
	  									<span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="#" onclick="change_div('low')">低于警戒值店铺</a></li>
										<li><a href="#" onclick="change_div('see')">观察期店铺</a></li>
										<li><a href="#" onclick="change_div('apply')">新的店铺申请</a></li>
									</ul>
								</div>
								
							</div>
							<div class="widget-content nopadding" id="low">
								<table class="table table-bordered data-table">
									<thead>
										<tr>
											<th style="width: 20%;">店铺编号</th>
											<th style="width: 20%;">卖家编号</th>
											<th style="width: 20%;">店铺信用度</th>
											<th style="width: 20%;">店铺等级</th>
											<th style="width: 20%;">操 作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${underlist }" var="shop">
											<tr class="gradeX">
												<td style="vertical-align:middle;">${shop.sId }</td>
												<td style="vertical-align:middle;">${shop.sUserid }</td>
												<td style="vertical-align:middle;">${shop.sCredit }</td>
												<td style="vertical-align:middle;">${shop.sGrade }</td>
												
												<td style="text-align: center;">
													<button class="btn btn-warning" data-reveal-id="myModal"
														data-animation="fade">发送警告</button>
													<button onclick="addtosee('${shop.sId}')" class="btn btn-danger">加入观察期</button>
													<button onclick="delete_shop('${shop.sId}')" class="btn btn-inverse">关闭店铺</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="widget-content nopadding" id="see">
								<table class="table table-bordered data-table">
									<thead>
										<tr>
											<th style="width: 20%;">店铺编号</th>
											<th style="width: 20%;">店铺名称</th>
											<th style="width: 20%;">店铺诚信度</th>
											<th style="width: 20%;">店铺状态</th>
											<th style="width: 20%;">操 作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${seelist }" var="shop">
										<tr class="gradeX">
											<td style="width: 20%;vertical-align:middle;">${shop.sId }</td>
											<td style="width: 20%;vertical-align:middle;">${shop.sName }</td>
											<td style="width: 20%;vertical-align:middle;">${shop.sCredit }</td>
											<td style="width: 20%;vertical-align:middle;text-align:center;">观察期</td>
											<td style="width: 20%;text-align: center;">
												<button onclick="updatetonormal('${shop.sId}')" class="btn btn-success">恢复店铺</button>
												<button onclick="delete_shop('${shop.sId}')" class="btn btn-inverse">关闭店铺</button>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="widget-content nopadding" id="apply">
								<table class="table table-bordered data-table">
									<thead>
										<tr>
											<th style="width: 20%;">申请卖家</th>
											<th style="width: 20%;">店铺名称</th>
											<th style="width: 20%;">店铺类型</th>
											<th style="width: 20%;">申请状态</th>
											<th style="width: 20%;">操 作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${applylist }" var="shop">
											<tr class="gradeX">
												<td style="width: 20%;vertical-align:middle;">${shop.sUserid }</td>
												<td style="width: 20%;vertical-align:middle;">${shop.sName }</td>
												<td style="width: 20%;vertical-align:middle;">${shop.sShoptypeid }</td>
												<td style="width: 20%;vertical-align:middle;text-align: center;">未审核</td>
												<td style="width: 20%;text-align: center;">
													<button onclick="adoptapply('${shop.sId}')" class="btn btn-success">通过申请</button>
													<button onclick="delete_apply('${shop.sId}')" class="btn btn-danger">退回申请</button>
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
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
		<script src="<%=basePath %>js/maruti.js"></script>
		<script src="<%=basePath %>js/maruti.tables.js"></script>
		
		<script type="text/javascript">
			function change_div(id) {
				if (id == 'see') {
					document.getElementById("low").style.display = 'none';
					document.getElementById("apply").style.display = 'none';
					document.getElementById("see").style.display = 'block';
					document.getElementById("low-t").style.display = 'none';
					document.getElementById("apply-t").style.display = 'none';
					document.getElementById("see-t").style.display = 'block';
				} else if(id == 'low'){
					document.getElementById("see").style.display = 'none';
					document.getElementById("apply").style.display = 'none';
					document.getElementById("low").style.display = 'block';
					document.getElementById("see-t").style.display = 'none';
					document.getElementById("apply-t").style.display = 'none';
					document.getElementById("low-t").style.display = 'block';
				} else{
					document.getElementById("apply").style.display = 'block';
					document.getElementById("see").style.display = 'none';
					document.getElementById("low").style.display = 'none';
					document.getElementById("apply-t").style.display = 'block';
					document.getElementById("see-t").style.display = 'none';
					document.getElementById("low-t").style.display = 'none';
				}
			}
		</script>
	
		<script type="text/javascript">
			function adoptapply(sId) {
				swal(
					{
						title: "申请通过?",
						text: "通过前请确认!",
						type: "warning",
						showCancelButton: true,
						confirmButtonColor: "#149BDF",
						confirmButtonText: "是的,通过!"
					},
					function()
					{
						window.location.href="<%=basePath%>shop/updateToNormal.do?sId="+sId;
					}
				);
			}
		</script>
		
		<script type="text/javascript">
			function updatetonormal(sId) {
				swal(
					{
						title: "恢复店铺?",
						text: "恢复前请确认店铺信息!",
						type: "warning",
						showCancelButton: true,
						confirmButtonColor: "#149BDF",
						confirmButtonText: "是的,恢复!"
					},
					function()
					{
						window.location.href="<%=basePath%>shop/updateToNormal.do?sId="+sId;
					}
				);
			}
		</script>
		
		<script type="text/javascript">
			function delete_shop(sId) {
				swal(
					{
						title: "确定关闭店铺?",
						text: "关闭前请确认店铺的信息!",
						type: "warning",
						showCancelButton: true,
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "是的,关闭!"
					},
					function()
					{
						window.location.href="<%=basePath%>shop/updateToClose.do?sId="+sId;
					}
				);
			}
		</script>
		<script type="text/javascript">
			function delete_apply(sId) {
				swal(
					{
						title: "确定退回?",
						text: "退回前请确认申请的信息!",
						type: "warning",
						showCancelButton: true,
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "是的,退回!"
					},
					function()
					{
						window.location.href="<%=basePath%>shop/deleteApply.do?sId="+sId;
					
					}
				);
			}
		</script>

		<script type="text/javascript">
			function addtosee(sId) {
				swal(
					{
						title: "确定加入观察期?",
						text: "加入观察期前请确认店铺的信息!",
						type: "warning",
						showCancelButton: true,
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "是的,加入!"
					},
					function()
					{
						window.location.href="<%=basePath%>shop/updateToSee.do?sId="+sId;
					}
				);
			}
		</script>
		
	</body>

</html>