/**
 * Created by Administrator on 2017/4/30.
 */
var baseUrl = 'http://localhost:8080/shop';
var baseAdminUrl = 'http://localhost:8080/shop/admin';


var resourceHtml = 'route';

var resourceAdminHtml = baseUrl + '/view/admin';

var staticUserNum = 10;//平台用户统计已百为单位

var pageSize = 10;

//登录检查
var loginCheck = baseUrl + "/user/login.do";

//用户注销
var loginOutUser = baseUrl + "/user/loginOut.do";

var recoverPassword = baseAdminUrl + "/user/recoverPwd.do";

//获取当前登录用户
var getLoginUser = baseUrl + "/user/getLoginUser.do";

var getUserList = baseAdminUrl + "/user/list.do";

var getUserByUserId = baseAdminUrl + "/user/getByUserId.do";

var deleteUser = baseAdminUrl + "/user/del.do";

var getRoleList = baseAdminUrl + "/role/list.do";

var saveRole = baseAdminUrl + "/role/save.do";

var deleteRole = baseAdminUrl + "/role/del.do";

var getRoleByRoleId = baseAdminUrl + "/role/getByRoleId.do";

var updateRole = baseAdminUrl + "/role/update.do";

var getTypeList = baseAdminUrl + "/type/list.do";

var saveType = baseAdminUrl + "/type/save.do";

var deleteType = baseAdminUrl + "/type/del.do";

var getTypeByTypeId = baseAdminUrl + "/type/getByTypeId.do";

var updateType = baseAdminUrl + "/type/update.do";

var getTableList = baseAdminUrl + "/table/list.do";

var getGuideList = baseAdminUrl + "/guide/list.do";

var saveGuide = baseAdminUrl + "/guide/save.do";

var deleteGuide = baseAdminUrl + "/guide/del.do";

var getGuideByGuideId = baseAdminUrl + "/guide/getByGuideId.do";

var updateGuide = baseAdminUrl + "/guide/update.do";

var updateGuideStatus = baseAdminUrl + "/guide/changeStatus.do";

//获取商品列表
var getGoodsList = baseUrl + "/goods/list.do";// 有userid则个人，没有则全部(主页)