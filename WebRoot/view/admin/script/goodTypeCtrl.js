/**
 * Created by Administrator on 2017/4/30.
 */
adminApp.controller("goodTypeCtrl",['$scope','$state','$rootScope','sessionStorage','extendsResource',goodTypeFunc]);

function goodTypeFunc($scope,$state,$rootScope,sessionStorage,extendsResource) {

	$scope.baseurl = baseUrl;
	$scope.pageNum = 1;
	$scope.pageStr = [];
	$scope.typeName = '';
	$scope.conds = {
		pageNum	: $scope.pageNum
	}
	
	function initTypeList(conds){
		extendsResource.extend(getTypeList).query(conds,function(data){
			if(data.status == 'success'){
				$scope.typeList = data.goodTypeList;
				$scope.pageTotal = data.pageTotal;
				for(var i = 1 ; i <= $scope.pageTotal ; i++){
					$scope.pageStr.push(i);
				}
				console.log($scope.pageStr);
			}
		});
		if($scope.pageNum == 1){
			$(".left").addClass("disabled");//前一页置灰
		}
		if($scope.pageNum == $scope.pageTotal){
			$(".right").addClass("disabled");//前一页置灰
		}
		$("#page"+$scope.conds.pageNum).addClass("active");///////////////这句不起作用
	}
	initTypeList($scope.conds);
	
	$scope.pageLeft = function(){
		$scope.conds.pageNum = $scope.pageNum - 1;
		$scope.pageStr = [];
		initTypeList($scope.conds);
	}
	
	$scope.pageRight = function(){
		$scope.conds.pageNum = $scope.pageNum + 1;
		$scope.pageStr = [];
		initTypeList($scope.conds);
	}
	
	$scope.toPage = function(page){
		$scope.conds.pageNum = page;
		$scope.pageStr = [];
		console.log($scope.conds);
		initTypeList($scope.conds);
	}
	
	$scope.addType = function(typeName){
		extendsResource.extend(saveType).save({goodTypeName:typeName},function(data){
			if(data.status == 'success'){
				$scope.pageStr = [];
				initTypeList($scope.conds);
				$scope.TypeName = '';
				$("#addModel").css("visibility", "hidden");
				$(".reveal-modal-bg").css("display","none");
			}
		});
	}
	
	$scope.showDelModel = function(typeid){
		extendsResource.extend(getTypeByTypeId).get({goodTypeId:typeid},function(data){
			if(data.status == 'success'){
				$scope.delType = data.goodTypeInfo;
				console.log($scope.delType);
				$("#delModel").css("visibility", "visible");
				$(".reveal-modal-bg").css("display","block");
			}
		});
	}
	
	$scope.deletType = function(typeid){
		console.log(typeid);
		$scope.delCansle();
		extendsResource.extend(deleteType).get({goodTypeId:typeid},function(data){
			if(data.status == 'success'){
				$scope.pageStr = [];
				initTypeList($scope.conds);
			}
		});
	}
	$scope.delCansle = function(){
		$("#delModel").css("visibility", "hidden");
		$(".reveal-modal-bg").css("display","none");
	}
	
	$scope.getTypeInfo = function(typeid){
		extendsResource.extend(getTypeByTypeId).get({goodTypeId:typeid},function(data){
			if(data.status == 'success'){
				$scope.typeInfo = data.goodTypeInfo;
				console.log($scope.typeInfo);
				$("#infoModel").css("visibility", "visible");
				$(".reveal-modal-bg").css("display","block");
			}
		});
	}
	
	$scope.updateType = function(Type){
		extendsResource.extend(updateType).save(Type,function(data){
			if(data.status == 'success'){
				$("#infoModel").css("visibility", "hidden");
				$(".reveal-modal-bg").css("display","none");
				$scope.pageStr = [];
				initTypeList($scope.conds);
			}
		});
	}
	
	
	$scope.cleanForm = function(){
		$scope.typeName = '';
	}
	
}