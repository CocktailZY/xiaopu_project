mainApp.controller('personTableCtrl', [ '$scope', '$state', '$rootScope',
		'$stateParams', 'extendsResource', personTableFunc ]);

function personTableFunc($scope, $state, $rootScope, $stateParams,
		extendsResource) {
	$scope.showOpt = true;
	if($rootScope.loginUser == '' || $rootScope.loginUser == null){
	     window.location.href = baseUrl + '/view/index.html';
	 }
	
	var userid = $rootScope.loginUser.userId;
	$scope.baseurl = baseUrl;
	$scope.pageNum = 1;
	$scope.pageStr = [];
	$scope.roleName = '';
	$scope.conds = {
		pageNum	: $scope.pageNum
	}
	// 获取交易单列表
	$scope.getPersonTable = function(conds) {
		extendsResource.extend(getTableList).query(conds, function(data) {
			if (data.status == 'success') {
				$scope.personTables = data.tableList;
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
				console.log($scope.showOpt);
				console.log($scope.personTables);
			} else {
				$.bootstrapGrowl("获取失败!", {
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
		});
	}
	$scope.pageLeft = function(){
		$scope.conds.pageNum = $scope.pageNum - 1;
		$scope.pageStr = [];
		$scope.getPersonTable($scope.conds);
	}
	
	$scope.pageRight = function(){
		$scope.conds.pageNum = $scope.pageNum + 1;
		$scope.pageStr = [];
		$scope.getPersonTable($scope.conds);
	}
	
	$scope.toPage = function(page,event){
//		$(event.target).addClass('active');
		$scope.conds.pageNum = page;
		$scope.pageStr = [];
		console.log($scope.conds);
//		$("#page"+$scope.conds.pageNum).addClass("active");
		$scope.getPersonTable($scope.conds);
	}

	$scope.toogle = function(byTime) {
		for ( var i = 0; i < $scope.personTables.length; i++) {
			if ($scope.personTables[i].byTime == byTime) {
				$scope.personTables[i].show = !$scope.personTables[i].show;
			}
		}
	}

	// 确认交易单
	$scope.confirmTable = function(tableId) {
		extendsResource.extend(comfirmTable).save({
			tableId : tableId,
			status : 1
		}, function(data) {
			if (data.status == 'success') {
				$scope.getOtherTable();
				$rootScope.$emit("refreshBand", {type:'cart'});
			} else {
				alert("修改状态失败!");
			}
		});
	}
	
	$scope.getMyTable = function (){
		$scope.showOpt = false;
		var conds = {
				pageNum	: $scope.pageNum,
				fromid : userid
			}
		$scope.pageStr = [];
		extendsResource.extend(getMyTableList).query(conds, function(data) {
			if (data.status == 'success') {
				$scope.personTables = data.tableList;
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
				console.log($scope.showOpt);
				console.log($scope.pageStr);
				if($scope.conds.pageNum == 1){
					$(".left").addClass("disabled");//前一页置灰
				}
				if($scope.conds.pageNum == $scope.pageTotal){
					$(".right").addClass("disabled");//前一页置灰
				}
				console.log($scope.personTables);
			} else {
				alert("获取交易单列表失败!");
			}
		});
	}
	
	$scope.getOtherTable = function(){
		$scope.showOpt = true;
		var conds = {
			pageNum	: $scope.pageNum,
			userid : userid,
			fromid : userid
		}
		$scope.pageStr = [];
		$scope.getPersonTable(conds);
	}
	$scope.getOtherTable();
	
	$scope.cansleTable = function(tabId){
		extendsResource.extend(cansleStatus).save({
			tableId : tabId
		}, function(data) {
			console.log(data);
			if (data.status == 'success') {
				$scope.getOtherTable();
				$rootScope.$emit("refreshBand", {type:'cart'});
			} else {
				alert("修改状态失败!");
			}
		});
	}

}