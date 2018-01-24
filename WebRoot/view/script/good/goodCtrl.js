/**
 * Created by Administrator on 2017/4/24.
 */
mainApp.controller('goodCtrl',['$scope','$rootScope','extendsResource','$timeout',function ($scope,$rootScope,extendsResource,$timeout) {
    
	
	$scope.locationUrl = [];// 存储当前路径
   // 初始化页面数据
    getGoodTypeInit();
    getGoodsInit();
    

    $scope.getByTypeId = function(typeId,typeName){
    	$scope.locationUrl=[];
    	console.log(typeId);
    	getGoodsInit({goodTypeId:typeId});
    	$scope.locationUrl.push(typeName);
    }


    $scope.cleanLocation = function () {
        $scope.locationUrl = [];// 清空路径
        getGoodsInit();
    }

    // 获取商品列表
    function getGoodsInit(conditions) {
        extendsResource.extend(getGoodsList).query(conditions,function (data) {
            if (data.status == 'success') {
            	if(data.goodsList.length == 0){
            		$scope.flag = true;
            	}else{
            		$scope.flag = false;
            		$scope.goodsList = data.goodsList;
            	}
                
            } else {
                console.debug("服务器返回错误!");
            }
        });
    }
    // 获取类型列表
    function getGoodTypeInit(conditions) {
        extendsResource.extend(listGoodType).query(conditions,function (data) {
            if (data.status == 'success') {
                $scope.goodTypeList = data.typelist;
                console.log($scope.goodTypeList)
            } else {
                console.debug("服务器返回错误!");
            }
        });
    }
    // 获取公告
    function getGuide() {
    	extendsResource.extend(getGuides).query({pageNum:1,status:1},function (data) {
            if(data.status == 'success'){
                $scope.guideList = data.guideList;
            }else{
                alert("网络错误,获取失败!");
            }
        });
    }
    getGuide();

}]);