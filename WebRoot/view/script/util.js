/**
 * Created by sky on 2017/3/14.
 */
//获取路径上的参数  和  url
var Util = {
    queryString : function(val) {
        var uri = decodeURI(window.location.search, "UTF-8");
        var re = new RegExp("" + val + "=([^&?]*)", "ig");
        return ((uri.match(re)) ? (uri.match(re)[0].substr(val.length + 1))
            : null);
    },
    getLocalHostPath : function () {
        var curWwwPath = window.document.location.href;
        var pathName = window.document.location.pathname;
        var pos = curWwwPath.indexOf(pathName);
        var localhostPath = curWwwPath.substring(0, pos);
        return localhostPath;
    },
    getDomain : function () {
        var curWwwPath = window.document.location.href;
        var pathName = window.document.location.pathname;
        var pos = curWwwPath.indexOf(pathName);
        var localhostPath = curWwwPath.substring(0, pos);
        return localhostPath.replace('http://','').replace('https://','');
    }
}


//转义<>
var trimSymbol = function (text) {
    text = text.replace(/</g, "&lt;");
    text = text.replace(/>/g, "&gt;");
    return text;
};
// 去空格
var trimSpace = function (text, tag) {
    if (text) {
        if (!tag) {
            tag = "";
        }
        text = text.replace(/\s\s/g, tag + tag);
    }
    return text;
};
// 将\n替换为<br>
var trimEnter = function (text) {
    text = text.replace(/\n/g, "<br>");
    return text;
};

function removeHttp(str) {
    return str.replace('http://','').replace('https://','');
}