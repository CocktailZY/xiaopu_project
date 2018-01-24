/**
 * Created by Administrator on 2017/4/30.
 */
mainApp.controller('guideCtrl',['$scope','extendsResource','$rootScope',guideFunc]);

function guideFunc($scope,extendsResource,$rootScope) {
	if($rootScope.loginUser == '' || $rootScope.loginUser == null){
	     window.location.href = baseUrl + '/view/index.html';
	 }
	$scope.pageNum = 1;
	$scope.pageStr = [];
	$scope.roleName = '';
	$scope.conds = {
		pageNum	: $scope.pageNum,
		userId:$rootScope.loginUser.userId
	}
    function getGuide(conds) {
    	extendsResource.extend(getGuides).query(conds,function (data) {
            if(data.status == 'success'){
            	console.log(data.guideList);
                $scope.guideList = data.guideList;
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
            }else{
                alert("网络错误,获取失败!");
            }
        });
    }
    getGuide($scope.conds);
    
    $scope.delGuide = function(guideId){
    	//没有删除确认
    	extendsResource.extend(delGuides).get({guideId : guideId},function (data) {
            if(data.status == 'success'){
            	getGuide();
            	$scope.$emit("refreshBand", {type:'cart'});
            }else{
                alert("网络错误,获取失败!");
            }
        });
    }
    
    $scope.allRead = function(){
    	extendsResource.extend(allReadGuide).get({userId : $rootScope.loginUser.userId},function (data) {
            if(data.status == 'success'){
            	getGuide();
            	$scope.$emit("refreshBand", {type:'cart'});
            }else{
                alert("网络错误,获取失败!");
            }
        });
    }

}
