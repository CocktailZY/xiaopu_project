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
    <title>修改页面</title>
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
				    		$("#pTypeid"+wc).remove();
				    	
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
				    		$("#pTypeid"+wc).remove();
				    	
				    	}
				    	
				    	//$td = $("<td id='td"+cs+"' name='zitd'></td>");
				    	$td_select = $("<select name='pTypeid' id='pTypeid"+cs+"' onchange='getproduct("+cs+")' ></select>");
				    	$td_select_option = $("<option value='0'>请选择商品子类型</option>");
				    	$td_select.append($td_select_option);
				    	//$td.append($td_select);
				    	$("#bgm").append($td_select);
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
   	 		
    		function addRow(id,imid){
    			
    			
	    		if($("#cql"+id).val() == 0){
	    			$input1 = $("<input type='file' name='uploadImg' id='uploadImg"+id+"' onchange='PreviewImage(this,"+id+")'>");
		    		$input2 = $("<input type='hidden' name='imgId' value='"+imid+"'>");
		    		$("#pos"+id).append($input1);
		    		$("#pos"+id).append($input2);
	    			$("#cql"+id).val(id);
	   			
	    		
	    		}else{
	    			alert("只能点一次！");
	    		}
    		}
    </script>
    <!-- 添加图片: 结束  -->
    <!-- 加载页面时执行规格1的颜色选择功能: 开始 -->
   <script type="text/javascript">
		 $(function(){
		 	var erji = 0;
		 	var sanji = 0;
		 		if('${leixing2 }' == ""){
		 			
		 		}else if('${leixing2 }' != "" && '${leixing3 }' == ""){
		 			$td_select = $("<select name='pTypeid' id='pTypeid2' onchange='getproduct(2)' ></select>");
				    $td_select_option = $("<option value='0'>请选择商品子类型</option>");
				    $td_select.append($td_select_option);
				    //$td.append($td_select);
				    $("#bgm").append($td_select);
				   	erji=${leixing1 };
		 		}else if('${leixing2 }' != "" && '${leixing3 }' != ""){
		 			for(var cs=2;cs<=3;cs++){
		 				$td_select = $("<select name='pTypeid' id='pTypeid"+cs+"' onchange='getproduct("+cs+")' ></select>");
				    	$td_select_option = $("<option value='0'>请选择商品子类型</option>");
				    	$td_select.append($td_select_option);
				    	//$td.append($td_select);
				    	$("#bgm").append($td_select);
				    	erji=${leixing2 };
				    	sanji=${leixing1 };
				    }
		 			alert("o了");
		 		}else{
		 			alert("出错了！！！！！");
		 			return;
		 		
		 		}
		 	//for(var qzx=1;qzx<=3;qzx++){	
			 	var pTypeid = $("#pTypeid1").find("option:selected").val();//传回商品类型ID
	    	
				 $.ajax({
				    type: "post",  
				    async : false,  
				    url:  "<%=basePath%>product/selectProduct.do",   
				    
				    dataType: "json",	
				    data: {					
				    						
				    	ptId : pTypeid
				    	
				    } ,
				    //spid:qzx,
				    success:function(data){
				    	var json = eval(data);
				    	var cs = 2;
				    	var pk = "NO";
				    	if(json[0].panduan == pk){
				    		alert("没有子类型了！");
				    		var wc = 2;
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
										if($("#xcv"+ss).val() == json[i].tsId){
											var td = ("<option value='"+json[i].tsId+"' selected='selected'>"+json[i].tsTitle+"</option>"); 
										}else{
										
											var td = ("<option value='"+json[i].tsId+"'>"+json[i].tsTitle+"</option>"); 
										}
										row.append(td);
									}
								}
							}
				    	
				    	}else{
				    		
					    	var wc = 2;
					    	for(wc;wc<10;wc++){
					    		$("#pTypeid"+wc).remove();
					    	
					    	}
					    	
					    	//$td = $("<td id='td"+cs+"' name='zitd'></td>");
					    	$td_select = $("<select name='pTypeid' id='pTypeid"+cs+"' onchange='getproduct("+cs+")' ></select>");
					    	$td_select_option = $("<option value='0'>请选择商品子类型</option>");
					    	$td_select.append($td_select_option);
					    	//$td.append($td_select);
					    	$("#bgm").append($td_select);
					    	$("#pTypeid"+cs).empty();
					    	var row = $("#pTypeid"+cs);
					    	for(var i=0;i<json.length;i++){
					    		if(erji == json[i].cptId){
									var td = ("<option value='"+json[i].cptId+"' selected='selected'>"+json[i].cptName+"</option>"); 
										row.append(td); 
								}else{
										
									var td = ("<option value='"+json[i].cptId+"'>"+json[i].cptName+"</option>"); 
										row.append(td);
								}
					    		
					    	}
				    	}
						
			        },
			        error:function(){				
			        	alert("出现异常");
			        }
				});
		 	//}	
		 	var pTypeid = $("#pTypeid2").find("option:selected").val();//传回商品类型ID
	    	
				 $.ajax({
				    type: "post",  
				    async : false,  
				    url:  "<%=basePath%>product/selectProduct.do",   
				    
				    dataType: "json",	
				    data: {					
				    						
				    	ptId : pTypeid
				    	
				    } ,
				    //spid:qzx,
				    success:function(data){
				    	var json = eval(data);
				    	var cs = 3;
				    	var pk = "NO";
				    	if(json[0].panduan == pk){
				    		alert("没有子类型了！");
				    		var wc = 3;
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
										if($("#xcv"+ss).val() == json[i].tsId){
											var td = ("<option value='"+json[i].tsId+"' selected='selected'>"+json[i].tsTitle+"</option>"); 
										}else{
										
											var td = ("<option value='"+json[i].tsId+"'>"+json[i].tsTitle+"</option>"); 
										} 
										row.append(td);
									}
								}
							}
				    	
				    	}else{
				    		
					    	var wc = 3;
					    	for(wc;wc<10;wc++){
					    		$("#pTypeid"+wc).remove();
					    	
					    	}
					    	
					    	//$td = $("<td id='td"+cs+"' name='zitd'></td>");
					    	$td_select = $("<select name='pTypeid' id='pTypeid"+cs+"' onchange='getproduct("+cs+")' ></select>");
					    	$td_select_option = $("<option value='0'>请选择商品子类型</option>");
					    	$td_select.append($td_select_option);
					    	//$td.append($td_select);
					    	$("#bgm").append($td_select);
					    	$("#pTypeid"+cs).empty();
					    	var row = $("#pTypeid"+cs);
					    	for(var i=0;i<json.length;i++){
					    		if(sanji == json[i].cptId){
									var td = ("<option value='"+json[i].cptId+"' selected='selected'>"+json[i].cptName+"</option>"); 
										row.append(td); 
								}else{
										
									var td = ("<option value='"+json[i].cptId+"'>"+json[i].cptName+"</option>"); 
										row.append(td);
								}
					    		
					    	}
				    	}
						
			        },
			        error:function(){				
			        	alert("出现异常");
			        }
				});
		 		
		 		var pTypeid = $("#pTypeid3").find("option:selected").val();//传回商品类型ID
	    	
				 $.ajax({
				    type: "post",  
				    async : false,  
				    url:  "<%=basePath%>product/selectProduct.do",   
				    
				    dataType: "json",	
				    data: {					
				    						
				    	ptId : pTypeid
				    	
				    } ,
				    //spid:qzx,
				    success:function(data){
				    	var json = eval(data);
				    	var cs = 3;
				    	var pk = "NO";
				    	if(json[0].panduan == pk){
				    		alert("没有子类型了！");
				    		var wc = 3;
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
										if($("#xcv"+ss).val() == json[i].tsId){
											var td = ("<option value='"+json[i].tsId+"' selected='selected'>"+json[i].tsTitle+"</option>"); 
										}else{
										
											var td = ("<option value='"+json[i].tsId+"'>"+json[i].tsTitle+"</option>"); 
										}
										row.append(td);
									}
								}
							}
				    	
				    	}else{
				    		
					    	var wc = 3;
					    	for(wc;wc<10;wc++){
					    		$("#pTypeid"+wc).remove();
					    	
					    	}
					    	
					    	//$td = $("<td id='td"+cs+"' name='zitd'></td>");
					    	$td_select = $("<select name='pTypeid' id='pTypeid"+cs+"' onchange='getproduct("+cs+")' ></select>");
					    	$td_select_option = $("<option value='0'>请选择商品子类型</option>");
					    	$td_select.append($td_select_option);
					    	//$td.append($td_select);
					    	$("#bgm").append($td_select);
					    	$("#pTypeid"+cs).empty();
					    	var row = $("#pTypeid"+cs);
					    	for(var i=0;i<json.length;i++){
					    		if(erji == json[i].cptId){
									var td = ("<option value='"+json[i].cptId+"' selected='selected'>"+json[i].cptName+"</option>"); 
										row.append(td); 
								}else{
										
									var td = ("<option value='"+json[i].cptId+"'>"+json[i].cptName+"</option>"); 
										row.append(td);
								}
					    		
					    	}
				    	}
						
			        },
			        error:function(){				
			        	alert("出现异常");
			        }
				});
				$("#img1").bigColorpicker(function(el,color){
					$(el).css("backgroundColor",color);
					
					//将获取到的color放到隐藏域中
					$("#psColor1").val(color);
					
				});
				$("#img2").bigColorpicker(function(el,color){
					$(el).css("backgroundColor",color);
					
					//将获取到的color放到隐藏域中
					$("#psColor2").val(color);
					
				});
				$("#img3").bigColorpicker(function(el,color){
					$(el).css("backgroundColor",color);
					
					//将获取到的color放到隐藏域中
					$("#psColor3").val(color);
					
				});
				
			
			for(var iop=1;iop<=3;iop++){
			var tsId = $("#tsId"+iop).find("option:selected").val();//传回商品规格ID
				
				 $.ajax({
				    type: "post",  
				    async : true,  
				    url:  "<%=basePath%>product/selectProduct1.do",   
				    
				    dataType: "json",	
				    data: {					
				    						
				    	tsId : tsId
				    	
				    } ,
				    
				  	spid:iop,
				    success:function(data){ 	
				    	var json = eval(data);
				    	$("#spId"+this.spid).empty();
						var row2 = $("#spId"+this.spid);
						for(var i=0;i<json.length;i++){
							if(json[i].spId != null){
								if($("#asd"+this.spid).val() == json[i].spId){
									var td = ("<option value='"+json[i].spId+"' selected='selected'>"+json[i].spFications+"</option>"); 
								}else{
									var td = ("<option value='"+json[i].spId+"'>"+json[i].spFications+"</option>");
								}
								 
								row2.append(td);
							}
						}
						
						
			        },
			        error:function(){				
			        	alert("出现异常");
			        }
				});
				}
				$("#qq1").css("backgroundColor","${guigeList[0].productSpecs.psColor}");
				$("#qq2").css("backgroundColor","${guigeList[1].productSpecs.psColor}");
				$("#qq3").css("backgroundColor","${guigeList[2].productSpecs.psColor}");
				$("#pContent").val("${generals[0].product.pContent }");
			
		});
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
  	<script type="text/javascript"> 
	   function PreviewImage(imgFile,id) 
	   { 
	    var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.PNG$)|(\.*.bmp$)/;      
	    if(!pattern.test(imgFile.value)) 
	    { 
	     alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
	     imgFile.focus(); 
	    } 
	    else 
	    { 
	     var path; 
	     if(document.all)//IE 
	     { 
	      imgFile.select(); 
	      path = document.selection.createRange().text; 
	      document.getElementById("imgPreview").innerHTML=""; 
	      document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
	     } 
	     else//FF 
	     { 
	     	
			
	      	path = URL.createObjectURL(imgFile.files[0]);
	      	document.getElementById("mmm"+id).src=path;
	      //document.getElementById("mmm"+id).innerHTML = "<img src='"+path+"'/>"; 
	      //document.getElementById("imgPreview").innerHTML = "<img src='"+path+"'/>"; 
	     } 
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
   <form action="<%=basePath%>product/productupdateGo.do" method="post" enctype="multipart/form-data" id="mainFrom" target="">
   		<input type="hidden" name="pId" value="${pId }">
   		
   		<!-- 第一个table： 开始 -->
   		
   		<table border="1" align="center">
   			<tr>
   				<td>商品名称</td>
   				<td>商品类型</td>
   				<!-- <td>商品品牌</td> -->
   				<td>商品折扣</td>
   			</tr>
   			<tr>
   				<c:forEach items="${generals }" var="generals">
   				<td><input type="text" name="pName" id="pName" value="${generals.product.pName }"></td>
   				<td id="bgm">
   						<select id="pTypeid1" onchange="getproduct('1')" name="pTypeid">
   							<c:forEach items="${productTypesss }" var="productTypesss">
   								<c:choose>
   									<c:when test="${leixing2 == null && leixing1 == productTypesss.ptId}">
   										
   											<option value="${productTypesss.ptId }" selected="selected">${productTypesss.ptName }</option>
   										
   									</c:when>
   									<c:when test="${(leixing2 != null && leixing3 eq null) && leixing2 == productTypesss.ptId}">
   										
   											<option value="${productTypesss.ptId }" selected="selected">${productTypesss.ptName }</option>
   										
   									</c:when>
   									<c:when test="${leixing2 != null && leixing3 != null && leixing3 == productTypesss.ptId}">
   										
   											<option value="${productTypesss.ptId }" selected="selected">${productTypesss.ptName }</option>
   										
   									</c:when>
   									<c:otherwise>
   										<option value="${productTypesss.ptId }">${productTypesss.ptName }</option>
   									</c:otherwise>
   									</c:choose>
   								
   								
								
								
   							</c:forEach>
   						</select>
   					
   				</td>
   				<!-- <td>
   					<select id="bId" name="bId">
   						<option value="0" >请选择商品品牌</option>
   					</select>
   				</td> -->
   				<td><input type="text" name="pDiscount" id="pDiscount" value="${generals.product.pDiscount }"></td>
   				</c:forEach>
   			</tr>
   			
   		</table>
   		
   		<!-- 第一个table： 结束 -->
   		<table border="1" align="center">
   			<tr>
   			<!-- 第二个table： 开始 -->
   			<c:forEach items="${guigeList }" var="guigeList" varStatus="vs">
   				<td>
   					<input type="hidden" id="xcv${vs.index + 1}" value="${guigeList.typeSpecs.tsId}">
   					<input type="hidden" id="asd${vs.index + 1}" value="${guigeList.specs.spId}">
   					<input type="hidden" name="guigeid" value="${guigeList.productSpecs.psId}">
			   		<table border="1" >
			   			
			   			<tr>
			   				<td>商品规格</td>
			   				<td>
			   					<select id="tsId${vs.index + 1}" onchange="getproduct1('${vs.index + 1}')" name="tsId">
									<option value="0" >请选择商品规格</option>
									
			   					</select>
			   					
			   				</td>
			   			</tr>
			   			<tr>
			   				<td>商品规格详情</td>
			   				<td>
			   					<select id="spId${vs.index + 1}" name="spId">
									<option value="0" >请选择商品规格详情</option>
			   					</select>
			   					
			   				</td>
			   			</tr>
			   			<tr>
			   				<td>商品颜色</td>
			   				<td>
			   					<div style="margin: 0 auto;border: solid 1px #F0F0F0;padding: 10px;" >
									<div id= "qq${vs.index + 1}">
										<a href="javascript:void(0)" id="img${vs.index + 1}" name="img"></a>
										<input type="hidden" id="psColor${vs.index + 1}" name="psColor" value="${guigeList.productSpecs.psColor }" />
									</div>
								</div>
			   				</td>
			   				
			   			
			   			</tr>
			   			<tr>
			   				<td>商品单价</td>
			   				<td><input type="text" name="spPrice" id="spPrice${vs.index + 1}" value="${guigeList.productSpecs.psPrice }"></td>
			   			
			   			</tr>
			   			<tr>
			   				<td>商品数量</td>
			   				<td><input type="text" name="spNum" id="spNum${vs.index + 1}" value="${guigeList.productSpecs.psNum }"></td>
			   			
			   			</tr>
			   		</table>
   		
   				</td>
   			</c:forEach>
   		<!-- 第二个table：结束 -->		
   			</tr>
   		</table>
   			
   		
   		<!-- 第三个table：开始 -->
   		
   		<table border="1" align="center">
   			<tr>
   				<td>商品描述</td>
   				<td><textarea name="pContent" id="pContent" style="height: 100px;width: 215px;"></textarea></td>
   			</tr>
   			
   			<tr>
   				
   			</tr>
   		</table>
   		
   		
   		
   		<!-- 第三个table：结束 -->
   		
   		
   		
   	<table border="1" align="center">
   			<tr>
   				<td>商品图片</td>
   				<c:forEach items="${imagesList }" var="il" varStatus="vs">
   					<td width="300px" height="150px">
   						<img id="mmm${vs.index + 1}" alt="asdasd" src="<%=basePath %>fileUpload/${il.imAddress }" style="width: 300px;height: 150px;"><br>
   						 <input type="button" value="修改" onclick="addRow('${vs.index + 1}','${il.imId }');">
   						 <input type="hidden" id="cql${vs.index + 1}" value="0">
   						 
   						 <span id="pos${vs.index + 1}">
   						 	
   						 </span>
   					</td>
   					<td>
   					
   						
   						<%-- <span id="pos">
		  					<input type="file" name="uploadImg" id="uploadImg${vs.index + 1}" 
		  					style="position: absolute; filter: alpha(opacity = 0); opacity: 0;">
			  			</span>
   					 --%>
   					</td>
   				</c:forEach>
   				
   			</tr>
   	</table>
   </form>
   <div align="center">
	   	
	   	<!-- <input type="button" onclick="addRow();" value="再增加一个文件选择框"> -->
	   	<!-- <input type="button" onclick="addguige();" value="添加新的商品规格信息"> -->
	   	<input type="button" value="提交" onclick="tijiao()">
   	</div>
	
	
	
	
   	
  </body>
</html>
