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
		
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>智能停车管理系统</title>
		<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	    <meta name="viewport" content="width=device-width" />
	   	<!-- 浏览器小图标 -->
	    <link href="<%=basePath %>back/assets/img/apple-icon.png" rel="apple-touch-icon" sizes="76x76">
		<link href="<%=basePath %>back/assets/img/title.jpg" rel="icon" type="image/png" sizes="130x150">
		<!-- 外部CSS -->
	    <link href="<%=basePath %>back/assets/css/bootstrap.min.css" rel="stylesheet" />
	    <link href="<%=basePath %>back/assets/css/animate.min.css" rel="stylesheet"/>
	    <link href="<%=basePath %>back/assets/css/paper-dashboard.css" rel="stylesheet"/>
	    <link href="<%=basePath %>back/assets/css/demo.css" rel="stylesheet" />
	   	<link href="<%=basePath %>back/assets/css/themify-icons.css" rel="stylesheet">
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
			.savebutton1{
				border-style: solid;
				color: #ffffff;
				width:50%;
				height:50px;
				margin-left: 25%;
				margin-right: 25%;
				margin-top: 20px;
				border-radius:5px;
			}
			.savebutton1:hover{
				background-color: #777777;
				border-color: gold;
			}
			.savebutton2{
				border-style: solid;
				color: #ffffff;
				width:50%;
				height:50px;
				margin-left: 25%;
				margin-right: 25%;
				margin-top: 20px;
				border-radius:5px;
			}
			.savebutton2:hover{
				background-color: #777777;
				border-color: coral;
			}
    	</style>
	</head>
	<body>
		<!-- 办理会员入场 -->
		<div id="userEnter" class="reveal-modal">
			<h3 style="text-align: center;">会员入场业务办理</h3>
			<form action="<%=basePath%>record/userEnter.do" method="post">
				<div>
					<div class="add_view">
						车牌号：<input type="text" class="form-control" style="border-radius:5px;" id="rPlatenumber" name="rPlatenumber" value="" placeholder="请输入车牌号" onkeyup="checkNumber(this)"/>
					</div>
					<div class="alert alert-info"  id="checkNumber" role="alert" style="border-radius:5px;">如：蒙A99999</div>
				</div>
				<button type="submit"  class="savebutton" onclick="return checkUserForm()">提 交</button>
			</form>
			<a class="close-reveal-modal">&#215;</a>
		</div>
		
		<!-- 办理临时入场 -->
		<div id="tempEnter" class="reveal-modal">
			<h3 style="text-align: center;">临时入场业务办理</h3>
			<form action="<%=basePath%>record/tempEnter.do" method="post">
				<div>
					<div class="add_view">
						车牌号：<input type="text" class="form-control" style="border-radius:5px;" id="tempPlatenumber" name="rPlatenumber" value="" placeholder="请输入车牌号" onkeyup="checkTempNumber(this)"/>
					</div>
					<div class="alert alert-info"  id="checkTemp" role="alert" style="border-radius:5px;">如：蒙A99999</div>
				</div>
				<button type="submit"  class="savebutton" onclick="return checkTempForm()">提 交</button>
			</form>
			<a class="close-reveal-modal">&#215;</a>
		</div>
		
		<!-- 车辆出场 -->
		<div id="leavePark" class="reveal-modal">
			<h3 style="text-align: center;">车辆离场业务办理</h3>
			<form action="<%=basePath%>record/leavePark.do" method="post">
				<div>
					<div class="add_view">
						车牌号：<input type="text" class="form-control" style="border-radius:5px;" id="leavePlatenumber" name="rPlatenumber" value="" placeholder="请输入车牌号" onkeyup="checkLeaveNumber(this)"/>
					</div>
					<div class="alert alert-info"  id="checkLeave" role="alert" style="border-radius:5px;">如：蒙A99999</div>
				</div>
				<button type="submit"  class="savebutton" onclick="return checkLeaveForm()">提 交</button>
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
		                <li>
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
		                <li class="active">
		                    <a href="<%=basePath%>back/inandout.jsp">
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
		    	<!-- 页面主体上方标题和三个菜单 -->
				<nav class="navbar navbar-default">
		            <div class="container-fluid">
		                <div class="navbar-header">
		                    <a class="navbar-brand" href="#">出 入 业 务 管 理 In And Out</a>
		                </div>
		            </div>
		        </nav>
				<!-- 页面正文 -->
		        <div class="content">
		            <div class="container-fluid">
		            	<!-- 第一行 -->
		            	<div class="row">
		                    <div class="col-md-12">
		                        <div class="card" style="height: 80px;">
		                            <div class="header">
		                                <h4 class="title">出入场业务办理</h4>
		                                <p class="category">In And Out Business Processing</p>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <!-- 第二行 -->
		            	<div class="row">
		                    <div class="col-lg-4 col-sm-6">
		                        <div class="card">
		                            <div class="content">
		                            	<a href="#" data-reveal-id="userEnter" data-animation="fade">
			                                <div class="row">
			                                    <div class="col-xs-12">
			                                        <div class="icon-big icon-success text-center">
			                                            <i class="ti-angle-double-down"></i>
			                                        </div>
			                                    </div>
			                                </div>
			                                <div class="footer">
			                                    <hr />
			                                    <div class="stats" style="padding-left:220px;">
			                                        <i class="ti-angle-double-down"></i> 会员入场业务
			                                    </div>
			                                </div>
		                                </a>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-lg-4 col-sm-6">
		                        <div class="card">
		                            <div class="content">
		                            	<a href="#" data-reveal-id="tempEnter" data-animation="fade">
			                                <div class="row">
			                                    <div class="col-xs-12">
			                                        <div class="icon-big icon-success text-center">
			                                            <i class="ti-angle-down"></i>
			                                        </div>
			                                    </div>
	
			                                </div>
			                                <div class="footer">
			                                    <hr />
			                                    <div class="stats" style="padding-left:220px;">
			                                        <i class="ti-angle-down"></i> 临时入场业务
			                                    </div>
			                                </div>
			                            </a>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-lg-4 col-sm-6">
		                        <div class="card">
		                            <div class="content">
		                            	<a href="#" data-reveal-id="leavePark" data-animation="fade">
			                                <div class="row">
			                                    <div class="col-xs-12">
			                                        <div class="icon-big icon-success text-center">
			                                            <i class="ti-angle-double-up"></i>
			                                        </div>
			                                    </div>
			                                </div>
			                                <div class="footer">
			                                    <hr />
			                                    <div class="stats" style="padding-left:220px;">
			                                        <i class="ti-angle-double-up"></i> 车辆离场业务
			                                    </div>
			                                </div>
		                                </a>
		                            </div>
		                        </div>
		                    </div>
		                </div>
						<!-- 第三行 -->
						<div class="col-lg-6" style="margin-left:280px;margin-top:30px;">
				        <form action="<%=basePath%>record/selectRecord.do" method="post">
						    <div class="input-group">
						      	<input type="text" class="form-control" name="selectString" placeholder="请输入查询记录的车牌号或用户名" style="border-top-left-radius: 20px !important;border-bottom-left-radius: 20px !important;border-color: #dddddd !important;">
						      	<span class="input-group-btn">
						        	<button class="btn btn-default" type="submit">查询</button>
						      	</span>
						    </div>
						</form><!-- /input-group -->
						</div>
				        <div class="row">
				    
		                    <div class="col-md-12">
		                        <div class="card">
		                            <div class="header">
		                                <h4 class="title">车辆出入记录</h4>
		                                <p class="category">In And Out Record</p>
		                            </div>
		                            <div class="content table-responsive table-full-width">
		                                <table class="table table-striped">
		                                    <thead>
		                                        <th style="width:15%;text-align:center;">车牌号</th>
		                                    	<th style="width:10%;text-align:center;">停车卡类型</th>
		                                    	<th style="width:10%;text-align:center;">用户</th>
		                                    	<th style="width:10%;text-align:center;">停靠车位</th>
		                                    	<th style="width:15%;text-align:center;">入场时间</th>
		                                    	<th style="width:15%;text-align:center;">离场时间</th>
		                                    	<th style="width:8%;text-align:center;">收费金额</th>
		                                    	<th style="width:17%;text-align:center;">支付状态</th>
		                                    </thead>
		                                    <tbody>
		                                    	<c:forEach items="${recordList }" var="record">
		                                    		<tr>
			                                    		<td style="width:15%;text-align:center;">${record.rPlatenumber }</td>
														<td style="width:10%;text-align:center;">${record.rCardtype }</td>
														<td style="width:10%;text-align:center;">${record.rUser }</td>
														<td style="width:10%;text-align:center;">${record.rParking }</td>
														<td style="width:15%;text-align:center;">${record.rStarttime }</td>
														<td style="width:15%;text-align:center;">${record.rEndtime }</td>
														<td style="width:8%;text-align:center;">${record.rPrise }</td>
														<td style="width:17%;text-align:center;">${record.rPriseType }</td>
													</tr>
		                                        </c:forEach>
		                                        <c:forEach items="${selectUserList }" var="record">
		                                    		<tr>
			                                    		<td style="width:15%;text-align:center;">${record.rPlatenumber }</td>
														<td style="width:10%;text-align:center;">${record.rCardtype }</td>
														<td style="width:10%;text-align:center;">${record.rUser }</td>
														<td style="width:10%;text-align:center;">${record.rParking }</td>
														<td style="width:15%;text-align:center;">${record.rStarttime }</td>
														<td style="width:15%;text-align:center;">${record.rEndtime }</td>
														<td style="width:8%;text-align:center;">${record.rPrise }</td>
														<td style="width:17%;text-align:center;">${record.rPriseType }</td>
													</tr>
		                                        </c:forEach>
		                                        <c:forEach items="${selectPlatenumberList }" var="record">
		                                    		<tr>
			                                    		<td style="width:15%;text-align:center;">${record.rPlatenumber }</td>
														<td style="width:10%;text-align:center;">${record.rCardtype }</td>
														<td style="width:10%;text-align:center;">${record.rUser }</td>
														<td style="width:10%;text-align:center;">${record.rParking }</td>
														<td style="width:15%;text-align:center;">${record.rStarttime }</td>
														<td style="width:15%;text-align:center;">${record.rEndtime }</td>
														<td style="width:8%;text-align:center;">${record.rPrise }</td>
														<td style="width:17%;text-align:center;">${record.rPriseType }</td>
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
	<!-- 弹框 -->		
	<script src="<%=basePath %>back/js/jquery-1.6.2.js" type="text/javascript"></script>
	<script src="<%=basePath %>back/js/jquery.reveal.js" type="text/javascript"></script>
	
	<script src="<%=basePath %>back/js/jquery.notify.js" type="text/javascript" ></script>
	
	<!-- 验证公告内容 -->
	<script type="text/javascript">
		function checkPlatenumber(target){
			var content=target.value;
			var long=content.length;
			if(long != 0){
				$("#checkplatenumber").removeClass();
               	$("#checkplatenumber").addClass("alert alert-success");
                $("#checkplatenumber").html("输入正确！");
			}else if(long == 0){
				$("#checkplatenumber").removeClass();
              	$("#checkplatenumber").addClass("alert alert-danger");
               	$("#checkplatenumber").html("输入不能为空！");
			}
		}
	</script>

	<!-- 验证公告内容 -->
	<script type="text/javascript">
		function checkUser(target){
			var content=target.value;
			var long=content.length;
			if(long != 0){
				$("#checkuser").removeClass();
               	$("#checkuser").addClass("alert alert-success");
                $("#checkuser").html("输入正确！");
			}else if(long == 0){
				$("#checkuser").removeClass();
              	$("#checkuser").addClass("alert alert-danger");
               	$("#checkuser").html("输入不能为空！");
			}
		}
	</script>
	
	<!-- 验证入场信息表单-->
	<script type="text/javascript">
		function checkUserForm(){
   			var tipnumber = $("#checkNumber").text();
 
   			if(tipnumber != "输入正确！")
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
	
	<!-- 验证入场信息表单-->
	<script type="text/javascript">
		function checkTempForm(){
   			var tipnumber = $("#checkTemp").text();
 
   			if(tipnumber != "输入正确！")
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
	
	<!-- 验证入场信息表单-->
	<script type="text/javascript">
		function checkLeaveForm(){
   			var tipnumber = $("#checkLeave").text();
 
   			if(tipnumber != "输入正确！")
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
	
	<script type="text/javascript">
		function checkNumber(target){
			var content=target.value;
			var long=content.length;
			if(long != 0 && long == 7){
				$("#checkNumber").removeClass();
               	$("#checkNumber").addClass("alert alert-success");
                $("#checkNumber").html("输入正确！");
			}else if(long !=7 && long != 0){
				$("#checkNumber").removeClass();
              	$("#checkNumber").addClass("alert alert-warning");
               	$("#checkNumber").html("输入车牌号位数不符！");
			}else if(long == 0){
				$("#checkNumber").removeClass();
              	$("#checkNumber").addClass("alert alert-danger");
               	$("#checkNumber").html("输入不能为空！");
			}
		}
	</script>
	
	<script type="text/javascript">
		function checkTempNumber(target){
			var content=target.value;
			var long=content.length;
			if(long != 0 && long == 7){
				$("#checkTemp").removeClass();
               	$("#checkTemp").addClass("alert alert-success");
                $("#checkTemp").html("输入正确！");
			}else if(long !=7 && long != 0){
				$("#checkTemp").removeClass();
              	$("#checkTemp").addClass("alert alert-warning");
               	$("#checkTemp").html("输入车牌号位数不符！");
			}else if(long == 0){
				$("#checkTemp").removeClass();
              	$("#checkTemp").addClass("alert alert-danger");
               	$("#checkTemp").html("输入不能为空！");
			}
		}
	</script>
	
	<script type="text/javascript">
		function checkLeaveNumber(target){
			var content=target.value;
			var long=content.length;
			if(long != 0 && long == 7){
				$("#checkLeave").removeClass();
               	$("#checkLeave").addClass("alert alert-success");
                $("#checkLeave").html("输入正确！");
			}else if(long !=7 && long != 0){
				$("#checkLeave").removeClass();
              	$("#checkLeave").addClass("alert alert-warning");
               	$("#checkLeave").html("输入车牌号位数不符！");
			}else if(long == 0){
				$("#checkLeave").removeClass();
              	$("#checkLeave").addClass("alert alert-danger");
               	$("#checkLeave").html("输入不能为空！");
			}
		}
	</script>
</html>
