var mainApp = angular.module('mainApp', ['ngResource', 'ui.router','angularFileUpload']);
restfulFactory(mainApp);

mainApp.run(function($rootScope , $interval){
    $rootScope.img=["images/img_bg_1.jpg" ,"images/img_bg_2.jpg","images/img_bg_3.jpg"]
    var i = 0;
    var timer = $interval(function(){
        if(i >= $rootScope.img.length){
            i = 0;
        }
        $rootScope.imgSrc = $rootScope.img[i++];
    },3000)
});

mainApp.controller('rootCtrl',['$scope','$state','$rootScope','sessionStorage','extendsResource',function ($scope,$state,$rootScope,sessionStorage,extendsResource) {
    $scope.baseUrl = baseUrl;
    $scope.condition = '';
    $rootScope.$on("refreshBand", function (event, data) {
		getCart();
		getTable(); 
    	getTip();
       	getGuide();
       	
    });
    function getLogin(){
    	extendsResource.extend(getLoginUser).get({},function(data){
        	if(data.loginUser != null){
        		console.log(data.loginUser);
            	$rootScope.loginUser = data.loginUser;
            	console.log($rootScope.loginUser);
            	
    	       
    	       	
    	       	getTip();
    	       	getTable(); 
    	       	getGuide();
    	       	getCart();
            	    
        	    //向下广播模糊查询
        	    $scope.likeSearch = function (conditions) {
        	    	var obj = decodeURI(conditions);
        	    	console.log(obj);
        	        $state.go("goodResult",{conds:obj});
        	        
        	    }
        	}else{
        		 $scope.likeSearch = function (conditions) {
        			 window.location.href = baseUrl + '/view/index.html';
        		 }
        	}
        	 
            $state.go("goods");
        	
            
            $scope.loginOut = function(){
            	extendsResource.extend(loginOutUser).get({},function(data){
//                	$rootScope.$emit("alert",data.message);
//                    if(data.status == 'success'){
//                        $timeout(function(){
                        	window.location.href = baseUrl + "/view/index.html";//跳回登录页
//                        },1500);
//                    }
                });
            }
    	});
    }
    getLogin();
    
    function getTip(){
    	$rootScope.msgNum = 0;
    	var conds = {
	    		userid : $rootScope.loginUser.userId,
	    		mark:"new",
	    		pageNum : ''
	    		}
	 
	    extendsResource.extend(getTipsList).query(conds,function (data) {
	    	if(data.status == 'success'){
	    		for(var i = 0 ; i < data.personTipList.length ; i++){
	    			if(data.personTipList[i].tabList.length != 0){
    	    			$rootScope.msgNum = $rootScope.msgNum + data.personTipList[i].tabList.length;
    	    		}
	    		}
	    	}else{
	    		console.debug("获取未读留言失败！");
	    	}
	    });
    }
    function getTable(){
    	$rootScope.tableNum = 0;  
    	var tConds = {
//	    		status:0,
    			userid:$rootScope.loginUser.userId,
    			mark:'new',
	    		pageNum : ''
    	    }
    	    extendsResource.extend(getTableList).query(tConds,function (data) {
    	        if(data.status == 'success'){
    	        	for(var i = 0 ; i < data.tableList.length ; i++){
	    				$rootScope.tableNum = $rootScope.tableNum + data.tableList[i].tabList.length;
    	    		}
    	    	}else{
    	    		console.debug("获取未读交易单失败！");
    	    	}
    	    });
    }
    function getGuide(){
    	var gCondes = {
    	    	pageNum : 1,
    	    	userId : $rootScope.loginUser.userId,
    	    	mark : 'front_new'
    	    }
    	    extendsResource.extend(getGuides).query(gCondes,function (data) {
    	        if(data.status == 'success'){
    	        	console.log("未读条数");
    	        	console.log(data.guideList);
    	        	$rootScope.guideNum = data.guideList.length;
    	        }else{
    	    		console.debug("获取未读公告申请失败！");
    	    	}
    	    });
    }
    function getCart(){
    	$rootScope.cartNum = 0;
    	var cartConds = {
    	    	userid:$rootScope.loginUser.userId,
    	    	pageNum:1
    	    }
    	    extendsResource.extend(getCartList).query(cartConds,function (data) {
    	        if(data.status == 'success'){
    	        	console.log("未读条数");
    	        	console.log(data.cartList);
    	        	if(data.cartList != null){
    	        		for(var i = 0 ; i < data.cartList.length ; i++){
        	    			if(data.cartList[i].goodList.length != 0){
            	    			$rootScope.cartNum = $rootScope.cartNum + data.cartList[i].goodList.length;
            	    		}
        	    		}
    	        	}else{
    	        		$rootScope.cartNum = 0;
    	        	}
    	        	
    	        }else{
    	    		console.debug("获取购物车物品条数失败！");
    	    	}
    	    });
    }

}]);

mainApp.config(["$stateProvider", "$urlRouterProvider", function ($stateProvider, $urlRouterProvider) {
    //$urlRouterProvider.otherwise('/filesManager');
    $stateProvider
    //商品首页
        .state('goods', {
            url: "/goods",
            templateUrl: prefixHtml + "/good/good.html",
            controller:"goodCtrl"
        })
        //商品详情
        .state('goodDtail', {
            url: "/detail/:goodsId",
            templateUrl: prefixHtml + "/good/goodDetail.html",
            controller:"goodDetailCtrl"
        })
        //查询结果页
        .state('goodResult', {
            url: "/goodResult/:conds",
            templateUrl: prefixHtml + "/good/goodSearchResult.html",
            controller:"goodSearchCtrl"
        })
        //购物车
        .state('cart', {
            url: "/cart",
            templateUrl: prefixHtml + "/good/cart.html",
            controller:"cartCtrl"
        })
        //个人中心
        .state('personCenter',{
            url: "/personCenter/:type",
            templateUrl: prefixHtml + "/user/personCenter.html",
            controller:"personCenterCtrl"
        })
        //个人中心-我的商品
        .state('personCenter.personGoods', {
            url: "/personGoods",
            templateUrl: prefixHtml + "/user/personGoods.html",
            controller:"personGoodsCtrl"
        })
        //商品发布
        .state('personCenter.goodPublish', {
            url: "/goodPublish",
            templateUrl: prefixHtml + "/good/goodPublish.html",
            controller:"goodPublishCtrl"
        })
        //个人中心-我的消息
        .state('personCenter.personTip', {
            url: "/personTip",
            templateUrl: prefixHtml + "/user/personTip.html",
            controller:"personTipCtrl"
        })
        //个人中心-我的公告
        .state('personCenter.personGuide', {
            url: "/personGuide",
            templateUrl: prefixHtml + "/user/personGuide.html",
            controller:"guideCtrl"
        })
        //申请公告
        .state('personCenter.guidePublish', {
            url: "/guidePublish",
            templateUrl: prefixHtml + "/guide/guidePublish.html",
            controller:"guidePublishCtrl"
        })
        //个人中心-我的交易单
        .state('personCenter.personTable', {
            url: "/personTable",
            templateUrl: prefixHtml + "/user/personTable.html",
            controller:"personTableCtrl"
        })
        //个人中心-个人设置
        .state('personCenter.personInfo', {
            url: "/personInfo",
            templateUrl: prefixHtml + "/user/personInfo.html",
            controller:"personInfoCtrl"
        })
        //二手指南
        .state('guide', {
            url: "/guide",
            templateUrl: prefixHtml + "/guide/guide.html",
            controller : "guideCtrl"
        })
}]);
