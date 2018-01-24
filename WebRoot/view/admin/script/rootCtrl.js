/**
 * Created by Administrator on 2017/4/30.
 */
var adminApp = angular.module('adminApp', ['ngResource', 'ui.router']);
restfulFactory(adminApp);

adminApp.config(["$stateProvider", "$urlRouterProvider", function ($stateProvider, $urlRouterProvider) {
    //$urlRouterProvider.otherwise('/filesManager');
    $stateProvider
        //用户管理
        .state('adminUser', {
            url: "/adminUser",
            templateUrl: resourceHtml + "/adminUser.html",
            controller:"adminCtrl"
        })
        //商品类型管理
        .state('goodType', {
            url: "/goodType",
            templateUrl: resourceHtml + "/goodType.html",
            controller:"goodTypeCtrl"
        })
        //交易单管理
        .state('table', {
            url: "/table",
            templateUrl: resourceHtml + "/tableCtrl.html",
            controller:"tableCtrl"
        })
        //二手指南管理
        .state('guide', {
            url: "/guide",
            templateUrl: resourceHtml + "/guide.html",
            controller:"guideCtrl"
        })
        //角色管理
        .state('role', {
            url: "/role",
            templateUrl: resourceHtml + "/role.html",
            controller:"roleCtrl"
        })
        //平台统计
        .state('count', {
            url: "/count",
            templateUrl: resourceHtml + "/count.html",
            controller:"countCtrl"
        })

}]);

adminApp.controller("rootCtrl",['$scope','$rootScope','$state','extendsResource',function ($scope,$rootScope,$state,extendsResource) {
	 
		extendsResource.extend(getLoginUser).get({},function(data){
	    	if(data.adminUser != null){
	    		console.log(data.loginUser);
	        	$rootScope.adminLoginUser = data.adminUser;
	        	console.log($rootScope.adminLoginUser);
	        	$state.go("adminUser");
	    	}else{
	    		window.location.href = resourceAdminHtml + "/login.html";//跳回登录页
	    	}
		});
//		if($rootScope.adminLoginUser == '' || $rootScope.adminLoginUser == null){
//			 
//	     }else{
//	     }
	 $scope.loginOut = function(){
	    	extendsResource.extend(loginOutUser).get({},function(data){
	           window.location.href = resourceAdminHtml + "/login.html";//跳回登录页
	        });
	    }
	 
}]);