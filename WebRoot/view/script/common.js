/**
 * Created by sky on 2017/3/14.
 */
mainApp.factory('promptBox',[function () {
    return {
        showAlert : function (status,msg) {
            var type = 'green', btnClass = "btn-green";
            var icon =  'glyphicon-ok-sign';

            if(status && status == 'failed'){
                type = "red";
                btnClass = "btn-red";
                icon =  'glyphicon-info-sign';
            }

            $.alert({
                type: type,
               /* icon: 'glyphicon glyphicon-info-sign',
                titleClass :'',*/
                title: '   ',
                content: '<span class="glyphicon glyphicon-pos ' + icon +'"></span>&nbsp;&nbsp;' + msg ,
                //closeIcon: true,//叉号关闭按钮
                buttons: {
                    ok : {
                        text : '关闭',
                        btnClass: btnClass
                    }
                }
            });
        }
    }
}]).factory('sessionStorage',[function () {
    return {
        put :  function (key,data){
            sessionStorage.setItem(key,data);
        },
        getObj : function (key) {
            return JSON.parse(sessionStorage.getItem(key));
        },
        getStr :function (key) {
            return sessionStorage.getItem(key);
        }
    }
}]).factory('fileReader', ["$q", "$log", function($q, $log){
    var onLoad = function(reader, deferred, scope) {
        return function () {
            scope.$apply(function () {
                deferred.resolve(reader.result);
            });
        };
    };
    var onError = function (reader, deferred, scope) {
        return function () {
            scope.$apply(function () {
                deferred.reject(reader.result);
            });
        };
    };
    var getReader = function(deferred, scope) {
        var reader = new FileReader();
        reader.onload = onLoad(reader, deferred, scope);
        reader.onerror = onError(reader, deferred, scope);
        return reader;
    };
    var readAsDataURL = function (file, scope) {
        var deferred = $q.defer();
        var reader = getReader(deferred, scope);
        reader.readAsDataURL(file);
        return deferred.promise;
    };
    return {
        readAsDataUrl: readAsDataURL
    };
}]);


// 以html格式显示
mainApp.directive('parseHtml', [
    function () {
        return function (scope, element, attr) {
            scope.$watch(attr.parseHtml, function (value) {
                parseDoc(value);
            });

            function parseDoc(value) {
                if (angular.isDefined(value)) {
                    value = trimSpace(value, '&nbsp');
                    value = trimEnter(value);
                    element.html(value);
                }
            }
        };
    }
])
    .directive('setValue',['$timeout',function ($timeout) {
        return {
            scope : { modelValue: '=?setValue'},
            link :function (scope, element, attr, ctrl) {
                element.bind('keyup',function (event) {
                    $timeout(function () {
                        scope.modelValue = element.html();
                        //console.log(scope.modelValue);
                    },0)
                })
            }
        }
    }])
    .directive('fileModel', ['$parse', function ($parse) {
        return {
            restrict: 'A',
            link: function(scope, element, attrs, ngModel) {
                var model = $parse(attrs.fileModel);
                var modelSetter = model.assign;
                element.bind('change', function(event){
                    scope.$apply(function(){
                        modelSetter(scope, element[0].files[0]);
                    });
                    //附件预览
                    scope.file = (event.srcElement || event.target).files[0];
                    scope.getFile();
                });
            }
        };
    }]);

//日期
mainApp.filter('formDay', function () {
        return function (seconds) {
            if (seconds) {
                var d = new Date(seconds);
                var nowDate = new Date();
                var day = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate();
                var nowDay = nowDate.getFullYear() + "/" + (nowDate.getMonth() + 1) + "/" + nowDate.getDate();
                if (day == nowDay) {
                    day = "今天";
                }
                return day;
            }
        };
    })
.filter('formatBr', function () {
    return function (str) {
        if (str) {
            str.replace(/\\n/g,'<br>');
            return str;
        }
    };
})

