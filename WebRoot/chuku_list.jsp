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
			//��ҳ����
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
									<B>�������</B>
								</td>
							</tr>
							
							                                      
<tr>
								<td height="30"   align="center">
									���ⵥ�ţ�
								</td>
								<td height="30"   align="center">
									<input name="biaoqian" type="text"/> 
								</td>
							
								<td height="30"   align="center">
									<input type="submit" value="����">
								</td>
								
								<p><p>
								 
							</tr>
							<tr class="tabletd2">
								<td width="4.6%" align="center">
									<b>���</b>
								</td>
								<td width="6%" align="center">
									<b>��������</b>
								</td>
							    <td width="6%" align="center">
									<b>���ⵥ��</b>
								</td> 
								<td width="6%" align="center">
									<b>��������</b>
								</td>
								<td width="6%" align="center">
									<b>�ͻ�</b>
								</td> 
								<td width="6%" align="center">
									<b>����ֿ�</b>
								</td>
								<td width="6%" align="center">
									<b>������</b>
								</td>
								<td width="6%" align="center">
									<b>��Ʒ����</b>
								</td> 
								<td width="6%" align="center">
									<b>��Ʒ����</b>
								</td>
								<td width="6%" align="center">
									<b>��Ʒ���</b>
								</td>
								<td width="6%" align="center">
									<b>��ƷƷ��</b>
								</td> 
								<td width="6%" align="center">
									<b>����</b>
								</td>
								 <td width="6%" align="center">
									<b>����</b>
								</td>
								<td width="6%" align="center">
									<b>������</b>
								</td> 
								<td width="6%" align="center">
									<b>��ע</b>
								</td>
							 
								 
								<td align="center">
									&nbsp;<b>����</b>
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
										class="admin">ɾ��</a>
								</td>
							</tr>
							<%
								}
							%>
							<tr class="tabletop">
								<td height="25" align="center">
								</td>
								<td colspan="17" align="center">
									��
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
									ҳ   &nbsp;&nbsp; ��<%=products.size() %>����¼
								</td>
							</tr>
						</table>
			 
			</td>
			 
		</table>
	</body>

</html>
 