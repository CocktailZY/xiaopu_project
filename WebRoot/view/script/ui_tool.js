/**
 * Created by Administrator on 2017/4/24.
 */
$(function() {
	$(document).on("click", ".nav-pills > li", function() {
		if ($(this).hasClass("active")) {
			$(this).removeClass("active");
		} else {
			$('.nav-pills > li').each(function() {
				$(this).removeClass("active");
			});
			$(this).addClass("active");
		}
	})

	$(document).on("click", ".dropdown-menu > li", function() {
		var uri = decodeURI(window.location, "UTF-8");
		console.log(uri);
		console.log(uri.length);
	})

	$(document).ready(function(){
	$("body").on("click",".ch_cho li",function(){
		$(this).addClass("on").siblings().removeClass("on");
		var xh=$(this).index();
		//alert(xh);
		$(".ch_con li").eq(xh).siblings().css("display","none");
		$(".ch_con li").eq(xh).css("display","block");
		})
	$("body").on("click",".zf_ch1",function(){
		var zt=$(this).attr("checkzt");
		//alert(zt);
		if(zt=="0"){
			$(this).siblings().attr("checkzt","0");
			$(this).attr("checkzt","1");
			}
		})
	$("body").on('input propertychange','.amount_in',function(){
	          var deox=$(this).val();
			  $(".amnum").text(deox*10);
			  if(isNaN(deox) || deox==""){
				  $(".amnum").text(0);
				  alert("您好,请输入充值金额!");
				  $(this).val(0);
				  $(this).focus();
				  }
			})
	$("body").on("click",".amount_in",function(){
		$(this).select();
		})
	})

});
