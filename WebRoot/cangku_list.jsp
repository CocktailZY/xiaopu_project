<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<jsp:useBean id="array" scope="page" class="com.util.AllBean" />

 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<%
	    request.setCharacterEncoding("gbk");    
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
						action="cangku_list.jsp"
						onSubmit="return check()">
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
							<tr class="tabletop">
								<td height="20" colspan="7" align="center">
									<B>�ֿ����ù���</B>
								</td>
							</tr>

							<tr>
								<td height="30" align="center">
									�ֿ����ƣ�
								</td>
								<td height="30" align="center">
									<input name="biaoqian" type="text" />
								</td>

								<td height="30" align="center">
									<input type="submit" value="����">
								</td>

								<p>
								<p>
							</tr>

							<tr class="tabletd2">
								<td width="6.6%" align="center">
									<b>���</b>
								</td>
								<td width="16.6%" align="center">
									<b>�ֿ���</b>
								</td>
								<td width="16.6%" align="center">
									<b>�ֿ�����</b>
								</td>
								<td width="16.6%" align="center">
									<b>��ϵ��</b>
								</td>
								<td width="16.6%" align="center">
									<b>��ע</b>
								</td>
								<td width="16.6%" align="center">
									<b>�Ƿ�ͣ��</b>
								</td>


								<td align="center">
									&nbsp;
									<b>����</b>
								</td>
							</tr>
							<%
								//ArrayList products = array.getCangku();
								

                             String biaoqian=request.getParameter("biaoqian");
							ArrayList products=null;
							
							if(biaoqian != null && !biaoqian.equals("")){
							 products = array.getCangkuByname(biaoqian);
							}else{
							 products = array.getCangku();
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
								<td align="center" width="25%">
									<a href="<%=path%>/editCangku.jsp?id=<%=alRow.get(0)%>"
										class="admin">�༭</a> &nbsp;
									<a
										href="<%=path%>/CangkuServlet?method=delete&id=<%=alRow.get(0)%>"
										class="admin">ɾ��</a>
								</td>
							</tr>
							<%
								}
							%>
							<tr class="tabletop">
								<td height="25" align="center">
								</td>
								<td colspan="6" align="center">
									��
									<%
									for (int i = 0; i < Math.ceil(products.size() / (double) pageindex); i++) {
										if (pages == (i + 1)) {
								%>
									<a href="<%=path%>/cangku_list.jsp?pages=<%=i + 1%>"><font
										color="red"><%=i + 1%></font> </a>&nbsp;
									<%
										} else {
									%>
									<a href="<%=path%>/cangku_list.jsp?pages=<%=i + 1%>"><%=i + 1%></a>&nbsp;

									<%
										}

										}
									%>
									ҳ &nbsp;&nbsp; ��<%=products.size()%>����¼
								</td>
							</tr>
						</table>
				</td>
		</table>
	</body>

</html>
