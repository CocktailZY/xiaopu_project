/**
 * Created by Administrator on 2017/4/25.
 */
var mainApp = angular.module('indexModule', ['ngResource', 'ui.router']);
restfulFactory(mainApp);

mainApp.controller('indexCtrl',['$scope','$state','$timeout',function ($scope,$state,$timeout) {
	$scope.showAlert = false;
    
    $scope.$on("alert",function(event,data){
    	console.log("info:"+data);
    	$scope.alertMsg = data;
    	$scope.showAlert = true;
    	if($scope.alertMsg == '登录成功!'){
    		$scope.showAlert = false;
    	}
    	$timeout(function(){
    		$scope.showAlert = false;
	    },500);
    });
    $state.go("login");
    console.log("enter login");
}]);

mainApp.config(["$stateProvider", "$urlRouterProvider", function ($stateProvider, $urlRouterProvider) {
    //$urlRouterProvider.otherwise('/filesManager');
    $stateProvider
    //登录
        .state('login', {
            url: "/login",
            templateUrl: prefixHtml + "/login.html",
            controller:"loginCtrl"
        })
     //注册
        .state('regist', {
            url: "/regist",
            templateUrl: prefixHtml + "/regist.html",
            controller:"registCtrl"
        })
}]);