<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8"%>
 
<html xmlns="http://www.w3.org/1999/xhtml">
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${pageContext.request.contextPath}/images/css1/css.css"
			rel="stylesheet" type="text/css">
	</head>
	<SCRIPT language=javascript>
<!--
var displayBar=true;
function switchBar(obj){
	if (displayBar)
	{
		parent.frame.cols="0,*";
		displayBar=false;
		obj.value="打开左边管理菜单";
	}
	else{
		parent.frame.cols="195,*";
		displayBar=true;
		obj.value="关闭左边管理菜单";
	}
}

function fullmenu(url){
	if (url==null) {url = "admin_left.asp";}
	parent.leftFrame.location = url;
}

//-->
</SCRIPT>
	<%
		Properties props = System.getProperties();
	%>
	<body>
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						系统信息统计
						<input onClick="switchBar(this)" type="button" value="关闭左边管理菜单"
							name="SubmitBtn" />
					</th>
				</tr>
				<tr>
					<td class="td_bg" width="50%" height="23">
						操作系统的名称：
						<span class="TableRow2"><%=props.getProperty("os.name")%></span>
					</td>
					<td class="td_bg" width="50%">
						操作系统的构架：
						<span class="TableRow1"><%=props.getProperty("os.arch")%></span>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="50%" height="23">
						操作系统的版本：
						<span class="TableRow2"><%=props.getProperty("os.version")%></span>
					</td>
					<td class="td_bg" width="50%">
					 
						<span class="TableRow1"></span>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="50%" height="23">
						加载库时搜索的路径列表：
						<span class="TableRow2"><%=props.getProperty("java.library.path")%></span>
					</td>
					<td class="td_bg" width="50%">
						用户的当前工作目录：<%=props.getProperty("user.dir")%></td>
				</tr>
				<tr>
					<td class="td_bg" width="50%" height="23">
						Java的运行环境版本：
						<span class="TableRow2"> <%=props.getProperty("java.version")%>
						</span>
					</td>
					<td class="td_bg" width="50%">
						Java的运行环境供应商：
						<span class="TableRow1"> <%=props.getProperty("java.vendor")%>
						</span>
					</td>
				</tr>
			</tbody>
		</table>

	 
	</body>
</html>
