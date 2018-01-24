/**
 * Created by sky on 2017/3/15.
 */
var baseUrl = "http://localhost:8080/shop";

var prefixHtml = "route";

// 分页
var page_size = 5;// 每页显示条数

// 登录检查
var loginCheck = baseUrl + "/user/login.do";

// 获取当前登录用户
var getLoginUser = baseUrl + "/user/getLoginUser.do";

// 用户注销
var loginOutUser = baseUrl + "/user/loginOut.do";

// 用户注册
var registUser = baseUrl + "/user/regist.do";

// 获取全部类型
var listGoodType = baseUrl + "/goodType/list.do";

// 获取商品详情
var getDetailByGoodsId = baseUrl + "/goods/getDetailByGoodsId.do";

// 新增商品
var goodSave = baseUrl + "/goods/save.do";

// 修改商品
var goodUpdate = baseUrl + "/goods/update.do";

// 删除商品
var goodDel = baseUrl + "/goods/delete.do";

// 添加商品图片
var goodImgSave = baseUrl + "/goodImg/save.do";

// 新增留言
var commentSave = baseUrl + "/msg/save.do";

// 模糊查询
var goodLikeSearch = baseUrl + "/goods/mohu.do";

// 获取商品列表
var getGoodsList = baseUrl + "/goods/list.do";// 有userid则个人，没有则全部(主页)

// 获取商品图片列表
var getGoodImgsLsit = baseUrl + "/goodImg/list.do";

// 获取消息列表
var getTipsList = baseUrl + "/tip/list.do";

// 置为全部已读
var allReadTip = baseUrl + "/tip/updateAllRead.do";

// 获取交易单列表
var getTableList = baseUrl + "/table/list.do";// 有userid则个人，没有则全部(后台)

//获取个人交易单列表
var getMyTableList = baseUrl + "/table/listMy.do";// 有userid则个人，没有则全部(后台)

// 修改交易单状态
var comfirmTable = baseUrl + "/table/comfirmTable.do";

// 取消订单
var cansleStatus = baseUrl + "/table/cansleStatus.do";

// 检查该用户是否有未处理的交易单
var tableCheck = baseUrl + "/table/tableCheck.do";

// 根据userid获取用户信息
var getUserInfoByUserId = baseUrl + "/user/getInfoByUserId.do";

// 修改用户
var updateUserInfo = baseUrl + "/user/updateUserInfo.do";

// 获取二手指南
var getGuides = baseUrl + "/admin/guide/list.do";

// 指南申请
var saveGuides = baseUrl + "/admin/guide/save.do";

// 删除申请
var delGuides = baseUrl + "/admin/guide/del.do";

// 标为已读
var allReadGuide = baseUrl + "/admin/guide/allReadGuide.do";

// 提交交易单
var tableSave = baseUrl + "/table/save.do";

// 提交购物车交易单
var tableSaveCart = baseUrl + "/table/saveCart.do";

// 加入购物车
var addCart = baseUrl + "/cart/save.do";

// 获取购物车list
var getCartList = baseUrl + "/cart/list.do";

// 更新数量和总价
var updateNumCart = baseUrl + "/cart/update.do";

// 移除购物车
var deleteCart = baseUrl + "/cart/delete.do";
// 移除购物车全部
var deleteCartIds = baseUrl + "/cart/deleteCartIds.do";

/*
 * 后台路径
 */

// 获取商品留言
var commentList = baseUrl + '/goodDetail/commentList.do';

var commentDel = baseUrl + '/msg/delete.do';