/**
 * Created by Administrator on 2017/4/30.
 */
adminApp.controller("guideCtrl",['$scope','$state','$rootScope','sessionStorage','extendsResource',roleFunc]);

function roleFunc($scope,$state,$rootScope,sessionStorage,extendsResource) {
	$scope.baseurl = baseUrl;
	$scope.pageNum = 1;
	$scope.pageStr = [];
	$scope.content = '';
	$scope.conds = {
		pageNum	: $scope.pageNum
	}
	
	$scope.guide = {
		goodId : ''
	}
	
	function initGuideList(conds){
		$scope.pageStr = [];
		extendsResource.extend(getGuideList).query(conds,function(data){
			if(data.status == 'success'){
				$scope.guideList = data.guideList;
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
	initGuideList($scope.conds);
	
	$scope.pageLeft = function(){
		$scope.conds.pageNum = $scope.pageNum - 1;
		initGuideList($scope.conds);
	}
	
	$scope.pageRight = function(){
		$scope.conds.pageNum = $scope.pageNum + 1;
		initGuideList($scope.conds);
	}
	
	$scope.toPage = function(page,event){
//		$(event.target).addClass('active');
		$scope.conds.pageNum = page;
		console.log($scope.conds);
//		$("#page"+$scope.conds.pageNum).addClass("active");
		initGuideList($scope.conds);
	}
	
	function getUserGoods() {
    	extendsResource.extend(getGoodsList).query({},function (data) {
            if(data.status == 'success'){
                $scope.personGoods = data.goodsList;
                $scope.guide.goodId = $scope.personGoods[0].goodObj.goodId;
                console.debug($scope.guide.goodId);
                console.log($scope.personGoods);
            }else{
                alert("获取商品列表失败!");
            }
        });
    }
    getUserGoods();
	
	$scope.addGuide = function(content){
		extendsResource.extend(saveGuide).save({guideContent:content,mark:'back_old',status:1,goodId:$scope.guide.goodId,userId:$rootScope.adminLoginUser.userId},function(data){
			if(data.status == 'success'){
				initGuideList($scope.conds);
				$scope.content = '';
				$("#addModel").css("visibility", "hidden");
				$(".reveal-modal-bg").css("display","none");
			}
		});
	}
	
	$scope.showDelModel = function(guideid){
		extendsResource.extend(getGuideByGuideId).get({guideId:guideid},function(data){
			if(data.status == 'success'){
				$scope.delGuide = data.guideInfo;
				console.log($scope.delGuide);
				$("#delModel").css("visibility", "visible");
				$(".reveal-modal-bg").css("display","block");
			}
		});
	}
	
	$scope.deletGuide = function(guideid){
		console.log(guideid);
		$scope.delCansle();
		extendsResource.extend(deleteGuide).get({guideId:guideid},function(data){
			if(data.status == 'success'){
				initGuideList($scope.conds);
			}
		});
	}
	$scope.delCansle = function(){
		$("#delModel").css("visibility", "hidden");
		$(".reveal-modal-bg").css("display","none");
	}
	
	$scope.getGuideInfo = function(guideid){
		extendsResource.extend(getGuideByGuideId).get({guideId:guideid},function(data){
			if(data.status == 'success'){
				$scope.guideInfo = data.guideInfo;
				console.log($scope.guideInfo);
				$("#infoModel").css("visibility", "visible");
				$(".reveal-modal-bg").css("display","block");
			}
		});
	}
	
	$scope.updateGuide = function(guide){
		extendsResource.extend(updateGuide).save(guide,function(data){
			if(data.status == 'success'){
				$("#infoModel").css("visibility", "hidden");
				$(".reveal-modal-bg").css("display","none");
				initGuideList($scope.conds);
			}
		});
	}
	
	$scope.updateStatus = function(id){
		extendsResource.extend(updateGuideStatus).get({guideId:id},function(data){
			if(data.status == 'success'){
				initGuideList($scope.conds);
			}
		});
	}
	
	$scope.cleanForm = function(){
		$scope.content = '';
	}
}