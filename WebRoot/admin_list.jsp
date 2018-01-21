<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
 
 <jsp:useBean id="array" scope="page" class="com.util.AllBean" />
 
 
<%
 
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":"
				+ request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<%
		String message = (String) request.getAttribute("message");
			if (message == null) {
				message = "";
			}
			if (!message.trim().equals("")) {
				out.println("<script language='javascript'>");
				out.println("alert('" + message + "');");
				out.println("</script>");
			}
			request.removeAttribute("message");
			//分页代码
			int pageindex = 5;
			int pages = 0;
			try {
				pages = Integer
						.parseInt(request.getParameter("pages") == null ? "1"
								: request.getParameter("pages"));
			} catch (Exception e) {
			}
	%>
	<link rel="stylesheet" href="<%=path%>/img/css.css" type="text/css" />
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			background="<%=path%>/img/all_bg.jpg" height="100%">
			<tr>
				<td class="border_left border_right border_bottom" height="400"
					valign="top" align="center">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="25"></td>
						</tr>
					</table>
					<form name="form1" method="post"
						action="<%=path %>/admin_list.jsp"
						onSubmit="return check()">
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
							<tr class="tabletop">
								<td height="20" colspan="6" align="center">
									<B>管理员管理</B>
								</td>
							</tr>
							<tr>
								<td height="30"   align="center">
									关键字：
								</td>
								<td height="30"   align="center">
									<input name="biaoqian" type="text"/> 
								</td>
							
								<td height="30"   align="center">
									<input type="submit" value="搜索">
								</td>
								
								<p><p>
								 
							</tr>
							 
							
							
							<tr class="tabletd2">
								<td width="16.6%" align="center">
									<b>序号</b>
								</td>
								<td width="16.6%" align="center">
									<b>管理员账号</b>
								</td>
							    <td width="16.6%" align="center">
									<b>管理员登陆密码</b>
								</td> 
							 
								 
								<td align="center">
									&nbsp;<b>操作</b>
								</td>
							</tr>
							<%
								//ArrayList products = array.getAdmin();
								
								String biaoqian=request.getParameter("biaoqian");
							ArrayList products=null;
							
							if(biaoqian != null && !biaoqian.equals("")){
							 products = array.getAdmin1(biaoqian);
							}else{
							 products = array.getAdmin();
							}
							   
									for (int i = (pages - 1) * pageindex; i < (pages * pageindex < products
											.size() ? pages * pageindex : products.size()); i++) {
										ArrayList alRow = (ArrayList) products.get(i);
							%>
							<tr class="tabletd<%=i % 2 + 1%>">
								<td align="center"><%=i + 1%></td>
						 <td align="center"><%=alRow.get(1)%></td> 
						 <td align="center"><%=alRow.get(2)%></td>    
								<td align="center" width="25%">
									 <a href="<%=path%>/editAdmin.jsp?id=<%=alRow.get(0)%>"
										class="admin">编辑</a> &nbsp;
									<a href="<%=path%>/AdminServlet?method=delete&id=<%=alRow.get(0)%>"
										class="admin">删除</a>
								</td>
							</tr>
							<%
								}
							%>
							<tr class="tabletop">
								<td height="25" align="center">
									<a href="<%=path%>/addAdmin.jsp">添加管理员</a>
								</td>
								<td colspan="6" align="center">
									第
									<%
									for (int i = 0; i < Math.ceil(products.size()
												/ (double) pageindex); i++) {
											if (pages == (i + 1)) {
								%>
									<a href="<%=path%>/admin_list.jsp?pages=<%=i + 1%>"><font
										color="red"><%=i + 1%></font> </a>&nbsp;
									<%
										} else {
									%>
									<a href="<%=path%>/admin_list.jsp?pages=<%=i + 1%>"><%=i + 1%></a>&nbsp;

									<%
										}

											}
									%>
									页   &nbsp;&nbsp; 共<%=products.size() %>条记录
								</td>
							</tr>
						</table>
			 
			</td>
			 
		</table>
	</body>

</html>
 