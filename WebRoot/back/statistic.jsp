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
    

    
	</head>
	<body>
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
		                <li>
		                    <a href="<%=basePath%>record/show.do">
		                        <i class="ti-direction-alt"></i>
		                        <p>出 入 业 务 管 理&nbsp;&nbsp;In Out</p>
		                    </a>
		                </li>
		                <li class="active">
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
		                    <a class="navbar-brand" href="#">信息统计管理&nbsp;&nbsp;Statistic Management</a>
		                </div>
		            </div>
		        </nav>
		        <!-- 页面正文 -->
		        <div class="content">
		            <div class="container-fluid">
                		<!-- 第一行-->
			            <div class="row">
			                <div class="col-md-12">
			                    <div class="card">
			                        <div class="header">
			                            <h4 class="title">当日停车场入场车辆情况统计</h4>
			                            <p class="category">Day Situation Statistics</p>
			                        </div>
			                        <a style="float:right;margin-right:7%;">灰色代表临时车辆，蓝色代表会员车辆</a>
			                        <div style="padding-left: 5%;padding-top: 30px;">
			                           	<div id="canvas-holder" style="padding-bottom:50px;">
											<canvas id="daycanvas" height="450" width="1100"></canvas>
										</div>
									</div>
									
			                    </div>
			                   
			                </div>
		            	</div>
		                <!-- 第二行-->
			            <div class="row">
			                <div class="col-md-12">
			                    <div class="card">
			                        <div class="header">
			                            <h4 class="title">年度停车场入场车辆情况统计</h4>
			                            <p class="category">Year Situation Statistics</p>
			                        </div>
			                        <a style="float:right;margin-right:7%;">灰色代表临时车辆，蓝色代表会员车辆</a>
			                        <div style="padding-left: 5%;padding-top: 30px;">
			                           	<div id="canvas-holder" style="padding-bottom:50px;">
											<canvas id="yearcanvas" height="450" width="1100"></canvas>
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
			    <div style="display:none;">
			    	<a id="eightUserCount">${eightUserCount}</a>
			    	<a id="nineUserCount">${nineUserCount}</a>
			    	<a id="tenUserCount">${tenUserCount}</a>
			    	<a id="elevenUserCount">${elevenUserCount}</a>
			    	<a id="twelveUserCount">${twelveUserCount}</a>
			    	<a id="thirteenUserCount">${thirteenUserCount}</a>
			    	<a id="fourteenUserCount">${fourteenUserCount}</a>
			    	<a id="fifteenUserCount">${fifteenUserCount}</a>
			    	<a id="sixteenUserCount">${sixteenUserCount}</a>
			    	<a id="seventeenUserCount">${seventeenUserCount}</a>
			    	<a id="eighteenUserCount">${eighteenUserCount}</a>
			    	<a id="nineteenUserCount">${nineteenUserCount}</a>
			    	<a id="twentyUserCount">${twentyUserCount}</a>
			    	
			    	<a id="eightTempCount">${eightTempCount}</a>
			    	<a id="nineTempCount">${nineTempCount}</a>
			    	<a id="tenTempCount">${tenTempCount}</a>
			    	<a id="elevenTempCount">${elevenTempCount}</a>
			    	<a id="twelveTempCount">${twelveTempCount}</a>
			    	<a id="thirteenTempCount">${thirteenTempCount}</a>
			    	<a id="fourteenTempCount">${fourteenTempCount}</a>
			    	<a id="fifteenTempCount">${fifteenTempCount}</a>
			    	<a id="sixteenTempCount">${sixteenTempCount}</a>
			    	<a id="seventeenTempCount">${seventeenTempCount}</a>
			    	<a id="eighteenTempCount">${eighteenTempCount}</a>
			    	<a id="nineteenTempCount">${nineteenTempCount}</a>
			    	<a id="twentyTempCount">${twentyTempCount}</a>
			    	
			    	<a id="JanuaryUserCount">${JanuaryUserCount}</a>
			    	<a id="FebruaryUserCount">${FebruaryUserCount}</a>
			    	<a id="MarchUserCount">${MarchUserCount}</a>
			    	<a id="AprilUserCount">${AprilUserCount}</a>
			    	<a id="MayUserCount">${MayUserCount}</a>
			    	<a id="JuneUserCount">${JuneUserCount}</a>
			    	<a id="JulyUserCount">${JulyUserCount}</a>
			    	<a id="AugustUserCount">${AugustUserCount}</a>
			    	<a id="SeptemberUserCount">${SeptemberUserCount}</a>
			    	<a id="OctoberUserCount">${OctoberUserCount}</a>
			    	<a id="NovemberUserCount">${NovemberUserCount}</a>
			    	<a id="DecemberUserCount">${DecemberUserCount}</a>
			    	
			    	<a id="JanuaryTempCount">${JanuaryTempCount}</a>
			    	<a id="FebruaryTempCount">${FebruaryTempCount}</a>
			    	<a id="MarchTempCount">${MarchTempCount}</a>
			    	<a id="AprilTempCount">${AprilTempCount}</a>
			    	<a id="MayTempCount">${MayTempCount}</a>
			    	<a id="JuneTempCount">${JuneTempCount}</a>
			    	<a id="JulyTempCount">${JulyTempCount}</a>
			    	<a id="AugustTempCount">${AugustTempCount}</a>
			    	<a id="SeptemberTempCount">${SeptemberTempCount}</a>
			    	<a id="OctoberTempCount">${OctoberTempCount}</a>
			    	<a id="NovemberTempCount">${NovemberTempCount}</a>
			    	<a id="DecemberTempCount">${DecemberTempCount}</a>
			    </div>
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
	
	<script>
	var eightUser = document.getElementById("eightUserCount").text;
	var nineUser = document.getElementById("nineUserCount").text;
	var tenUser = document.getElementById("tenUserCount").text;
	var elevenUser = document.getElementById("elevenUserCount").text;
	var twelveUser = document.getElementById("twelveUserCount").text;
	var thirteenUser = document.getElementById("thirteenUserCount").text;
	var fourteenUser = document.getElementById("fourteenUserCount").text;
	var fifteenUser = document.getElementById("fifteenUserCount").text;
	var sixteenUser = document.getElementById("sixteenUserCount").text;
	var seventeenUser = document.getElementById("seventeenUserCount").text;
	var eighteenUser = document.getElementById("eighteenUserCount").text;
	var nineteenUser = document.getElementById("nineteenUserCount").text;
	var twentyUser = document.getElementById("twentyUserCount").text;
	
	var eightTemp = document.getElementById("eightTempCount").text;
	var nineTemp = document.getElementById("nineTempCount").text;
	var tenTemp = document.getElementById("tenTempCount").text;
	var elevenTemp = document.getElementById("elevenTempCount").text;
	var twelveTemp = document.getElementById("twelveTempCount").text;
	var thirteenTemp = document.getElementById("thirteenTempCount").text;
	var fourteenTemp = document.getElementById("fourteenTempCount").text;
	var fifteenTemp = document.getElementById("fifteenTempCount").text;
	var sixteenTemp = document.getElementById("sixteenTempCount").text;
	var seventeenTemp = document.getElementById("seventeenTempCount").text;
	var eighteenTemp = document.getElementById("eighteenTempCount").text;
	var nineteenTemp = document.getElementById("nineteenTempCount").text;
	var twentyTemp = document.getElementById("twentyTempCount").text;
	
	var JanuaryUser = document.getElementById("JanuaryUserCount").text;
	var FebruaryUser = document.getElementById("FebruaryUserCount").text;
	var MarchUser = document.getElementById("MarchUserCount").text;
	var AprilUser = document.getElementById("AprilUserCount").text;
	var MayUser = document.getElementById("MayUserCount").text;
	var JuneUser = document.getElementById("JuneUserCount").text;
	var JulyUser = document.getElementById("JulyUserCount").text;
	var AugustUser = document.getElementById("AugustUserCount").text;
	var SeptemberUser = document.getElementById("SeptemberUserCount").text;
	var OctoberUser = document.getElementById("OctoberUserCount").text;
	var NovemberUser = document.getElementById("NovemberUserCount").text;
	var DecemberUser = document.getElementById("DecemberUserCount").text;
	
	var JanuaryTemp = document.getElementById("JanuaryTempCount").text;
	var FebruaryTemp = document.getElementById("FebruaryTempCount").text;
	var MarchTemp = document.getElementById("MarchTempCount").text;
	var AprilTemp = document.getElementById("AprilTempCount").text;
	var MayTemp = document.getElementById("MayTempCount").text;
	var JuneTemp = document.getElementById("JuneTempCount").text;
	var JulyTemp = document.getElementById("JulyTempCount").text;
	var AugustTemp = document.getElementById("AugustTempCount").text;
	var SeptemberTemp = document.getElementById("SeptemberTempCount").text;
	var OctoberTemp = document.getElementById("OctoberTempCount").text;
	var NovemberTemp = document.getElementById("NovemberTempCount").text;
	var DecemberTemp = document.getElementById("DecemberTempCount").text;
	
	var lineChartData = {

		labels : ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
		datasets : [
			{
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				data : [JanuaryTemp,FebruaryTemp,MarchTemp,AprilTemp,MayTemp,JuneTemp,JulyTemp,AugustTemp,SeptemberTemp,OctoberTemp,NovemberTemp,DecemberTemp]
			},
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,1)",
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
				data : [JanuaryUser,FebruaryUser,MarchUser,AprilUser,MayUser,JuneUser,JulyUser,AugustUser,SeptemberUser,OctoberUser,NovemberUser,DecemberUser]
			}
		]
	}
	var myLine = new Chart(document.getElementById("yearcanvas").getContext("2d")).Line(lineChartData);
	</script>
	
	<script>
	var lineChartData = {
		labels : ["8点","9点","10点","11点","12点","13点","14点","15点","16点","17点","18点","19点","20点"],
		datasets : [
			{
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				data : [eightTemp,nineTemp,tenTemp,elevenTemp,twelveTemp,thirteenTemp,fourteenTemp,fifteenTemp,sixteenTemp,seventeenTemp,eighteenTemp,nineteenTemp,twentyTemp]
			},
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,1)",
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
				data : [eightUser,nineUser,tenUser,elevenUser,twelveUser,thirteenUser,fourteenUser,fifteenUser,sixteenUser,seventeenUser,eighteenUser,nineteenUser,twentyUser]
			}
		]
	}
	var myLine = new Chart(document.getElementById("daycanvas").getContext("2d")).Line(lineChartData);
	</script>

</html>
