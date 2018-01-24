/**
 * Created by Administrator on 2017/4/25.
 */
adminApp.controller('loginCtrl',['$scope','$rootScope','extendsResource','$timeout',loginFunc]);

function loginFunc($scope,$rootScope,extendsResource,$timeout) {
	$scope.enterEvent = function(event,user) {
        if(event.keyCode == '13'){
        	$scope.adminLogin(user);
        }
    }
	
    $scope.adminLogin = function (user) {
    	$scope.showBtn = false;
        console.log(user);
        extendsResource.extend(loginCheck).save(user,function (data) {
            if(data.role == 'admin'){
            	window.location.href = resourceAdminHtml + '/index.html';
            }else{
            	$.bootstrapGrowl("该用户非平台管理员!", {
                    ele: $("body"), // which element to append to
                    type: 'success', // (null, 'info', 'error', 'success')
                    offset: {from: 'top', amount: 150}, // 'top', or 'bottom'
                    align: 'right', // ('left', 'right', or 'center')
                    width: 300, // (integer, or 'auto')
                    delay: 2000,
                    allow_dismiss: true,
                    stackup_spacing: 20 // spacing between consecutively stacked growls.
                });
            }
            $scope.user = {};
        });
    }
    
    $scope.recoverPwd = function(user){
    	extendsResource.extend(recoverPassword).save(user,function (data) {
            if(data.status == 'success'){
            	$scope.user = {};
            	window.open(resourceAdminHtml + "/login.html");//跳回登录页
            }
        });
    }

}