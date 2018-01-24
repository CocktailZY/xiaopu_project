/**
 * Created by zhaoyu on 2017/4/27.
 */
mainApp.controller('goodSearchCtrl',['$scope','$stateParams','extendsResource','$timeout',detailFunc]);

    function detailFunc($scope,$stateParams,extendsResource,$timeout) {
    	var conds = $stateParams.conds;
    	console.log("zhaoyu");
    	console.log(decodeURI(conds));
    	$scope.baseurl = baseUrl;
    	$scope.pageNum = 1;
    	$scope.pageStr = [];
    	var conditions = {
			conds:decodeURI(conds),
			pageNum:$scope.pageNum,
			pageSize:8
    	}
    	if(conditions.conds == ''){
    		extendsResource.extend(getGoodsList).query({pageNum:1,status:1,pageSize:8},function (data) {
                if (data.status == 'success') {
                	if(data.goodsList.length == 0){
                		$scope.flag = true;
                	}else{
                		$scope.flag = false;
                		$scope.goodsList = data.goodsList;
                		$scope.pageTotal = data.pageTotal;
                		for(var i = 1 ; i <= $scope.pageTotal ; i++){
        					var pageObj = {
        					    	 nowPage:false,
        					    	 pageIndex : i
        					     }
        					if(conditions.pageNum == i){
        						pageObj.nowPage = true;
        					}
        					$scope.pageStr.push(pageObj);
        				}
        				console.log($scope.pageStr);
        				if(conditions.pageNum == 1){
        					$(".left").addClass("disabled");//前一页置灰
        				}
        				if(conditions.pageNum == $scope.pageTotal){
        					$(".right").addClass("disabled");//前一页置灰
        				}
                	}
                    
                } else {
                    console.debug("服务器返回错误!");
                }
            });
    	}else{
    		likeSearch(conditions);
    	}
    	$scope.pageLeft = function(){
    		conditions.pageNum = $scope.pageNum - 1;
    		$scope.pageStr = [];
    		likeSearch(conditions);
    	}
    	
    	$scope.pageRight = function(){
    		conditions.pageNum = $scope.pageNum + 1;
    		$scope.pageStr = [];
    		likeSearch(conditions);
    	}
    	
    	$scope.toPage = function(page,event){
//    		$(event.target).addClass('active');
    		conditions.pageNum = page;
    		$scope.pageStr = [];
//    		$("#page"+$scope.conds.pageNum).addClass("active");
    		likeSearch(conditions);
    	}
    	$scope.conditions = decodeURI(conds);
        //模糊查询
        function likeSearch(conditions){
        	console.log("zhaoyu---");
        	console.log(conditions);
        	conditions.status = 1;
        	extendsResource.extend(goodLikeSearch).query(conditions,function (data) {
            	if(data.status == 'success'){
            		if(data.goodsList.length == 0){
                		$scope.flag = true;
                	}else{
                		$scope.flag = false;
                		$scope.goodsList = data.goodsList;
                		$scope.pageTotal = data.pageTotal;
                		for(var i = 1 ; i <= $scope.pageTotal ; i++){
        					var pageObj = {
        					    	 nowPage:false,
        					    	 pageIndex : i
        					     }
        					if(conditions.pageNum == i){
        						pageObj.nowPage = true;
        					}
        					$scope.pageStr.push(pageObj);
        				}
        				console.log($scope.pageStr);
        				if(conditions.pageNum == 1){
        					$(".left").addClass("disabled");//前一页置灰
        				}
        				if(conditions.pageNum == $scope.pageTotal){
        					$(".right").addClass("disabled");//前一页置灰
        				}
                	}
            	}else{
            		console.debug("模糊查询失败!");
            	}
            });
        }
    }
