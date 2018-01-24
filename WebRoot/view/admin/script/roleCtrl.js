/**
 * Created by Administrator on 2017/4/30.
 */
adminApp.controller("roleCtrl",['$scope','$state','$rootScope','sessionStorage','extendsResource',roleFunc]);

function roleFunc($scope,$state,$rootScope,sessionStorage,extendsResource) {
	$scope.baseurl = baseUrl;
	$scope.pageNum = 1;
	$scope.pageStr = [];
	$scope.roleName = '';
	$scope.conds = {
		pageNum	: $scope.pageNum
	}
	
	function initRoleList(conds){
		extendsResource.extend(getRoleList).query(conds,function(data){
			if(data.status == 'success'){
				$scope.roleList = data.roleList;
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
	initRoleList($scope.conds);
	
	$scope.pageLeft = function(){
		$scope.conds.pageNum = $scope.pageNum - 1;
		$scope.pageStr = [];
		initRoleList($scope.conds);
	}
	
	$scope.pageRight = function(){
		$scope.conds.pageNum = $scope.pageNum + 1;
		$scope.pageStr = [];
		initRoleList($scope.conds);
	}
	
	$scope.toPage = function(page,event){
//		$(event.target).addClass('active');
		$scope.conds.pageNum = page;
		$scope.pageStr = [];
		console.log($scope.conds);
//		$("#page"+$scope.conds.pageNum).addClass("active");
		initRoleList($scope.conds);
	}
	
	$scope.addRole = function(roleName){
		extendsResource.extend(saveRole).save({roleName:roleName},function(data){
			if(data.status == 'success'){
				$scope.pageStr = [];
				initRoleList($scope.conds);
				$scope.roleName = '';
				$("#addModel").css("visibility", "hidden");
				$(".reveal-modal-bg").css("display","none");
			}
		});
	}
	
	$scope.showDelModel = function(roleid){
		extendsResource.extend(getRoleByRoleId).get({roleId:roleid},function(data){
			if(data.status == 'success'){
				$scope.delRole = data.roleInfo;
				console.log($scope.delRole);
				$("#delModel").css("visibility", "visible");
				$(".reveal-modal-bg").css("display","block");
			}
		});
	}
	
	$scope.deletRole = function(roleid){
		console.log(roleid);
		$scope.delCansle();
		extendsResource.extend(deleteRole).get({roleId:roleid},function(data){
			if(data.status == 'success'){
				$scope.pageStr = [];
				initRoleList($scope.conds);
			}
		});
	}
	$scope.delCansle = function(){
		$("#delModel").css("visibility", "hidden");
		$(".reveal-modal-bg").css("display","none");
	}
	
	$scope.getRoleInfo = function(roleid){
		extendsResource.extend(getRoleByRoleId).get({roleId:roleid},function(data){
			if(data.status == 'success'){
				$scope.roleInfo = data.roleInfo;
				console.log($scope.roleInfo);
				$("#infoModel").css("visibility", "visible");
				$(".reveal-modal-bg").css("display","block");
			}
		});
	}
	
	$scope.updateRole = function(role){
		extendsResource.extend(updateRole).save(role,function(data){
			if(data.status == 'success'){
				$("#infoModel").css("visibility", "hidden");
				$(".reveal-modal-bg").css("display","none");
				$scope.pageStr = [];
				initRoleList($scope.conds);
			}
		});
	}
	
	$scope.cleanForm = function(){
		$scope.roleName = '';
	}
}