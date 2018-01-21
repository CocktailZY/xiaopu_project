<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    <link href="${ctx}/UiMaker/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/UiMaker/js/jquery.js"></script>
	<script type="text/javascript" src="${ctx}/UiMaker/custom/checkForm.js"></script>
	<script type="text/javascript">
	function save() {
		var ids = '';
		var nums = '';
		var checks = document.getElementsByName("select");
		var snum = document.getElementsByName("count");
		for ( var i = 0; i < checks.length; i++) {
			if (checks[i].checked == true) {
				ids = ids + checks[i].value + ",";
				nums = nums + snum[i].value + ",";
			}
		}
		document.getElementById("gonghuoids").value = ids;
		document.getElementById("count").value = nums;
		document.getElementById("idform").submit();
	}
	</script>
  </head>
  
   <body>
    	<form action="${ctx}/order/save.action" id="idform" method="post">
	    	<input type="hidden" id="gonghuoids" name="dto.pp">
			<input type="hidden" id="count"  name="dto.count">
			<c:if test="${login_user.role.id eq 2}">
				<input type="hidden" name="dto.orderType.id" value="1">
				<div class="rightinfo">
					<input type="button" value="保存" onclick="save()" class="my_input">
				</div>
			</c:if>
			<c:if test="${login_user.role.id eq 3}">
				<input type="hidden" name="dto.orderType.id" value="2">
				<div class="rightinfo">
					<input type="button" value="保存" onclick="save()" class="my_input">
				</div>
			</c:if>
			
			
    	
    		<table border="1" class="tablelist">
    			<tr>
    				<td>
    					<!-- <input name="selectAll" type="radio" id="selectAll" onclick="checkAll('select')" /> -->
					</td>
    				<td>供货商名称</td>
    				<td>价格</td>
    				<td>进购数量</td>
    			</tr>
    			<c:forEach items="${list }" var="item"> 
    				<input type="hidden" name="qqq" value="${item.goods.id }">
    				<input type="hidden" name="orderinfoDto.jprice" value="${item.jprice }">
    				<input type="hidden" name="aaa" value="${item.supplier.id }">
    				<tr>
    					<td>
    					<input name="select" type="radio" value="${item.id}" onclick="unCheckAll('select')"/>
						</td>
    					<td>${item.supplier.supName }</td>
    					<td>${item.jprice }</td>
    					<td><input type="text" name="count" value="${num }" class="my_input"></td>
    				</tr>
    			
    			</c:forEach>
    			
    		</table>
    	
    	
    	</form>
  </body>
</html>
</html>