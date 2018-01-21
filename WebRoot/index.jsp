<%@ page language="java" import="java.util.*  "  contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title><%=com.util.Constant.SYS_NAME %></title>
 

<script language="JavaScript"> 
 var msg  = "欢迎光临<%=com.util.Constant.SYS_NAME %>,有任何问题请及时联系网站管理员<%=com.util.Constant.contact %>" ;
var interval = 100
var subLen=0;
function Scroll() 
{
len = msg.length;
window.status = msg.substring(0, subLen);
subLen++;
	if ( subLen > len ) 
	{ 
	subLen = 1; 
	window.status = '';
	window.setTimeout("Scroll()", interval );
	}
	else
	window.setTimeout("Scroll()", interval );
} 
Scroll();

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

</script>

<meta http-equiv="Content-Type" content="text/html;charset=utf-8"></head>
<frameset rows="59,*" frameborder="no" border="0" framespacing="0">
	<frame src="top.jsp" noresize="noresize" frameborder="0" name="topFrame" marginwidth="0" marginheight="0" scrolling="no">
<frameset rows="*" cols="195,*" id="frame">
	<frame src="left.jsp" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto"/>
	<frame src="right.jsp" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes"/>
</frameset>
<frame src="UntitledFrame-1" noresize="noresize" frameborder="0" name="bottomFrame" marginwidth="0" marginheight="0" scrolling="no">
<noframes>
	<body></body>
</noframes>
</frameset>
</html>