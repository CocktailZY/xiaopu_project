/**
 * Created by Administrator on 2017/4/29.
 */
mainApp.controller('personCenterCtrl',['$scope','$state','$rootScope','$stateParams','extendsResource',personFunc]);

function personFunc($scope,$state,$rootScope,$stateParams,extendsResource) {
	if($rootScope.loginUser == '' || $rootScope.loginUser == null){
	     window.location.href = baseUrl + '/view/index.html';
	 }
	var userid = $rootScope.loginUser.userId;
    var methodType = $stateParams.type;
    $scope.baseurl = baseUrl;
    console.log("zzz:"+methodType);
//    $scope.showBtn = false;

    if(methodType == 'good'){
    	$("#personGoods").addClass("active");
    	$state.go("personCenter.personGoods");
    }else if(methodType == 'tip'){
    	$("#personTip").addClass("active");
    	$state.go("personCenter.personTip");
    }else if(methodType == 'table'){
    	$("#personTable").addClass("active");
    	$state.go("personCenter.personTable");
    }else if(methodType == 'guide'){
    	$("#personGuide").addClass("active");
    	$state.go("personCenter.personGuide");
    }else{
    	$("#personInfo").addClass("active");
    	$state.go("personCenter.personInfo");
    }
    
}