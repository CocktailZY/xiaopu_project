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

function numcheck(n){
var textnum = document.getElementsByName(n);
  var reg = /^\d+$/;
      if( n.value.match( reg )){        
    var re =n.value.match( reg );       
     return true;    
     }else{
     alert('������ֻ��Ϊ���֣�');}
}



function reg()
{
	var pattern = /^[a-zA-Z0-9]+$/;
	var ints = /^[0-9]+$/;
	var emails = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (document.form1.sNo.value == ""  )  
	{
		alert("�˺Ų���Ϊ��");
		document.form1.sNo.focus();
		return false;
	} else if (document.form1.pwd.value == ""  )  
	{
		alert("���벻��Ϊ��");
		document.form1.pwd.focus();
		return false;
	}else if (document.form1.name.value == ""  )  
	{
		alert("����Ϊ��");
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
							��Ʒ����
						</h3>
						<form action="<%=path%>/ChukuServlet?method=insert"
							method="post" name="form1" onSubmit="return reg()">
							<fieldset>
								<legend>
							��Ʒ����
								</legend>
								<div>
									<label for="name">
										�����������ͣ�
									</label>
									 
								<select name="chukuType"  style="width:160px" size="1">

									<option value="��Ʒ����">
										��Ʒ����
									</option>
									<option value="��������">
										��������
									</option>
									<option value="��������">
										��������
									</option>

								</select>
									<br />
								</div>

 
								<div>
									<label for="name">
										�������ڣ�
									</label>
									<input type="text" class="Wdate" style="width: 160px"
										onFocus="WdatePicker({dateFmt:'yyyy-MM-dd  '})" id="rukuriqi"
										name="chukuriqi" value="<%=Utils.getCurDate() + ""%>" />
									<br />
								</div>
							 


								<div>
									<label for="name">
										�ͻ���
									</label>
									<%
										CommDAO dao1 = new CommDAO();
										List<HashMap> list1 = dao1.select("select * from t_kehu  ");
									%>
									<select name="kehu" style="width: 160px">
										<%
											for (HashMap map1 : list1) {
										%>
										<option value="<%=map1.get("kehuname")%>">
											<%=map1.get("kehuname")%>
										</option>

										<%
											}
										%>
									</select>
									<br />
								</div>

								<div>
									<label for="name">
										��ϵ�ˣ�
									</label>
									<input type="text" class="it1" onBlur="this.className='it1';"
										style="WIDTH: 160px; FONT-FAMILY: Arial"
										onFocus="this.className='it2';" name="lianxiren">
									<br />
								</div>
								
									<div>
									<label for="name">
										ѡ��ֿ⣺
									</label>
									<%
										CommDAO dao12 = new CommDAO();
										List<HashMap> list12 = dao1.select("select * from t_cangku  ");
									%>
									<select name="cangku" style="width: 160px">
										<%
											for (HashMap map12 : list12) {
										%>
										<option value="<%=map12.get("name")%>">
											<%=map12.get("name")%>
										</option>

										<%
											}
										%>
									</select>
									<br />
								</div>
								
								
								<div>
									<label for="name">
										�����ˣ�
									</label>
									<%
										CommDAO dao123 = new CommDAO();
										List<HashMap> list123 = dao1.select("select * from t_user  ");
									%>
									<select name="jingshouren" style="width: 160px">
										<%
											for (HashMap map123 : list123) {
										%>
										<option value="<%=map123.get("name")%>">
											<%=map123.get("name")%>
										</option>

										<%
											}
										%>
									</select>
									<br />
								</div>
								
								<div>
									<label for="name">
										��ϵ�ֻ���
									</label>
									<input type="text" class="it1" onBlur="this.className='it1';"
										style="WIDTH: 160px; FONT-FAMILY: Arial"
										onFocus="this.className='it2';" name="tel2">
									<br />
								</div>

							 	<div>
									<label for="name">
										ѡ��������Ʒ��
									</label>
									<%
										CommDAO dao1234 = new CommDAO();
										List<HashMap> list1234 = dao1.select("select * from t_goods  ");
									%>
									<select name="gongsNo">
										<%
											for (HashMap map1234 : list1234) {
										%>
										<option value="<%=map1234.get("id")%>">
											��Ʒ��:<%=map1234.get("name")%>&nbsp;&nbsp;�����:<%=map1234.get("num")%>
										</option>

										<%
											}
										%>
									</select>
									<br />
								</div>
							 	<div>
									<label for="name">
									����������
									</label>
									<input type="text" class="it1" 	onBlur="numcheck(goodsNum)"
										style="WIDTH: 160px; FONT-FAMILY: Arial"
										onFocus="this.className='it2';" name="goodsNum">
									<br />
								</div>
								<div>
									<label for="name">
										��Ʒ�۸�
									</label>
									<input type="text" class="it1" onBlur="this.className='it1';"
										style="WIDTH: 160px; FONT-FAMILY: Arial"
										onFocus="this.className='it2';" name="tel2">
									<br />
								</div>
								<div>
									<label for="name">
										���ۼ۸�
									</label>
									<input type="text" class="it1" onBlur="this.className='it1';"
										style="WIDTH: 160px; FONT-FAMILY: Arial"
										onFocus="this.className='it2';" name="tel2">
									<br />
								</div>

								 
								 
								<div>
									<label for="name">
									��ע��
									</label>
									<input type="text" class="it1" onBlur="this.className='it1';"
										style="WIDTH: 160px; FONT-FAMILY: Arial"
										onFocus="this.className='it2';" name="beizhu">
									<br />
								</div>
								

								<div>
									<label for="name">
										�Ƿ����ã�
									</label>
								
		 ����&nbsp;<input type="radio" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';" name="iszaiyong" value="����" checked="checked">&nbsp;&nbsp;
         ������&nbsp;<input type="radio" class="it1" onBlur="this.className='it1';" onFocus="this.className='it2';" name="iszaiyong" value="������"><br />

								 
									<br />
								</div>

								<div class="enter">
									<input type="submit" class="buttom" value="�ύ" />
									<input type="reset" class="buttom" value="����" />
								</div>
							</fieldset>
						</form>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>

