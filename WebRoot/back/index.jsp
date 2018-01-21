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
    	</style>
    

    
	</head>
	<body>
		<!-- 修改密码窗口 -->
		<div id="changePwd" class="reveal-modal">
			<h3 style="text-align: center;">修改管理员密码</h3>
			<form action="<%=basePath%>admin/changepwd.do" method="post">
				<div class="add_view">
				<input type="text" style="display:none;" name="aId" value="1"/>
					新密码：<input type="password" class="form-control" style="border-radius:5px;" id="newpwd" name="aPwd" value="" placeholder="请输入新密码" onkeyup="checkNewPwd(this)"/>
				</div>
				<div class="alert alert-info"  id="checknewpwd" role="alert">密码为长度 6-20 字符的数字、字母、下划线</div>
				<div class="add_view">
					重复输入：<input type="password" class="form-control" style="border-radius:5px;" id="repeatpwd" value="" placeholder="请重复输入密码" onkeyup="checkRepeatPwd(this)"></input>
				</div>
				<div class="alert alert-info" id="checkrepeatpwd" role="alert">重复输入的密码须与上方新密码一致</div>
				<button type="submit" class="savebutton" onclick="return checkPwdForm()">保 存</button>
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
		                <li class="active">
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
		    	<!-- 页面主体上方标题和三个菜单 -->
		        <nav class="navbar navbar-default">
		            <div class="container-fluid">
		                <div class="navbar-header">
		                    <a class="navbar-brand" href="#">首 页&nbsp;&nbsp;Home Page</a>
		                </div>
		                <div class="collapse navbar-collapse">
		                    <ul class="nav navbar-nav navbar-right">
		                        <li>
		                        	<a  href="#" data-reveal-id="changePwd" data-animation="fade">
										<i class="ti-settings"></i>
										<p>修改密码</p>
		                            </a>
		                        </li>
								<li>
									<a href="#" onclick="power_off()">
										<i class="ti-power-off"></i>
										<p>退出系统</p>
		                            </a>
		                        </li>
		                    </ul>
		                </div>
		            </div>
		        </nav>
		        <!-- 页面正文 -->
		        <div class="content">
		            <div class="container-fluid">
                		<!-- 第一行 -->
		                <div class="row">
		                    <div class="col-lg-3 col-sm-6">
		                        <div class="card">
		                            <div class="content">
		                                <div class="row">
		                                    <div class="col-xs-5">
		                                        <div class="icon-big icon-warning text-center">
		                                            <i class="ti-car"></i>
		                                        </div>
		                                    </div>
		                                    <div class="col-xs-7">
		                                        <div class="numbers">
		                                            <p>空余车位</p>
		                                            <a id="freeCount">${getFreeCount }</a>
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="footer">
		                                    <hr />
		                                    <div class="stats">
		                                        <i class="ti-car"></i> Free parking
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-lg-3 col-sm-6">
		                        <div class="card">
		                            <div class="content">
		                                <div class="row">
		                                    <div class="col-xs-5">
		                                        <div class="icon-big icon-success text-center">
		                                            <i class="ti-car"></i>
		                                        </div>
		                                    </div>
		                                    <div class="col-xs-7">
		                                        <div class="numbers">
		                                            <p>实时停车量</p>
													<a id="carCount">${getCarCount }</a>
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="footer">
		                                    <hr />
		                                    <div class="stats">
		                                        <i class="ti-car"></i> Real-time parking
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-lg-3 col-sm-6">
		                        <div class="card">
		                            <div class="content">
		                                <div class="row">
		                                    <div class="col-xs-5">
		                                        <div class="icon-big icon-danger text-center">
		                                            <i class="ti-direction-alt"></i>
		                                        </div>
		                                    </div>
		                                    <div class="col-xs-7">
		                                        <div class="numbers">
		                                            <p>当日进场车辆数</p>
		                                            <a>${nowDateCount }</a>
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="footer">
		                                    <hr />
		                                    <div class="stats">
		                                        <i class="ti-direction-alt"></i> In and out number
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-lg-3 col-sm-6">
		                        <div class="card">
		                            <div class="content">
		                                <div class="row">
		                                    <div class="col-xs-5">
		                                        <div class="icon-big icon-info text-center">
		                                            <i class="ti-server"></i>
		                                        </div>
		                                    </div>
		                                    <div class="col-xs-7">
		                                        <div class="numbers">
		                                            <p>当日收入金额</p>
		                                            <a>${allPrise }</a>
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="footer">
		                                    <hr />
		                                    <div class="stats">
		                                        <i class="ti-server"></i> Income of the day's
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <!-- 第二行 -->
		                <div class="row">
	                    	<div class="col-md-12">
	                        	<div class="card">
	                            	<div class="header">
	                                	<h4 class="title">停车场收费公示栏</h4>
	                                	<p class="category">Charge Rule Publicity</p>
	                            	</div>
	                            	<div class="content table-responsive table-full-width">
	                                	<table class="table table-striped">
	                                		<thead>
	                                			<th style="padding-left:20px;">临时卡用户</th>
	                                		</thead>
	                                    	<tbody>
	                                    		<c:forEach items="${allInterimList }" var="charge">
		                                    		<tr>
		                                    			<td style="width:30%;"></td>
														<td style="width:15%;">${charge.chName }</td>
														
														<td style="width:10%;">${charge.chUnitprise } 元</td>
														<td style="width:10%;">/${charge.chUnittime }</td>
														<td style="width:35%;"></td>
													</tr>
	                                        	</c:forEach>
	                                    	</tbody>
                                		</table>
                                		<table class="table table-striped">
	                                		<thead>
	                                			<th style="padding-left:20px;">会员卡用户</th>
	                                		</thead>
	                                    	<tbody>
	                                    		<c:forEach items="${allMemberList }" var="charge">
		                                    		<tr>
		                                    			<td style="width:30%;"></td>
														<td style="width:15%;">${charge.chName }</td>
														
														<td style="width:10%;">${charge.chUnitprise } 元</td>
														<td style="width:10%;">/${charge.chUnittime }</td>
														<td style="width:35%;"></td>
													</tr>
	                                        	</c:forEach>
	                                    	</tbody>
                                		</table>
                                		
                                		
                            		</div>
                        		</div>
                    		</div>
                		</div>
                		<!-- 第三行-->
			            <div class="row">
			                <div class="col-md-12">
			                    <div class="card">
			                        <div class="header">
			                            <h4 class="title">停车场车位实时状况图</h4>
			                            <p class="category">Parking Space Allocation</p>
			                        </div>
			                        <div style="padding-left: 26%;padding-top: 30px;">
			                           	<div id="canvas-holder" style="padding-bottom:50px;">
											<canvas id="chart-area" width="500" height="350"/>
										</div>
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

	<script src="<%=basePath %>back/layer/layer.js"></script>
	<script src="<%=basePath %>back/js/Chart.js"></script>
	<!-- 弹框 -->		
	<script src="<%=basePath %>back/js/jquery-1.6.2.js" type="text/javascript"></script>
	<script src="<%=basePath %>back/js/jquery.reveal.js" type="text/javascript"></script>
	
	<script src="<%=basePath %>back/js/jquery.notify.js" type="text/javascript" ></script>	
	
		<script src="<%=basePath %>back/js/sweet-alert.min.js"></script>

	<!-- 车位分部饼状图 -->
	<script>
	window.onload = function() { 
		var ctx = document.getElementById("canvas").getContext("2d");
		ctx.fillRect(10, 10, 20, 20);
 	};
 	var free =  document.getElementById("freeCount");
	var freevalue = free.innerHTML;
	var myfree = parseInt(freevalue);
	
	var car =  document.getElementById("carCount");
	var carvalue = car.innerHTML;
	var mycar = parseInt(carvalue);

	var pieData = [
		{
			value: myfree,
			color:"#46BFBD",
			highlight: "#5AD3D1",
			label: "空余车位"
		},
		{
			value: mycar,
			color: "#F7464A",
			highlight: "#FF5A5E",
			label: "占用车位"
		}
	];

	window.onload = function(){
		var ctx = document.getElementById("chart-area").getContext("2d");
		window.myPie = new Chart(ctx).Pie(pieData);
	};
	</script>
	<!-- 验证新密码 -->
	<script type="text/javascript">
		function checkNewPwd(target){
			var content=target.value;
			var long=content.length;
			if(long < 21 && long > 5){
				$("#checknewpwd").removeClass();
               	$("#checknewpwd").addClass("alert alert-success");
                $("#checknewpwd").html("输入正确！");
			}else if(long > 20 || long < 6){
				$("#checknewpwd").removeClass();
              	$("#checknewpwd").addClass("alert alert-warning");
               	$("#checknewpwd").html("长度不在规定范围内！");
			}else if(long == 0){
				$("#checknewpwd").removeClass();
              	$("#checknewpwd").addClass("alert alert-danger");
               	$("#checknewpwd").html("输入不能为空！");
			}
		}
	</script>
	<!-- 验证重复密码 -->
	<script type="text/javascript">
		function checkRepeatPwd(target){
			var newcontent=document.getElementById("newpwd").value;
			var repeatcontent = target.value;
			var long=repeatcontent.length;

			if(newcontent == repeatcontent && long >5 || newcontent == repeatcontent &&  long < 21){
				$("#checkrepeatpwd").removeClass();
               	$("#checkrepeatpwd").addClass("alert alert-success");
                $("#checkrepeatpwd").html("输入正确！");
			}else if(newcontent != repeatcontent){
				$("#checkrepeatpwd").removeClass();
              	$("#checkrepeatpwd").addClass("alert alert-warning");
               	$("#checkrepeatpwd").html("输入不正确！");
			}else if(long==0){
				$("#checkrepeatpwd").removeClass();
              	$("#checkrepeatpwd").addClass("alert alert-danger");
               	$("#checkrepeatpwd").html("输入不能为空！");
			}
		}
	</script>
	<!-- 验证修改密码表单 -->
	<script type="text/javascript">
		function checkPwdForm() {
   			var tipnew = $("#checknewpwd").text();
   			var tiprepeat = $("#checkrepeatpwd").text();
   			if(tipnew != "输入正确！" || tiprepeat != "输入正确！"){
   				$('<p>请输入正确信息后保存修改！</p>').notify('error');
   				return false;
   			}else{
   				$('<p>修改成功！</p>').notify('success');
   				return true;			
   			}
     	}
		</script>
		
		<!-- 删除收费规则信息弹出提示框的JS -->
	<script type="text/javascript">
		function power_off() {
			swal({
				title: "退出系统",
				text: "确认退出系统？",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "是的,退出!"
			},
			function()
				{
					window.location.href="<%=basePath%>back/login.jsp"
				}
			);
		}
	</script>
</html>
