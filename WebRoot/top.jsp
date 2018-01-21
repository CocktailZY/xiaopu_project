<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link
			href="${pageContext.request.contextPath}/images/css1/top_css.css"
			rel="stylesheet" type="text/css" />


 


	</head>
	<body bgcolor="#03A8F6">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>

				<td width="194" height="60" align="center"
					background="${pageContext.request.contextPath}/images/top_logo.jpg">
					<div align="left" style="FONT-WEIGHT: bold; FONT-SIZE: 20pt;">
						<font size="2"><%=new AllBean().getXitongName().get(1)%></font>
					</div>
				</td>

				<td align="center"
					style="background: url(${pageContext.request.contextPath}/images/top_bg.jpg) no-repeat">
					<table cellspacing="0" cellpadding="0" border="0" width="100%"
						height="33">
						<tbody>
							<tr>
								<td width="30" align="left">
									<img onClick="switchBar(this)" height="15" alt="关闭左边管理菜单"
										src="${pageContext.request.contextPath}/images/on-of.gif"
										width="15" border="0" />
								</td>

							</tr>
						</tbody>
					</table>
					<table height="26" border="0" align="left" cellpadding="0"
						cellspacing="0" class="subbg" NAME=t1>
						<tbody>
							<tr align="middle">
								<td width="71" height="26" align="center" valign="middle"
									background="${pageContext.request.contextPath}/images/top_tt_bg.gif">
									<a href="right.jsp" target="main" class="STYLE2">管理首页</a>
								</td>
								<td align="center" class="topbar">
									<span class="STYLE2"> </span>
								</td>
								<td align="center" class="topbar">
									<span class="STYLE2"> </span>
								</td>
								<td align="center" class="topbar">
									<span class="STYLE2"> </span>
								</td>
			<%
			if(null == request.getSession().getAttribute("role")){   
   System.out.println("为空");
}else if ("管理员".equals(request.getSession().getAttribute("role"))){   
      System.out.println("不为空");
			 %>					
								
			 
			 	<td width="71" align="center" valign="middle"
									background="${pageContext.request.contextPath}/images/top_tt_bg.gif">
									<a href="${pageContext.request.contextPath}/editTeacher.jsp"
										target="main" class="STYLE2">修改资料</a>
								</td>
			 
<%} else if(null == request.getSession().getAttribute("role")){   
   System.out.println("为空");
}else if ("学生".equals(request.getSession().getAttribute("role"))){   
      System.out.println("不为空");
			 %>					
			 
			 	<td width="71" align="center" valign="middle"
									background="${pageContext.request.contextPath}/images/top_tt_bg.gif">
									<a href="${pageContext.request.contextPath}/editStudent.jsp"
										target="main" class="STYLE2">修改资料</a>
								</td>
			 
			 <%} %>




								<td width="71" align="center" valign="middle"
									background="${pageContext.request.contextPath}/images/top_tt_bg.gif">
									<a href="${pageContext.request.contextPath}/login.jsp"
										target="_top" class="STYLE2">退出登录</a>
								</td>
								<td>
									&nbsp;&nbsp;

									<font style="font-size: 13px; font-weight: bold;"> <%
 	if (request.getSession().getAttribute("name") == null
 			|| request.getSession().getAttribute("role") == null) {
 	} else {
 		out.print("角色:<font color=pink style='font-size: 12px; font-weight: bold;' >"
 				+ request.getSession().getAttribute("role").toString()
 				+ "</font>&nbsp;&nbsp;&nbsp;&nbsp;用户:<font  color=pink  style='font-size: 12px; font-weight: bold;'>"
 			+ request.getSession().getAttribute("name").toString() 
 				+ "</font>");
 	}
 %> </font>


								</td>
						</tbody>
					</table>
				</td>


			</tr>
			<tr height="6">
				<td bgcolor="#1F3A65"
					background="${pageContext.request.contextPath}/images/top_bg.jpg"></td>
			</tr>
		</table>
		<script language="javascript">
<!--
var displayBar=true;
function switchBar(obj){
	if (displayBar)
	{
		parent.frame.cols="0,*";
		displayBar=false;
		obj.title="打开左边管理菜单";
	}
	else{
		parent.frame.cols="195,*";
		displayBar=true;
		obj.title="关闭左边管理菜单";
	}
}
//-->
</script>
	</body>
</html>
