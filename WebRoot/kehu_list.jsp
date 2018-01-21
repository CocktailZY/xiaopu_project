<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
 
 <jsp:useBean id="array" scope="page" class="com.util.AllBean" />

  
<%
        request.setCharacterEncoding("gbk");
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
						action="<%=path %>/kehu_list.jsp"
						onSubmit="return check()">
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
							<tr class="tabletop">
								<td height="20" colspan="12" align="center">
									<B>客户管理</B>
								</td>
							</tr>
							
							<tr>
								<td height="30"   align="center">
									姓名：
								</td>
								<td height="30"   align="center">
									<input name="biaoqian" type="text"/> 
								</td>
							
								<td height="30"   align="center">
									<input type="submit" value="搜索">
								</td>
								
								<p><p>
								 
							</tr>
							<tr>
								<td height="30"   align="center">
									类别：
								</td>
								<td height="30"   align="center">
											 
								<select name="kehutype"  style="width:140px" size="1"> 
									<option value="潜在客户">
										潜在客户
									</option>
									<option value="新客户">
										新客户
									</option>
									<option value="老客户">
										老客户
									</option>

								</select>
								</td>
							
								<td height="30"   align="center">
									<input type="submit" value="搜索">
								</td>
								
								<p><p>
								 
							</tr>
							
							
							<tr class="tabletd2">
								<td width="5.6%" align="center">
									<b>序号</b>
								</td>
								<td width="8%" align="center">
									<b>客户名称</b>
								</td>
							    <td width="8%" align="center">
									<b>客户类别</b>
								</td> 
								<td width="8%" align="center">
									<b>地址</b>
								</td>
								<td width="8%" align="center">
									<b>联系人</b>
								</td>
							    <td width="8%" align="center">
									<b>联系电话</b>
								</td> 
								<td width="8%" align="center">
									<b>联系手机</b>
								</td>
								<td width="8%" align="center">
									<b>传真</b>
								</td>
								<td width="8%" align="center">
									<b>Email</b>
								</td> 
								<td width="8%" align="center">
									<b>备注</b>
								</td>
								<td width="8%" align="center">
									<b>是否停用</b>
								</td>
								 
							 
								 
								<td align="center">
									&nbsp;<b>操作</b>
								</td>
							</tr>
							<%
							//	ArrayList products = array.getKehu();
							
String biaoqian=request.getParameter("biaoqian");
String kehutype=request.getParameter("kehutype");
							ArrayList products=null;
							 
							 if(biaoqian != null && !biaoqian.equals("")){
							 products = array.getKehu1(biaoqian);
							} else if(!"请选择".equals(kehutype)){
							 products = array.getKehu2(kehutype);
							}
									for (int i = (pages - 1) * pageindex; i < (pages * pageindex < products
											.size() ? pages * pageindex : products.size()); i++) {
										ArrayList alRow = (ArrayList) products.get(i);
							%>
							<tr class="tabletd<%=i % 2 + 1%>">
								<td align="center"><%=i + 1%></td>
						 <td align="center"><%=alRow.get(1)%></td> 
						 <td align="center"><%=alRow.get(2)%></td>  
						 <td align="center"><%=alRow.get(3)%></td> 
						 <td align="center"><%=alRow.get(4)%></td>  
						 <td align="center"><%=alRow.get(5)%></td> 
						 <td align="center"><%=alRow.get(6)%></td>  
						 <td align="center"><%=alRow.get(7)%></td> 
						 <td align="center"><%=alRow.get(8)%></td>  
						 <td align="center"><%=alRow.get(9)%></td> 
						 <td align="center"><%=alRow.get(10)%></td> 
						   
								<td align="center" width="25%">
									  <a href="<%=path%>/editKehu.jsp?id=<%=alRow.get(0)%>" class="admin">编辑</a> &nbsp;
									<a href="<%=path%>/KehuServlet?method=delete&id=<%=alRow.get(0)%>"
										class="admin">删除</a>
								</td>
							</tr>
							<%
								}
							%>
							<tr class="tabletop">
								<td height="25" align="center">
								</td>
								<td colspan="14" align="center">
									第
									<%
									for (int i = 0; i < Math.ceil(products.size()
												/ (double) pageindex); i++) {
											if (pages == (i + 1)) {
								%>
									<a href="<%=path%>/kehu_list.jsp?pages=<%=i + 1%>"><font
										color="red"><%=i + 1%></font> </a>&nbsp;
									<%
										} else {
									%>
									<a href="<%=path%>/kehu_list.jsp?pages=<%=i + 1%>"><%=i + 1%></a>&nbsp;

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
 