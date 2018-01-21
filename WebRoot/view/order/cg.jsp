<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>商品列表</title>
<link href="${ctx}/UiMaker/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ctx}/UiMaker/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/UiMaker/custom/checkForm.js"></script>
<script type="text/javascript">
	function save() {
		var ns = '';
		var ids = '';
		var pris = '';
		var resourceids = document.getElementsByName("checks");
		var nums = document.getElementsByName("num");
		var prices = document.getElementsByName("jprice");
		for ( var i = 0; i < resourceids.length; i++) {
			if (resourceids[i].checked == true) {
				ns = ns + nums[i].value + ",";
				ids = ids + resourceids[i].value + ",";
				pris = pris + prices[i].value + ",";
			}
		}
		document.getElementById("name").value = ids;
		document.getElementById("nums").value = ns;
		document.getElementById("prices").value = pris;
		var rolename = '${login_user.role.role_name }';
		if(rolename == '仓库管理员' ){
			document.form1.action="<%=request.getContextPath()%>/purchase/add.action";
		}else{
			document.form1.action="<%=request.getContextPath()%>/order/saveOrderOut.action";
		}
		document.getElementById("from").submit();
	}
	function onCheckall() {
		var checkall = document.getElementById("checkall");
		var checks = document.getElementsByName("checks");
		if (checkall.checked == true) {
			for ( var i = 0; i < checks.length; i++) {
				checks[i].checked = true;

			}
		} else {
			for ( var i = 0; i < checks.length; i++) {
				checks[i].checked = false;
			}
		}
	}
</script>
</head>
<body>
	<form action="${ctx }/order/saveOrderOut.action" id="from" method="post" name="form1">
		<!-- 商品id -->
		<input id="name" name="dto.name" type="hidden" /> 
		<!-- 数量 -->
		<input id="nums" name="dto.num" type="hidden" /> 
		<!-- 进价 -->
		<input id="prices" name="ivnDto.jprice" type="hidden" /> 
		
		

		<table border="1" class="tablelist">
			<tr>
				<td><input type="checkbox" id="checkall" onclick="onCheckall()">
				</td>
				<td>商品名称</td>
				<td>库存数量</td>
				<td>进价</td>
				<td>数量</td>
			</tr>
			<c:forEach items="${kclist }" var="inventory">
				<tr>
					<td><input type="checkbox" name="checks"
						value="${inventory.goods.id }">
					</td>

					<td>${inventory.goods.goodName }</td>

					<td>${inventory.num }</td>

					<td>${inventory.jprice }
						<!-- 进价 -->
						<input name="jprice" type="hidden" value="${inventory.jprice }" />元
					</td>
					<td>
						<input type="text" name="num" class="my_input">
					</td>

				</tr>
			</c:forEach>
			<c:if test="${login_user.role.role_name == '仓库管理员' }">
				<tr>
					<td colspan="5">选择采购员： 
						<select name="dto.user.id" class="my_select">
								<c:forEach items="${ulist }" var="user">
									<option value="${user.id }">${user.username }</option>
								</c:forEach>
						</select>
					</td>
				</tr>
			</c:if>
			<c:if test="${login_user.role.role_name == '售货员' }">
				<tr>
					<td colspan="5">选择销售员： <select name="dto.user.id" class="my_select">
							<c:forEach items="${ulist }" var="user">
								<option value="${user.id }">${user.username }</option>
							</c:forEach>
					</select></td>
				</tr>
			</c:if>
			<tr style="background-color: #f5f8fa;border-top: solid 1px #b6cad2;border-bottom: solid 1px #b6cad2;">
				<td colspan="5">
					<c:if test="${login_user.role.role_name == '仓库管理员' || login_user.role.role_name == '系统管理员' || login_user.role.role_name == '进货员'}">
						<a href="javascript:save()" class="my_a">生成订单</a>
					</c:if>
				</td>
			</tr>
			<%-- <tr>
				<c:if test="${login_user.role.role_name == '仓库管理员' }">
					<td colspan="5">
						<input type="button" value="生成订单" onclick="save()">
					</td>
				</c:if>
				<c:if test="${login_user.role.role_name == '售货员' }">
					<td colspan="4"><input type="button" value="生成订单"
						onclick="form1.action='<%=request.getContextPath()%>/order/qxsj.action',form1.submit();">
					</td>
				</c:if>
			</tr> --%>
		</table>
	</form>
</body>
</html>