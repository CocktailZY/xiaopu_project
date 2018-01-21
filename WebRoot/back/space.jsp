<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<link rel="apple-touch-icon" sizes="76x76" href="<%=basePath %>back/assets/img/apple-icon.png">
		<link rel="icon" type="image/png" sizes="130x150" href="<%=basePath %>back/assets/img/title.jpg">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>智能停车管理系统</title>
		<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	    <meta name="viewport" content="width=device-width" />

	    <link href="<%=basePath %>back/assets/css/bootstrap.min.css" rel="stylesheet" />
	    <link href="<%=basePath %>back/assets/css/animate.min.css" rel="stylesheet"/>
	    <link href="<%=basePath %>back/assets/css/paper-dashboard.css" rel="stylesheet"/>
	    <link href="<%=basePath %>back/assets/css/demo.css" rel="stylesheet" />
	    <link href="<%=basePath %>back/assets/css/themify-icons.css" rel="stylesheet">
	    <link href="<%=basePath %>back/css/hover.css" rel="stylesheet" media="all">
	    <link href="<%=basePath %>back/css/reveal.css" rel="stylesheet">
	    <link href="<%=basePath %>back/css/jquery.notify.css" rel="stylesheet" type="text/css" >
	    <link rel="stylesheet" href="<%=basePath %>back/css/sweet-alert.css" type="text/css" >
	    
		<!-- 内部CSS -->
	    <style type="text/css">
	        a {
	            text-decoration: none;
	        }
	        ul, ol, li {
	            list-style: none;
	            padding: 0;
	            margin: 0;
	        }
	        #demo {
	            width: 380px;
	            margin: 10px auto;
	        }
	        p {
	            margin: 0;
	        }
	        #dt {
	            margin: 30px auto;
	            height: 28px;
	            width: 200px;
	            padding: 0 6px;
	            border: 1px solid #ccc;
	            outline: none;
	        }
	        .savebutton{
				border-style: solid;
				color: #ffffff;
				width:50%;
				height:50px;
				margin-left: 25%;
				margin-right: 25%;
				margin-top: 20px;
				border-radius:5px;
			}
			.savebutton:hover{
				background-color: #777777;
				border-color: #777777;
			}
    	</style>
	</head>
	<body>
		<!-- 添加区块 -->
		<div id="addZone" class="reveal-modal">
			<h3 style="text-align: center;">修改停车场参数</h3>
			<form action="<%=basePath%>zone/addZone.do" method="post">
				<div>
					<div class="add_view">
						<input style="display:none;" value="" name="zId"/>
						区块名称：<input type="text" class="form-control" style="border-radius:5px;" id="zName" name="zName" value="" placeholder="请输入区块名称" onkeyup="checkZname(this)"/>
					</div>
					<div class="alert alert-info" id="checkZname" role="alert" style="border-radius:5px;">10个字符以内</div>
				</div>
				
				<button type="submit" class="savebutton" onclick="return checkZoneForm()">保 存</button>
			</form>
			<a class="close-reveal-modal">&#215;</a>
		</div>
		
		<!-- 添加车位 -->
		<div id="addSpace" class="reveal-modal">
			<h3 style="text-align: center;">添加车位信息</h3>
			<form action="<%=basePath%>space/addSpace.do" method="post">
				<div>
					<div class="add_view">
						所属区块：<select class="form-control" name="sZone">
									<c:forEach items="${allZoneList }" var="zone">
											  <option>${zone.zName }</option>
									</c:forEach>
							  </select>
					</div>
					<div class="add_view">
						添加数量：<input type="text" class="form-control" style="border-radius:5px;" name="count" value="" placeholder="请输入100以内的数字" onkeyup="checkCount(this)"/>
					</div>
					<div class="alert alert-info" id="checkCount" role="alert" style="border-radius:5px;">10个字符以内</div>
				</div>
				<button type="submit" class="savebutton" onclick="return checkSpaceForm()">保 存</button>
			</form>
			<a class="close-reveal-modal">&#215;</a>
		</div>
		
		
		<div class="wrapper">
			<!-- 页面左侧logo和导航 -->
			<div class="sidebar" data-background-color="white" data-active-color="danger">
		    	<div class="sidebar-wrapper">
		            <div class="logo">
		                <a class="simple-text">
		            		 智能停车管理系统
		                </a>
		            </div>
		            <ul class="nav">
		                <li>
		                    <a href="<%=basePath%>admin/show.do">
		                        <i class="ti-home"></i>
		                        <p>首 页&nbsp;&nbsp;Home Page </p>
		                    </a>
		                </li>
		                <li class="active">
		                    <a href="<%=basePath%>space/show.do">
		                        <i class="ti-menu"></i>
		                        <p>车 位 管 理&nbsp;&nbsp;Parking Space</p>
		                    </a> 
		                </li>
		                <li>
		                    <a href="<%=basePath%>charge/show.do">
		                        <i class="ti-clipboard"></i>
		                        <p>收 费 规 则 管 理&nbsp;&nbsp;Charge</p>
		                    </a>
		                </li>
		                <li>
		                    <a href="<%=basePath%>card/show.do">
		                        <i class="ti-id-badge"></i>
		                        <p>办 卡 业 务 管 理&nbsp;&nbsp;Card</p>
		                    </a>
		                </li>
		                <li>
		                    <a href="<%=basePath%>record/show.do">
		                        <i class="ti-direction-alt"></i>
		                        <p>出 入 业 务 管 理&nbsp;&nbsp;In Out</p>
		                    </a>
		                </li>
		                <li>
		                    <a href="<%=basePath%>record/statistic.do">
		                        <i class="ti-server"></i>
		                        <p>信 息 统 计 管 理&nbsp;&nbsp;Statistic</p>
		                    </a>
		                </li>
		            </ul>
		    	</div>
		    </div>
			<!-- 页面主体 -->
		    <div class="main-panel">
		    	<!-- 主体上方标题和三个选项菜单 -->
				<nav class="navbar navbar-default">
		            <div class="container-fluid">
		                <div class="navbar-header">
		                    <a class="navbar-brand" href="#">车 位 管 理 Parking Space</a>
		                </div>
		                
		            </div>
		        </nav>
				<!-- 页面正文 -->
		        <div class="content">
		            <div class="container-fluid">
		            	<!-- 第一行 -->      
		            	<!-- 第一行 -->
				        <div class="row">
		                    <div class="col-md-12">
		                        <div class="card">
		                            <div class="header">
		                                <h4 class="title">停车场区块信息<a class="btn btn-round btn-fill btn-info" style="height:50px;width:128px; font-size: 15px;float: right;margin-top:0px;color: white;padding-top:14px;" href="#" data-reveal-id="addZone" data-animation="fade">添加区块</a></h4>
		                                <p class="category">Zone Information</p>
		                            </div>
		                            <div class="content table-responsive table-full-width">
		                                <table class="table">
		                                    <thead>
		                                    	<th style="width:10%;text-align:center;">区块名称</th>
		                                    	<th style="width:10%;text-align:center;">操作</th>
		                                    	<th style="width:10%;text-align:center;">区块名称</th>
		                                    	<th style="width:10%;text-align:center;">操作</th>
		                                    	<th style="width:10%;text-align:center;">区块名称</th>
		                                    	<th style="width:10%;text-align:center;">操作</th>
		                                    	<th style="width:10%;text-align:center;">区块名称</th>
		                                    	<th style="width:10%;text-align:center;">操作</th>
		                                    	<th style="width:10%;text-align:center;">区块名称</th>
		                                    	<th style="width:10%;text-align:center;">操作</th>
		                                    </thead>
		                                    <tbody>
		                                    	<c:forEach items="${allZoneList }" var="zone" varStatus="status">
		                                    	<c:if  test="${status.count%5==1}">
		                                    		<tr>
		                                    	</c:if>
														<td style="width:10%;text-align:center;">${zone.zName }</td>
														<td style="width:10%;text-align:center;">
														<a class="btn btn-round btn-fill btn-danger" style="font-size: 15px;margin-top:0px;color: white;" onclick="delete_zone('${zone.zId }','${zone.zName }')">删 除</a></td>
												<c:if test="${status.count%5==0}">	
													</tr>
												</c:if>
		                                        </c:forEach>
		                                    </tbody>
		                                </table>
		                            </div>
		                        </div>
		                    </div>
                		</div>
				        <!-- 第四行 -->
				        <div class="row">
		                    <div class="col-md-12">
		                        <div class="card">
		                            <div class="header">
		                                <h4 class="title">车位图示<a class="btn btn-round btn-fill btn-info" style="height:50px;width:128px; font-size: 15px;float: right;margin-top:0px;color: white;padding-top:14px;" href="#" data-reveal-id="addSpace" data-animation="fade">添加车位</a></h4>
		                                <p class="category">Parking View</p>
		                            </div>
		                            <div class="content table-responsive table-full-width" style="padding-left:27px;" id="table">
		                                <table >
		                                    	<c:forEach items="${allSpaceList }" var="space"  varStatus="status">
		                                    	<c:if  test="${status.count%5==1}">
		                                    		<tr>
		                                    	</c:if>
			                                    	<c:if  test="${space.sState==1}">
				                                    	<td style="width:236px;height:60px;text-align:center;">
				                                    		<a class="btn btn-round btn-fill btn-warning" style="height:50px;width:200px; font-size: 15px;margin-top:0px;color: white;padding-top:14px;" href="#" onclick="show_car('${space.sPlatenumber }')"><i class="ti-car"></i>&nbsp;&nbsp;&nbsp;&nbsp;${space.sZone}-${space.sNumber}&nbsp;&nbsp;&nbsp;&nbsp;占用&nbsp;&nbsp;&nbsp;</a>
				                                    	</td>
				                                    </c:if>
				                                    <c:if  test="${space.sState==0}">
				                                    	<td style="width:236px;height:60px;text-align:center;">
				                                    		<a class="btn btn-round btn-fill btn-success" style="height:50px;width:200px; font-size: 15px;margin-top:0px;color: white;padding-top:14px;" href="#" onclick="show_empty()"><i class="ti-car"></i>&nbsp;&nbsp;&nbsp;&nbsp;${space.sZone}-${space.sNumber}&nbsp;&nbsp;&nbsp;&nbsp;空余&nbsp;&nbsp;&nbsp;<i class="ti-trash" onclick="delete_space('${space.sId }')"></i></a>
				                                    	</td> 
				                                    </c:if>
												<c:if test="${status.count%5==0}">
													</tr>
												</c:if>
		                                        </c:forEach>
		                                </table>
		                            </div>
		                        </div>
		                    </div>
                		</div>
		            </div>
		        </div>
		        <footer class="footer">
			        <div class="container-fluid">
			            <div class="copyright pull-right">
			                &copy;Copyright <script>document.write(new Date().getFullYear())</script> by 解忧小铺</a> All Rights Reserved
			            </div>
			        </div>
			    </footer>
		    </div>
		</div>
	</body>

    <!--   Core JS Files   -->
    <script src="<%=basePath %>back/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%=basePath %>back/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="<%=basePath %>back/assets/js/bootstrap-checkbox-radio.js"></script>
	<!--  Charts Plugin -->
	<script src="<%=basePath %>back/assets/js/chartist.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="<%=basePath %>back/assets/js/bootstrap-notify.js"></script>
    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="<%=basePath %>back/assets/js/paper-dashboard.js"></script>
	<script src="<%=basePath %>back/js/jquery-1.6.2.js" type="text/javascript"></script>
	
	<script src="<%=basePath %>back/js/jquery.reveal.js" type="text/javascript"></script>
	<script src="<%=basePath %>back/js/jquery.notify.js" type="text/javascript" ></script>
	
	<script src="<%=basePath %>back/js/sweet-alert.min.js"></script>

   	
	
	
	<!-- 验证规则名称 -->
	<script type="text/javascript">
		function checkCharge(target){
			var content=target.value;
			var long=content.length;
			if(long != 0 && long < 11){
				$("#checkCharge").removeClass();
               	$("#checkCharge").addClass("alert alert-success");
                $("#checkCharge").html("输入正确！");
			}else if(long > 10){
				$("#checkCharge").removeClass();
              	$("#checkCharge").addClass("alert alert-warning");
               	$("#checkCharge").html("输入内容长度超限");
			}else if(long == 0){
				$("#checkCharge").removeClass();
              	$("#checkCharge").addClass("alert alert-danger");
               	$("#checkCharge").html("输入不能为空！");
			}
		}
	</script>
	
	<!-- 验证规则金额 -->
	<script type="text/javascript">
		function checkPrise(target){
			var content=target.value;
			var long=content.length;
			var reg=/^[1-9]\d*$|^0$/;
			if(reg.test(content)==true && long != 0 && long < 5){
				$("#checkPrise").removeClass();
               	$("#checkPrise").addClass("alert alert-success");
                $("#checkPrise").html("输入正确！");
			}else if(reg.test(content)!=true && long != 0 || long > 4 && long != 0){
				$("#checkPrise").removeClass();
              	$("#checkPrise").addClass("alert alert-warning");
               	$("#checkPrise").html("输入内容有误或超限！");
			}else if(long == 0){
				$("#checkPrise").removeClass();
              	$("#checkPrise").addClass("alert alert-danger");
               	$("#checkPrise").html("输入不能为空！");
			}
		}
	</script>

	<!-- 验证车位数 -->
	<script type="text/javascript">
		function checkCount(target){
			var content=target.value;
			var long=content.length;
			if(long != 0 && long < 3){
				$("#checkCount").removeClass();
               	$("#checkCount").addClass("alert alert-success");
                $("#checkCount").html("输入正确！");
			}else if(long > 2){
				$("#checkCount").removeClass();
              	$("#checkCount").addClass("alert alert-warning");
               	$("#checkCount").html("添加车位超出99个！");
			}else if(long == 0){
				$("#checkCount").removeClass();
              	$("#checkCount").addClass("alert alert-danger");
               	$("#checkCount").html("输入不能为空！");
			}
		}
	</script>
	
	<!-- 验证区块 -->
	<script type="text/javascript">
		function checkZname(target){
			var content=target.value;
			var long=content.length;
			if(long != 0 && long < 3){
				$("#checkZname").removeClass();
               	$("#checkZname").addClass("alert alert-success");
                $("#checkZname").html("输入正确！");
			}else if(long > 2){
				$("#checkZname").removeClass();
              	$("#checkZname").addClass("alert alert-warning");
               	$("#checkZname").html("区块名称过长！");
			}else if(long == 0){
				$("#checkZname").removeClass();
              	$("#checkZname").addClass("alert alert-danger");
               	$("#checkZname").html("输入不能为空！");
			}
		}
	</script>
	
	<!-- 验证停车场基本信息表单-->
	<script type="text/javascript">
		function checkZoneForm(){
   			var tipzname = $("#checkZname").text();
   			if(tipzname != "输入正确！")
   			{
   				$('<p>请输入正确信息后保存修改！</p>').notify('error');
   				return false;
   			}else
   			{
   				$('<p>保存成功！</p>').notify('success');
   				return true;			
   			}
     	}
	</script>
	
	<!-- 验证收费规则信息表单-->
	<script type="text/javascript">
		function checkChargeForm(){
   			var tipname = $("#checkCharge").text();
   			var tipprise = $("#checkPrise").text();

   			if(tipname != "输入正确！" || tipprise != "输入正确！")
   			{
   				$('<p>请输入正确信息后保存修改！</p>').notify('error');
   				return false;
   			}else
   			{
   				$('<p>保存成功！</p>').notify('success');
   				return true;			
   			}
     	}
	</script>
	
	<!-- 验证公告信息表单-->
	<script type="text/javascript">
		function checkSpaceForm(){
   			var tipcount = $("#checkCount").text();  
   			if(tipcount != "输入正确！")
   			{
   				$('<p>请输入正确信息后保存修改！</p>').notify('error');
   				return false;
   			}else
   			{
   				$('<p>保存成功！</p>').notify('success');
   				return true;			
   			}
     	}
	</script>
	


	<!-- 删除停车场区块 -->
	<script type="text/javascript">
		function delete_zone(zId,zName) {
			var array = new Array();   
			<c:forEach items="${allZoneNameList }" var="zone">   
			array.push("${zone}");    
			var temp = "${zone}";   
			</c:forEach>
			var test = 0;
			for(var i=0;i<array.length;i++){
				if(array[i]==zName){
					test = test + 1;
				}else{
					test = test;
				}
			}
			if(test == 0){
				swal({
					title: "删除区块！",
					text: "区块删除将删除包含的车位？",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "是的,删除!"
				},
				function()
					{
						window.location.href="<%=basePath%>zone/deleteZone.do?zId="+zId
					}
				);
			}else{
				swal({
					title: "不可删除！",
					text: "此区块尚有占用车位",
					type: "warning",
					showCancelButton: false,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "关闭"
				});
			}
		}
	</script>
	
	<!-- 删除车位 -->
	<script type="text/javascript">
		function delete_space(sId) {

				swal({
					title: "删除车位！",
					text: "该车位的所有信息将被删除！",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "是的,删除!"
				},
				function()
					{
						window.location.href="<%=basePath%>space/deleteSpace.do?sId="+sId
					}
				);
		}
	</script>
	
	<script type="text/javascript">
		function show_car(sPlatenumber) {
			swal({
				title: "此车位已占用",
				text: "停靠车辆车牌号为："+sPlatenumber,
				showCancelButton: false,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "关闭"
			});
		}
	</script>

</html>
