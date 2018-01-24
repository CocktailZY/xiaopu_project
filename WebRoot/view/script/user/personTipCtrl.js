mainApp.controller('personTipCtrl',['$scope','$state','$rootScope','$stateParams','extendsResource',personTipFunc]);

function personTipFunc($scope,$state,$rootScope,$stateParams,extendsResource){
	if($rootScope.loginUser == '' || $rootScope.loginUser == null){
	     window.location.href = baseUrl + '/view/index.html';
	 }
	var userid = $rootScope.loginUser.userId;
	$scope.baseurl = baseUrl;
	$scope.pageNum = 1;
	$scope.pageStr = [];
	$scope.conds = {
		pageNum	: $scope.pageNum,
		userid : userid
	}
	 //获取消息列表
    $scope.getPersonMessage = function (conds) {
        extendsResource.extend(getTipsList).query(conds,function (data) {
            if(data.status == 'success'){
                $scope.personTips = data.personTipList;
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
                console.log($scope.personTips);
            }else{
                alert("获取消息列表失败!");
            }
        });
    }
    $scope.getPersonMessage($scope.conds);
    
    $scope.pageLeft = function(){
		$scope.conds.pageNum = $scope.pageNum - 1;
		$scope.pageStr = [];
		getPersonMessage($scope.conds);
	}
	
	$scope.pageRight = function(){
		$scope.conds.pageNum = $scope.pageNum + 1;
		$scope.pageStr = [];
		getPersonMessage($scope.conds);
	}
	
	$scope.toPage = function(page,event){
//		$(event.target).addClass('active');
		$scope.conds.pageNum = page;
		$scope.pageStr = [];
		console.log($scope.conds);
//		$("#page"+$scope.conds.pageNum).addClass("active");
		getPersonMessage($scope.conds);
	}
	
	$scope.allRead = function(){
		extendsResource.extend(allReadTip).get({userId : $rootScope.loginUser.userId},function (data) {
            if(data.status == 'success'){
            	$scope.pageStr = [];
            	$scope.getPersonMessage($scope.conds);
            }else{
                alert("网络错误,获取失败!");
            }
        });
	}
}