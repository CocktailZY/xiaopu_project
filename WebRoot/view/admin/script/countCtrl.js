/**
 * Created by Administrator on 2017/4/30.
 */
adminApp.controller("countCtrl",['$scope','$state','$rootScope','sessionStorage','extendsResource','$timeout',countFunc]);

function countFunc($scope,$state,$rootScope,sessionStorage,extendsResource,$timeout) {
    var usernum = 0;
    
    function countUser(){
    	extendsResource.extend(getUserList).query(function(data){
    		if(data.status == 'success'){
    			$scope.userNum = data.allUser.length;
    		}
    	});
    }
    countUser();
    
    function countTable(){
    	var tablenum = 0;
    	extendsResource.extend(getTableList).query({status:1},function(data){
    		if(data.status == 'success'){
    			for(var i = 0 ; i < data.tableList.length ; i++){
    				for(var j = 0 ; j < data.tableList[i].tabList.length ; j++){
    					tablenum = tablenum + data.tableList[i].tabList[j].goodList.length;
    				}
    			}
    			console.log("tablenum");
    			$scope.tablenum = tablenum;
    			console.log($scope.tablenum);
    			
    			
    			var total = 0;
    	    	extendsResource.extend(getTableList).query({},function(data){
    				if(data.status == 'success'){
    					for(var k = 0 ; k < data.tableList.length ; k++){
    						for(var h = 0 ; h < data.tableList[k].tabList.length ; h++){
    							total = total + data.tableList[k].tabList[h].goodList.length;
    	    				}
    	    			}
    					console.log("total");
    					$scope.total = total;
    					console.log($scope.total);
    					
    					
    					$scope.percent = ( parseFloat($scope.tablenum) / parseFloat($scope.total) )*100;
    			    	console.log($scope.percent);
    					
    				}else{
    					alert("获取统计数据失败!");
    				}
    			});
    			
    		}
    	});
    	
    }
    countTable();
    
//    function countTableAll(){
//    	var total = 0;
//    	extendsResource.extend(getTableList).query({},function(data){
//			if(data.status == 'success'){
//				for(var k = 0 ; k < data.tableList.length ; k++){
//					for(var h = 0 ; h < data.tableList[k].tabList.length ; h++){
//						total = total + data.tableList[k].tabList[h].goodList.length;
//    				}
//    			}
//				console.log("total");
//				$scope.total = total;
//				console.log($scope.total);
//			}else{
//				alert("获取统计数据失败!");
//			}
//		});
//    }
}