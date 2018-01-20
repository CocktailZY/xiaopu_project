<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
    
<head>
        <title>后台管理系统登录</title><meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=basePath%>css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="<%=basePath%>css/maruti-login.css" />
    </head>
    <body>
        <div id="logo">
            <img src="<%=basePath%>img/login-logo.png" alt="" />
        </div>
        <div id="loginbox">            
            <form id="loginform" class="form-vertical" action="<%=basePath%>user/login.do" method="post">
				 <div class="control-group normal_text"><h3 style="font-family: '微软雅黑';">后台管理员登录</h3></div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on"><i class="icon-user"></i></span>&nbsp;&nbsp;<input type="text" name="uName" placeholder="账号" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on"><i class="icon-lock"></i></span>&nbsp;&nbsp;<input type="password" name="uPwd" placeholder="密码" />
                        </div>
                    </div>
                </div>
				<div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
							<select name="uRoleid">
								<c:forEach items="${rolelist }" var="item">
									<option value="${item.roId }">${item.roName }</option>
								</c:forEach>
							</select>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link btn btn-warning" id="to-recover">忘记密码?</a></span>
                    <span class="pull-right"><input type="submit" class="btn btn-success" value="登&nbsp;&nbsp;&nbsp;录" />&nbsp;</span>
                </div>
            </form>
            
        </div>
               
        <script src="<%=basePath%>js/jquery.min.js"></script>  
        <script src="<%=basePath%>js/maruti.login.js"></script> 
    </body>

</html>
