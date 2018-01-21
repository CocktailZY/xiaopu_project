<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品列表</title>
<!-- <style type="text/css">
body {
	background: #fefbe6;
	text-align: center;
	margin: 0;
	padding: 0;
	color: #500f60;
}

li {
	list-style-type: none;
}

a:link {
	list-style-type: none;
}

img {
	width: 100%;
	height: 120px;
}

#static {
	margin: 0 auto;
	text-align: left;
}

#main {
	width: 100%;
	margin: 0 auto;
	color: #530a4a;
	position: absolute;
	top: 110px;
}

#main ul {
	
}

#main ul li {
	width: 20%;
	float: left;
}

#main_t {
	position: absolute;
	top: 140px;
	color: #530a4a;
	width: 100%;
	margin-top: 200px;
	padding-top: 200px;
	font-size: 0.8em;
}

#main_t_l,#main_t_a {
	color: #3f1262;
	width: 100%;
	font-size: 0.8em;
}

#main_t_l ul li {
	width: 20%;
	float: left;
}

#zon {
	background: #dbfff1;
	color: #f8cd66;
}

.bot_in {
	background: #f1fcc4;
	border: 3px #f1fcc4 solid;
	border-radius: 6px 6px 6px 6px;
	-moz-border-radius: 6px;
}

#ji {
	width: 130px;
	height: 30px;
	filter: alpha(opacity =         100 finishopacity =         50 style =         1
		startx =  
		      0, starty =         0, finishx =         0, finishy =        
		150) progid:DXImageTransform.Microsoft.gradient(startcolorstr=red,
		endcolorstr=blue, gradientType=0 );
	-ms-filter: alpha(opacity =         100 finishopacity =         50 style =         1
		startx =  
		      0, starty =         0, finishx =         0, finishy =        
		150) progid:DXImageTransform.Microsoft.gradient(startcolorstr=red,
		endcolorstr=blue, gradientType=0 ); /*IE8*/
	background: red;
	background: -moz-linear-gradient(top, red, rgba(0, 0, 255, 0.5) );
	background: -webkit-gradient(linear, 0 0, 0 bottom, from(#0dc613),
		to(rgba(111, 246, 116, 0.5) ) );
	background: -o-linear-gradient(top, red, rgba(0, 0, 255, 0.5) );
	color: #fff;
	margin-top: 6%;
	border: none;
}

.ji {
	width: 130px;
	height: 30px;
	filter: alpha(opacity =         100 finishopacity =         50 style =         1
		startx =  
		      0, starty =         0, finishx =         0, finishy =        
		150) progid:DXImageTransform.Microsoft.gradient(startcolorstr=red,
		endcolorstr=blue, gradientType=0 );
	-ms-filter: alpha(opacity =         100 finishopacity =         50 style =         1
		startx =  
		      0, starty =         0, finishx =         0, finishy =        
		150) progid:DXImageTransform.Microsoft.gradient(startcolorstr=red,
		endcolorstr=blue, gradientType=0 ); /*IE8*/
	background: red;
	background: -moz-linear-gradient(top, red, rgba(0, 0, 255, 0.5) );
	background: -webkit-gradient(linear, 0 0, 0 bottom, from(#0dc613),
		to(rgba(111, 246, 116, 0.5) ) );
	background: -o-linear-gradient(top, red, rgba(0, 0, 255, 0.5) );
	color: #fff;
	margin-top: 6%;
	border: none;
}
</style> -->
<link href="${ctx}/UiMaker/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${ctx}/UiMaker/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/UiMaker/custom/checkForm.js"></script>
<script type="text/javascript"> 
	   
	    function addNum(id){
	    	var t = $("#num"+id);
	    	t.val(parseFloat(t.val())+1);
	    	total(id);
	    };
	   function jianNum(id){
	   		var t = $("#num"+id);
	    	t.val(parseFloat(t.val())-1);
	    	total(id);
	    };
    
    function total(id)
	{
	
		/*计算单个的价格*/
		var quantity=document.getElementById("num"+id).value;
		var nowNum = document.getElementById("onNum"+id).value;
		if(parseInt(quantity) > parseInt(nowNum)){
			/* alert(quantity+"---"+nowNum); */
			alert("购买数量大于上架数量!");
			document.getElementById("num"+id).value = nowNum;
		}
		
		
		var price=document.getElementById("price"+id).value;
		var smallTotal=parseInt(quantity)*parseFloat(price);
		document.getElementById("total"+id).value = smallTotal;
	}
	
	function save(){
		var ids = '';
		var num = '';
		var s='';
		var c='';
		var checks = document.getElementsByName("checks");
		var nums = document.getElementsByName("total");
		var ss = document.getElementsByName("num");
		var cs = document.getElementsByName("carId");
		for ( var i = 0; i < checks.length; i++) {
			if (checks[i].checked == true) {
				ids = ids + checks[i].value + ",";
				num = num +nums[i].value+",";
				s = s + ss[i].value+",";
				c = c + cs[i].value+",";
			};
		}
		document.getElementById("ids").value = ids;
		document.getElementById("total").value = num;
		document.getElementById("numm").value = s;
		document.getElementById("ccid").value = c;
		var allprice = document.getElementById("count").value;
		document.getElementById("allprice").value = allprice;
		
		
		alert("下单成功!");
		document.getElementById("idform").submit();
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
	
	function count(){
		/*计算总价*/
		var checks = document.getElementsByName("checks");
		var	cc =0;
		for ( var i = 0; i < checks.length; i++) {
			if (checks[i].checked == true) {
			
			var price=document.getElementById("total"+checks[i].value).value;	
				cc += parseFloat(price);
			}
			if (checks[i].checked == false){
			 document.getElementById("count").value=cc;
			 }
		}
			document.getElementById("count").value=cc;
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
<div align="center">
	<div class="uew-select" style="padding-top: 9px; padding-bottom: 9px; text-align: left;">
		<a href="<%=request.getContextPath()%>/good/list.action?dto.status=1" class="my_a">返回</a>
	</div>
	<form action="${ctx}/sell/save.action" method="post" id="idform">
	<!-- 商品id -->
		<input type="hidden" name="dto.goodsn" id="ids">
		<input type="hidden" name="dto.nums" id="total">
		<input type="hidden" name="numm" id="numm">
		<input type="hidden" name="ccid" id="ccid">
		<input type="hidden" name="dto.allprice" id="allprice">
	</form>
	<table width="60%" border="1" class="tablelist">
		<tr>
			<th>
  					<!-- <input type="checkbox" id="checkall" onclick="onCheckall()"> -->
			</th>
			<th>编号</th>
			<th>商品名称</th>
			<th>零售单价</th>
			<th>小计</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${carlist }" var="car">
			<input type="hidden" name="carId" value="${car.id }">
			<tr>
				<td><input type="checkbox" name="checks" value="${car.goods.id }" onclick="count()"></td>
				<td>${car.goods.goodName}</td>
				<td>
					${car.jprice }
					<input type="hidden" class="price" id="price${car.goods.id }" value="${car.jprice }" name="price">
				</td>
				<td>
					<a href="javascript:jianNum('${car.goods.id }')" class="my_inputA jian" id="jian" name="jian">-</a>
					<input type="text" value="${car.num }" id="num${car.goods.id }" name="num" onchange="total('${car.goods.id}')" class="my_inputNum num">
					<input type="hidden" value="${car.goods.onNum }" id="onNum${car.goods.id }" name="onNum">
					<a href="javascript:addNum('${car.goods.id }')" class="my_inputA add" id="add" name="add">+</a>
				</td>
				<td>
					<input type="text" class="total" id="total${car.goods.id }" value="${car.num*car.jprice }" readonly="readonly" name="total" >
				</td>
				<td><a href="${ctx}/sell/delCar.action?carDto.id=${car.id }" class="my_a">删除</a></td>
			</tr>
		</c:forEach>
	</table>
	<div style="height:1px; width:100%; background-color:floralwhite;"></div>
	<table align="center" border="1" class="tablelist" >
		<tr>
			<td>姓名:</td>
			<td><input type="text" class="bot_in my_input" id="name" value="${customer.name }"/></td>
		</tr>
		<tr>
			<td>联系方式:</td>
			<td><input type="text" class="bot_in my_input" id="tele" value="${customer.phone }"/></td>
		</tr>
		<tr>
			<td>地址:</td>
			<td><input type="text" class="bot_in my_input" id="address" value="${customer.address }"/></td>
		</tr>
		<tr style="background-color: #f5f8fa;border-top: solid 1px #b6cad2;border-bottom: solid 1px #b6cad2;">
			<td colspan="2">
			总计：<input type="text" id="count" value="0" readonly="readonly">
				<a href="javascript:save()" class="my_a">提交</a>
			</td>
		</tr>
	</table>
</div>
		
</body>
</html>
