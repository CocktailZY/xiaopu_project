/**
 * Created by Administrator on 2017/4/30.
 */
adminApp.controller("tableCtrl",['$scope','$state','$rootScope','sessionStorage','extendsResource',goodTypeFunc]);

function goodTypeFunc($scope,$state,$rootScope,sessionStorage,extendsResource) {

	$scope.baseurl = baseUrl;
	$scope.pageNum = 1;
	$scope.pageStr = [];
	$scope.conds = {
		pageNum	: $scope.pageNum
	}
	
	function initTableList(conds){
		extendsResource.extend(getTableList).query(conds,function(data){
			if(data.status == 'success'){
				$scope.tableList = data.tableList;
				$scope.pageTotal = data.pageTotal;
				for(var i = 1 ; i <= $scope.pageTotal ; i++){
					$scope.pageStr.push(i);
				}
				console.log($scope.pageStr);
			}
		});
		if($scope.pageNum == 1){
			$(".left").addClass("disabled");//前一页置灰
		}
		if($scope.pageNum == $scope.pageTotal){
			$(".right").addClass("disabled");//前一页置灰
		}
		$("#page"+$scope.conds.pageNum).addClass("active");
	}
	initTableList($scope.conds);
	
	$scope.toogle = function(byTime) {
		for ( var i = 0; i < $scope.tableList.length; i++) {
			if ($scope.tableList[i].byTime == byTime) {
				$scope.tableList[i].show = !$scope.tableList[i].show;
			}
		}
	}
	
}