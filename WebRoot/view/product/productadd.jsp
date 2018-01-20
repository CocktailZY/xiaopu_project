<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'productadd.jsp' starting page</title>
   	<link rel="stylesheet" href="<%=basePath%>css/jquery.bigcolorpicker.css" type="text/css" />
   	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.bigcolorpicker.js"></script>
    
    <!-- <script type="text/javascript" src="js/jquery-3.0.0.js"></script> -->
    <!-- 商品类型_商品品牌,商品类型_商品规格 的二级联动: 开始  -->
    <script type="text/javascript">
    	function getproduct(qzx){
    	var pTypeid = $("#pTypeid"+qzx).find("option:selected").val();//传回商品类型ID
    	
			 $.ajax({
			    type: "post",  
			    async : true,  
			    url:  "<%=basePath%>product/selectProduct.do",   
			    
			    dataType: "json",	
			    data: {					
			    						
			    	ptId : pTypeid
			    	
			    } ,
			    spid:qzx,
			    success:function(data){
			    	var json = eval(data);
			    	var cs = parseFloat(this.spid) + 1;
			    	var pk = "NO";
			    	if(json[0].panduan == pk){
			    		alert("没有子类型了！");
			    		var wc = parseFloat(this.spid) + 1;
				    	for(wc;wc<10;wc++){
				    		$("#td"+wc).remove();
				    	
				    	}
				    	for(var ss=1;ss<=3;ss++){ 	
					    	$("#tsId"+ss).empty();//清空
					    	
					    	
							var row = $("#tsId"+ss);
							
							
							for(var i=0;i<json.length;i++){
								//根据后台存入的先后顺序不用  区分品牌和规格。 先存入的是规格，所以规格不为空，品牌为空
								if(json[i].tsId != null){
									//用js拼接
									var td = ("<option value='"+json[i].tsId+"'>"+json[i].tsTitle+"</option>"); 
									row.append(td);
								}
							}
						}
			    	
			    	}else{
			    		
				    	var wc = parseFloat(this.spid) + 1;
				    	for(wc;wc<10;wc++){
				    		$("#td"+wc).remove();
				    	
				    	}
				    	
				    	$td = $("<td id='td"+cs+"' name='zitd'></td>");
				    	$td_select = $("<select name='pTypeid' id='pTypeid"+cs+"' onchange='getproduct("+cs+")' ></select>");
				    	$td_select_option = $("<option value='0'>请选择商品子类型</option>");
				    	$td_select.append($td_select_option);
				    	$td.append($td_select);
				    	$("#tr_pType").append($td);
				    	$("#pTypeid"+cs).empty();
				    	var row = $("#pTypeid"+cs);
				    	for(var i=0;i<json.length;i++){
				    		var td = ("<option value='"+json[i].cptId+"'>"+json[i].cptName+"</option>"); 
									row.append(td);
				    	}
			    	}
			    	
			    	//为商品品牌和三个规格表的规格赋值 	
			    	/*for(var ss=1;ss<=3;ss++){ 	
			    		var json = eval(data);
			    	
				    	$("#tsId"+ss).empty();//清空
				    	$("#bId").empty();
				    	
						var row = $("#tsId"+ss);
						var row1 = $("#bId");
						
						for(var i=0;i<json.length;i++){
							//根据后台存入的先后顺序不用  区分品牌和规格。 先存入的是规格，所以规格不为空，品牌为空
							if(json[i].tsId != null && json[i].bId == null){
								//用js拼接
								var td = ("<option value='"+json[i].tsId+"'>"+json[i].tsTitle+"</option>"); 
								row.append(td);
							}
	
						}
						for(var i=0;i<json.length;i++){
							//后存的是品牌 所以规格和品牌都不为空
							if(json[i].bId != null){
								var td = ("<option value='"+json[i].bId+"'>"+json[i].bName+"</option>"); 
								row1.append(td);
							}
						}
					
					} */
					
		        },
		        error:function(){				
		        	alert("出现异常");
		        }
			}); 
		}
    
    </script>
    <!-- 商品类型_商品品牌,商品类型_商品规格 的二级联动: 结束  -->
    <!-- 商品规格_商品规格详情 的二级联动: 开始  -->
    <script type="text/javascript">
    	function getproduct1(tt){
    	  
	    	var tsId = $("#tsId"+tt).find("option:selected").val();//传回商品规格ID
				 $.ajax({
				    type: "post",  
				    async : true,  
				    url:  "<%=basePath%>product/selectProduct1.do",   
				    
				    dataType: "json",	
				    data: {					
				    						
				    	tsId : tsId
				    	
				    } ,
				    
				  	spid:tt,
				    success:function(data){ 	
				    	var json = eval(data);
				    	$("#spId"+this.spid).empty();
						var row2 = $("#spId"+this.spid);
						for(var i=0;i<json.length;i++){
							if(json[i].spId != null){
								var td = ("<option value='"+json[i].spId+"'>"+json[i].spFications+"</option>"); 
								row2.append(td);
							}
						}
						
						
			        },
			        error:function(){				
			        	alert("出现异常");
			        }
				}); 
			
		}
    
    </script>
    <!-- 商品规格_商品规格详情 的二级联动: 结束  -->
    <!-- 添加图片: 开始  -->
   	 <script type="text/javascript">
   	 		var i = 1;
    		function addRow(){
    			//图片个数限制五张
	    		if(i<5){
	    			$input1 = $("<input type='file' name='uploadImg' id='uploadImg"+(i+1)+"' onchange='xianzhi(this)'>");
		    		/* addElement = document.createElement("input");
		    		addElement.type="file";
		    		addElement.name="uploadImg";
		    		addElement.size="20";
		    		addElement.id="uploadImg"+(i+1); */
		    		$("#pos").append($input1);
	    			i++;
	   			
	    		
	    		}else{
	    			alert("上传图片最多为5张！");
	    		}
    		}
    </script>
    <!-- 添加图片: 结束  -->
    <!-- 加载页面时执行规格1的颜色选择功能: 开始 -->
   <script type="text/javascript">
		 $(function(){
				$("#img1").bigColorpicker(function(el,color){
					$(el).css("backgroundColor",color);
					//将获取到的color放到隐藏域中
					$("#psColor1").val(color);
				});
			
		}) 
	</script> 
	<!-- 加载页面时执行规格1的颜色选择功能: 结束 -->
	<!-- 表单提交前的判断: 开始 -->
	<script type="text/javascript">
		function tijiao(){
		
			var pname = $("#pName").val();
			
			//var shuzi =  '/^/d+(/.{1}/d+)?$/';
			//var zhengshu = '/^[0-9]*[1-9][0-9]*$/';
			if(pname==""){
				
				alert("请填写商品名称！");
				return;
			
			}else{
				var pcontent = $("#pContent").val();
				for(var i=1;i<=3;i++){
					var tsid = $("#tsId"+i).find("option:selected").val();
					var spid = $("#spId"+i).find("option:selected").val();
					var spnum = $("#spNum"+i).val();
					var spprice = $("#spPrice"+i).val();
					
					if(tsid==0){
					
						alert("请选择规格"+i+" 的商品规格！");
						return;
							
					}
					if(spid==0){
					
						alert("请选择规格"+i+" 的商品规格详情！");
						return;
					
					}
					if(spprice==""){
						
						alert("请填写规格"+i+" 的商品单价！");
						return;
					}
					/* var shuzi='/^/d+(/.{1}/d+)?$/'; 
					if(!shuzi.exec(spprice)){
						alert("商品单价只能为数字！");
						return;
					} */
					if(spnum==""){
						
						alert("请填写规格"+i+" 的商品数量！");
						return;
					
					}
					/* if(!zhenghsu.text(spnum)){
						alert("商品数量必须为正整数！");
						return;
					} */
				
				}
				for(var hh=1;hh<=5;hh++){
					var uploadimg = $("#uploadImg"+hh).val();
					if(uploadimg==""){
						alert("还有商品图片没上传！");
					    return;
					}
				
				}
				if(pcontent==""){
						if(window.confirm('没有商品描述，你确定要继续吗？')){
			                
			                 $("#mainFrom").submit();
			             }else{
			                 return false;
			             }
				}
				$("#mainFrom").submit();
			}
				
				
	
		}	
		
	
	</script>
	<!-- 表单提交前的判断: 结束 -->
	<!-- 添加新的规格(jQuery拼接): 开始 -->
  	<script type="text/javascript">
  		var j=2;
  		function addguige(){
  		//限制最多3个规格表
  		if(j<4){
		    //第一个tr标签 ： 开始
		    $tr1 = $("<tr></tr>");
		    $tr1_td1 = $("<td>商品规格</td>");
		    $tr1_td2 = $("<td></td>");
		    
		    $tr1_td2_select = $("<select onchange='getproduct1("+j+")' name='tsId' id='tsId"+j+"'></select>");
		    $tr1_td2_select_option = $("<option value='0'>请选择商品规格</option>");
		    
		    $tr1_td2_select.append( $tr1_td2_select_option);
		    
		   	$tr1_td2.append($tr1_td2_select);
		   	$tr1.append($tr1_td1);
		   	$tr1.append($tr1_td2);
		   	//第一个tr标签 ： 结束
		   
		   
		    //第二个tr标签 ： 开始
			$tr2 = $("<tr></tr>");
		    $tr2_td1 = $("<td>商品规格详情</td>");
		    $tr2_td2 = $("<td></td>");
		    
		    $tr2_td2_select = $("<select name='spId' id='spId"+j+"'></select>");
		    $tr2_td2_select_option = $("<option value='0'>请选择商品规格详情</option>");
		    
		    $tr2_td2_select.append( $tr2_td2_select_option);
		    
		   	$tr2_td2.append($tr2_td2_select);
		   	$tr2.append($tr2_td1);
		   	$tr2.append($tr2_td2);
		    //第二个tr标签 ： 结束
		    
		    
		    //第三个tr标签 ： 开始
		    $tr3 = $("<tr></tr>");
		    $tr3_td1 = $("<td>商品颜色</td>");
		    $tr3_td2 = $("<td></td>");
		    $tr3_td2_div = $("<div style='margin: 0 auto;border: solid 1px #F0F0F0;padding: 10px;'></div>");
		    $tr3_td2_div_div = $("<div name='qq' id='qq"+j+"'></div>");
		    $tr3_td2_div_div_a = $("<a href='javascript:void(0)' name='img' id='img"+j+"'></a>");
		   	$tr3_td2_div_div_input = $("<input type='hidden' name='psColor' id='psColor"+j+"' value='#FFFFFF'>");
		   
		   	$tr3_td2_div_div.append($tr3_td2_div_div_a);
		   	$tr3_td2_div_div.append($tr3_td2_div_div_input);
		   	$tr3_td2_div.append($tr3_td2_div_div);
		    $tr3_td2.append($tr3_td2_div);
		    $tr3.append($tr3_td1);
		    $tr3.append($tr3_td2);
		    //第三个tr标签 ： 结束
		    
		    //第四个tr标签 ： 开始
		    $tr4 = $("<tr></tr>");
		    $tr4_td1 = $("<td>商品单价</td>");
		    $tr4_td2 = $("<td></td>");
		    $tr4_td2_input = $("<input type='text' name='spPrice' id='spPrice"+j+"'>");
		    
		    $tr4_td2.append($tr4_td2_input);
		    $tr4.append($tr4_td1);
		    $tr4.append($tr4_td2); 
		    //第四个tr标签 ： 结束
		    
		    //第五个tr标签 ： 开始
		    $tr5 = $("<tr></tr>");
		    $tr5_td1 = $("<td>商品数量</td>");
		    $tr5_td2 = $("<td></td>");
		    $tr5_td2_input = $("<input type='text' name='spNum' id='spNum"+j+"'>");
		    
		    $tr5_td2.append($tr5_td2_input);
		    $tr5.append($tr5_td1);
		    $tr5.append($tr5_td2);
		   	//第五个tr标签 ： 结束
		    $table = $("<table broder='1'></table>");
		    $td = $("<td></td>");
		    $table.append($tr1);
		    $table.append($tr2);
		    $table.append($tr3);
		    $table.append($tr4);
		    $table.append($tr5);
		    
		    $td.append($table);
		    $("#table_tr").append($td);
		    
		   		//添加一次规格表加载一次商品颜色的插件
				$("#img2").bigColorpicker(function(el,color){
					$(el).css("backgroundColor",color);
					$("#psColor2").val(color);
					
				});
				$("#img3").bigColorpicker(function(el,color){
					$(el).css("backgroundColor",color);
					$("#psColor3").val(color);
					
				});
			
			j++;
		    
		 }else{
		 	alert("最多3种规格!");
		 }
		    
  		}
  	
  	</script> 
  	<!-- 添加新的规格(jQuery拼接): 结束 -->
  	<script type="text/javascript">
  		function xianzhi(imgFile){
  			var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.PNG$)|(\.*.bmp$)/;      
		    if(!pattern.test(imgFile.value)) 
		    { 
		     alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
		     imgFile.focus();
		     imgFile.value.remove();
		     return; 
		    }
  		
  		}
  	
  	</script>
  	<!-- 商品颜色样式： 开始 -->
	<style rel="stylesheet" type="text/css">
		#img1{
			width:35px;
			height:35px;
			display:block;
		}
		#qq1{
			width:37px;
			height:37px;
			display:block;
			border: solid 1px ;
		}
		#img2{
			width:35px;
			height:35px;
			display:block;
		}
		#qq2{
			width:37px;
			height:37px;
			display:block;
			border: solid 1px ;
		}
		#img3{
			width:35px;
			height:35px;
			display:block;
		}
		#qq3{
			width:37px;
			height:37px;
			display:block;
			border: solid 1px ;
		}
	</style>
	<!-- 商品颜色样式： 结束 -->
  </head>
  
  <body>
   <form action="<%=basePath%>product/productadd.do" method="post" enctype="multipart/form-data" id="mainFrom">
   <table border="5">
   		<tr>
   		<!-- 第一个table： 开始 -->
   		<td>
   		<table border="1">
   			<tr>
   				<td>商品名称</td>
   				<td><input type="text" name="pName" id="pName"></td>
   			</tr>
   			<tr id="tr_pType">
   				<td>商品类型</td>
   				<td>
   					
   						<select id="pTypeid1" onchange="getproduct('1')" name="pTypeid">
   							<c:forEach items="${productType }" var="productType">
   								<option value="${productType.ptId }">${productType.ptName }</option>
   							</c:forEach>
   						</select>
   					
   				</td>
   			</tr>
   			<!-- <tr>
   				<td>商品品牌</td>
   				<td>
   					<select id="bId" name="bId">
   						<option value="0" >请选择商品品牌</option>
   					</select>
   				</td>
   			</tr> -->
   		</table>
   		</td>
   		<!-- 第一个table： 结束 -->
   		</tr>
   		<tr>
   		<td>
   		<!-- 第二个table： 开始 -->
   		<table border="1" >
   			
   			<tr>
   				<td>商品规格</td>
   				<td>
   					<select id="tsId1" onchange="getproduct1(1)" name="tsId">
						<option value="0" >请选择商品规格</option>
						
   					</select>
   					
   				</td>
   			</tr>
   			<tr>
   				<td>商品规格详情</td>
   				<td>
   					<select id="spId1" name="spId">
						<option value="0" >请选择商品规格详情</option>
   					</select>
   					
   				</td>
   			</tr>
   			<tr>
   				<td>商品颜色</td>
   				<td>
   					<div style="margin: 0 auto;border: solid 1px #F0F0F0;padding: 10px;" >
						<div id= "qq1">
							<a href="javascript:void(0)" id="img1" name="img"></a>
							<input type="hidden" id="psColor1" name="psColor" value="#FFFFFF" />
						</div>
					</div>
   				</td>
   				
   			
   			</tr>
   			<tr>
   				<td>商品单价</td>
   				<td><input type="text" name="spPrice" id="spPrice1"></td>
   			
   			</tr>
   			<tr>
   				<td>商品数量</td>
   				<td><input type="text" name="spNum" id="spNum1"></td>
   			
   			</tr>
   		</table>
   		<!-- 第二个table：结束 -->
   		</td>
   		<td>
   			<table>
   				<tr id="table_tr">
   					
   				</tr>
   			</table>
   		</td>
   		</tr>	
   		<tr>
   		<!-- 第三个table：开始 -->
   		<td>
   		<table border="1">
   			<tr>
   				<td>商品描述</td>
   				<td><textarea name="pContent" id="pContent" style="height: 100px"></textarea></td>
   			</tr>
   			<tr>
   				<td>商品图片</td>
   				<td width="300px" height="150px">
   					
   					<span id="pos">
		  				<input type="file" name="uploadImg" id="uploadImg1" onchange="xianzhi(this)">
			  		</span>
   				</td>
   			</tr>
   			<tr>
   				<td>
   					<input type="button" value="提交" onclick="tijiao()">
   				</td>
   			</tr>
   		</table>
   		</td>
   		<!-- 第三个table：结束 -->
   		</tr>
   	</table>	
   </form>
   	<input type="button" onclick="addRow();" value="再增加一个文件选择框"><br>
   	<input type="button" onclick="addguige();" value="添加新的商品规格信息">
   	
	
	
	
	
   	
  </body>
</html>
