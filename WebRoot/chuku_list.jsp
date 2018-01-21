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
						action="chuku_list.jsp"
						onSubmit="return check()">
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
							<tr class="tabletop">
								<td height="20" colspan="17" align="center">
									<B>出库管理</B>
								</td>
							</tr>
							
							                                      
<tr>
								<td height="30"   align="center">
									出库单号：
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
								<td width="4.6%" align="center">
									<b>序号</b>
								</td>
								<td width="6%" align="center">
									<b>出库类型</b>
								</td>
							    <td width="6%" align="center">
									<b>出库单号</b>
								</td> 
								<td width="6%" align="center">
									<b>出库日期</b>
								</td>
								<td width="6%" align="center">
									<b>客户</b>
								</td> 
								<td width="6%" align="center">
									<b>出库仓库</b>
								</td>
								<td width="6%" align="center">
									<b>经手人</b>
								</td>
								<td width="6%" align="center">
									<b>商品编码</b>
								</td> 
								<td width="6%" align="center">
									<b>商品名称</b>
								</td>
								<td width="6%" align="center">
									<b>商品规格</b>
								</td>
								<td width="6%" align="center">
									<b>商品品牌</b>
								</td> 
								<td width="6%" align="center">
									<b>数量</b>
								</td>
								 <td width="6%" align="center">
									<b>单价</b>
								</td>
								<td width="6%" align="center">
									<b>出库金额</b>
								</td> 
								<td width="6%" align="center">
									<b>备注</b>
								</td>
							 
								 
								<td align="center">
									&nbsp;<b>操作</b>
								</td>
							</tr>
							<%
								//ArrayList products = array.getChuku();
								

                                          String biaoqian=request.getParameter("biaoqian");
							ArrayList products=null;
							
							if(biaoqian != null && !biaoqian.equals("")){
							 products = array.getChukubyNo(biaoqian);
							}else{
							 products = array.getChuku();
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
						 <td align="center"><%=alRow.get(11)%></td> 
						 <td align="center"><%=alRow.get(12)%></td>  
						  <td align="center"><%=alRow.get(13)%></td>  
						 <td align="center"><%=alRow.get(14)%></td>   
						   
								<td align="center" width="25%">
									 
									<a href="<%=path%>/ChukuServlet?method=delete&id=<%=alRow.get(0)%>"
										class="admin">删除</a>
								</td>
							</tr>
							<%
								}
							%>
							<tr class="tabletop">
								<td height="25" align="center">
								</td>
								<td colspan="17" align="center">
									第
									<%
									for (int i = 0; i < Math.ceil(products.size()
												/ (double) pageindex); i++) {
											if (pages == (i + 1)) {
								%>
									<a href="<%=path%>/chuku_list.jsp?pages=<%=i + 1%>"><font
										color="red"><%=i + 1%></font> </a>&nbsp;
									<%
										} else {
									%>
									<a href="<%=path%>/chuku_list.jsp?pages=<%=i + 1%>"><%=i + 1%></a>&nbsp;

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
 