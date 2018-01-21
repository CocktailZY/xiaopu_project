<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8"%>
<%@page import="com.util.Constant"%>
 
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<link href="images/css1/left_css.css" rel="stylesheet" type="text/css">
	</head>
	<SCRIPT language=JavaScript>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>
	<body bgcolor="16ACFF">

		<table width="98%" border="0" cellpadding="0" cellspacing="0"
			background="images/tablemde.jpg">
			<tr>
				<td height="5" background="images/tableline_top.jpg"
					bgcolor="#16ACFF"></td>
			</tr>
			<tr>
				<td>
					<TABLE width="97%" border=0 align=right cellPadding=0 cellSpacing=0
						class=leftframetable>
						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(1);
												height=25>
												管理员管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu1 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/admin_list.jsp"
														target=main>管理员管理</A>
												</TD>
											</TR>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/addAdmin.jsp"
														target=main>添加管理员</A>
												</TD>
											</TR>
										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>




						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(4);
												height=25>
												部门管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu4 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/bumen_list.jsp"
														target=main>部门管理</A>
												</TD>
											</TR>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/addBumen.jsp"
														target=main>添加部门</A>
												</TD>
											</TR>
										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>



						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(2);
												height=25>
												员工管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu2 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/user_list.jsp"
														target=main>员工管理</A>
												</TD>
											</TR>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/addUser.jsp"
														target=main>注册员工</A>
												</TD>
											</TR>
										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>


						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(211);
												height=25>
												员工工资发放管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu21 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/gongzi_list.jsp"
														target=main>查看工资</A>
												</TD>
											</TR>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/addGongzi.jsp"
														target=main>工资发放</A>
												</TD>
											</TR>
										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>




						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(3);
												height=25>
												客户管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu3 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/kehu_list.jsp"
														target=main>客户管理管理</A>
												</TD>
											</TR>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/addKehu.jsp"
														target=main>注册客户</A>
												</TD>
											</TR>
										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>











						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand"
												onclick=showsubmenu(51); height=25>
												供应商管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu51 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A
														href="${pageContext.request.contextPath}/gongyingshang_list.jsp"
														target=main>供应商管理</A>
												</TD>
											</TR>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A
														href="${pageContext.request.contextPath}/addGongyingshang.jsp"
														target=main>添加供应商</A>
												</TD>
											</TR>
										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>




						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand"
												onclick=showsubmenu(52); height=25>
												商品类别管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu52 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/type_list.jsp"
														target=main>商品类别管理</A>
												</TD>
											</TR>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/addType.jsp"
														target=main>添加商品类别</A>
												</TD>
											</TR>
										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>


						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand"
												onclick=showsubmenu(61); height=25>
												商品管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu61 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>

											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/addGoods.jsp"
														target=main>添加商品</A>
												</TD>
											</TR>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/goods_list.jsp"
														target=main>查看商品</A>
												</TD>
											</TR>

										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>



						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand"
												onclick=showsubmenu(62); height=25>
												仓库设置管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu62 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>

											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/addCangku.jsp"
														target=main>添加仓库设置</A>
												</TD>
											</TR>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A
														href="${pageContext.request.contextPath}/cangku_list.jsp"
														target=main>查看仓库设置</A>
												</TD>
											</TR>

										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>


						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand"
												onclick=showsubmenu(621); height=25>
												入库管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu621 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>

											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/addRuku.jsp"
														target=main>我要入库</A>
												</TD>
											</TR>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/ruku_list.jsp"
														target=main>查看入库信息</A>
												</TD>
											</TR>

										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>


						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand"
												onclick=showsubmenu(622); height=25>
												出库管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu622 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>

											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/addChuku.jsp"
														target=main>我要出库</A>
												</TD>
											</TR>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/chuku_list.jsp"
														target=main>查看出库信息</A>
												</TD>
											</TR>

										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>
						
						
						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand"
												onclick=showsubmenu(622); height=25>
												销售管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu622 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>

											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/xiaoshou.jsp"
														target=main>销售商品</A>
												</TD>
											</TR>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/xiaoshou_list.jsp"
														target=main>查看销售信息</A>
												</TD>
											</TR>

										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>



						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand"
												onclick=showsubmenu(62211); height=25>
												统计报表
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu6221 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>

											 
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/ruku_list1.jsp"
														target=main>入库年份交易信息</A>
												</TD>
											</TR>
											
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/ruku_list2.jsp"
														target=main>入库月份交易信息</A>
												</TD>
											</TR>
											
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/chuku_list1.jsp"
														target=main>出库年份交易信息</A>
												</TD>
											</TR>
											
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/chuku_list2.jsp"
														target=main>出库月份交易信息</A>
												</TD>
											</TR>


										  <TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A href="${pageContext.request.contextPath}/gongzi_list1.jsp"
														target=main>部门工资统计分析</A>
												</TD>
											</TR>
										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>



						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(9);
												height=25>
												系统设置管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu9 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A
														href="${pageContext.request.contextPath}/xitongshezhi_list.jsp"
														target=main>系统设置管理</A>
												</TD>
											</TR>

										</TBODY>

									</TABLE>
								</TD>
							</TR>
						</TBODY>

					</TABLE>
				</td>
			</tr>

			<tr>
			<tr>
				<td height="5" background="images/tableline_bottom.jpg"
					bgcolor="#9BC2ED"></td>
			</tr>


			<!--  
			<tr>
				<td>
					<TABLE class=leftframetable cellSpacing=0 cellPadding=0 width="97%"
						align=right border=0>
						<TBODY>
							<TR>
								<TD height="25"
									style="background: url(images/left_tt.gif) no-repeat">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<TD width="20"></TD>
											<TD class=STYLE1 style="CURSOR: hand" onclick=showsubmenu(5);
												height=25>
												用户信息管理
											</TD>
										</tr>
									</table>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE id=submenu5 cellSpacing=0 cellPadding=0 width="100%"
										border=0>
										<TBODY>
											<TR>
												<TD width="2%">
													<IMG src="images/closed.gif">
												</TD>
												<TD height=23>
													<A
														href="${pageContext.request.contextPath}/sysusers.action"
														target=main>用户管理</A>
												</TD>
											</TR>

										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</td>
			</tr>
			<tr>
			<tr>
				<td height="5" background="images/tableline_top.jpg"
					bgcolor="#9BC2ED"></td>
			</tr>-->
		</table>
	</body>
</html>
