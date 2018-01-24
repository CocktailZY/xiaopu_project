/**
 * Created by Administrator on 2017/4/25.
 */
mainApp.controller('loginCtrl',['$scope','$rootScope','sessionStorage','extendsResource','$timeout',loginFunc]);

function loginFunc($scope,$rootScope,sessionStorage,extendsResource,$timeout) {
	$scope.showBtn = true;
	if($scope.user == null){
		$scope.showBtn = true;
	}
	$scope.enterEvent = function(event,user) {
        if(event.keyCode == '13'){
        	$scope.login(user);
        }
    }
	
	
    $scope.login = function (user) {
    	$scope.showBtn = false;
        console.log(user);
        extendsResource.extend(loginCheck).save(user,function (data) {
        	$scope.$emit("alert",data.message);
            if(data.status == 'success'){
            	window.location.href = baseUrl + "/view/main.html";
            }
        });
    }

}