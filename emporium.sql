/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50537
Source Host           : localhost:3306
Source Database       : emporium

Target Server Type    : MYSQL
Target Server Version : 50537
File Encoding         : 65001

Date: 2018-09-19 09:18:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address` (
  `add_id` int(11) NOT NULL AUTO_INCREMENT,
  `add_tel` varchar(32) NOT NULL,
  `add_name` varchar(32) NOT NULL,
  `address` varchar(200) NOT NULL,
  `add_userId` int(11) NOT NULL,
  `add_state` int(11) NOT NULL,
  PRIMARY KEY (`add_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_address
-- ----------------------------
INSERT INTO `t_address` VALUES ('1', '15849994576', '赵昱', '江苏省,镇江市,京口区,123456test', '6', '1');
INSERT INTO `t_address` VALUES ('2', '15849994576', '李旭', '山东省,聊城市,冠县,test22222', '6', '0');

-- ----------------------------
-- Table structure for t_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(32) NOT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_brand
-- ----------------------------
INSERT INTO `t_brand` VALUES ('1', '其他');
INSERT INTO `t_brand` VALUES ('2', '李宁');
INSERT INTO `t_brand` VALUES ('3', '361度');
INSERT INTO `t_brand` VALUES ('4', '苹果');

-- ----------------------------
-- Table structure for t_bulletion
-- ----------------------------
DROP TABLE IF EXISTS `t_bulletion`;
CREATE TABLE `t_bulletion` (
  `bu_id` int(11) NOT NULL AUTO_INCREMENT,
  `bu_content` varchar(20) NOT NULL,
  `bu_start` varchar(32) DEFAULT NULL,
  `bu_end` varchar(32) DEFAULT NULL,
  `bu_category` int(1) NOT NULL,
  `bu_state` int(1) NOT NULL,
  `bu_shopId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bulletion
-- ----------------------------
INSERT INTO `t_bulletion` VALUES ('1', '商城国庆大促销', '2018-10-01 00:00:00', '2018-10-07 23:59:59', '0', '0', null);
INSERT INTO `t_bulletion` VALUES ('2', '活动二@中秋月饼全部五折', '2018-09-15 06:00:00', '2018-09-15 23:00:00', '1', '1', '1');
INSERT INTO `t_bulletion` VALUES ('3', '阿迪达斯@新款上市，全部九折！', '2018-10-01 00:00:00', '2018-10-07 23:59:59', '1', '1', '3');
INSERT INTO `t_bulletion` VALUES ('4', '商城国庆大促销', '2018-10-01 00:00:00', '2018-10-07 23:59:59', '0', '0', null);
INSERT INTO `t_bulletion` VALUES ('5', '商城国庆大促销', '2018-10-01 00:00:00', '2018-10-07 23:59:59', '0', '0', null);
INSERT INTO `t_bulletion` VALUES ('6', '活动一@全部商品大促销', '2018-09-15 12:00:00', '2018-09-16 12:00:00', '0', '0', null);
INSERT INTO `t_bulletion` VALUES ('7', '阿迪达斯@新款上市，全部九折！', '2018-10-01 00:00:00', '2018-10-07 23:59:59', '0', '0', null);
INSERT INTO `t_bulletion` VALUES ('8', '活动一@全部商品大促销', '2018-09-15 12:00:00', '2018-09-16 12:00:00', '0', '0', null);
INSERT INTO `t_bulletion` VALUES ('9', '活动二@中秋月饼全部五折', '2018-09-15 06:00:00', '2018-09-15 23:00:00', '0', '0', null);
INSERT INTO `t_bulletion` VALUES ('10', '阿迪达斯@新款上市，全部九折！', '2018-10-01 00:00:00', '2018-10-07 23:59:59', '0', '0', null);
INSERT INTO `t_bulletion` VALUES ('11', '活动一@全部商品大促销', '2018-09-15 12:00:00', '2018-09-16 12:00:00', '0', '0', null);
INSERT INTO `t_bulletion` VALUES ('12', '活动一@全部商品大促销', '2018-09-15 12:00:00', '2018-09-16 12:00:00', '0', '2', null);
INSERT INTO `t_bulletion` VALUES ('13', '阿迪达斯@新款上市，全部九折！', '2018-10-01 00:00:00', '2018-10-07 23:59:59', '0', '0', null);
INSERT INTO `t_bulletion` VALUES ('14', '商城国庆大促销', '2018-10-01 00:00:00', '2018-10-07 23:59:59', '0', '0', null);

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_num` varchar(32) NOT NULL,
  `c_createTime` varchar(32) DEFAULT NULL,
  `c_productId` int(11) NOT NULL,
  `c_userId` int(11) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cart
-- ----------------------------

-- ----------------------------
-- Table structure for t_closeshop
-- ----------------------------
DROP TABLE IF EXISTS `t_closeshop`;
CREATE TABLE `t_closeshop` (
  `cs_id` int(11) NOT NULL AUTO_INCREMENT,
  `cs_content` varchar(200) NOT NULL,
  `cs_state` int(1) NOT NULL,
  `cs_userId` int(11) NOT NULL,
  PRIMARY KEY (`cs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_closeshop
-- ----------------------------

-- ----------------------------
-- Table structure for t_comments
-- ----------------------------
DROP TABLE IF EXISTS `t_comments`;
CREATE TABLE `t_comments` (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT,
  `comm_content` varchar(200) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `comm_productId` int(11) NOT NULL,
  `comm_time` varchar(32) NOT NULL,
  `comm_userId` int(11) DEFAULT NULL,
  `comm_star` int(11) NOT NULL,
  `s_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comments
-- ----------------------------
INSERT INTO `t_comments` VALUES ('1', '19941108买家评价19941108追加评价', '0', '15', '2018-09-12', '1', '-1', '1');
INSERT INTO `t_comments` VALUES ('2', '谢谢亲的好评！！！欢迎再次光临本小店', '1', '15', '2018-09-13', '111', '0', '1');
INSERT INTO `t_comments` VALUES ('3', '19941109又一个买家评价19941109又一个追加评价', '0', '14', '2018-09-14', '1', '1', '1');
INSERT INTO `t_comments` VALUES ('5', '19941110又来了买家评价19941110又来了追加评价', '0', '14', '2018-09-15', '1', '2', '1');
INSERT INTO `t_comments` VALUES ('6', '回复测试', '3', '14', '2018-09-15 10:32:45', '404', '1', '1');

-- ----------------------------
-- Table structure for t_complaint
-- ----------------------------
DROP TABLE IF EXISTS `t_complaint`;
CREATE TABLE `t_complaint` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT,
  `co_title` varchar(64) NOT NULL,
  `co_content` varchar(200) NOT NULL,
  `co_username` varchar(32) NOT NULL,
  `co_creattime` varchar(64) NOT NULL,
  `co_state` int(1) NOT NULL,
  `co_userId` int(11) NOT NULL,
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_complaint
-- ----------------------------
INSERT INTO `t_complaint` VALUES ('1', '投诉1', 'test1', 'zy', '123456', '0', '3');
INSERT INTO `t_complaint` VALUES ('2', '投诉2', 'test2', 'zy', '123456', '1', '3');
INSERT INTO `t_complaint` VALUES ('3', '投诉3', 'test3', 'zy', '123456', '2', '3');
INSERT INTO `t_complaint` VALUES ('4', '投诉4', 'test4', 'wac', '123123123', '0', '2');

-- ----------------------------
-- Table structure for t_favorites
-- ----------------------------
DROP TABLE IF EXISTS `t_favorites`;
CREATE TABLE `t_favorites` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_shopId` int(11) NOT NULL,
  `f_productId` int(11) NOT NULL,
  `f_userId` int(11) NOT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for t_history
-- ----------------------------
DROP TABLE IF EXISTS `t_history`;
CREATE TABLE `t_history` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_productId` int(11) NOT NULL,
  `h_userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_history
-- ----------------------------

-- ----------------------------
-- Table structure for t_images
-- ----------------------------
DROP TABLE IF EXISTS `t_images`;
CREATE TABLE `t_images` (
  `im_id` int(11) NOT NULL AUTO_INCREMENT,
  `im_address` varchar(200) NOT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`im_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_images
-- ----------------------------
INSERT INTO `t_images` VALUES ('1', 'aa.png', '1');
INSERT INTO `t_images` VALUES ('2', 'bb.png', '2');
INSERT INTO `t_images` VALUES ('3', 'cc.png', '3');
INSERT INTO `t_images` VALUES ('4', 'dd.png', '4');
INSERT INTO `t_images` VALUES ('5', 'ee.png', '5');
INSERT INTO `t_images` VALUES ('6', 'ff.png', '6');
INSERT INTO `t_images` VALUES ('7', 'gg.png', '7');
INSERT INTO `t_images` VALUES ('8', 'hh.png', '8');
INSERT INTO `t_images` VALUES ('9', 'ii.png', '9');
INSERT INTO `t_images` VALUES ('10', 'jj.png', '10');
INSERT INTO `t_images` VALUES ('11', 'kk.png', '11');
INSERT INTO `t_images` VALUES ('12', 'qq.png', '12');
INSERT INTO `t_images` VALUES ('13', 'mm.png', '13');
INSERT INTO `t_images` VALUES ('14', 'yy.png', '14');
INSERT INTO `t_images` VALUES ('15', '数据库字典.png', '15');

-- ----------------------------
-- Table structure for t_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_orderdetail`;
CREATE TABLE `t_orderdetail` (
  `od_id` int(11) NOT NULL AUTO_INCREMENT,
  `od_num` varchar(32) NOT NULL,
  `od_total` varchar(32) NOT NULL,
  `od_orderId` int(11) NOT NULL,
  `od_productId` int(11) NOT NULL,
  `ps_id` int(11) NOT NULL,
  `comm_state` int(11) NOT NULL,
  PRIMARY KEY (`od_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderdetail
-- ----------------------------
INSERT INTO `t_orderdetail` VALUES ('1', '20', '200', '1', '44', '14', '1');
INSERT INTO `t_orderdetail` VALUES ('2', '30', '45245', '1', '44', '15', '2');

-- ----------------------------
-- Table structure for t_orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_orderinfo`;
CREATE TABLE `t_orderinfo` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_stime` varchar(32) NOT NULL,
  `o_state` int(1) NOT NULL,
  `o_total` varchar(32) NOT NULL,
  `o_ftime` varchar(32) NOT NULL,
  `o_userId` int(11) NOT NULL,
  `o_shopId` int(11) NOT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderinfo
-- ----------------------------
INSERT INTO `t_orderinfo` VALUES ('1', '2018-09-11', '1', '321315', '2018-09-15', '1', '1');
INSERT INTO `t_orderinfo` VALUES ('2', '2018-09-11', '1', '651321', '2018-09-11', '1', '1');
INSERT INTO `t_orderinfo` VALUES ('3', '2018-09-11', '1', '65461', '2018-09-11', '1', '1');
INSERT INTO `t_orderinfo` VALUES ('4', '2018-09-11', '0', '53161', '2018-09-11', '1', '1');
INSERT INTO `t_orderinfo` VALUES ('5', '2018-09-11', '0', '56451', '2018-09-11', '1', '1');
INSERT INTO `t_orderinfo` VALUES ('6', '2018-09-11', '2', '684661', '2018-09-11', '1', '1');

-- ----------------------------
-- Table structure for t_power
-- ----------------------------
DROP TABLE IF EXISTS `t_power`;
CREATE TABLE `t_power` (
  `po_id` int(11) NOT NULL AUTO_INCREMENT,
  `po_name` varchar(32) NOT NULL,
  `parentId` int(11) NOT NULL,
  `url` varchar(64) NOT NULL,
  PRIMARY KEY (`po_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_power
-- ----------------------------
INSERT INTO `t_power` VALUES ('1', '系统管理', '0', '#');
INSERT INTO `t_power` VALUES ('2', '用户管理', '0', 'user');
INSERT INTO `t_power` VALUES ('3', '角色管理', '10', 'role/list.do');
INSERT INTO `t_power` VALUES ('4', '权限管理', '10', 'power/list.do');
INSERT INTO `t_power` VALUES ('5', '店铺管理', '0', '#');
INSERT INTO `t_power` VALUES ('6', '商品类型管理', '5', 'productType/list.do');
INSERT INTO `t_power` VALUES ('7', '类型规格管理', '5', 'typeSpecs/list.do');
INSERT INTO `t_power` VALUES ('8', '公告管理', '0', 'bulletion');
INSERT INTO `t_power` VALUES ('9', '投诉管理', '0', 'complaint');
INSERT INTO `t_power` VALUES ('10', '角色&权限', '0', '#');
INSERT INTO `t_power` VALUES ('11', '店铺状态管理', '5', 'shop/list.do');
INSERT INTO `t_power` VALUES ('12', '管理员管理', '1', 'user/listAdmin.do');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(64) NOT NULL,
  `p_content` varchar(200) NOT NULL,
  `p_discount` varchar(32) DEFAULT NULL,
  `p_onTime` varchar(32) DEFAULT NULL,
  `p_new` int(1) NOT NULL,
  `p_special` int(1) NOT NULL,
  `p_onState` int(1) NOT NULL,
  `p_typeId` int(11) NOT NULL,
  `p_shopId` int(11) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '短衫', '新品', '0.95', '2018-09-07 09:13:34', '0', '0', '1', '2', '1');
INSERT INTO `t_product` VALUES ('2', '短裤', '新品', '0.99', '2018-09-07 09:13:34', '0', '0', '1', '3', '1');
INSERT INTO `t_product` VALUES ('3', '长袖', '新品', null, '2018-09-07 09:13:34', '0', '0', '1', '2', '1');
INSERT INTO `t_product` VALUES ('4', '连衣裙', '新品', null, '2018-09-07 09:13:34', '0', '0', '1', '2', '1');
INSERT INTO `t_product` VALUES ('5', '短衫', '新品', null, '2018-09-07 09:13:34', '0', '0', '1', '3', '1');
INSERT INTO `t_product` VALUES ('6', '短裤', '新品', null, '2018-09-07 09:13:34', '0', '0', '1', '2', '1');
INSERT INTO `t_product` VALUES ('7', '短衣裙', '旧款', '0.85', '2018-09-07 09:13:34', '0', '0', '1', '3', '1');
INSERT INTO `t_product` VALUES ('9', '背心', '旧款', '0.95', '2018-09-07 09:13:34', '0', '0', '1', '2', '1');
INSERT INTO `t_product` VALUES ('10', '手机', '旧款', '0.85', '2018-09-07 09:13:34', '0', '0', '1', '1', '1');
INSERT INTO `t_product` VALUES ('11', '电脑', '旧款', '0.85', '2018-09-07 09:13:34', '0', '0', '1', '1', '1');
INSERT INTO `t_product` VALUES ('12', 'ipad', '旧款', '0.85', '2018-09-08 09:33:54', '0', '0', '1', '1', '1');
INSERT INTO `t_product` VALUES ('13', '刷子', '旧款', '0.85', '2018-09-08 09:33:54', '0', '0', '1', '1', '1');
INSERT INTO `t_product` VALUES ('14', '苹果', '新品', null, '2018-09-08 09:33:54', '1', '0', '1', '1', '1');
INSERT INTO `t_product` VALUES ('15', '联想', '旧款', null, '2018-09-08 09:33:54', '0', '0', '1', '1', '1');

-- ----------------------------
-- Table structure for t_producttype
-- ----------------------------
DROP TABLE IF EXISTS `t_producttype`;
CREATE TABLE `t_producttype` (
  `pt_id` int(11) NOT NULL AUTO_INCREMENT,
  `pt_name` varchar(32) NOT NULL,
  `parentId` int(11) NOT NULL,
  `childId` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `delflag` int(1) NOT NULL,
  PRIMARY KEY (`pt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_producttype
-- ----------------------------
INSERT INTO `t_producttype` VALUES ('1', '手机', '0', '1', '1', '0');
INSERT INTO `t_producttype` VALUES ('2', '地方', '1', '0', '2', '0');
INSERT INTO `t_producttype` VALUES ('3', '电视', '1', '0', '2', '0');
INSERT INTO `t_producttype` VALUES ('4', '服装', '0', '1', '1', '0');
INSERT INTO `t_producttype` VALUES ('5', '上衣', '4', '1', '2', '0');
INSERT INTO `t_producttype` VALUES ('6', '裤子', '4', '0', '2', '0');
INSERT INTO `t_producttype` VALUES ('7', '半袖', '5', '0', '3', '0');
INSERT INTO `t_producttype` VALUES ('8', '长袖', '5', '0', '3', '0');
INSERT INTO `t_producttype` VALUES ('10', '增加一级类型测试', '0', '0', '1', '0');
INSERT INTO `t_producttype` VALUES ('11', '增加二级类型测试', '10', '1', '2', '0');
INSERT INTO `t_producttype` VALUES ('12', '增加三级类型测试', '11', '0', '3', '0');
INSERT INTO `t_producttype` VALUES ('13', '食品', '0', '1', '1', '0');
INSERT INTO `t_producttype` VALUES ('14', '游戏', '0', '1', '1', '0');
INSERT INTO `t_producttype` VALUES ('15', '奢侈品', '0', '1', '1', '0');
INSERT INTO `t_producttype` VALUES ('16', '化妆品', '0', '1', '1', '0');
INSERT INTO `t_producttype` VALUES ('17', '运动品牌', '0', '1', '1', '0');
INSERT INTO `t_producttype` VALUES ('18', '数码', '0', '1', '1', '0');
INSERT INTO `t_producttype` VALUES ('19', '居家生活', '0', '1', '1', '0');
INSERT INTO `t_producttype` VALUES ('20', '电器', '0', '1', '1', '0');
INSERT INTO `t_producttype` VALUES ('21', '美食', '0', '1', '1', '0');
INSERT INTO `t_producttype` VALUES ('22', '儿童玩具', '0', '1', '1', '0');
INSERT INTO `t_producttype` VALUES ('23', '礼品', '0', '1', '1', '0');

-- ----------------------------
-- Table structure for t_product_specs
-- ----------------------------
DROP TABLE IF EXISTS `t_product_specs`;
CREATE TABLE `t_product_specs` (
  `ps_id` int(11) NOT NULL AUTO_INCREMENT,
  `sp_id` int(11) NOT NULL,
  `ps_color` varchar(20) NOT NULL,
  `ps_price` varchar(32) NOT NULL,
  `ps_num` varchar(32) NOT NULL,
  `p_id` int(11) NOT NULL,
  `ts_id` int(11) NOT NULL,
  PRIMARY KEY (`ps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product_specs
-- ----------------------------
INSERT INTO `t_product_specs` VALUES ('1', '1', '#2B2B2B', '78', '45', '1', '1');
INSERT INTO `t_product_specs` VALUES ('2', '2', '#2B2B2B', '50', '12', '2', '2');
INSERT INTO `t_product_specs` VALUES ('3', '3', '#2B2B2B', '30', '25', '3', '3');
INSERT INTO `t_product_specs` VALUES ('4', '4', '#2B2B2B', '58', '60', '4', '4');
INSERT INTO `t_product_specs` VALUES ('5', '5', '#2B2B2B', '20', '52', '5', '5');
INSERT INTO `t_product_specs` VALUES ('6', '6', '#2B2B2B', '23', '55', '6', '6');
INSERT INTO `t_product_specs` VALUES ('7', '7', '#2B2B2B', '45', '52', '7', '7');
INSERT INTO `t_product_specs` VALUES ('9', '9', '#2B2B2B', '45.9', '35', '9', '9');
INSERT INTO `t_product_specs` VALUES ('10', '10', '#2B2B2B', '50', '50', '10', '10');
INSERT INTO `t_product_specs` VALUES ('11', '11', '#2B2B2B', '63', '32', '11', '11');
INSERT INTO `t_product_specs` VALUES ('12', '12', '#2B2B2B', '36.5', '22', '12', '12');
INSERT INTO `t_product_specs` VALUES ('13', '13', '#2B2B2B', '25.9', '24', '13', '13');
INSERT INTO `t_product_specs` VALUES ('14', '14', '#2B2B2B', '30.5', '16', '14', '14');
INSERT INTO `t_product_specs` VALUES ('15', '8', '#00ACAC', '5', '12', '15', '3');
INSERT INTO `t_product_specs` VALUES ('16', '7', '#00ACAC', '5', '12', '1', '3');
INSERT INTO `t_product_specs` VALUES ('17', '10', '#0081FF', '5', '12', '15', '4');
INSERT INTO `t_product_specs` VALUES ('18', '10', '#0081FF', '5', '12', '1', '4');

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `qu_id` int(11) NOT NULL AUTO_INCREMENT,
  `qu_question` varchar(32) DEFAULT NULL,
  `qu_answer` varchar(32) DEFAULT NULL,
  `qu_userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`qu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_question
-- ----------------------------

-- ----------------------------
-- Table structure for t_return
-- ----------------------------
DROP TABLE IF EXISTS `t_return`;
CREATE TABLE `t_return` (
  `re_id` int(11) NOT NULL AUTO_INCREMENT,
  `re_reason` varchar(64) NOT NULL,
  `re_content` varchar(200) DEFAULT NULL,
  `re_state` int(1) NOT NULL,
  `re_date` varchar(32) NOT NULL,
  `re_orderdetailId` int(11) NOT NULL,
  PRIMARY KEY (`re_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_return
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `ro_id` int(11) NOT NULL AUTO_INCREMENT,
  `ro_name` varchar(32) NOT NULL,
  PRIMARY KEY (`ro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员');
INSERT INTO `t_role` VALUES ('2', '买家');
INSERT INTO `t_role` VALUES ('3', '卖家');
INSERT INTO `t_role` VALUES ('4', '店铺管理员');
INSERT INTO `t_role` VALUES ('5', '投诉管理员');

-- ----------------------------
-- Table structure for t_role_power
-- ----------------------------
DROP TABLE IF EXISTS `t_role_power`;
CREATE TABLE `t_role_power` (
  `rp_id` int(11) NOT NULL AUTO_INCREMENT,
  `rp_roleId` int(11) NOT NULL,
  `rp_powerId` int(11) NOT NULL,
  PRIMARY KEY (`rp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_power
-- ----------------------------
INSERT INTO `t_role_power` VALUES ('1', '1', '1');
INSERT INTO `t_role_power` VALUES ('2', '1', '2');
INSERT INTO `t_role_power` VALUES ('3', '1', '3');
INSERT INTO `t_role_power` VALUES ('9', '1', '5');
INSERT INTO `t_role_power` VALUES ('10', '1', '4');
INSERT INTO `t_role_power` VALUES ('15', '1', '7');
INSERT INTO `t_role_power` VALUES ('16', '1', '6');
INSERT INTO `t_role_power` VALUES ('17', '1', '8');
INSERT INTO `t_role_power` VALUES ('18', '1', '9');
INSERT INTO `t_role_power` VALUES ('19', '1', '10');
INSERT INTO `t_role_power` VALUES ('20', '1', '11');
INSERT INTO `t_role_power` VALUES ('21', '4', '5');
INSERT INTO `t_role_power` VALUES ('22', '4', '6');
INSERT INTO `t_role_power` VALUES ('23', '4', '7');
INSERT INTO `t_role_power` VALUES ('24', '4', '11');
INSERT INTO `t_role_power` VALUES ('25', '1', '12');
INSERT INTO `t_role_power` VALUES ('26', '5', '9');

-- ----------------------------
-- Table structure for t_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_role_user`;
CREATE TABLE `t_role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ru_userId` int(11) NOT NULL,
  `ru_roleId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_shop
-- ----------------------------
DROP TABLE IF EXISTS `t_shop`;
CREATE TABLE `t_shop` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(32) NOT NULL,
  `s_state` int(1) NOT NULL,
  `s_shopTypeId` int(11) NOT NULL,
  `s_userId` int(11) NOT NULL,
  `s_credit` int(11) NOT NULL,
  `s_grade` int(11) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shop
-- ----------------------------
INSERT INTO `t_shop` VALUES ('1', '11', '3', '1111', '11111', '5', '1');
INSERT INTO `t_shop` VALUES ('2', '22', '3', '2222', '22222', '4', '0');
INSERT INTO `t_shop` VALUES ('3', '33', '3', '3333', '33333', '4', '0');
INSERT INTO `t_shop` VALUES ('4', '44', '2', '4444', '44444', '5', '0');
INSERT INTO `t_shop` VALUES ('5', '55', '3', '5555', '55555', '1', '0');
INSERT INTO `t_shop` VALUES ('6', '66', '1', '6666', '66666', '10', '0');
INSERT INTO `t_shop` VALUES ('7', '77', '1', '7777', '77777', '10', '0');
INSERT INTO `t_shop` VALUES ('9', '99', '0', '9999', '99999', '10', '0');

-- ----------------------------
-- Table structure for t_shoptype
-- ----------------------------
DROP TABLE IF EXISTS `t_shoptype`;
CREATE TABLE `t_shoptype` (
  `sh_id` int(11) NOT NULL AUTO_INCREMENT,
  `sh_name` varchar(32) NOT NULL,
  `sh_deposit` varchar(32) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`sh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shoptype
-- ----------------------------
INSERT INTO `t_shoptype` VALUES ('1', '专卖店', '5000', '0');
INSERT INTO `t_shoptype` VALUES ('2', '普通店铺', '', '0');
INSERT INTO `t_shoptype` VALUES ('3', '服装店', '3000', '2');
INSERT INTO `t_shoptype` VALUES ('4', '食品店', '2000', '2');

-- ----------------------------
-- Table structure for t_specs
-- ----------------------------
DROP TABLE IF EXISTS `t_specs`;
CREATE TABLE `t_specs` (
  `sp_id` int(11) NOT NULL AUTO_INCREMENT,
  `sp_fications` varchar(32) NOT NULL,
  `ts_id` int(11) NOT NULL,
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_specs
-- ----------------------------
INSERT INTO `t_specs` VALUES ('1', '4G内存', '1');
INSERT INTO `t_specs` VALUES ('2', '3G内存', '1');
INSERT INTO `t_specs` VALUES ('3', '2G内存', '1');
INSERT INTO `t_specs` VALUES ('4', '1G内存', '1');
INSERT INTO `t_specs` VALUES ('5', '1028*987', '2');
INSERT INTO `t_specs` VALUES ('6', '1299*768', '2');
INSERT INTO `t_specs` VALUES ('7', 'XL', '3');
INSERT INTO `t_specs` VALUES ('8', 'XXL', '3');
INSERT INTO `t_specs` VALUES ('9', 'XXXL', '3');
INSERT INTO `t_specs` VALUES ('10', '半袖', '4');
INSERT INTO `t_specs` VALUES ('11', '长袖', '4');
INSERT INTO `t_specs` VALUES ('12', '短裤', '4');
INSERT INTO `t_specs` VALUES ('13', '裤子规格详情1', '5');
INSERT INTO `t_specs` VALUES ('14', '裤子规格详情2', '5');
INSERT INTO `t_specs` VALUES ('15', '裤子规格详情3', '5');
INSERT INTO `t_specs` VALUES ('16', '裤子规格2详情1', '6');
INSERT INTO `t_specs` VALUES ('17', '裤子规格2详情2', '6');
INSERT INTO `t_specs` VALUES ('18', '裤子规格2详情3', '6');

-- ----------------------------
-- Table structure for t_type_specs
-- ----------------------------
DROP TABLE IF EXISTS `t_type_specs`;
CREATE TABLE `t_type_specs` (
  `ts_id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_title` varchar(32) DEFAULT NULL,
  `ts_productTypeId` int(11) NOT NULL,
  PRIMARY KEY (`ts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type_specs
-- ----------------------------
INSERT INTO `t_type_specs` VALUES ('1', '内存', '7');
INSERT INTO `t_type_specs` VALUES ('2', '分辨率', '7');
INSERT INTO `t_type_specs` VALUES ('3', '尺寸', '8');
INSERT INTO `t_type_specs` VALUES ('4', '款式', '8');
INSERT INTO `t_type_specs` VALUES ('5', '裤子规格1', '6');
INSERT INTO `t_type_specs` VALUES ('6', '裤子规格2', '6');
INSERT INTO `t_type_specs` VALUES ('7', '裤子规格3', '6');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(32) NOT NULL,
  `u_pwd` varchar(32) NOT NULL,
  `u_email` varchar(64) DEFAULT NULL,
  `u_head` varchar(200) DEFAULT NULL,
  `u_cent` varchar(32) DEFAULT NULL,
  `u_state` int(1) NOT NULL,
  `u_code` varchar(64) NOT NULL,
  `u_roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '1234', null, null, null, '1', '123456789', '1');
INSERT INTO `t_user` VALUES ('2', 'zy1', '123', '804998302@qq.com', '123123', '0', '1', '2ff1dfede41c4e999a68c5c5636c1e4aeb06473aeeba4d388df575de1ed64025', '3');
INSERT INTO `t_user` VALUES ('3', 'zyzy', 'z123456', '804998302@qq.com', '123123', '0', '1', '471a7ec590e849d5a4c4d7000e8dfa0957295b942f94434b93a8119ac1b957f5', '2');
INSERT INTO `t_user` VALUES ('4', 'wac', '123', '8800@qq.com', '456456', '0', '1', '43ertgrgregesrt43524tgfsgre', '3');
INSERT INTO `t_user` VALUES ('5', 'testUsr', '123', '8900@qq.com', '456456', '0', '0', '123123123123', null);
INSERT INTO `t_user` VALUES ('6', 'user1', 'z123456', '804998302@qq.com', 'head1.png', '0', '1', '26336eba302c42a6a61ec1d606aac636b459047f36574898bb8f858a7507b048', '2');
INSERT INTO `t_user` VALUES ('7', 'user2', 'z12345', '804998302@qq.com', 'head1.png', '0', '1', 'b8dc41ac7a3e4f01b50dd0f56ca14273eae7cc0f5f354168acbe5f568ac2ab03', '2');
INSERT INTO `t_user` VALUES ('8', 'admin1', '123', '111@163.com', 'head1.png', '0', '1', '23132132131313213', '4');
INSERT INTO `t_user` VALUES ('9', 'admin2', '123123', null, 'head1.png', '0', '1', 'c648357f3bbf4083a8cc9cecb2de2be9cf9097e693584d0990910ac9772428d3', '5');
