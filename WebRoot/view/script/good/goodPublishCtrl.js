/**
 * Created by Administrator on 2017/4/29.
 */
mainApp.controller('goodPublishCtrl',['$scope','$state','extendsResource','$rootScope','FileUploader',publishFunc]);

function publishFunc($scope,$state,extendsResource,$rootScope,FileUploader) {

	if($rootScope.loginUser == '' || $rootScope.loginUser == null){
	     window.location.href = baseUrl + '/view/index.html';
	 }
	
	$scope.baseurl = baseUrl;
	
    //获取类型列表
    extendsResource.extend(listGoodType).query({},function (data) {
        if (data.status == 'success') {
            $scope.goodTypes = data.typelist;
            $scope.good = {
                	goodTypeId : data.typelist[0].typeObj.goodTypeId
                };
            console.debug($scope.good.goodTypeId);
        } else {
            console.log("服务器返回错误!");
        }
    });
    
//    function getGoodImgs(){
//    	 //获取商品图片列表
//        extendsResource.extend(getGoodImgsLsit).query({goodId : },function (data) {
//            if (data.status == 'success') {
//                $scope.goodImgs = data.imglist;
//                console.debug($scope.good.goodTypeId);
//            } else {
//                console.log("服务器返回错误!");
//            }
//        });
//    }
    

    //上传组件
    uploader = $scope.uploader = new FileUploader({
        autoUpload: true,
        url: baseUrl + "/appfile/uploadImg.do",
        queueLimit: 5
    });
    uploader.filters.push({
        name : 'sizeFilter',
        fn : function(item, options) {
            return item.size <= 20 * 1024 * 1024;// 大小小于20M
        }
    });
    $scope.clearItems = function(){    //重新选择文件时，清空队列，达到覆盖文件的效果
        uploader.clearQueue();
    }
    $scope.goodimgs = [];
     uploader.onCompleteItem = function(fileItem, response, status,headers){
    	 console.log(fileItem);
    	 console.log($scope.uploader);
         console.log(response);
          if (status == '200') {
              $scope.goodimgs.push(response);
          } else {
              alert("上传失败！");
          }
     };
     uploader.onCompleteAll = function(){
         console.log($scope.goodimgs);
     }
     
     $scope.removeImg = function(index){
    	 $scope.uploader.removeFromQueue(index);
    	 $scope.goodimgs.splice(index,1);
     }
     
    
     

    $scope.pubGood = function (good) {
        console.log(good);
        good.userId = $rootScope.loginUser.userId;
        extendsResource.extend(goodSave).save(good,function (data) {
            if(data.status == 'success'){
            	console.log("添加商品成功!");
                extendsResource.extend(goodImgSave).save({imgs:$scope.goodimgs,goodId:data.goodId},function (data) {
                    if(data.status == 'success'){
                        $state.go("personCenter.personGoods");
                        console.log("添加商品成功!");
                    }else{
                        alert("图片保存失败!");
                    }
                });
                
                $state.go("personCenter.personGoods");
            }else{
                alert("添加商品失败!");
            }
        });
    }

    $scope.cansol = function () {
        $scope.good = {};
        $state.go("personCenter.personGoods");
    }

}