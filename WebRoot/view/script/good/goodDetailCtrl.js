/**
\ * Created by zhaoyu on 2017/4/27.
 */
mainApp.controller('goodDetailCtrl',['$scope','$state','$rootScope','$stateParams','extendsResource','$timeout',detailFunc]);

    function detailFunc($scope,$state,$rootScope,$stateParams,extendsResource,$timeout) {
    	$scope.baseUrl = baseUrl;
        var goodid = $stateParams.goodsId;
        $scope.showSubmit = false;
        var imgCount = 0;
        $scope.pageNum = 1;
    	$scope.pageStr = [];
    	$scope.conds = {
    		pageNum	: $scope.pageNum,
    		goodId : goodid
    	}
        
        if($rootScope.loginUser == '' || $rootScope.loginUser == null){
            window.location.href = baseUrl + '/view/index.html';
        }
        
        console.log("goodid="+goodid);
        $scope.info = {
         		fromId : $rootScope.loginUser.userId,//当前登录人的id
         		phone : $rootScope.loginUser.phone,//当前登录人的phone
         		goodId : goodid,
         		userId : ''
         	}
        $scope.newComment = {
    		goodId : goodid,
    		userId : '',
    		msgContent : '',
    		parentMsgId : '',
        }
        //初始化商品详情
        function getDetail(conds) {
            extendsResource.extend(getDetailByGoodsId).get(conds,function (data) {
                if(data.status == 'success'){
                    $scope.goodDetail = data.detail;
                    $scope.goodImgsList = data.goodImgsList;
                    imgCount = $scope.goodImgsList.length;
                    $scope.userInfo = data.userInfo;//拿到卖家信息
                    $scope.message = data.message;//拿到买家留言
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
                    if(imgCount > 0){
                    	$timeout(function(){
                        	$("#demo").jcImgScroll({
                        		arrow : {
                        			width:45,	
                        			height:300,
                        			x:10,
                        			y:0
                        		},
                        		width :400, //设置图片宽度
                        		height:300, //设置图片高度
                        		imgtop:22,//每张图片的上下偏移量
                        		imgleft:-10,//每张图片的左边偏移量
                        		imgwidth:30,//每张图片的宽度偏移量
                        		imgheight:44,//每张图片的高度偏移量
                        		count : imgCount,
                        		offsetX : 10,
                        		NumBtn : false,
                        		title:false,
                        		setZoom:.8,
                        	},500);
                        })
                    }
                    
                }else{
                    console.debug("网络错误,获取失败!");
                }
            });
        }
        getDetail($scope.conds);
        
        /*分页*/
        $scope.pageLeft = function(){
    		$scope.conds.pageNum = $scope.pageNum - 1;
    		$scope.pageStr = [];
    		getDetail($scope.conds);
    	}
    	
    	$scope.pageRight = function(){
    		$scope.conds.pageNum = $scope.pageNum + 1;
    		$scope.pageStr = [];
    		getDetail($scope.conds);
    	}
    	
    	$scope.toPage = function(page,event){
//    		$(event.target).addClass('active');
    		$scope.conds.pageNum = page;
    		$scope.pageStr = [];
    		console.log($scope.conds);
//    		$("#page"+$scope.conds.pageNum).addClass("active");
    		getDetail($scope.conds);
    	}

        //提交评论
        $scope.submitComment = function (comment)
        {
        	console.log("zhaoyuComment");
        	console.log(comment);
            comment.userId = $rootScope.loginUser.userId;
            comment.parentMsgId = 0;
            extendsResource.extend(commentSave).save(comment,function (data) {
                if(data.status == 'success'){
                	$.bootstrapGrowl("评论成功!", {
	                    ele: $("body"), // which element to append to
	                    type: 'success', // (null, 'info', 'error', 'success')
	                    offset: {from: 'top', amount: 150}, // 'top', or 'bottom'
	                    align: 'right', // ('left', 'right', or 'center')
	                    width: 300, // (integer, or 'auto')
	                    delay: 2000,
	                    allow_dismiss: true,
	                    stackup_spacing: 20 // spacing between consecutively stacked growls.
	                });
                	$scope.pageStr = [];
                    getDetail($scope.conds);
                    $scope.newComment.msgContent = '';
                }else{
                	console.debug("网络错误,评论失败!");
                }
            });
        };
        
        $scope.delComment = function(msgid){
        	 extendsResource.extend(commentDel).get({msgId:msgid},function (data) {
                 if(data.status == 'success'){
                 	$.bootstrapGrowl("删除成功!", {
 	                    ele: $("body"), // which element to append to
 	                    type: 'success', // (null, 'info', 'error', 'success')
 	                    offset: {from: 'top', amount: 150}, // 'top', or 'bottom'
 	                    align: 'right', // ('left', 'right', or 'center')
 	                    width: 300, // (integer, or 'auto')
 	                    delay: 2000,
 	                    allow_dismiss: true,
 	                    stackup_spacing: 20 // spacing between consecutively stacked growls.
 	                });
                 	$scope.pageStr = [];
                     getDetail($scope.conds);
                     $scope.newComment.msgContent = '';
                     $rootScope.$emit("refreshBand", {type:'cart'});
                 }else{
                 	console.debug("网络错误,评论失败!");
                 }
             });
        }
        
        //交易单弹出前检查
        $scope.checkTable = function(){
        	//检查该用户是否有未处理的交易单
	    	extendsResource.extend(tableCheck).get({fromId : $rootScope.loginUser.userId, goodId : goodid},function (data) {
	    		if(data.status == 'success'){
	    			$scope.showSubmit = true;
	    			$.bootstrapGrowl("您有未处理的交易单!", {
	                    ele: $("body"), // which element to append to
	                    type: 'success', // (null, 'info', 'error', 'success')
	                    offset: {from: 'top', amount: 150}, // 'top', or 'bottom'
	                    align: 'right', // ('left', 'right', or 'center')
	                    width: 300, // (integer, or 'auto')
	                    delay: 2000,
	                    allow_dismiss: true,
	                    stackup_spacing: 20 // spacing between consecutively stacked growls.
	                });
	    			console.debug("您有未处理的交易单!");
	    		}else{
	    			$(".dealModal").modal("show");
	    		}
	    	});
        }
        
        //添加到购物车
        $scope.addToCart = function(status){
        	var cartInfo = {
        		userId : $rootScope.loginUser.userId,
        		goodId : goodid,
        		num : 1,
        		total : $scope.goodDetail.goodObj.price
        	}
        	if(status == 2){
        		$.bootstrapGrowl("该商品已被人抢先预定了咯!", {
                    ele: $("body"), // which element to append to
                    type: 'success', // (null, 'info', 'error', 'success')
                    offset: {from: 'top', amount: 150}, // 'top', or 'bottom'
                    align: 'right', // ('left', 'right', or 'center')
                    width: 300, // (integer, or 'auto')
                    delay: 2000,
                    allow_dismiss: true,
                    stackup_spacing: 20 // spacing between consecutively stacked growls.
                });
        	}else{
        		extendsResource.extend(addCart).save(cartInfo,function (data) {
    	            if(data.status == 'success'){
    	            	$.bootstrapGrowl("添加成功!", {
    	                    ele: $("body"), // which element to append to
    	                    type: 'success', // (null, 'info', 'error', 'success')
    	                    offset: {from: 'top', amount: 150}, // 'top', or 'bottom'
    	                    align: 'right', // ('left', 'right', or 'center')
    	                    width: 300, // (integer, or 'auto')
    	                    delay: 2000,
    	                    allow_dismiss: true,
    	                    stackup_spacing: 20 // spacing between consecutively stacked growls.
    	                });
    	            	$scope.$emit("refreshBand", {type:'cart'});
    	            	$state.go("cart");
    	            }else{
    	            	console.debug("提交失败");
    	            }
    	        });
        	}
        }
        
        //交易单提交方法
        $scope.addTable = function () {
        	$scope.info.userId = $scope.userInfo.userId;
	    	console.log($scope.info);
	    	extendsResource.extend(tableSave).save($scope.info,function (data) {
	            if(data.status == 'success'){
	            	$.bootstrapGrowl("提交成功!", {
	                    ele: $("body"), // which element to append to
	                    type: 'success', // (null, 'info', 'error', 'success')
	                    offset: {from: 'top', amount: 150}, // 'top', or 'bottom'
	                    align: 'right', // ('left', 'right', or 'center')
	                    width: 300, // (integer, or 'auto')
	                    delay: 2000,
	                    allow_dismiss: true,
	                    stackup_spacing: 20 // spacing between consecutively stacked growls.
	                });
	                $(".dealModal").modal("hide");
//	                window.location.href = baseUrl + "/view/main.html#/personCenter/table";//跳回登录页
	                $timeout(function(){
	                	$state.go("personCenter",{type:'table'});
	                },1000)
	                $scope.$emit("refreshBand", {type:'cart'});
	            }else{
	            	console.debug("提交失败");
	            }
	        });
        }
        $scope.cansleTable = function(){
        	$(".dealModal").modal("hide");
        }
    }
