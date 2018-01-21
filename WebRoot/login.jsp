<%@ page language="java" import="java.util.*,com.util.*"
	contentType="text/html;charset=UTF-8"%>
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
		<title>欢迎光临<%=com.util.Constant.SYS_NAME%></title>
		<script type="text/javascript">
	function changeImg(){
   document.getElementById("validatecodeimg").src=Math.round(Math.random()*10000)+".RandImage ";
   }
   function check(theform){
   		var u = theform.account;
   		var p = theform.pwd;
   		//var t = theform.usertype;
   		if(u.value.length==0){
   			alert("用户名不能为空!");
   			u.focus();
   			return false;
   		}else if(p.value.length==0){
   			alert("密码不能为空!");
   			p.focus();
   			return false;
   		} 
   		
   		theform.submit();
   		
   
   }
</script>
		<script language="javascript" for="document" event="onkeydown">
<!--
//识别回车事件
 
-->
</script>
		<style type="text/css">
<!--
a {
	color: #008EE3
}

a:link {
	text-decoration: none;
	color: #008EE3
}

A:visited {
	text-decoration: none;
	color: #666666
}

A:active {
	text-decoration: underline
}

A:hover {
	text-decoration: underline;
	color: #0066CC
}

A.b:link {
	text-decoration: none;
	font-size: 12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}

A.b:visited {
	text-decoration: none;
	font-size: 12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}

A.b:active {
	text-decoration: underline;
	color: #FF0000;
}

A.b:hover {
	text-decoration: underline;
	color: #ffffff
}

.table1 {
	border: 1px solid #CCCCCC;
}

.font {
	font-size: 12px;
	text-decoration: none;
	color: #999999;
	line-height: 20px;
}

.input {
	font-size: 12px;
	color: #999999;
	text-decoration: none;
	border: 0px none #999999;
}

td {
	font-size: 12px;
	color: #007AB5;
}

form {
	margin: 1px;
	padding: 1px;
}

input {
	border: 0px;
	height: 26px;
	color: #007AB5;
	.
	unnamed1
	{
	border
	:
	thin
	none
	#FFFFFF;
}

.unnamed1 {
	border: thin none #FFFFFF;
}

select {
	border: 1px solid #cccccc;
	height: 18px;
	color: #666666;
	.
	unnamed1
	{
	border
	:
	thin
	none
	#FFFFFF;
}

body {
	background-repeat: no-repeat;
	background-color: #9CDCF9;
	background-position: 0px 0px;
}

.tablelinenotop {
	border-top: 0px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
	border-bottom: 0px solid #CCCCCC;
	border-left: 1px solid #CCCCCC;
}

.tablelinenotopdown {
	border-top: 1px solid #eeeeee;
	border-right: 1px solid #eeeeee;
	border-bottom: 1px solid #eeeeee;
	border-left: 1px solid #eeeeee;
}

.style6 {
	FONT-SIZE: 9pt;
	color: #7b8ac3;
}
-->
</style>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>

	</head>
	<body>
		<form name="gz" id="gz" action="<%=path%>/LoginServlet"
			method="post">
			<br />
			<br />
			<table width="681" border="0" align="center" cellpadding="0"
				cellspacing="0" style="margin-top: 120px">
				<tr>
					<div align="center" style="FONT-WEIGHT: bold; FONT-SIZE: 38pt;">
						<%=new AllBean().getXitongName().get(1)%>
					</div>
					<td width="353" height="259" align="center" valign="bottom"
						background="images/login_1.gif">

						<table width="90%" border="0" cellspacing="3" cellpadding="0">
							<tr>
								<td align="right" valign="bottom" style="color: #05B8E4">
									<strong><%=new AllBean().getXitongName().get(1)%>  
									</strong>
								</td>
							</tr>
						</table>
					</td>
					<td width="195" background="images/login_2.gif">
						<table width="190" height="106" border="0" align="center"
							cellpadding="2" cellspacing="0">
							<tr>
								<td height="50" colspan="2" align="left">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td width="60" height="30" align="left">
									登陆名称
								</td>
								<td>
									<input name="account" type="TEXT" value=""
										style="background: url(images/login_6.gif) repeat-x; border: solid 1px #27B3FE; height: 20px; background-color: #FFFFFF"
										id="UserName" size="14">
								</td>
							</tr>
							<tr>
								<td height="30" align="left">
									登陆密码
								</td>
								<td>
									<input name="pwd" TYPE="PASSWORD"
										style="background: url(images/login_6.gif) repeat-x; border: solid 1px #27B3FE; height: 20px; background-color: #FFFFFF"
										id="Password" size="16">
								</td>
							</tr>
							<tr  style="display: none;" >
								<!-- style="display: none;" -->
								<td height="30" align="left" >
									用户类型
								</td>
								<td>
									<select name="type" style="width:123px">
										<option value="管理员">
											管理员
										</option>
										<option value="教师">
											教师
										</option>
										<option value="学生">
											学生
										</option> 
									</select>
							</tr>
							 
							<tr>
								<td colspan="2" align="left">
									<input type="button" onclick="check(document.forms.gz);"
										style="background: url(images/login_5.gif) no-repeat"
										value=" 登  陆 ">
									<input type="reset" name="Submit"
										style="background: url(images/login_5.gif) no-repeat"
										value=" 取  消 "><br>
					 
									 
							<tr>
								<td height="5" colspan="2"></td>
						</table>
					<td width="133" background="images/login_3.gif">
						&nbsp;
					</td>
				<tr>
					<td height="161" colspan="3" background="images/login_4.gif"></td>
				</tr>

			</table>
	</body>
</html>