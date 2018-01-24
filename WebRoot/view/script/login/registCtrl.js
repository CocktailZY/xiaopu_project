/**
 * Created by Administrator on 2017/4/25.
 */
mainApp.controller('registCtrl',['$scope','$rootScope','sessionStorage','extendsResource','$timeout',registFunc]);

function registFunc($scope,$rootScope,sessionStorage,extendsResource,$timeout) {

    $scope.regist = function (user) {
        console.log(user);
        user.headImg = '201801/20180123225211417_432.png';
        if(user.passWord == user.checkPassword){
        	extendsResource.extend(registUser).save(user,function(data){
            	$.bootstrapGrowl(data.message, {
                    ele: $("body"), // which element to append to
                    type: 'success', // (null, 'info', 'error', 'success')
                    offset: {from: 'top', amount: 150}, // 'top', or 'bottom'
                    align: 'right', // ('left', 'right', or 'center')
                    width: 300, // (integer, or 'auto')
                    delay: 2000,
                    allow_dismiss: true,
                    stackup_spacing: 20 // spacing between consecutively stacked growls.
                });
                if(data.status == 'success'){
                    $timeout(function(){
                    	window.location.href = baseUrl + "/view/main.html";
                    },1500);
                }
            });
        	user = {};//置空表单
        }else{
        	user.passWord = '';
        	user.checkPassword = '';
        	$.bootstrapGrowl("两次密码不一致!", {
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
        
    }

}