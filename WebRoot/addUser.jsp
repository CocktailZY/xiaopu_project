<%@ page language="java" import="java.util.*,com.util.*"
	pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script language="JavaScript" type="text/javascript"
	src="<%=path%>/img/My97DatePicker/WdatePicker.js"></script>
<script language="JavaScript">
function reg()
{
	var pattern = /^[a-zA-Z0-9]+$/;
	var ints = /^[0-9]+$/;
	var emails = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (document.form1.sNo.value == ""  )  
	{
		alert("账号不能为空");
		document.form1.sNo.focus();
		return false;
	} else if (document.form1.pwd.value == ""  )  
	{
		alert("密码不能为空");
		document.form1.pwd.focus();
		return false;
	}else if (document.form1.name.value == ""  )  
	{
		alert("姓名为空");
		document.form1.name.focus();
		return false;
	}
	
}
</script>
<style>
<!--
.it1 {
	background-color: #F6F6F6;
	border-top-color: #999;
	border-right-color: #999;
	border-bottom-color: #999;
	border-left-color: #999;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
}

.it2 {
	background-color: #F9FC81;
	border-top-color: #999;
	border-right-color: #999;
	border-bottom-color: #999;
	border-left-color: #999;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
}

h3 {
	font-size: 14px;
	font-weight: bold;
}

pre,p {
	color: #1E7ACE;
	margin: 4px;
}

input,select,textarea {
	padding: 1px;
	margin: 2px;
	font-size: 11px;
}

.buttom {
	padding: 1px 10px;
	font-size: 12px;
	border: 1px #1E7ACE solid;
	background: #D0F0FF;
}

#formwrapper {
	width: 450px;
	margin: 15px auto;
	padding: 20px;
	text-align: left;
	border: 1px #1E7ACE solid;
}

fieldset {
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #1E7ACE;
	background: #fff;
}

fieldset legend {
	color: #1E7ACE;
	font-weight: bold;
	padding: 3px 20px 3px 20px;
	border: 1px solid #1E7ACE;
	background: #fff;
}

fieldset label {
	float: left;
	width: 120px;
	text-align: right;
	padding: 4px;
	margin: 1px;
}

fieldset div {
	clear: left;
	margin-bottom: 2px;
}

.enter {
	text-align: center;
}

.clear {
	clear: both;
}
-->
</style>
<html>
	<link rel="stylesheet" href="<%=path%>/img/css.css" type="text/css" />
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			background="<%=path%>/img/all_bg.jpg" height="100%">
			<tr>
				<td class="border_left border_right border_bottom" height="400"
					valign="top" align="center">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="5"></td>
						</tr>
					</table>
					<div id="formwrapper">
						<h3>
							注册员工
						</h3>
						<form action="<%=path%>/UserServlet?method=insert"
							method="post" name="form1" onSubmit="return reg()">
							<fieldset>
								<legend>
									注册员工
								</legend>
								<div>
									<label for="name">
										选择部门：
									</label>
									<%
										CommDAO dao1 = new CommDAO();
										List<HashMap> list1 = dao1.select("select * from t_bumen  ");
									%>
									<select name="bumen">
										<%
											for (HashMap map1 : list1) {
										%>
										<option value="<%=map1.get("bumen")%>">
											<%=map1.get("bumen")%>
										</option>

										<%
											}
										%>
									</select>
									<br />
								</div>


								<div>
									<label for="name">
										员工编号：
									</label>
									<input type="text" class="it1" onBlur="this.className='it1';"
										style="WIDTH: 160px; FONT-FAMILY: Arial"
										onFocus="this.className='it2';" name="userNo">
									<br />
								</div>
								<div>
									<label for="name">
										员工姓名：
									</label>
									<input type="text" class="it1" onBlur="this.className='it1';"
										style="WIDTH: 160px; FONT-FAMILY: Arial"
										onFocus="this.className='it2';" name="name">
									<br />
								</div>
								<div>
									<label for="name">
										员工性别：
									</label>
									男&nbsp;
									<input type="radio" class="it1" onBlur="this.className='it1';"
										onFocus="this.className='it2';" name="sex" value="男"
										checked="checked">
									&nbsp;&nbsp; 女&nbsp;
									<input type="radio" class="it1" onBlur="this.className='it1';"
										onFocus="this.className='it2';" name="sex" value="女">
									<br />
									<br />
								</div>


								<div>
									<label for="name">
										员工年龄：
									</label>
									<input type="text" class="it1" onBlur="this.className='it1';"
										style="WIDTH: 160px; FONT-FAMILY: Arial"
										onFocus="this.className='it2';" name="age">
									<br />
								</div>

								<div>
									<label for="name">
										员工电话：
									</label>
									<input type="text" class="it1" onBlur="this.className='it1';"
										style="WIDTH: 160px; FONT-FAMILY: Arial"
										onFocus="this.className='it2';" name="tel">
									<br />
								</div>
								<div>
									<label for="name">
										员工QQ：
									</label>
									<input type="text" class="it1" onBlur="this.className='it1';"
										style="WIDTH: 160px; FONT-FAMILY: Arial"
										onFocus="this.className='it2';" name="qq">
									<br />
								</div>

								<div>
									<label for="name">
										到职日期：
									</label>
									<input type="text" class="Wdate" style="width: 160px"
										onFocus="WdatePicker({dateFmt:'yyyy-MM-dd  '})" id="daozhiriqi"
										name="daozhiriqi" value="<%=Utils.getCurDate() + ""%>" />
									<br />
								</div>
								<div>
									<label for="name">
										文化程度：
									</label>
									<select name="wenhuachengdu" style="width: 160px" size="1">

										<option value="研究生">
											研究生
										</option>
										<option value="大学本科">
											大学本科
										</option>
										<option value="大专">
											大专
										</option>

									</select>
									<br />
								</div>

								<div>
									<label for="name">
										婚姻状况：
									</label>
									 

		 已婚&nbsp;<input type="radio" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';" name="hunyinzhuangkuang" value="已婚" checked="checked">&nbsp;&nbsp;
          未婚&nbsp;<input type="radio" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';" name="hunyinzhuangkuang" value="未婚"><br />

								 
									<br />
								</div>
								<div>
									<label for="name">
										联系地址：
									</label>
									<input type="text" class="it1" onBlur="this.className='it1';"
										style="WIDTH: 160px; FONT-FAMILY: Arial"
										onFocus="this.className='it2';" name="dizhi">
									<br />
								</div>

								<div>
									<label for="name">
										是否在职：
									</label>
								
		 在职&nbsp;<input type="radio" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';" name="shifouzaizhi" value="在职" checked="checked">&nbsp;&nbsp;
         不在职&nbsp;<input type="radio" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';" name="shifouzaizhi" value="不在职"><br />

								 
									<br />
								</div>

								<div class="enter">
									<input type="submit" class="buttom" value="提交" />
									<input type="reset" class="buttom" value="重置" />
								</div>
							</fieldset>
						</form>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>

