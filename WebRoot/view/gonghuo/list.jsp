<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
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

	function aa() {
		if ("${goods.pagenum}" == 1) {
			alert("没有上一页！");
		}
	}

	function save() {
		var ids = '';
		var ps = '';
		var checks = document.getElementsByName("select");
		var prices = document.getElementsByName("jprice");
		for ( var i = 0; i < checks.length; i++) {
			if (checks[i].checked == true) {
				ids = ids + checks[i].value + ",";
				ps = ps + prices[i].value + ",";
			}
		}
		document.getElementById("gonghuoids").value = ids;
		document.getElementById("jinjia").value = ps;
		document.getElementById("idform").submit();
	}

	/* function countAllPice(goodsId) {

		var pice = $("#price").val();
		
		if(isNaN(num)){
			alert("数量只能为数字");
			return;
		}
		if(num==0){
		    alert("进货数量不能为0");
		    return;
		}
		var allprice = parseFloat(num) * parseFloat(pice);
		$("#allprice_" + goodsId).val(allprice);
	} */
</script>
</head>


<body>
	<form id="idform" method="post" action="${ctx}/gonghuo/update.action">
		<input type="hidden" id="gonghuoids" name="dto.pp">
		<input type="hidden" id="jinjia" name="dto.jprice">
		<input type="hidden" name="dto.id" value="${dto.id }">
		<div class="rightinfo">

			<div class="tools">

				<ul class="toolbar">
					<li><a href="javascript:save();"> <span><img
								src="${ctx}/UiMaker/images/t02.png" /> </span>确认修改 </a></li>
				</ul>
			</div>
		</div>
		<h4 align="center">goods list page</h4>
		<br>
		<table border="1" class="tablelist">
			<tr align="center">
				<td><input name="selectAll" type="checkbox" id="selectAll"
					onclick="checkAll('select')" />
				</td>
				<td>商品名称</td>
				<td>商品价格</td>
			
			</tr>
			<c:forEach items="${glist}" var="item">
				<tr align="center">
					<td><input name="select" type="checkbox" value="${item.id}"
						onclick="unCheckAll('select')" />
					</td>
					<td>${item.goods.goodName}</td>
					<td><input id="price" type="text" name="jprice"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>

</body>
</html>