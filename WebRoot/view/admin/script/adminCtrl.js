/**
 * Created by Administrator on 2017/4/30.
 */
adminApp.controller("adminCtrl",['$scope','$state','$rootScope','sessionStorage','extendsResource',adminFunc]);

function adminFunc($scope,$state,$rootScope,sessionStorage,extendsResource) {
	$scope.baseurl = baseUrl;
	$scope.pageNum = 1;
	$scope.pageStr = [];
	$scope.conds = {
		pageNum	: $scope.pageNum
	}
	console.debug($rootScope.adminLoginUser);
	function initUserList(conds){
		extendsResource.extend(getUserList).query(conds,function(data){
			if(data.status == 'success'){
				$scope.userList = data.userList;
				$scope.pageTotal = data.pageTotal;
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
			}
		});
	}
	initUserList($scope.conds);
	
	$scope.pageLeft = function(){
		$scope.conds.pageNum = $scope.pageNum - 1;
		$scope.pageStr = [];
		initUserList($scope.conds);
	}
	
	$scope.pageRight = function(){
		$scope.conds.pageNum = $scope.pageNum + 1;
		$scope.pageStr = [];
		initUserList($scope.conds);
	}
	
	$scope.toPage = function(page,event){
//		$(event.target).addClass('active');
		$scope.conds.pageNum = page;
		$scope.pageStr = [];
		console.log($scope.conds);
//		$("#page"+$scope.conds.pageNum).addClass("active");
		initUserList($scope.conds);
	}
	
	$scope.showDelModel = function(userid){
		extendsResource.extend(getUserByUserId).get({userId:userid},function(data){
			if(data.status == 'success'){
				$scope.userInfo = data.userInfo;
				console.log($scope.userInfo);
				$("#delModel").css("visibility", "visible");
				$(".reveal-modal-bg").css("display","block");
			}
		});
	}
	
	$scope.delUser = function(userid){
		console.log(userid);
		$scope.delCansle();
		extendsResource.extend(deleteUser).get({userId:userid},function(data){
			if(data.status == 'success'){
				$scope.pageStr = [];
				initUserList($scope.conds);
			}
		});
	}
	$scope.delCansle = function(){
		$("#delModel").css("visibility", "hidden");
		$(".reveal-modal-bg").css("display","none");
	}
	
}