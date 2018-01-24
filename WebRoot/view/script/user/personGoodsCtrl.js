mainApp.controller('personGoodsCtrl',['$scope','$state','$rootScope','$stateParams','extendsResource',personGoodFunc]);

function personGoodFunc($scope,$state,$rootScope,$stateParams,extendsResource){
	if($rootScope.loginUser == '' || $rootScope.loginUser == null){
	     window.location.href = baseUrl + '/view/index.html';
	 }
	$scope.baseurl = baseUrl;
	$scope.pageNum = 1;
	$scope.pageStr = [];
	var userid = $rootScope.loginUser.userId;
	$scope.conds = {
		userid : userid,
		pageNum	: $scope.pageNum,
		pageSize : 5
	}
	//获取商品列表
    $scope.getPersonGoods = function (conds) {
    	console.log("enter----getPersonGoods");
        extendsResource.extend(getGoodsList).query(conds,function (data) {
            if(data.status == 'success'){
                $scope.personGoods = data.goodsList;
                $scope.pageTotal = data.pageTotal;
				for(var i = 1 ; i <= $scope.pageTotal ; i++){
					var pageObj = {
					    	 nowPage:false,
					    	 pageIndex : i
					     }
					if($scope.conds.pageNum == i){
						pageObj.nowPage = true;
					}
					$scope.pageStr.push(pageObj);
				}
				console.log($scope.pageStr);
				if($scope.conds.pageNum == 1){
					$(".left").addClass("disabled");//前一页置灰
				}
				if($scope.conds.pageNum == $scope.pageTotal){
					$(".right").addClass("disabled");//前一页置灰
				}
                console.log($scope.personGoods);
            }else{
                alert("获取商品列表失败!");
            }
        });
    };
    $scope.getPersonGoods($scope.conds);
    
    $scope.pageLeft = function(){
		$scope.conds.pageNum = $scope.pageNum - 1;
		$scope.pageStr = [];
		$scope.getPersonGoods($scope.conds);
	}
	
	$scope.pageRight = function(){
		$scope.conds.pageNum = $scope.pageNum + 1;
		$scope.pageStr = [];
		$scope.getPersonGoods($scope.conds);
	}
	
	$scope.toPage = function(page,event){
//		$(event.target).addClass('active');
		$scope.conds.pageNum = page;
		$scope.pageStr = [];
		console.log($scope.conds);
//		$("#page"+$scope.conds.pageNum).addClass("active");
		$scope.getPersonGoods($scope.conds);
	}
	
	$scope.editGoodInfo = function(goodid){
		extendsResource.extend(getDetailByGoodsId).get({goodId:goodid,pageNum:1},function (data) {
            if(data.status == 'success'){
                $scope.goodDetail = data.detail;
                
              //获取类型列表
        	    extendsResource.extend(listGoodType).query({},function (data) {
        	        if (data.status == 'success') {
        	            $scope.goodTypes = data.typelist;
        	            $scope.good = {
        	                	goodTypeId : data.typelist[0].typeObj.goodTypeId
        	                };
        	            $("#infoModal").css("visibility", "visible");
        	    		$(".reveal-modal-bg").css("display", "block");
        	            console.debug($scope.good.goodTypeId);
        	            
        	            
        	            
        	        } else {
        	            console.log("服务器返回错误!");
        	        }
        	    });
                
            }else{
                console.debug("网络错误,获取失败!");
            }
        });
	}
	
	$scope.updateGood = function(goodDetail){
		extendsResource.extend(goodUpdate).save(goodDetail,function (data) {
            if(data.status == 'success'){
            	$("#infoModal").css("visibility", "hidden");
        		$(".reveal-modal-bg").css("display", "none");
            	$scope.pageStr = [];
            	$scope.getPersonGoods($scope.conds);
        		
            }else{
                console.debug("网络错误,获取失败!");
            }
        });
	}
	
	$scope.showDelModel = function(goodid) {
		$scope.delGoodId = goodid;
		$("#delModel").css("visibility", "visible");
		$(".reveal-modal-bg").css("display", "block");
	}
	$scope.delCansle = function() {
		$("#delModel").css("visibility", "hidden");
		$(".reveal-modal-bg").css("display", "none");
	}
	
	$scope.updateCansle = function() {
		$("#infoModal").css("visibility", "hidden");
		$(".reveal-modal-bg").css("display", "none");
	}
	
	$scope.delGood = function(){
		extendsResource.extend(goodDel).get({goodId:$scope.delGoodId},function (data) {
            if(data.status == 'success'){
            	$scope.delCansle();
            	$scope.pageStr = [];
        		$scope.getPersonGoods($scope.conds);
            }else{
                console.debug("网络错误,获取失败!");
            }
        });
	}
}