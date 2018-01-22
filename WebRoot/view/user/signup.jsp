<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<title>新用户注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="<%=basePath %>css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="<%=basePath %>css/animate.min.css" rel="stylesheet" type="text/css" media="all" /><!-- animation -->
<link href="<%=basePath %>css/menu.css" rel="stylesheet" type="text/css" media="all" /> <!-- menu style -->  
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="<%=basePath %>css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->
<script src="<%=basePath %>js/jquery-2.2.3.min.js"></script> 
<script src="<%=basePath %>js/jquery-scrolltofixed-min.js" type="text/javascript"></script><!-- fixed nav js -->
<script>
    $(document).ready(function() {

        // Dock the header to the top of the window when scrolled past the banner. This is the default behaviour.

        $('.header-two').scrollToFixed();  
        // previous summary up the page.

        var summaries = $('.summary');
        summaries.each(function(i) {
            var summary = $(summaries[i]);
            var next = summaries[i + 1];

            summary.scrollToFixed({
                marginTop: $('.header-two').outerHeight(true) + 10, 
                zIndex: 999
            });
        });
    });
</script>
<!-- //js --> 
<!-- web-fonts -->
<%--<link href='http://fonts.useso.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Lovers+Quarrel' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Offside' rel='stylesheet' type='text/css'>--%>  
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="<%=basePath %>js/move-top.js"></script>
<script type="text/javascript" src="<%=basePath %>js/easing.js"></script>	
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
</script>
<!-- //end-smooth-scrolling -->
<!-- smooth-scrolling-of-move-up -->
	<script type="text/javascript">
		$(document).ready(function() {
		
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->
</head>
<body>
	<!-- header -->
	<div class="header">
		<div class="w3ls-header" style="height: 36px">
			<div class="w3ls-header-left">
				<div class="header-logo">
					<h3><a href="<%=basePath %>index.jsp"><span>S</span>mart <i>Bazaar</i></a></h3>
					<h6>Your stores. Your place.</h6> 
				</div>
			</div>
			<div class="w3ls-header-right">
				<ul>
					<li class="dropdown head-dpdn">
						<a href="<%=basePath %>user/admin.do" class="dropdown-toggle">进入后台</a>
					</li>
				</ul>
			</div>
		</div>
		<%-- <div class="header-two"><!-- header-two -->
			<div class="container">
				<div class="header-logo">
					<h1><a href="<%=basePath %>index.jsp"><span>S</span>mart <i>Bazaar</i></a></h1>
					<h6>Your stores. Your place.</h6> 
				</div>	
			</div>		
		</div> --%>
		<div>
			 
		</div>
		<div class="header-three">
			<!-- <div class="container">
				<div class="menu" style="height: 50px;">	 
				</div>
			</div> -->
		</div>
	</div>
	<!-- //header --> 	
		<!-- 注册的各种验证 -->
	<script type="text/javascript" src="<%=basePath%>js/jquery-3.0.0.js"></script>
	<script type="text/javascript">
	var flag1;
	var flag2;
	var flag3;
	var flag4;
	function checkUsername(){
		if($("#uName").val().length>0){
			$.ajax({
				type:"post",
				async:true,
				url:"<%=basePath%>user/findByName.do",
				dataType:"json",
				data:{
					uName:$("#uName").val(),
				},
				success:function(data){
					$("#span1").html(data.mes);
					if(data.flag){
						flag1 = true;
					}else{
						flag1 = false;
					}
					
				},
				error:function(){
					alert("出现异常");
				}
			});
		}else{
			$("#span1").html("<font></font>");
		}
	}
 	function tip1(){
		$("#span1").html("<font color='black'>支持中文、字母、数字、“-”“_”的组合，4-16 个字符</font>");
	}
	
	function checkPass(){
		if($("#uPwd").val().length>0){
			var pwd = $("#uPwd").val();
			var regStr = /^((?=.*\d)(?=.*[A-z_])|(?=.*[A-z])(?=.*_))\w{6,20}$/;
			if(regStr.test(pwd)){
				$("#span2").html("<font color='green'>密码可用</font>");
				flag2 = true;
			}else{
				$("#span2").html("<font color='red'>密码规范不合格</font>");
				flag2 = false;
			}
		}else{
			$("#span2").html("<font></font>");
		}
	}
	function tip2(){
		$("#span2").html("<font color='black'>支持字母、数字和下划线两种及以上的组合，6-20个字符</font>");
	}
	
	function checktPwd(){
		if($("#tPwd").val().length>0){
			if($("#uPwd").val() == $("#tPwd").val()){
				$("#span3").html("<font color='green'>密码一致</font>");
				flag3 = true;
			}else{
				$("#span3").html("<font color='red'>密码不一致，请重新输入</font>");
				flag3 = false;
			}
			
		}else{
			$("#span3").html("<font></font>");
		}
	}
	function tip3(){
		$("#span3").html("<font color='black'>请再次输入密码，确认密码一致</font>");
	}
	
	function checkuEmail(){
		if($("#uEmail").val().length>0){
			var regStr = /\w@\w*\.\w/;
			if(regStr.test($("#uEmail").val())){
				$("#span4").html("<font color='green'>邮箱可用</font>");
				flag4 = true;
			}else{
				$("#span4").html("<font color='red'>邮箱规范不合格</font>");
				flag4 = false;
			}
		}else{
			$("#span4").html("<font></font>");
		}
	}
	function tip4(){
		$("#span4").html("<font color='black'>请输入常用的邮箱以便激活</font>");
	}
	
	function checkForm(){
		if(flag1){
			if(flag2){
				if(flag3){
					if(flag4){
						return true;
					}else{
						alert("有规范不合格的信息，请正确输入！");
						return false;
					}
				}else{
					alert("有规范不合格的信息，请正确输入！");
					return false;
				}
			}else{
				alert("有规范不合格的信息，请正确输入！");
				return false;
			}
		}else{
			alert("有规范不合格的信息，请正确输入！");
			return false;
		}
		
	}
	function subbtonFunc(obj){
		if ($(obj).prop('checked') == true) {
		    // do something
		    $("#subBtn").removeAttr("disabled");
		}else{
			$("#subBtn").prop("disabled","true");
		}
	}
	function subForm(){
		$('#myForm').submit();
	}
	/* function onn2(){
		alert("hehe");
		document.getElementById("agreement").style.display = "";
	} */
	</script>
	<!-- sign up-page -->
	<div class="login-page">
		<div class="container"> 
			<h3 class="w3ls-title w3ls-title1"style="font-family: '微软雅黑';color: slategray;font-size: 35px;">新用户注册</h3>  
			<div class="login-body">
				<form id="myForm" action="<%=basePath%>user/save.do" method="post" onsubmit="return checkForm();">
					<span id="span1"></span>
					<input type="text" class="user" id="uName" name="uName" placeholder="输入你的用户名" required="" onblur="checkUsername()" onclick="tip1()">
					<span id="span2"></span>
					<input type="password" class="lock" id="uPwd" name="uPwd" placeholder="请设置你的密码" required="" onblur="checkPass()" onclick="tip2()">
					<span id="span3"></span>
					<input type="password" class="lock" id="tPwd" name="tPwd" placeholder="再次输入你的密码" required="" onblur="checktPwd()" onclick="tip3()">
					<span id="span4"></span>
					<input type="text" class="user" id="uEmail" name="uEmail" placeholder="输入你的邮箱账号" required="" onblur="checkuEmail()" onclick="tip4()">
					<!-- <a id="aa" href="javascript:onn2()">这里是用户协议</a> -->
						<div id="agreement" class="agreement" style="height: 200px;overflow-y:scroll;overflow-x:hidden;display: block;">
							<p>尊敬的用户欢迎您注册成为本网站会员。请用户仔细阅读以下全部内容。如用户不同意本服务条款任意内容，请不要注册或使用本网站服务。如用户通过本网站注册程序，即表示用户与本网站已达成协议，自愿接受本服务条款的所有内容。此后，用户不得以未阅读本服务条款内容作任何形式的抗辩。</p>
							<p>
								一、本站服务条款的确认和接纳<br>本网站涉及的各项服务的所有权和运作权归本网站所有。本网站所提供的服务必须按照其发布的服务条款和操作规则严格执行。本服务条款的效力范围及于本网站的一切产品和服务，用户在享受本网站的任何服务时，应当受本服务条款的约束。
							</p>
							<p>
								二、服务简介<br>本网站运用自己的操作系统通过国际互联网络为用户提供各项服务。用户必须: 1.
								提供设备，如个人电脑、手机或其他上网设备。 2. 个人上网和支付与此服务有关的费用。
							</p>
							<p>
								三、用户在不得在本网站上发布下列违法信息<br>1. 反对宪法所确定的基本原则的； 2.
								危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3. 损害国家荣誉和利益的； 4. 煽动民族仇恨、民族歧视，破坏民族团结的；
								5. 破坏国家宗教政策，宣扬邪教和封建迷信的； 6. 散布谣言，扰乱社会秩序，破坏社会稳定的； 7.
								散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8. 侮辱或者诽谤他人，侵害他人合法权益的； 9.
								含有法律、行政法规禁止的其他内容的。
							</p>
							<p>
								四、有关个人资料<br>用户同意: 1. 提供及时、详尽及准确的个人资料。 2. 同意接收来自本网站的信息。 3.
								不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。 4.
								本网站不公开用户的姓名、地址、电子邮箱和笔名。除以下情况外: a) 用户授权本站透露这些信息。 b)
								相应的法律及程序要求本站提供用户的个人资料。
							</p>
							<p>
								五、服务条款的修改<br>本网站有权在必要时修改服务条款，一旦条款及服务内容产生变动，本网站将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以主动取消获得的本网站信息服务。如果用户继续享用本网站信息服务，则视为接受服务条款的变动。
							</p>
							<p>
								六、用户隐私制度<br>尊重用户个人隐私是本网站的一项基本政策。所以，本网站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本网站中的非公开内容，除非有法律许可要求或本网站在诚信的基础上认为透露这些信息在以下四种情况是必要的:
								1. 遵守有关法律规定，遵从本网站合法服务程序。 2. 保持维护本网站的商标所有权。 3.
								在紧急情况下竭力维护用户个人和社会大众的隐私安全。 4. 符合其他相关的要求。
							</p>
							<p>
								七、用户的帐号、密码和安全性<br>用户一旦注册成功，将获得一个密码和用户名。用户需谨慎合理的保存、使用用户名和密码。如果你不保管好自己的帐号和密码安全，将负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。你可随时根据指示改变你的密码。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告本网站。
								八、 拒绝提供担保
								用户明确同意信息服务的使用由用户个人承担风险。本网站不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保，但会在能力范围内，避免出错。
							</p>
							<p>
								九、有限责任<br>如因不可抗力或其它本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等本站会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失，同时会尽量避免这种损害的发生。
							</p>
							<p>
								十、用户信息的储存和限制<br>本站有判定用户的行为是否符合国家法律法规规定及本站服务条款权利，如果用户违背本网站服务条款的规定，本网站有权中断对其提供服务的权利。
							</p>
							<p>
								十一、用户管理<br>用户单独承担发布内容的责任。用户对服务的使用是根据所有适用于本站的国家法律、地方法律和国际法律标准的。用户必须遵循:
								1. 使用网络服务不作非法用途。 2. 不干扰或混乱网络服务。 3. 遵守所有使用网络服务的网络协议、规定、程序和惯例。
								用户须承诺不传输任何非法的、骚扰性的、中伤他人的、辱骂性的、恐性的、伤害性的、庸俗的，淫秽等信息资料。另外，用户也不能传输何教唆他人构成犯罪行为的资料；不能传输助长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。未经许可而非法进入其它电脑系统是禁止的。
								若用户的行为不符合以上提到的服务条款，本站将作出独立判断立即取消用户服务帐号。用户需对自己在网上的行为承担法律责任。用户若在本站上散布和传播反动、色情或其它违反国家法律的信息，本站的系统记录有可能作为用户违反法律的证据。
							</p>
							<p>
								十二、通告<br>所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。
							</p>
							<p>
								十三、信息内容的所有权<br>本网站定义的信息内容包括:
								文字、软件、声音、相片、录象、图表；在广告中全部内容；本网站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本网站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站共同所有，任何人需要转载本站的文章，必须征得原文作者或本站授权。
							</p>
							<p>
								十四、法律<br>本协议的订立、执行和解释及争议的解决均应适用中华人民共和国的法律。用户和本网站一致同意服从本网站所在地有管辖权的法院管辖。如发生本网站服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它条款则依旧保持对用户的约束力。
							</p>
						</div>
						<input type="checkbox" checked="checked" onchange="subbtonFunc(this)">我同意上述协议
						<input id="subBtn" type="button" value="立即注册" class="my_signBtn" onclick="subForm()">
				</form>
			</div>  
			<h6>已经拥有账号了吗? <a href="<%=basePath %>login.jsp">现在登录 »»</a> </h6>  
		</div>
	</div>
	<!-- //sign up-page --> 
	
	<!-- 底部广告和功能菜单 -->
	<div class="footer">
		<div class="container">
			<div class="footer-info w3-agileits-info">
				<div class="col-md-4 address-left agileinfo">
					<div class="footer-logo header-logo">
						<h2><a href="index.html"><span>S</span>mart <i>Bazaar</i></a></h2>
						<h6>Your stores. Your place.</h6>
					</div>
					<ul>
						<li><i class="fa fa-map-marker"></i>光明路1号, 昆山  苏州市  江苏省 中国.</li>
						<li><i class="fa fa-mobile"></i> 333 222 3333 </li>
						<li><i class="fa fa-phone"></i> +222 11 4444 </li>
						<li><i class="fa fa-envelope-o"></i> <a href="mailto:example@mail.com"> mail@example.com</a></li>
					</ul> 
				</div>
				<div class="col-md-8 address-right">
					<div class="col-md-4 footer-grids">
						<h3>消费者保障</h3>
						<ul>
							<li><a href="about.html">保障范围</a></li>
							<li><a href="marketplace.html">退货退款流程</a></li>  
							<li><a href="values.html">投诉举报</a></li>  
							<li><a href="privacy.html">人工服务</a></li>
						</ul>
					</div>
					<div class="col-md-4 footer-grids">
						<h3>新手上路</h3>
						<ul>
							<li><a href="contact.html">新手须知</a></li>
							<li><a href="login.html">消费警示</a></li> 
							<li><a href="faq.html">交易安全</a></li>
							<li><a href="sitemap.html">开店流程</a></li>
							<li><a href="login.html">在线帮助</a></li>
						</ul> 
					</div>
					<div class="col-md-4 footer-grids">
						<h3>关于我们</h3>
						<ul>
							<li><a href="contact.html">关于商城</a></li>
							<li><a href="login.html">合作伙伴</a></li> 
							<li><a href="faq.html">网站地图</a></li>
							<li><a href="sitemap.html">诚征英才</a></li>
							<li><a href="login.html">法律声明</a></li>
						</ul> 
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- 底部广告和功能菜单结束 -->	
	<!-- 底部结尾 -->
	<div class="copy-right"> 
		<div class="container">
			<p>Copyright &copy; 2018.解忧小铺  All rights reserved.</p>
		</div>
	</div>
	<!-- 底部结尾结束 --> 
	 
	<!-- menu js aim -->
	<script src="js/jquery.menu-aim.js"> </script>
	<script src="js/main.js"></script> <!-- Resource jQuery -->
	<!-- //menu js aim --> 
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"></script>
</body>
</html>