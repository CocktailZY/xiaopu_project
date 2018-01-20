<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

	<head>
		<title>公告信息管理</title>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath %>css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="<%=basePath %>css/uniform.css" />
		<link rel="stylesheet" href="<%=basePath %>css/select2.css" />
		<link rel="stylesheet" href="<%=basePath %>css/maruti-style.css" />
		<link rel="stylesheet" href="<%=basePath %>css/maruti-media.css" class="skin-color" />
		<link rel="stylesheet" href="<%=basePath %>css/mycss.css" />
		<link rel="stylesheet" href="<%=basePath %>css/sweet-alert.css" type="text/css" >
		<link rel="stylesheet" href="<%=basePath %>css/reveal.css">
		<link rel="stylesheet" href="<%=basePath %>css/rgq.css">
		<link rel="stylesheet" href="<%=basePath %>css/jcDate.css" type="text/css"/>	
		<link rel="stylesheet" href="<%=basePath %>css/default.css" type="text/css" >
		<link rel="stylesheet" href="<%=basePath %>css/jquery.notify.css" type="text/css" >
		<!-- 外部JS -->
		<script src="<%=basePath %>js/jquery.min.js"></script>
		<script src="<%=basePath %>js/jquery.ui.custom.js"></script>
		<script src="<%=basePath %>js/bootstrap.min.js"></script>
		<script src="<%=basePath %>js/jquery.uniform.js"></script>
		<script src="<%=basePath %>js/select2.min.js"></script>
		<script src="<%=basePath %>js/jquery.dataTables.min.js"></script>
		<script src="<%=basePath %>js/maruti.js"></script>
		<script src="<%=basePath %>js/maruti.tables.js"></script>
		<script src="<%=basePath %>js/sweet-alert.min.js"></script>
		<script src="<%=basePath %>js/jquery.reveal.js" type="text/javascript"></script>
		<script src="<%=basePath %>js/layer.js" type="text/javascript"></script>
		<script src="<%=basePath %>js/jquery.notify.js" type="text/javascript" ></script>
		
		<style type="text/css">
		.savebutton{
			border-style: solid;
			color: #ffffff;
			width:50%;
			height:50px;
			margin-left: 25%;
			margin-right: 25%;
			margin-top: 20px
		}
		.savebutton:hover{
			background-color: #777777;
			border-color: #777777;
		}
		</style>
	</head>

	<body>
		<!-- 修改窗口 -->
		<div id="updatemall" class="reveal-modal">
			<h1 style="text-align: center;">修改公告信息</h1>
			<form action="<%=basePath%>bulletion/updateMall.do" method="post">
				<div class="add_view">
					<input class="form-control add_shop" id="buId" name="buId" value="" type="hidden"/>
				</div>
				<div class="add_view">
					开始时间：<input class="form-control add_shop" id="buStart" name="buStart" value="" onmousemove="checkStartTime(this)"/>
				</div>
				<div class="mycheckbox alert alert-info" id="checkBuStart"role="alert">请输入活动开始时间，格式为  年-月-日 时：分：秒</div>
				<div class="add_view">
					结束时间：<input class="form-control add_shop" id="buEnd" name="buEnd" value="" onmousemove="checkEndTime(this)"/>
				</div>
				<div class="alert alert-info mycheckbox"  id="checkBuEnd" role="alert">请输入活动结束时间，格式为  年-月-日 时：分：秒</div>
				<div class="add_view">
					公告内容：<textarea class="form-control add-shop" rows="5" id="buContent" name="buContent" onmousemove="checkContent(this)"></textarea>
				</div>
				<div class="alert alert-info mycheckbox" id="checkBuContent" role="alert">请输入20字以内的公告标题（请以@符号分割一二级标题）</div>
				<button type="submit" class="savebutton" onclick="return checkForm()">保 存</button>
			</form>
			<a class="close-reveal-modal">&#215;</a>
		</div>
		
		<!-- 添加窗口 -->
		<div id="addmall" class="reveal-modal">
			<h1 style="text-align: center;">添加公告信息</h1>
			<form action="<%=basePath%>bulletion/addMall.do" method="post">
				<div class="add_view">
					开始时间：<input class="form-control add_shop" id="addbuStart" name="buStart" value="" onkeyup="checkAddStartTime(this)"/>
				</div>
				<div class="mycheckbox alert alert-info" id="addcheckBuStart"role="alert">请输入活动开始时间，格式为  年-月-日 时：分：秒</div>
				<div class="add_view">
					结束时间：<input class="form-control add_shop" id="addbuEnd" name="buEnd" value="" onkeyup="checkAddEndTime(this)"/>
				</div>
				<div class="alert alert-info mycheckbox"  id="addcheckBuEnd" role="alert">请输入活动结束时间，格式为  年-月-日 时：分：秒</div>
				<div class="add_view">
					公告内容：<textarea class="form-control add-shop" rows="5" id="addbuContent" name="buContent" onkeyup="checkAddContent(this)"></textarea>
				</div>
				<div class="alert alert-info mycheckbox" id="addcheckBuContent" role="alert">请输入20字以内的公告标题（请以@符号分割一二级标题）</div>
				<button type="submit" class="savebutton" onclick="return checkAddForm()">保 存</button>
			</form>
			<a class="close-reveal-modal">&#215;</a>
		</div>
		<!--Header-part-->
		<div id="header">
			<div style="padding-left: 20px;padding-top: 20px;font-family:'微软雅黑';font-size: 24px;color: ghostwhite;">
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
				<div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首 页</a> <a href="#" class="current">公告管理</a> </div>
				<h1>公告管理</h1>
			</div>
			<div id="mall-t" style="text-align: center;font-size: 24px;font-family: '微软雅黑';">商 城 公 告 管 理</div>
			<div id="shop-t" style="text-align: center;font-size: 24px;font-family: '微软雅黑';">店 铺 公 告 管 理</div>
			<div id="all-t" style="text-align: center;font-size: 24px;font-family: '微软雅黑';">全 部 公 告</div>
			<div id="mallbulletion-add" style="margin-right: 1%;width:4%;float:right;">
				<button class="mallbulletion-add" style="width:100%;height:3%;" data-reveal-id="addmall" data-animation="fade">+</button>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon"><i class="icon-th"></i></span>
								<div class="btn-group" role="group" style="height: 39px; font-size: 10px;">
									<ul class="nav nav-tabs" role="tablist">
  										<li role="presentation" id="allli" class="active" ><a href="#" onclick="change_div('all')">已发公告</a></li>
  										<li role="presentation" id="mallli" ><a href="#" onclick="change_div('mall')">商城公告</a></li>
 										<li role="presentation" id="shopli" ><a href="#" onclick="change_div('shop')">店铺公告</a></li>
									</ul>
								</div>	
							</div>
							<div class="widget-content nopadding" id="mall">
								<table class="table table-bordered data-table">
									<thead>
										<tr>
											<th style="width: 10%;">公告编号</th>
											<th style="width: 30%;">公告内容</th>
											<th style="width: 10%;">公告状态</th>
											<th style="width: 15%;">开始时间</th>
											<th style="width: 15%;">结束时间</th>		
											<th style="width: 20%;">操 作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${mallList }" var="bulletion">
											<tr class="gradeX">
												<td style="vertical-align:middle;width: 10%;text-align: center;">${bulletion.buId }</td>
												<td style="vertical-align:middle;width: 30%;text-align: center;">${bulletion.buContent }</td>
												<td style="vertical-align:middle;text-align: center;width: 10%;">未发布</td>
												<td style="vertical-align:middle;width: 15%;text-align: center;">${bulletion.buStart }</td>
												<td style="vertical-align:middle;width: 15%;text-align: center;">${bulletion.buEnd }</td>
												<td style="text-align: center;width: 20%;">
													<button class="btn btn-success" onclick="release('${bulletion.buId}')">发布公告</button><br>
													<button class="btn btn-warning" data-reveal-id="updatemall"
														data-animation="fade" onclick="update_mall(this)">修改公告</button><br>
													<button class="btn btn-danger" onclick="delete_bulletion('${bulletion.buId}')">删除公告</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="widget-content nopadding" id="shop">
								<table class="table table-bordered data-table">
									<thead>
										<tr>
											<th style="width: 10%;">公告编号</th>
											<th style="width: 25%;">公告内容</th>
											<th style="width: 15%;">店铺编号</th>
											<th style="width: 10%;">公告状态</th>
											<th style="width: 10%;">开始时间</th>
											<th style="width: 10%;">结束时间</th>
											<th style="width: 20%;">操 作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${shopList }" var="bulletion">
										<tr class="gradeX">
											<td style="vertical-align:middle;text-align: center;width: 10%;">${bulletion.buId }</td>
											<td style="vertical-align:middle;text-align: center;width: 25%;">${bulletion.buContent }</td>
											<td style="vertical-align:middle;text-align: center;width: 15%;">${bulletion.buShopId }</td>
											<td style="vertical-align:middle;text-align: center;width: 10%;">未审核</td>
											<td style="vertical-align:middle;text-align: center;width: 10%;">${bulletion.buStart }</td>
											<td style="vertical-align:middle;text-align: center;width: 10%;">${bulletion.buEnd }</td>
											<td style="width: 20%;text-align: center;">
												<button class="btn btn-success" onclick="window.location.href='<%=basePath%>bulletion/updateToRelease.do?buId=${bulletion.buId}'">审核通过</button>
												<button class="btn btn-danger" onclick="delete_bulletion('${bulletion.buId}')">删除公告</button>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="widget-content nopadding" id="all">
								<table class="table table-bordered data-table">
									<thead>
										<tr>
											<th style="width: 10%;">公告编号</th>
											<th style="width: 20%;">公告内容</th>
											<th style="width: 15%;">公告类型</th>
											<th style="width: 15%;">店铺编号</th>
											<th style="width: 15%;">开始时间</th>
											<th style="width: 15%;">结束时间</th>
											<th style="width: 10%;">操 作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${allList }" var="bulletion">
											<tr class="gradeX">
												<td style="vertical-align:middle;width: 10%;text-align: center;">${bulletion.buId }</td>
												<td style="vertical-align:middle;width: 20%;text-align: center;">${bulletion.buContent }</td>
												<td style="vertical-align:middle;width: 15%;text-align: center;">
												<c:if test="${bulletion.buCategory == 0 }">
													商城公告
												</c:if>
												<c:if test="${bulletion.buCategory == 1 }">
													店铺公告
												</c:if>
												</td>
												<td style="vertical-align:middle;width: 15%;text-align: center;">${bulletion.buShopId }</td>
												<td style="vertical-align:middle;width: 15%;text-align: center;">${bulletion.buStart }</td>
												<td style="vertical-align:middle;width: 15%;text-align: center;">${bulletion.buEnd }</td>
												
												<td style="text-align: center;width: 10%;">
													<button class="btn btn-danger" onclick="update_delete('${bulletion.buId }')">删除公告</button>
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
		<div style="color:white;background: black;width:100%;text-align: center;"> 2016 &copy; 安博实训A2小组</div>

		<!-- 点击切换div的JS -->
		<script type="text/javascript">
			function change_div(id) {
				if (id == 'all') {
					document.getElementById("all").style.display = 'block';
					document.getElementById("mall").style.display = 'none';
					document.getElementById("shop").style.display = 'none';
					document.getElementById("all-t").style.display = 'block';
					document.getElementById("mall-t").style.display = 'none';
					document.getElementById("shop-t").style.display = 'none';
					document.getElementById("mallbulletion-add").style.display = 'none';
					$("#mallli").removeClass();
					$("#shopli").removeClass();
					$("#allli").addClass("active");
				} else if(id == 'mall'){
					document.getElementById("all").style.display = 'none';
					document.getElementById("shop").style.display = 'none';
					document.getElementById("mall").style.display = 'block';
					document.getElementById("all-t").style.display = 'none';
					document.getElementById("shop-t").style.display = 'none';
					document.getElementById("mall-t").style.display = 'block';
					document.getElementById("mallbulletion-add").style.display = 'block';
					$("#allli").removeClass();
					$("#shopli").removeClass();
					$("#mallli").addClass("active");
				}else {
					document.getElementById("all").style.display = 'none';
					document.getElementById("mall").style.display = 'none';
					document.getElementById("shop").style.display = 'block';
					document.getElementById("all-t").style.display = 'none';
					document.getElementById("mall-t").style.display = 'none';
					document.getElementById("shop-t").style.display = 'block';
					document.getElementById("mallbulletion-add").style.display = 'none';
					$("#mallli").removeClass();
					$("#allli").removeClass();
					$("#shopli").addClass("active");
				}
			}
		</script>
		
		<!-- 删除公告信息弹出提示框的JS -->
		<script type="text/javascript">
			function delete_bulletion(buId) {
				swal({
					title: "确定删除?",
					text: "删除前请确认公告的信息!",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "是的,删除!"
				},
				function()
					{
						window.location.href="<%=basePath%>bulletion/deleteBulletion.do?buId="+buId
					}
				);
			}
		</script>
		
		<!-- 点击发布商城公告弹出提示框的JS -->
		<script type="text/javascript">
			function release(buId) {
				swal({
					title: "确定发布?",
					text: "发布后将不可做出修改!",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#149BDF",
					confirmButtonText: "是的,发布!"
				},
				function()
					{
						window.location.href="<%=basePath%>bulletion/updateToRelease.do?buId="+buId
					}
				);
			}
		</script>
		
		<!-- 将公告修改为删除状态的提示框JS -->
		<script type="text/javascript">
			function update_delete(buId) {
				swal({
					title: "确定删除?",
					text: "删除前请确认公告的信息!",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "是的,删除!"
				},
				function()
					{
						window.location.href="<%=basePath%>bulletion/updateToDelete.do?buId="+buId
					}
				);
			}
		</script>
		
		<!-- 通过行号获取当前行数据进行修改的JS -->
		<script type="text/javascript">
			var curRow;	//全局行号
			var curRowId; //选中行的记录信息的ID
			var curColor;
			function update_mall(tr)
			{
				//节点的节点得到tr,根据tr行号输出对应内容
				s=tr.parentNode.parentNode;	
				curRow = s;
				curRowId = s.id;
				document.getElementById("buId").value =s.cells[0].innerText;
				document.getElementById("buContent").value =s.cells[1].innerText;
				document.getElementById("buStart").value =s.cells[3].innerText;
				document.getElementById("buEnd").value =s.cells[4].innerText;
			}
		</script>
		
		<!-- 判断修改的活动开始时间格式及数值是否符合要求 -->
		<script type="text/javascript">
			function checkStartTime(target){
				var time=target.value;
				var now = new Date().getTime();
				var r=time.match(/^(\d{4})\-(\d{2})\-(\d{2}) (\d{2}):(\d{2}):(\d{2})$/);
				var n=Date.parse(new Date(now));
				var t=Date.parse(new Date(time));
				if(target.value==''){
   		   	 		$("#checkBuStart").removeClass();
               		$("#checkBuStart").addClass("mycheckbox alert alert-warning");
                	$("#checkBuStart").html("输入不能为空！");
                }else if(target.value!='' && r!= null && t>n){
   		   			$("#checkBuStart").removeClass();
                	$("#checkBuStart").addClass("mycheckbox alert alert-success");
                 	$("#checkBuStart").html("输入正确！");
   		   		}else if(r==null){
   		   			$("#checkBuStart").removeClass();
               		$("#checkBuStart").addClass("mycheckbox alert alert-warning");
                	$("#checkBuStart").html("请输入正确的时间格式！");
   		   		}else if(t<n){
   		   			$("#checkBuStart").removeClass();
               		$("#checkBuStart").addClass("mycheckbox alert alert-warning");
                	$("#checkBuStart").html("您输入的开始时间早于当前时间，请重新输入！");
   		   		}
			}
		</script>
		
		<!-- 判断修改的活动结束时间格式及数值是否符合要求-->
		<script type="text/javascript">
			function checkEndTime(target){
				var start= $("#buStart").val();
				var s=Date.parse(new Date(start));
				var end=target.value;
				var e=Date.parse(new Date(end));
				var r=end.match(/^(\d{4})\-(\d{2})\-(\d{2}) (\d{2}):(\d{2}):(\d{2})$/);
				if(target.value==''){
   		   	 		$("#checkBuEnd").removeClass();
               		$("#checkBuEnd").addClass("mycheckbox alert alert-warning");
                	$("#checkBuEnd").html("输入不能为空！");
                	//target.focus();
                }else if(target.value!='' && r!= null && e>s){
   		   			$("#checkBuEnd").removeClass();
                	$("#checkBuEnd").addClass("mycheckbox alert alert-success");
                 	$("#checkBuEnd").html("输入正确！");
   		   		}else if(r==null){
   		   			$("#checkBuEnd").removeClass();
               		$("#checkBuEnd").addClass("mycheckbox alert alert-warning");
                	$("#checkBuEnd").html("请输入正确的时间格式！");
   		   		}else if(e<s){
   		   			$("#checkBuEnd").removeClass();
               		$("#checkBuEnd").addClass("mycheckbox alert alert-warning");
                	$("#checkBuEnd").html("您输入的结束时间早于开始时间，请重新输入！");
   		   		}
			}
		</script>
		
		<!-- 判断修改的活动标题格式及数值是否符合要求 -->
		<script type="text/javascript">
		function checkContent(target){
				var content=target.value;
				var long=content.length;
				if(long<21 && long != 0){
					$("#checkBuContent").removeClass();
                	$("#checkBuContent").addClass("mycheckbox alert alert-success");
                 	$("#checkBuContent").html("输入正确！");
				}else if(long>20){
					$("#checkBuContent").removeClass();
               		$("#checkBuContent").addClass("mycheckbox alert alert-warning");
                	$("#checkBuContent").html("长度超出限制！");
				}else if(long==0){
					$("#checkBuContent").removeClass();
               		$("#checkBuContent").addClass("mycheckbox alert alert-warning");
                	$("#checkBuContent").html("输入不能为空！");
				}
			}
		
		</script>
		
		<!-- 验证修改提交的公告信息 -->
		<script type="text/javascript">
		function checkForm() {
   			var tipStart = $("#checkBuStart").text();
   			var tipEnd = $("#checkBuEnd").text();
   			var tipContent = $("#checkBuContent").text();
   			if(tipStart!="输入正确！" || tipEnd!="输入正确！" || tipContent!="输入正确！"){
   				$('<p>请输入正确信息后保存！</p>').notify('error');
   				return false;
   			}else{
   				$('<p>保存成功！</p>').notify('success');
   				return true;			
   			}
     	}
		</script>
		
		<!-- 判断添加的活动开始时间格式及数值是否符合要求 -->
		<script type="text/javascript">
			function checkAddStartTime(target){
				var time=target.value;
				var now = new Date().getTime();
				var r=time.match(/^(\d{4})\-(\d{2})\-(\d{2}) (\d{2}):(\d{2}):(\d{2})$/);
				var n=Date.parse(new Date(now));
				var t=Date.parse(new Date(time));
				if(target.value==''){
   		   	 		$("#addcheckBuStart").removeClass();
               		$("#addcheckBuStart").addClass("mycheckbox alert alert-warning");
                	$("#addcheckBuStart").html("输入不能为空！");
                	//target.focus();
                }else if(target.value!='' && r!= null && t>n){
   		   			$("#addcheckBuStart").removeClass();
                	$("#addcheckBuStart").addClass("mycheckbox alert alert-success");
                 	$("#addcheckBuStart").html("输入正确！");
   		   		}else if(r==null){
   		   			$("#addcheckBuStart").removeClass();
               		$("#addcheckBuStart").addClass("mycheckbox alert alert-warning");
                	$("#addcheckBuStart").html("请输入正确的时间格式！");
   		   		}else if(t<n){
   		   			$("#addcheckBuStart").removeClass();
               		$("#addcheckBuStart").addClass("mycheckbox alert alert-warning");
                	$("#addcheckBuStart").html("您输入的开始时间早于当前时间，请重新输入！");
   		   		}
			}
		</script>
		
		<!-- 判断添加的活动结束时间格式及数值是否符合要求-->
		<script type="text/javascript">
			function checkAddEndTime(target){
				var start= $("#addbuStart").val();
				var s=Date.parse(new Date(start));
				var end=target.value;
				var e=Date.parse(new Date(end));
				var r=end.match(/^(\d{4})\-(\d{2})\-(\d{2}) (\d{2}):(\d{2}):(\d{2})$/);
				if(target.value==''){
   		   	 		$("#addcheckBuEnd").removeClass();
               		$("#addcheckBuEnd").addClass("mycheckbox alert alert-warning");
                	$("#addcheckBuEnd").html("输入不能为空！");
                	//target.focus();
                }else if(target.value!='' && r!= null && e>s){
   		   			$("#addcheckBuEnd").removeClass();
                	$("#addcheckBuEnd").addClass("mycheckbox alert alert-success");
                 	$("#addcheckBuEnd").html("输入正确！");
   		   		}else if(r==null){
   		   			$("#addcheckBuEnd").removeClass();
               		$("#addcheckBuEnd").addClass("mycheckbox alert alert-warning");
                	$("#addcheckBuEnd").html("请输入正确的时间格式！");
   		   		}else if(e<s){
   		   			$("#addcheckBuEnd").removeClass();
               		$("#addcheckBuEnd").addClass("mycheckbox alert alert-warning");
                	$("#addcheckBuEnd").html("您输入的结束时间早于开始时间，请重新输入！");
   		   		}
			}
		</script>
		
		<!-- 判断添加的活动标题格式及数值是否符合要求 -->
		<script type="text/javascript">
		function checkAddContent(target){
				var content=target.value;
				var long=content.length;
				if(long<21 && long != 0){
					$("#addcheckBuContent").removeClass();
                	$("#addcheckBuContent").addClass("mycheckbox alert alert-success");
                 	$("#addcheckBuContent").html("输入正确！");
				}else if(long>20){
					$("#addcheckBuContent").removeClass();
               		$("#addcheckBuContent").addClass("mycheckbox alert alert-warning");
                	$("#addcheckBuContent").html("长度超出限制！");
				}else if(long==0){
					$("#addcheckBuContent").removeClass();
               		$("#addcheckBuContent").addClass("mycheckbox alert alert-warning");
                	$("#addcheckBuContent").html("输入不能为空！");
				}
			}
		</script>
		
		<!-- 验证添加的公告信息 -->
		<script type="text/javascript">
		function checkAddForm() {
   			var tipStart = $("#addcheckBuStart").text();
   			var tipEnd = $("#addcheckBuEnd").text();
   			var tipContent = $("#addcheckBuContent").text();
   			if(tipStart!="输入正确！" || tipEnd!="输入正确！" || tipContent!="输入正确！"){
   				$('<p>请输入正确信息后保存！</p>').notify('error');
   				return false;
   			}else{
   				$('<p>保存成功！</p>').notify('success');
   				return true;
   			}
     	}
		</script>
	</body>

</html>