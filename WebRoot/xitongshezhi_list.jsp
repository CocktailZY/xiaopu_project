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
						action="ModifyAdminServlet?mark=username"
						onSubmit="return check()">
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
							<tr class="tabletop">
								<td height="20" colspan="8" align="center">
									<B>ϵͳ���ù���</B>
								</td>
							</tr>
							<tr class="tabletd2">
								<td width="12.6%" align="center">
									<b>���</b>
								</td>
								<td width="12.6%" align="center">
									<b>ϵͳ����</b>
								</td>
								<td width="12.6%" align="center">
									<b>��Ȩ��Ϣ</b>
								</td>
								<td width="12.6%" align="center">
									<b>��ע��Ϣ</b>
								</td>
							 

								<td align="center">
									&nbsp;
									<b>����</b>
								</td>
							</tr>
							<%
								ArrayList products = array.getXitongshezhi();
								for (int i = (pages - 1) * pageindex; i < (pages * pageindex < products
										.size() ? pages * pageindex : products.size()); i++) {
									ArrayList alRow = (ArrayList) products.get(i);
							%>
							<tr class="tabletd<%=i % 2 + 1%>">
								<td align="center"><%=i + 1%></td>
								<td align="center"><%=alRow.get(1)%></td>
								<td align="center"><%=alRow.get(2)%></td>
								<td align="center"><%=alRow.get(3)%></td> 

								<td align="center" width="25%">
   <%
   if(null == request.getSession().getAttribute("role")){   
   System.out.println("Ϊ��");
}else if("����Ա".equals(request.getSession().getAttribute("role").toString())){   
      %>
									<a
										href="<%=path%>/xitongshezhi_update.jsp?id=<%=alRow.get(0)%>"
										class="admin">�༭</a>
										
									<%} %>
								</td>
							</tr>
							<%
								}
							%>
							<tr class="tabletop">
								<td height="25" align="center">
								</td>
								<td colspan="8" align="center">
									��
									<%
									for (int i = 0; i < Math.ceil(products.size() / (double) pageindex); i++) {
										if (pages == (i + 1)) {
								%>
									<a href="<%=path%>/xitongshezhi.jsp?pages=<%=i + 1%>"><font
										color="red"><%=i + 1%></font> </a>&nbsp;
									<%
										} else {
									%>
									<a href="<%=path%>/xitongshezhi_list.jsp?pages=<%=i + 1%>"><%=i + 1%></a>&nbsp;

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
