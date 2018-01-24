/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50558
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2018-01-24 22:04:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `goodId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `num` int(11) DEFAULT NULL,
  `total` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_user` (`userId`),
  KEY `cart_good` (`goodId`),
  CONSTRAINT `cart_good` FOREIGN KEY (`goodId`) REFERENCES `good` (`goodid`),
  CONSTRAINT `cart_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '9', '19', '1', '600');
INSERT INTO `cart` VALUES ('2', '8', '19', '1', '800');
INSERT INTO `cart` VALUES ('3', '10', '24', '1', '50');

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `goodid` int(32) NOT NULL AUTO_INCREMENT,
  `goodname` varchar(255) NOT NULL,
  `price` varchar(32) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `goodtypeid` int(32) NOT NULL,
  `ontime` varchar(255) DEFAULT NULL,
  `userid` int(32) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`goodid`),
  KEY `goodtypeid` (`goodtypeid`),
  KEY `userid` (`userid`),
  CONSTRAINT `goodtypeid` FOREIGN KEY (`goodtypeid`) REFERENCES `goodtype` (`goodtypeid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('8', 'iphone4s', '800', '黑色 8/16g 国行 全网通', '1', '2018-01-23 22:53', '19', '2');
INSERT INTO `good` VALUES ('9', 'iphone4', '600', '黑色 8g 国行 全网通', '1', '2018-01-23 22:56', '19', '2');
INSERT INTO `good` VALUES ('10', '蓝色半袖', '50', '蓝色 L/XL/XXL', '3', '2018-01-24 11:39', '23', '0');
INSERT INTO `good` VALUES ('11', '沙滩裤', '60', '格纹 M/L/XL/XXL', '3', '2018-01-24 11:43', '23', '1');
INSERT INTO `good` VALUES ('12', '薄款棉衣', '160', '超薄修身 黑色 M/L/XL', '3', '2018-01-24 11:49', '23', '1');
INSERT INTO `good` VALUES ('13', '蓬蓬裙', '100', '黑白 S/M/L', '3', '2018-01-24 11:55', '23', '1');
INSERT INTO `good` VALUES ('14', '绑带凉鞋', '60', '粗跟 36/37/38/39', '3', '2018-01-24 11:57', '23', '0');
INSERT INTO `good` VALUES ('15', '圆领针织衫', '100', '修身 S/M/L/XL', '3', '2018-01-24 11:59', '23', '1');
INSERT INTO `good` VALUES ('16', '魅族', '1200', '黑色 运存4G/32G', '1', '2018-01-24 12:06', '24', '1');
INSERT INTO `good` VALUES ('17', '创维电视', '5240', '52寸', '2', '2018-01-24 16:58', '25', '1');

-- ----------------------------
-- Table structure for goodimg
-- ----------------------------
DROP TABLE IF EXISTS `goodimg`;
CREATE TABLE `goodimg` (
  `imgid` int(32) NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(255) DEFAULT NULL,
  `goodid` int(32) DEFAULT NULL,
  PRIMARY KEY (`imgid`),
  KEY `goodid` (`goodid`),
  CONSTRAINT `goodid` FOREIGN KEY (`goodid`) REFERENCES `good` (`goodid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodimg
-- ----------------------------
INSERT INTO `goodimg` VALUES ('1', '201801/20180123225318024_966.jpg', '8');
INSERT INTO `goodimg` VALUES ('2', '201801/20180123225544462_995.jpg', '9');
INSERT INTO `goodimg` VALUES ('3', '201801/20180123225546005_981.jpg', '9');
INSERT INTO `goodimg` VALUES ('4', '201801/20180123225547093_855.jpg', '9');
INSERT INTO `goodimg` VALUES ('5', '201801/20180124113657421_25.png', '10');
INSERT INTO `goodimg` VALUES ('6', '201801/20180124114015087_556.png', '11');
INSERT INTO `goodimg` VALUES ('7', '201801/20180124114808162_317.png', '12');
INSERT INTO `goodimg` VALUES ('8', '201801/20180124115417112_369.png', '13');
INSERT INTO `goodimg` VALUES ('9', '201801/20180124115615846_873.png', '14');
INSERT INTO `goodimg` VALUES ('10', '201801/20180124115748573_10.png', '15');
INSERT INTO `goodimg` VALUES ('11', '201801/20180124120536515_432.png', '16');
INSERT INTO `goodimg` VALUES ('12', '201801/20180124165744395_479.jpg', '17');
INSERT INTO `goodimg` VALUES ('13', '201801/20180124165744408_844.jpg', '17');
INSERT INTO `goodimg` VALUES ('14', '201801/20180124165744431_48.jpg', '17');
INSERT INTO `goodimg` VALUES ('15', '201801/20180124165744500_323.jpg', '17');
INSERT INTO `goodimg` VALUES ('16', '201801/20180124165744522_612.jpg', '17');

-- ----------------------------
-- Table structure for goodmessage
-- ----------------------------
DROP TABLE IF EXISTS `goodmessage`;
CREATE TABLE `goodmessage` (
  `msgid` int(32) NOT NULL AUTO_INCREMENT,
  `parentmsgid` int(32) NOT NULL DEFAULT '0',
  `goodid` int(32) NOT NULL,
  `userid` int(32) NOT NULL,
  `msgcontent` varchar(255) DEFAULT NULL,
  `inserttime` varchar(255) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`msgid`),
  KEY `goodid_fk` (`goodid`),
  KEY `userid_msg_fk` (`userid`),
  CONSTRAINT `goodid_fk` FOREIGN KEY (`goodid`) REFERENCES `good` (`goodid`),
  CONSTRAINT `userid_msg_fk` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodmessage
-- ----------------------------
INSERT INTO `goodmessage` VALUES ('1', '0', '9', '19', '留言1', '2018-01-23 23:00', '1');
INSERT INTO `goodmessage` VALUES ('2', '0', '9', '19', '留言2', '2018-01-23 23:00', '1');
INSERT INTO `goodmessage` VALUES ('3', '0', '9', '19', '留言3', '2018-01-23 23:01', '1');
INSERT INTO `goodmessage` VALUES ('4', '0', '9', '24', '留言4', '2018-01-24 12:05', '1');

-- ----------------------------
-- Table structure for goodtype
-- ----------------------------
DROP TABLE IF EXISTS `goodtype`;
CREATE TABLE `goodtype` (
  `goodtypeid` int(32) NOT NULL AUTO_INCREMENT,
  `goodtypename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goodtypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodtype
-- ----------------------------
INSERT INTO `goodtype` VALUES ('1', '手机');
INSERT INTO `goodtype` VALUES ('2', '电视');
INSERT INTO `goodtype` VALUES ('3', '衣服');

-- ----------------------------
-- Table structure for guide
-- ----------------------------
DROP TABLE IF EXISTS `guide`;
CREATE TABLE `guide` (
  `guideId` int(32) NOT NULL AUTO_INCREMENT,
  `guideContent` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `mark` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `goodId` int(11) NOT NULL,
  PRIMARY KEY (`guideId`),
  KEY `user_guide` (`userId`),
  KEY `good_guide` (`goodId`),
  CONSTRAINT `good_guide` FOREIGN KEY (`goodId`) REFERENCES `good` (`goodid`),
  CONSTRAINT `user_guide` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guide
-- ----------------------------
INSERT INTO `guide` VALUES ('1', '年终促销，真情回馈', '1', 'front_new', '25', '17');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleid` int(32) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '普通用户');
INSERT INTO `role` VALUES ('2', '管理员');

-- ----------------------------
-- Table structure for table_change
-- ----------------------------
DROP TABLE IF EXISTS `table_change`;
CREATE TABLE `table_change` (
  `tableid` int(32) NOT NULL AUTO_INCREMENT,
  `fromid` int(32) NOT NULL,
  `goodid` int(32) NOT NULL,
  `userid` int(32) DEFAULT NULL,
  `ordertime` varchar(255) NOT NULL,
  `finishtime` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tableid`),
  KEY `goodid_table_fk` (`goodid`),
  KEY `fromid_table_fk` (`fromid`),
  CONSTRAINT `fromid_table_fk` FOREIGN KEY (`fromid`) REFERENCES `user` (`userid`),
  CONSTRAINT `goodid_table_fk` FOREIGN KEY (`goodid`) REFERENCES `good` (`goodid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of table_change
-- ----------------------------
INSERT INTO `table_change` VALUES ('5', '24', '10', '23', '2018-01-24 12:07', null, '1', 'old');
INSERT INTO `table_change` VALUES ('7', '25', '14', '23', '2018-01-24 17:04', null, '1', 'old');

-- ----------------------------
-- Table structure for tip
-- ----------------------------
DROP TABLE IF EXISTS `tip`;
CREATE TABLE `tip` (
  `tipid` int(32) NOT NULL AUTO_INCREMENT,
  `goodid` int(32) NOT NULL,
  `userid` int(32) NOT NULL,
  `fromid` int(32) NOT NULL,
  `type` varchar(255) NOT NULL,
  `createtime` varchar(255) NOT NULL,
  `mark` varchar(255) NOT NULL,
  PRIMARY KEY (`tipid`),
  KEY `userid_fk` (`userid`),
  KEY `goodid_tip_fk` (`goodid`),
  CONSTRAINT `goodid_tip_fk` FOREIGN KEY (`goodid`) REFERENCES `good` (`goodid`),
  CONSTRAINT `userid_fk` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tip
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `headimg` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `roleid` int(32) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `roleid` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('19', 'username', '123123', '201801/20180123225211417_432.png', '15151515151', '1');
INSERT INTO `user` VALUES ('20', 'admin', 'admin', '201801/20180123225211417_432.png', '13131313131', '2');
INSERT INTO `user` VALUES ('23', 'customer', '123123', '201801/20180123225211417_432.png', '15151515151', '1');
INSERT INTO `user` VALUES ('24', 'customer1', '123123', '201801/20180123225211417_432.png', '15151515151', '1');
INSERT INTO `user` VALUES ('25', 'cocktail', '123123', '201801/20180123225211417_432.png', '15151515151', '1');
SET FOREIGN_KEY_CHECKS=1;
