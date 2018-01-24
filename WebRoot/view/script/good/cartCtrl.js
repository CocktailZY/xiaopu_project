/**
 * Created by zhaoyu on 2017/4/27.
 */
mainApp.controller('cartCtrl', [ '$scope','$state', '$rootScope', '$stateParams',
		'extendsResource', '$timeout', cartFunc ]);

function cartFunc($scope,$state, $rootScope, $stateParams, extendsResource, $timeout) {
	if ($rootScope.loginUser == '' || $rootScope.loginUser == null) {
		window.location.href = baseUrl + '/view/index.html';
	}
	$scope.baseurl = baseUrl;
	$scope.pageNum = 1;
	$scope.pageStr = [];
	$scope.conds = {
		pageNum : $scope.pageNum,
		userid : $rootScope.loginUser.userId
	}
	function getListCart(conds) {
		$scope.zongji = 0;
		extendsResource
				.extend(getCartList)
				.query(
						conds,
						function(data) {
							if (data.status == 'success') {
								$scope.cartList = data.cartList;
								for ( var k = 0; k < data.cartList.length; k++) {
									for ( var h = 0; h < data.cartList[k].goodList.length; h++) {
										$scope.zongji = $scope.zongji
												+ parseFloat(data.cartList[k].goodList[h].cartObj.total);
									}

								}
								$scope.pageTotal = data.pageTotal;
								for ( var i = 1; i <= $scope.pageTotal; i++) {
									var pageObj = {
										nowPage : false,
										pageIndex : i
									}
									if ($scope.conds.pageNum == i) {
										pageObj.nowPage = true;
									}
									$scope.pageStr.push(pageObj);
								}
								console.log($scope.pageStr);
								if ($scope.conds.pageNum == 1) {
									$(".left").addClass("disabled");// 前一页置灰
								}
								if ($scope.conds.pageNum == $scope.pageTotal) {
									$(".right").addClass("disabled");// 前一页置灰
								}
							}
						});
	}
	getListCart($scope.conds);
	$scope.pageLeft = function() {
		$scope.conds.pageNum = $scope.pageNum - 1;
		$scope.pageStr = [];
		getListCart($scope.conds);
	}

	$scope.pageRight = function() {
		$scope.conds.pageNum = $scope.pageNum + 1;
		$scope.pageStr = [];
		getListCart($scope.conds);
	}

	$scope.toPage = function(page, event) {
		// $(event.target).addClass('active');
		$scope.conds.pageNum = page;
		$scope.pageStr = [];
		console.log($scope.conds);
		// $("#page"+$scope.conds.pageNum).addClass("active");
		getListCart($scope.conds);
	}

	$scope.showDelModel = function(cartid) {
		$scope.cartObjId = cartid;
		$("#delModel").css("visibility", "visible");
		$(".reveal-modal-bg").css("display", "block");
	}

	$scope.delUser = function() {
		console.log($scope.cartObjId);
		$scope.delCansle();
		extendsResource.extend(deleteCart).get({
			id : $scope.cartObjId
		}, function(data) {
			if (data.status == 'success') {
				$scope.pageStr = [];
				getListCart($scope.conds);
				$scope.$emit("refreshBand", {type:'cart'});
			}
		});
	}
	$scope.delCansle = function() {
		$("#delModel").css("visibility", "hidden");
		$(".reveal-modal-bg").css("display", "none");
	}

	$scope.addToTable = function() {
		$(".dealModal").modal("show");
	}

	$scope.addNum = function(id) {
		extendsResource.extend(updateNumCart).query({
			id : id,
			type : 'add'
		}, function(data) {
			if (data.status == 'success') {
				$scope.pageStr = [];
				getListCart($scope.conds);
			}
		});
	}
	$scope.reduceNum = function(id) {
		extendsResource.extend(updateNumCart).query({
			id : id,
			type : 're'
		}, function(data) {
			if (data.status == 'success') {
				$scope.pageStr = [];
				getListCart($scope.conds);
			}
		});
	}
	$scope.payCart = function(){
		var goodIds = [];
		var cartIds = [];
		for ( var k = 0; k < $scope.cartList.length; k++) {
			for ( var h = 0; h < $scope.cartList[k].goodList.length; h++) {
				goodIds.push($scope.cartList[k].goodList[h].goodObj.goodId);
				cartIds.push($scope.cartList[k].goodList[h].cartObj.id);
			}
		}
		console.log(goodIds);
		extendsResource.extend(tableSaveCart).save(
				{cartList:goodIds,userId:$rootScope.loginUser.userId},
		function (data) {
            if(data.status == 'success'){
            	console.log(cartIds);
            	extendsResource.extend(deleteCartIds).get({
            		ids : cartIds
        		}, function(data) {
        			if (data.status == 'success') {
                    	alert("支付成功!");
                        $state.reload();
                        $scope.pageStr = [];
                        getListCart($scope.conds);
                        $scope.cansleTable();
        			}
        		});
            	$scope.$emit("refreshBand", {type:'cart'});
            }else{
            	console.debug("提交失败");
            }
        });
	}
	$scope.cansleTable = function(){
    	$(".dealModal").modal("hide");
    }
	
	//学校插件
	//弹出窗口
	$scope.pop = function(){
		//将窗口居中
		makeCenter();

		//初始化省份列表
		initProvince();

		//默认情况下, 给第一个省份添加choosen样式
		$('[province-id="1"]').addClass('choosen');

		//初始化大学列表
		initSchool(1);
	}

	//隐藏窗口
	$scope.hides = function(){
		$('#choose-box-wrapper').css("display","none");
	}

	function initProvince(){
		
		//原先的省份列表清空
		$('#choose-a-province').html('');
		
		for(i=0;i<schoolList.length;i++){
			$('#choose-a-province').append('<a href="javascript:void(0);" class="province-item" province-id="'+schoolList[i].id+'">'+schoolList[i].name+'</a>');
		}
		
		//添加省份列表项的click事件
		$('.province-item').bind('click',function(){
			var item=$(this);
			var province = item.attr('province-id');
			var choosenItem = item.parent().find('.choosen');
			if(choosenItem)
			$(choosenItem).removeClass('choosen');
			item.addClass('choosen');
			
			//更新大学列表
			initSchool(province);
		});
	}

	function initSchool(provinceID){

		//原先的学校列表清空
		$('#choose-a-school').html('');
		var schools = schoolList[provinceID-1].school;
		for(i=0;i<schools.length;i++){
			$('#choose-a-school').append('<a href="javascript:void(0);" class="school-item" school-id="'+schools[i].id+'">'+schools[i].name+'</a>');
		}
		
		//添加大学列表项的click事件
		$('.school-item').bind('click', function(){
			var item=$(this);
			var school = item.attr('school-id');

			//更新选择大学文本框中的值
			$('#school-name').val(item.text());

			//关闭弹窗
			$scope.hides();
		});
	}

	function makeCenter(){
		$('#choose-box-wrapper').css("display","block");
		$('#choose-box-wrapper').css("position","absolute");
		$('#choose-box-wrapper').css("top", "58px");
		$('#choose-box-wrapper').css("left", "142px");
	}
	//学校插件

}
