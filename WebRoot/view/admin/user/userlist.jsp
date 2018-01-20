<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<title>用户管理</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath %>css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<%=basePath %>css/uniform.css" />
<link rel="stylesheet" href="<%=basePath %>css/select2.css" />
<link rel="stylesheet" href="<%=basePath %>css/maruti-style.css" />
<link rel="stylesheet" href="<%=basePath %>css/maruti-media.css" class="skin-color" />
<link rel="stylesheet" href="<%=basePath%>css/reveal.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/sweet-alert.css">
<script src="<%=basePath%>js/sweet-alert.min.js"></script>
</head>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">用户管理</a></h1>
</div>
<!--close-Header-part--> 

<!--top-Header-messaages-->
<div class="btn-group rightzero"> <a class="top_message tip-left" title="Manage Files"><i class="icon-file"></i></a> <a class="top_message tip-bottom" title="Manage Users"><i class="icon-user"></i></a> <a class="top_message tip-bottom" title="Manage Comments"><i class="icon-comment"></i><span class="label label-important">5</span></a> <a class="top_message tip-bottom" title="Manage Orders"><i class="icon-shopping-cart"></i></a> </div>
<!--close-top-Header-messaages--> 

<!--top-Header-menu-->
	<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li class=""><a title="" href="<%=basePath%>user/getById.do?uId=${loginUser.uId}"><i class="icon icon-user"></i> <span class="text">管理员信息</span></a></li>
    <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">管理员消息</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#">公司总部</a></li>
        <li><a class="sInbox" title="" href="#">财务部</a></li>
        <li><a class="sOutbox" title="" href="#">人事部</a></li>
        <li><a class="sTrash" title="" href="#">市场部</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">系统设置</span></a></li>
    <li class=""><a title="" href="login.html"><i class="icon icon-share-alt"></i> <span class="text">退出登录</span></a></li>
  </ul>
</div>


<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>系统首页</a>
  <ul>
	  <c:forEach items="${fplist }" var="fp">
	  		<c:if test="${fp.url == '#'}">
	    	 <li class=" dropdown" id="menu-messages"><a href="<%=basePath%>${fp.url}" data-toggle="dropdown"><i class="icon icon-${fp.icon }"></i><span>${fp.poName }</span></a>
		    </c:if>
		    <c:if test="${fp.url != '#'}">
	    	 <li class=" dropdown" id="menu-messages"><a href="<%=basePath%>${fp.url}/list.do"><i class="icon icon-${fp.icon }"></i><span>${fp.poName }</span></a>
		    </c:if>		
		    	<ul class="dropdown-menu">
	    			<c:forEach items="${cplist }" var="cp">
			    		<c:if test="${cp.parentid == fp.poId }">
				    		<li><a class="sAdd" title="" href="<%=basePath%>${cp.url }">${cp.poName }</a></li>
			        	</c:if>
	       			 </c:forEach>	
		        </ul>
		    </li>
	   </c:forEach>

  </ul>
</div>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="<%=basePath %>view/admin/admin.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首 页</a> <a href="<%=basePath%>user/list.do" class="current">用户管理</a> </div>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
      
      	<button class="btn" onclick="window.location.href='<%=basePath %>view/user/signup.jsp'">注册新用户</button>
      	
        <div class="widget-box">
          <div class="widget-title">
             <span class="icon"><i class="icon-th"></i></span> 
            <h5>用户列表</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>用户编号</th>
                  <th>用户头像</th>
                  <th>用户名</th>
                  <th>密码</th>
                  <th>用户积分</th>
                  <th>用户角色</th>
                  <th>用户状态</th>
                  <th>操 作</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${list }" var="item">
	                <tr class="gradeX">
	                  <td>${item.uId }</td>
	                  <td><img src="<%=basePath%>fileUpload/${item.uHead }" width="30px" height="30px" /></td>
	                  <td>${item.uName }</td>
	                  <td>${item.uPwd }</td>
	                  <td>${item.uCent }</td>
	                  <td>
		                  <c:forEach items="${rlist }" var="role">
		                 	 <c:if test="${item.uRoleid == role.roId }">
		                		  ${role.roName }
		                	 </c:if>
		                  </c:forEach>
	                  </td>
	                  <td>
	                  	<c:if test="${item.uState == 1 }">
	                  		已激活
	                  	</c:if>
	                  	<c:if test="${item.uState == 0 }">
	                  		未激活
	                  	</c:if>
	                  </td>
	                  <td class="center">
	                  	<button class="btn btn-danger" onclick="delete_shop('${item.uId }')">删除</button>
	                  </td>
	                </tr>
	                
               	</c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row-fluid">
  <div id="footer" class="span12"> 2012 &copy; Marutii Admin. More Templates </div>
</div>
<script src="<%=basePath %>js/jquery.min.js"></script> 
<script src="<%=basePath %>js/jquery.ui.custom.js"></script> 
<script src="<%=basePath %>js/bootstrap.min.js"></script> 
<script src="<%=basePath %>js/jquery.uniform.js"></script> 
<%-- <script src="<%=basePath %>js/select2.min.js"></script> --%> 
<script src="<%=basePath %>js/jquery.dataTables.min.js"></script> 
<script src="<%=basePath %>js/maruti.js"></script> 
<script src="<%=basePath %>js/maruti.tables.js"></script>
<script src="<%=basePath%>js/jquery.reveal.js"></script>
<script type="text/javascript">
function delete_shop(uid) {
				swal({
					title: "确定删除?",
					text: "删除前请确认信息!",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: "#DD6B55",
					confirmButtonText: "是的,删除!"
				},
				function()
					{
						window.location.href="<%=basePath%>user/delete.do?uId="+uid;
					}
				
				);
			};




<%-- function set_fpower(pid){
			if(pid != null){
				var fpowerid = pid;
					$.ajax({
						type:"post",
						async:true,
						dataType:"json",
						url:"<%=basePath%>user/roleList.do",
						success:function(data){
							var json = eval(data);
							$("select[name=uRoleid]").empty();
							var row2 = $("select[name=uRoleid]");
							var td = "";
							for(var i=0;i<json.length;i++){
								if(json[i].roId != null){
									if(json[i].roId == fpowerid){
										td = $("<option selected="+"selected"+">").text(json[i].roName).val(json[i].roId);
									}else{
										td = $("<option>").text(json[i].roName).val(json[i].roId);
									}
									row2.append(td);
								}
							}
				        },
				        error:function(){				
				        	alert("出现异常");
						}
					});
					
					}else{
						$.ajax({
						type:"post",
						async:true,
						dataType:"json",
						url:"<%=basePath%>user/roleList.do",
						success:function(data){
							var json = eval(data);
							$("select[name=uRoleid]").empty();
							var row2 = $("select[name=uRoleid]");
							var td = "";
							for(var i=0;i<json.length;i++){
								if(json[i].roId != null){
									td = $("<option>").text(json[i].roName).val(json[i].roId);
									row2.append(td);
								}
							}
				        },
				        error:function(){				
				        	alert("出现异常");
						}
					});
					}
				} --%>
</script>

</body>
</html>
