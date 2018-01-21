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
		<!-- 添加会员卡-->
		<div id="addcard" class="reveal-modal">
			<h3 style="text-align: center;">添加会员卡</h3>
			<form action="<%=basePath%>card/addCard.do" method="post">
				<div style="width:48%;float:left;">
					<div class="add_view">
						<input style="display:none;" id="addNumber" name="cNumber" value="">
						用户名：<input type="text" class="form-control" style="border-radius:5px;" id="cUser" name="cUser" value="" placeholder="请输入用户名" onkeyup="checkAddUser(this)"/>
					</div>
					<div class="alert alert-info"  id="checkAddUser" role="alert" style="border-radius:5px;">10个字符以内</div>
				</div>
				<div style="width:48%;float:right;">
					<div class="add_view">
						车牌号：<input type="text" class="form-control" style="border-radius:5px;" id="cPlatenumber" name="cPlatenumber" value="" placeholder="请输入车牌号"/>
					</div>
					<div class="alert alert-success" id="checkAddPlatenumber" role="alert" style="border-radius:5px;">例：蒙A99999</div>
				</div>
				<div style="width:48%;float:left;">
					<div class="add_view">
						充值金额：<input type="text" class="form-control" style="border-radius:5px;" id="cMoney" name="cMoney" value="" placeholder="请输入初次缴费金额" onkeyup="checkAddPrise(this)"/>
					</div>
					<div class="alert alert-info" id="checkAddPrise" role="alert" style="border-radius:5px;">单位为 元</div>
				</div>
				<div style="width:48%;float:right;">
					<div class="add_view">
						联系电话：<input type="text" class="form-control" style="border-radius:5px;" id="cTel" name="cTel" value="" placeholder="请输入联系电话"/>
					</div>
					<div class="alert alert-success" id="checkAddTel" role="alert" style="border-radius:5px;">请填入真实联系方式</div>
				</div>
				
				<button type="submit" class="savebutton" onclick="return checkAddCardForm()">保 存</button>
			</form>
			<a class="close-reveal-modal">&#215;</a>
		</div>
		
		<!-- 缴费充值-->
		<div id="addmoney" class="reveal-modal">
			<h3 style="text-align: center;">添加缴费信息</h3>
			<form action="<%=basePath%>card/addMoney.do" method="post">
				<div>
					<div class="add_view">
						充值卡号：<input readonly type="text" class="form-control" style="border-radius:5px;" id="addcNumber" name="cNumber" value=""/>
					</div>
				</div>
				<div>
					<div class="add_view">
						充值金额：<input type="text" class="form-control" style="border-radius:5px;" id="cMoney" name="cMoney" value="" placeholder="请输入充值金额" onkeyup="checkMoney(this)"/>
					</div>
					<div class="alert alert-info" role="alert" id="checkPrise" style="border-radius:5px;">单笔充值最高不得超过10000</div>
				</div>
				
				<button type="submit" class="savebutton" onclick="return checkMoneyForm()">保 存</button>
			</form>
			<a class="close-reveal-modal">&#215;</a>
		</div>
		
		<!-- 修改会员卡-->
		<div id="updatecard" class="reveal-modal">
			<h3 style="text-align: center;">修改会员卡信息</h3>
			<form action="<%=basePath%>card/updateCard.do" method="post">
				<div style="width:48%;float:left;">
					<div class="add_view">
						会员卡号：<input readonly type="text" class="form-control" style="border-radius:5px;" id="updatecNumber" name="cNumber" value=""/>
					</div>
					<div class="alert alert-success"  id="checkUpdateNumber" role="alert" style="border-radius:5px;">请确认会员卡号</div>
				</div>
				<div style="width:48%;float:right;">
					<div class="add_view">
						用户名：<input type="text" class="form-control" style="border-radius:5px;" id="cUser" name="cUser" value="" placeholder="请输入用户名" onkeyup="checkUpdateUser(this)"/>
					</div>
					<div class="alert alert-info"  id="checkUpdateUser" role="alert" style="border-radius:5px;">10个字符以内</div>
				</div>
				<div style="width:48%;float:left;">
					<div class="add_view">
						车牌号：<input type="text" class="form-control" style="border-radius:5px;" id="cPlatenumber" name="cPlatenumber" value="" placeholder="请输入车牌号" onkeyup="checkCharge(this)"/>
					</div>
					<div class="alert alert-success" id="checkUpdatePlatenumber" role="alert" style="border-radius:5px;">例：蒙A99999</div>
				</div>
				<div style="width:48%;float:right;">
					<div class="add_view">
						联系电话：<input type="text" class="form-control" style="border-radius:5px;" id="cTel" name="cTel" value="" placeholder="请输入联系电话" onkeyup="checkCharge(this)"/>
					</div>
					<div class="alert alert-success" id="checkUpdateTel" role="alert" style="border-radius:5px;">请输入真实联系方式</div>
				</div>
				
				
				<button type="submit" class="savebutton" onclick="return checkUpdateCardForm()">保 存</button>
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
		                <li class="active">
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
		                    <a class="navbar-brand" href="#">办 卡 业 务 管 理 Card Management</a>
		                </div>
		                
		            </div>
		        </nav>
				<!-- 页面正文 -->
		        <div class="content">
		            <div class="container-fluid">
				        <!-- 第一行 -->
				        <div class="col-lg-6" style="margin-left:280px;">
				        <form action="<%=basePath%>card/selectCard.do" method="post">
						    <div class="input-group">
						      	<input type="text" class="form-control" name="selectString" placeholder="请输入查询的卡号、车牌号或用户名" style="border-top-left-radius: 20px !important;border-bottom-left-radius: 20px !important;border-color: #dddddd !important;">
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
		                                <h4 class="title">会员卡信息<a class="btn btn-round btn-fill btn-info" style="height:50px;width:128px; font-size: 15px;float: right;margin-top:0px;color: white;padding-top:14px;" href="#" data-reveal-id="addcard" data-animation="fade" onclick="add_Card()">添加会员卡</a></h4>
		                                <p class="category">Card Information</p>
		                            </div>
		                            <div class="content table-responsive table-full-width">
		                                <table class="table table-striped">
		                                    <thead>
		                                        <th style="width:15%;text-align:center;">卡号</th>
		                                    	<th style="width:15%;text-align:center;">车牌号</th>
		                                    	<th style="width:15%;text-align:center;">用户</th>
		                                    	<th style="width:15%;text-align:center;">电话</th>
		                                    	<th style="width:15%;text-align:center;">余额</th>
		                                    	<th style="width:25%;text-align:center;">操作</th>
		                                    </thead>
		                                    <tbody>
		                                    	<c:forEach items="${allCardList }" var="card">
		                                   
		                                    		<tr>
			                                    		<td style="width:15%;text-align:center;">${card.cNumber }</td>
														<td style="width:15%;text-align:center;">${card.cPlatenumber }</td>
														<td style="width:15%;text-align:center;">${card.cUser }</td>
														<td style="width:15%;text-align:center;">${card.cTel }</td>
														<td style="width:15%;text-align:center;"><a>${card.cMoney }</a>&nbsp;&nbsp;
															<a class="btn btn-round btn-fill btn-success" style="font-size: 15px;margin-top:0px;color: white;" data-reveal-id="addmoney" data-animation="fade" onclick="add_Money('${card.cNumber }')">充 值</a>
														</td>
														<c:if  test="${card.cMoney==0}">
														<td style="width:25%;text-align:center;">
															<a class="btn btn-round btn-fill btn-danger" style="font-size: 15px;margin-top:0px;color: white;" onclick="delete_card('${card.cId }')">注 销</a>
															<a class="btn btn-round btn-fill btn-warning" style="font-size: 15px;margin-top:0px;color: white;" onclick="update_card('${card.cNumber }')" data-reveal-id="updatecard" data-animation="fade">修改信息</a>
														</td>
														</c:if>
														<c:if  test="${card.cMoney!=0}">
														<td style="width:25%;text-align:center;">
															<a class="btn btn-round btn-fill btn-danger" style="font-size: 15px;margin-top:0px;color: white;" onclick="reduce_Money('${card.cNumber }','${card.cMoney }')">退 款</a>
															<a class="btn btn-round btn-fill btn-warning" style="font-size: 15px;margin-top:0px;color: white;" onclick="update_card('${card.cNumber }')" data-reveal-id="updatecard" data-animation="fade">修改信息</a>
														</td>
														</c:if>
													</tr>
												
		                                        </c:forEach>
		                                        
		                                        <c:forEach items="${selectNumberList }" var="card">
		                                   
		                                    		<tr>
			                                    		<td style="width:15%;text-align:center;">${card.cNumber }</td>
														<td style="width:15%;text-align:center;">${card.cPlatenumber }</td>
														<td style="width:15%;text-align:center;">${card.cUser }</td>
														<td style="width:15%;text-align:center;">${card.cTel }</td>
														<td style="width:15%;text-align:center;"><a>${card.cMoney }</a>&nbsp;&nbsp;
															<a class="btn btn-round btn-fill btn-success" style="font-size: 15px;margin-top:0px;color: white;" data-reveal-id="addmoney" data-animation="fade" onclick="add_Money('${card.cNumber }')">充 值</a>
														</td>
														<td style="width:25%;text-align:center;">
														
															<a class="btn btn-round btn-fill btn-danger" style="font-size: 15px;margin-top:0px;color: white;" onclick="delete_card('${card.cId }')">注 销</a>
															<a class="btn btn-round btn-fill btn-warning" style="font-size: 15px;margin-top:0px;color: white;" onclick="update_card('${card.cNumber }')" data-reveal-id="updatecard" data-animation="fade">修改信息</a>
														</td>
													</tr>
												
		                                        </c:forEach>
		                                        <c:forEach items="${selectUserList }" var="card">
		                                   
		                                    		<tr>
			                                    		<td style="width:15%;text-align:center;">${card.cNumber }</td>
														<td style="width:15%;text-align:center;">${card.cPlatenumber }</td>
														<td style="width:15%;text-align:center;">${card.cUser }</td>
														<td style="width:15%;text-align:center;">${card.cTel }</td>
														<td style="width:15%;text-align:center;"><a>${card.cMoney }</a>&nbsp;&nbsp;
															<a class="btn btn-round btn-fill btn-success" style="font-size: 15px;margin-top:0px;color: white;" data-reveal-id="addmoney" data-animation="fade" onclick="add_Money('${card.cNumber }')">充 值</a>
														</td>
														<td style="width:25%;text-align:center;">
															<a class="btn btn-round btn-fill btn-danger" style="font-size: 15px;margin-top:0px;color: white;" onclick="delete_card('${card.cId }')">注 销</a>
															<a class="btn btn-round btn-fill btn-warning" style="font-size: 15px;margin-top:0px;color: white;" onclick="update_card('${card.cNumber }')" data-reveal-id="updatecard" data-animation="fade">修改信息</a>
														</td>
													</tr>
												
		                                        </c:forEach>
		                                        <c:forEach items="${selectPlatenumberList }" var="card">
		                                   
		                                    		<tr>
			                                    		<td style="width:15%;text-align:center;">${card.cNumber }</td>
														<td style="width:15%;text-align:center;">${card.cPlatenumber }</td>
														<td style="width:15%;text-align:center;">${card.cUser }</td>
														<td style="width:15%;text-align:center;">${card.cTel }</td>
														<td style="width:15%;text-align:center;"><a>${card.cMoney }</a>&nbsp;&nbsp;
															<a class="btn btn-round btn-fill btn-success" style="font-size: 15px;margin-top:0px;color: white;" data-reveal-id="addmoney" data-animation="fade" onclick="add_Money('${card.cNumber }')">充 值</a>
														</td>
														<td style="width:25%;text-align:center;">
															<a class="btn btn-round btn-fill btn-danger" style="font-size: 15px;margin-top:0px;color: white;" onclick="delete_card('${card.cId }')">注 销</a>
															<a class="btn btn-round btn-fill btn-warning" style="font-size: 15px;margin-top:0px;color: white;" onclick="update_card('${card.cNumber }')" data-reveal-id="updatecard" data-animation="fade">修改信息</a>
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
	
	<!-- 验证添加用户名 -->
	<script type="text/javascript">
		function checkAddUser(target){
			var content=target.value;
			var long=content.length;
			if(long != 0 && long < 11){
				$("#checkAddUser").removeClass();
               	$("#checkAddUser").addClass("alert alert-success");
                $("#checkAddUser").html("输入正确！");
			}else if(long > 10){
				$("#checkAddUser").removeClass();
              	$("#checkAddUser").addClass("alert alert-warning");
               	$("#checkAddUser").html("输入用户名长度超限");
			}else if(long == 0){
				$("#checkAddUser").removeClass();
              	$("#checkAddUser").addClass("alert alert-danger");
               	$("#checkAddUser").html("输入不能为空！");
			}
		}
	</script>
	
	<!-- 验证添加金额 -->
	<script type="text/javascript">
		function checkAddPrise(target){
			var content=target.value;
			var long=content.length;
			var reg=/^[1-9]\d*$|^0$/;
			if(reg.test(content)==true && long != 0 && long < 5){
				$("#checkAddPrise").removeClass();
               	$("#checkAddPrise").addClass("alert alert-success");
                $("#checkAddPrise").html("输入正确！");
			}else if(reg.test(content)!=true && long != 0 || long > 4 && long != 0){
				$("#checkAddPrise").removeClass();
              	$("#checkAddPrise").addClass("alert alert-warning");
               	$("#checkAddPrise").html("输入金额格式不符！");
			}else if(long == 0){
				$("#checkAddPrise").removeClass();
              	$("#checkAddPrise").addClass("alert alert-danger");
               	$("#checkAddPrise").html("输入不能为空！");
			}
		}
	</script>
	
	<!-- 验证添加用户名 -->
	<script type="text/javascript">
		function checkUpdateUser(target){
			var content=target.value;
			var long=content.length;
			if(long != 0 && long < 11){
				$("#checkUpdateUser").removeClass();
               	$("#checkUpdateUser").addClass("alert alert-success");
                $("#checkUpdateUser").html("输入正确！");
			}else if(long > 10){
				$("#checkUpdateUser").removeClass();
              	$("#checkUpdateUser").addClass("alert alert-warning");
               	$("#checkUpdateUser").html("输入用户名长度超限");
			}else if(long == 0){
				$("#checkUpdateUser").removeClass();
              	$("#checkUpdateUser").addClass("alert alert-danger");
               	$("#checkUpdateUser").html("输入不能为空！");
			}
		}
	</script>
	
	<!-- 验证充值金额 -->
	<script type="text/javascript">
		function checkMoney(target){
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
               	$("#checkPrise").html("输入金额格式不符！");
			}else if(long == 0){
				$("#checkPrise").removeClass();
              	$("#checkPrise").addClass("alert alert-danger");
               	$("#checkPrise").html("输入不能为空！");
			}
		}
	</script>
	
	<!-- 验证添加会员卡信息表单-->
	<script type="text/javascript">
		function checkAddCardForm(){
   			var tipprise = $("#checkAddPrise").text();
   			var tipuser = $("#checkAddUser").text();

   			if(tipprise != "输入正确！" || tipuser != "输入正确！")
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
	
	<!-- 验证添加会员卡信息表单-->
	<script type="text/javascript">
		function checkMoneyForm(){
   			var tipprise = $("#checkPrise").text();

   			if(tipprise != "输入正确！")
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
	
	<!-- 退款-->
	<script type="text/javascript">
		function reduce_Money(cNumber,cMoney) {
				swal({
					title: "用户退款！",
					text: "卡号为："+cNumber+"的用户，退款金额为 "+cMoney,
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "是的,退款!"
				},
				function()
					{
						window.location.href="<%=basePath%>card/reduceMoney.do?cNumber="+cNumber
					}
				);

		}
	</script>
	
	<script type="text/javascript">
		function delete_card(cId) {
				swal({
					title: "会员卡销户！",
					text: "是否注销该会员卡？",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "是的,注销!"
				},
				function()
					{
						window.location.href="<%=basePath%>card/deleteCard.do?cId="+cId
					}
				);

		}
	</script>

	
	<script type="text/javascript">
		function add_Money(cNumber) {
			document.getElementById("addcNumber").value=cNumber;
			}
	</script>
	
	<script type="text/javascript">
		function add_Card() {
			var timestamp = new Date().getTime();
			document.getElementById("addNumber").value=timestamp;
			}
	</script>
	
	<script type="text/javascript">
		function update_card(cNumber) {
			document.getElementById("updatecNumber").value=cNumber;
			}
	</script>
</html>
