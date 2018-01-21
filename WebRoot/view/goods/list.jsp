<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品列表</title>
<link href="${ctx}/UiMaker/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ctx}/UiMaker/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/UiMaker/custom/checkForm.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".click").click(function() {
			$(".tip").fadeIn(200);
		});

		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

	});

	function paging(pageNum){
		document.getElementById("pageNum").value = pageNum;
		document.getElementById("findForm").submit();
	}
</script>
</head>
<body>
	<div align="center">
	
	<form action="<%=request.getContextPath()%>/good/list.action" method="post" id="findForm">
		<input type="hidden" id="pageNum" name="pageNum">
		<c:if test="${login_user.role.id != 6}">
		<div class="uew-select" style="padding-top: 3px; padding-bottom: 3px; text-align: left;">
			<a href="<%=request.getContextPath()%>/good/add.action" class="my_a">添加商品</a>
			<select name="dto.status" style="border: 1px solid #cccccc; padding:5px; border-radius: 5px;margin-left:5px;margin-right:5px;">
				 <option value="2" >全部商品</option>
			     <option value="1" ${dto.status == 1 ? 'selected': 2}>已上架</option>
			     <option value="0" ${dto.status == 0 ? 'selected': 2}>未上架</option>
			</select>
			<input type="button" name="statusbutton" onclick="paging(null)" value="查询" style="border: 1px solid #cccccc; padding:5px; border-radius: 5px;background-color: white;">
		</div>
		</c:if>
		<table width="60%" border="1" class="tablelist">
			<tr>
				<th>编号</th>
				<th>商品名称</th>
				<th>零售单价</th>
				<th>上架数量</th>
				<th>折扣</th>
				<th>商品类型</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${list }" var="item">
				<tr>
					
					<td>${item.id }</td>
					<td>${item.goodName }</td>
					<td>${item.price }</td>
					<td>${item.onNum }</td>
					<td>${item.discount }</td>
					<td>${item.goodType.typeName }</td>
					
					<td>
					
						<c:if test="${item.status eq 0 }">
						<a href="<%=request.getContextPath()%>/good/qxsj.action?dto.id=${item.id}" class="my_a">未上架</a>
						</c:if>
						<c:if test="${item.status eq 1 }">
						<a href="<%=request.getContextPath()%>/good/qxsj.action?dto.id=${item.id}" class="my_a">已上架</a>
						</c:if>
						<c:if test="${login_user.role.id == 3 }">
						<a href="<%=request.getContextPath()%>/good/update.action?dto.id=${item.id}" class="my_a">修改</a>
						</c:if>
						<a href="<%=request.getContextPath()%>/good/delete.action?dto.id=${item.id}" class="my_a">删除</a>
						<input type="hidden" name="dto.goodsn" value="${item.id} ">
					</td>
				</tr>
					
			</c:forEach>
			<c:if test="${item.status eq 0 }">
				<tr style="background-color: #f5f8fa;border-top: solid 1px #b6cad2;border-bottom: solid 1px #b6cad2;">
					<td colspan="7">
						<a href="<%=request.getContextPath()%>/good/qxsjall.action" class="my_a">一键上架</a>
					</td>
				</tr>
			</c:if>
			<%-- <tr style="background-color: #f5f8fa;border-top: solid 1px #b6cad2;border-bottom: solid 1px #b6cad2;">
				<td colspan="7">
					共${page.rowCount}条数据&nbsp;&nbsp;第${page.pageNum}页/共${page.pageCount}页&nbsp;&nbsp;
					<a href="javascript:paging('1');">首页</a>&nbsp;&nbsp;<a href="javascript:paging('${page.pageNum - 1}');" >上一页</a>&nbsp;&nbsp;
					<a href="javascript:paging('${page.pageNum + 1}');">下一页</a>&nbsp;&nbsp;<a href="javascript:paging('${page.pageCount}');">尾页</a>
				</td>
			</tr> --%>
			
		</table>
	</form>
	</div>
	<div class="pagin">
			<div class="message">
				共<i class="blue">${page.pageCount}</i>页，当前显示第&nbsp;<i class="blue">${page.pageNum}&nbsp;</i>页
			</div>
			<ul class="paginList">
		<li class="paginItem"><a href="javascript:paging('1');">首页</a></li>
		<li class="paginItem"><a href="javascript:paging('${page.pageNum - 1}')">上页</a></li>
		<li class="paginItem"><a href="javascript:paging('${page.pageNum + 1}')">下页</a></li>
		<li class="paginItem"><a href="javascript:paging('${page.pageCount}')">尾页</a></li>
		</ul>
	</div>
</body>
</html>