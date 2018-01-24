mainApp.controller('personInfoCtrl',['$scope','$state','$rootScope','$stateParams','extendsResource','FileUploader',personInfoFunc]);

function personInfoFunc($scope,$state,$rootScope,$stateParams,extendsResource,FileUploader){
	if($rootScope.loginUser == '' || $rootScope.loginUser == null){
	     window.location.href = baseUrl + '/view/index.html';
	 }
	var userid = $rootScope.loginUser.userId;
	$scope.baseurl =baseUrl;
	 //获取用户信息
    $scope.getPersonInfo = function () {
        extendsResource.extend(getUserInfoByUserId).get({userid:userid},function (data) {
            if(data.status == 'success'){
                $scope.info = data.info;
                console.log($scope.info);
            }else{
                alert("获取用户失败!");
            }
        });
    }
    $scope.getPersonInfo();
    
  //更新用户信息
    $scope.updateUserInfo = function (info) {
        extendsResource.extend(updateUserInfo).save(info,function (data) {
            if(data.status == 'success'){
                alert("修改用户信息成功!");
                $scope.showBtn = false;
                $(".mark").attr("readonly","readonly");
                $("#inputPassword3").attr("type","password");
                $scope.getPersonInfo();
            }else{
                alert("更新用户失败!");
            }
        });
        console.log(info);

    }
    
    //更改form表单编辑状态
    $scope.editUserInfo = function () {
        $scope.showBtn = true;
        $(".mark").removeAttr("readonly");
        $("#inputPassword3").attr("type","text");
    }

    //上传组件
    uploader = $scope.uploader = new FileUploader({
        autoUpload: true,
        url: baseUrl + "/appfile/uploadImg.do"
    });
    // 只允许上传一个图片
    uploader.filters.push({
        name : 'customFilter',
        fn : function(item, options) {
            return this.queue.length < 2;
        }
    });

    uploader.filters.push({
        name : 'sizeFilter',
        fn : function(item, options) {
            return item.size <= 10 * 1024 * 1024;// 大小小于10M
        }
    });

    // 上传完成
    $scope.uploader.onCompleteItem = function(fileItem, response, status,headers) {
        console.log("onCompleteItem " + JSON.stringify(response));
        if (status == '200') {
            $scope.info.headImg = response;
            $rootScope.loginUser.headImg = response;
            alert("上传成功！");
        } else {
            alert("上传失败！");
        }
    };
}