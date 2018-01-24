/**
 * Created by Administrator on 2017/4/30.
 */
mainApp.controller('guidePublishCtrl',['$scope','$state','extendsResource','$rootScope',guidePublishFunc]);

function guidePublishFunc($scope,$state,extendsResource,$rootScope) {
	if($rootScope.loginUser == '' || $rootScope.loginUser == null){
	     window.location.href = baseUrl + '/view/index.html';
	 }
	$scope.guide ={
		goodId : 1,
		mark : 'back_new',
		status : 0
	}
	function getUserGoods() {
    	extendsResource.extend(getGoodsList).query({userid : $rootScope.loginUser.userId},function (data) {
            if(data.status == 'success'){
                $scope.personGoods = data.goodsList;
                console.log($scope.personGoods);
            }else{
                alert("获取商品列表失败!");
            }
        });
    }
    getUserGoods();
    
    $scope.pubGuide = function(guide){
    	guide.userId = $rootScope.loginUser.userId
    	console.log(guide);
    	extendsResource.extend(saveGuides).save(guide,function (data) {
            if(data.status == 'success'){
            	alert("申请成功!");
            	$scope.$emit("refreshBand", {type:'cart'});
            	$state.go("personCenter.personGuide");
            }else{
                alert("网络错误,获取失败!");
            }
        });
    }

}
