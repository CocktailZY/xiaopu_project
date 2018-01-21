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
		<!-- 添加收费信息窗口 -->
		<div id="addcharge" class="reveal-modal">
			<h3 style="text-align: center;">添加收费信息</h3>
			<form action="<%=basePath%>charge/addCharge.do" method="post">
				<div style="width:48%;float:left;">
					<div class="add_view">
						规则名称：<input type="text" class="form-control" style="border-radius:5px;" id="chName" name="chName" value="" placeholder="请输入规则名称" onkeyup="checkCharge(this)"/>
					</div>
					<div class="alert alert-info"  id="checkCharge" role="alert" style="border-radius:5px;">10个字符以内</div>
				</div>
				<div style="width:48%;float:right;">
					<div class="add_view">
						停车卡类型：<select class="form-control" name="chCardtype">
									  <option>临时卡</option>
									  <option>会员卡</option>
								</select>
					</div>
					<div class="alert alert-success" role="alert" style="border-radius:5px;">请选择停车卡类型</div>
				</div>
				<div style="width:48%;float:left;">
					<div class="add_view">
						时间单位：<select class="form-control" name="chUnittime">
									  <option>小时</option>
									  <option>天</option>
								</select>
					</div>
					<div class="alert alert-success" role="alert" style="border-radius:5px;">请选择时间单位</div>
				</div>
				<div style="width:48%;float:right;">
					<div class="add_view">
						单位时间金额：<input type="text" class="form-control" style="border-radius:5px;" id="chUnitprise" name="chUnitprise" value="" placeholder="请输入金额" onkeyup="checkPrise(this)"></input>
					</div>
					<div class="alert alert-info" id="checkPrise" role="alert" style="border-radius:5px;">单位时间金额最大9999</div>
				</div>
				<a>注：8小时以上按天计算</a>
				<button type="submit" class="savebutton" onclick="return checkChargeForm()">保 存</button>
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
		                <li class="active">
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
		                    <a class="navbar-brand" href="#">收 费 规 则 管 理 Charge Management</a>
		                </div>
		                
		            </div>
		        </nav>
				<!-- 页面正文 -->
		        <div class="content">
		            <div class="container-fluid">
				        <!-- 第一行 -->
				        <div class="row">
		                    <div class="col-md-12">
		                        <div class="card">
		                            <div class="header">
		                                <h4 class="title">收费规则<a class="btn btn-round btn-fill btn-info" style="height:50px;width:128px; font-size: 15px;float: right;margin-top:0px;color: white;padding-top:14px;" href="#" data-reveal-id="addcharge" data-animation="fade">添加收费规则</a></h4>
		                                <p class="category">Charging Rules</p>
		                            </div>
		                            <div class="content table-responsive table-full-width">
		                                <table class="table table-striped">
		                                    <thead>
		                                        <th style="width:10%;text-align:center;">编号</th>
		                                    	<th style="width:20%;text-align:center;">规则名称</th>
		                                    	<th style="width:20%;text-align:center;">停车卡类型</th>
		                                    	<th style="width:20%;text-align:center;">单位时间金额</th>
		                                    	<th style="width:20%;text-align:center;">时间单位</th>
		                                    	<th style="width:20%;text-align:center;">操作</th>
		                                    </thead>
		                                    <tbody>
		                                    	<c:forEach items="${allChargeList }" var="charge">
	
		                                    		<tr>
			                                    		<td style="width:10%;text-align:center;">${charge.chId }</td>
														<td style="width:20%;text-align:center;">${charge.chName }</td>
														<td style="width:20%;text-align:center;">${charge.chCardtype }</td>
														<td style="width:20%;text-align:center;">${charge.chUnitprise }</td>
														<td style="width:20%;text-align:center;">${charge.chUnittime }</td>
														<td style="width:10%;text-align:center;">
														<a class="btn btn-round btn-fill btn-danger" style="font-size: 15px;margin-top:0px;color: white;" onclick="delete_charge('${charge.chId }')">删 除</a></td>
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
	
	<!-- 删除收费规则信息弹出提示框的JS -->
	<script type="text/javascript">
		function delete_charge(chId) {
			swal({
				title: "删除收费规则",
				text: "确认删除该收费规则？",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "是的,删除!"
			},
			function()
				{
					window.location.href="<%=basePath%>charge/deleteCharge.do?chId="+chId
				}
			);
		}
	</script>
	
	
</html>
