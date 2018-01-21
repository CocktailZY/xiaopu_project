/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50558
Source Host           : localhost:3306
Source Database       : erpsystem

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2018-01-21 18:48:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jprice` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `cusId` int(11) DEFAULT NULL,
  `goodId` int(11) DEFAULT NULL,
  `supId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g6v0gvmo6p0d4430qg0e1x8nk` (`cusId`),
  KEY `FK_925mhylq1oki69pl960269ctp` (`goodId`),
  KEY `FK_al2gh0jakqwwo66ju790pps83` (`supId`),
  CONSTRAINT `FK_925mhylq1oki69pl960269ctp` FOREIGN KEY (`goodId`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_al2gh0jakqwwo66ju790pps83` FOREIGN KEY (`supId`) REFERENCES `supplier` (`id`),
  CONSTRAINT `FK_g6v0gvmo6p0d4430qg0e1x8nk` FOREIGN KEY (`cusId`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('14', '500', '1', '1', '6', null);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'qweqwe', 'customer1', '123123');
INSERT INTO `customer` VALUES ('2', '123456789', 'customer9', '123456789');

-- ----------------------------
-- Table structure for entrepot
-- ----------------------------
DROP TABLE IF EXISTS `entrepot`;
CREATE TABLE `entrepot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entrepotName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entrepot
-- ----------------------------
INSERT INTO `entrepot` VALUES ('1', 'cangku1');
INSERT INTO `entrepot` VALUES ('2', 'cangku2');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount` varchar(255) DEFAULT NULL,
  `goodName` varchar(255) DEFAULT NULL,
  `onNum` int(11) NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `supId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7cbiixkc4aiw1q52mnswpgrb7` (`typeId`),
  KEY `FK_hcu45cm1272f95522ca0yjsc7` (`supId`),
  CONSTRAINT `FK_7cbiixkc4aiw1q52mnswpgrb7` FOREIGN KEY (`typeId`) REFERENCES `goodstype` (`id`),
  CONSTRAINT `FK_hcu45cm1272f95522ca0yjsc7` FOREIGN KEY (`supId`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '', 'good1', '150', '4.5', '1', '1', null);
INSERT INTO `goods` VALUES ('2', '', 'good2', '93', '6.0', '1', '1', null);
INSERT INTO `goods` VALUES ('3', '', 'good3', '100', '5', '0', '1', null);
INSERT INTO `goods` VALUES ('4', '', 'good4', '89', '10', '1', '2', null);
INSERT INTO `goods` VALUES ('5', '', 'good5', '100', '10', '0', '2', null);
INSERT INTO `goods` VALUES ('6', '', 'good6', '100', '500', '1', '2', null);
INSERT INTO `goods` VALUES ('7', '', 'good7', '0', '100', '0', '1', null);
INSERT INTO `goods` VALUES ('8', '', 'good8', '0', '50', '0', '1', null);

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('1', 'goodType1');
INSERT INTO `goodstype` VALUES ('2', 'goodType2');
INSERT INTO `goodstype` VALUES ('3', 'goodType3');

-- ----------------------------
-- Table structure for goodtosupplier
-- ----------------------------
DROP TABLE IF EXISTS `goodtosupplier`;
CREATE TABLE `goodtosupplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jprice` varchar(255) DEFAULT NULL,
  `goodId` int(11) DEFAULT NULL,
  `supId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2jn9mgb0yopjaj0l8uc4243r1` (`goodId`),
  KEY `FK_adpqe7f7s5r71a13fw7us48f8` (`supId`),
  CONSTRAINT `FK_2jn9mgb0yopjaj0l8uc4243r1` FOREIGN KEY (`goodId`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_adpqe7f7s5r71a13fw7us48f8` FOREIGN KEY (`supId`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodtosupplier
-- ----------------------------
INSERT INTO `goodtosupplier` VALUES ('22', '3', '1', '1');
INSERT INTO `goodtosupplier` VALUES ('23', '4', '2', '1');
INSERT INTO `goodtosupplier` VALUES ('24', '5', '3', '1');
INSERT INTO `goodtosupplier` VALUES ('25', '9', '4', '1');
INSERT INTO `goodtosupplier` VALUES ('26', '5', '5', '2');
INSERT INTO `goodtosupplier` VALUES ('27', '6', '6', '2');
INSERT INTO `goodtosupplier` VALUES ('28', '7', '7', '2');
INSERT INTO `goodtosupplier` VALUES ('29', '8', '8', '2');
INSERT INTO `goodtosupplier` VALUES ('30', '11', '5', '1');
INSERT INTO `goodtosupplier` VALUES ('31', '13', '6', '1');
INSERT INTO `goodtosupplier` VALUES ('32', null, '4', '1');
INSERT INTO `goodtosupplier` VALUES ('33', null, '5', '1');
INSERT INTO `goodtosupplier` VALUES ('34', '100', '7', '2');
INSERT INTO `goodtosupplier` VALUES ('35', '100', '8', '2');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jprice` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `entrepotId` int(11) DEFAULT NULL,
  `goodId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lered5nwuchh0n6ltng1112gk` (`entrepotId`),
  KEY `FK_ge60pgm9r8ojam0yqhn7q2gin` (`goodId`),
  CONSTRAINT `FK_ge60pgm9r8ojam0yqhn7q2gin` FOREIGN KEY (`goodId`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_lered5nwuchh0n6ltng1112gk` FOREIGN KEY (`entrepotId`) REFERENCES `entrepot` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('2', '3', '50', '0', '1', '1');
INSERT INTO `inventory` VALUES ('3', '4', '100', '0', '1', '2');
INSERT INTO `inventory` VALUES ('4', '5', '105', '0', '1', '3');
INSERT INTO `inventory` VALUES ('5', '9', '100', '0', '1', '4');
INSERT INTO `inventory` VALUES ('6', '11', '100', '0', '1', '5');
INSERT INTO `inventory` VALUES ('7', '13', '100', '0', '1', '6');
INSERT INTO `inventory` VALUES ('8', '5', '100', '0', '1', '5');
INSERT INTO `inventory` VALUES ('9', '6', '100', '0', '1', '6');
INSERT INTO `inventory` VALUES ('10', '7', '100', '0', '1', '7');
INSERT INTO `inventory` VALUES ('11', '8', '100', '0', '1', '8');

-- ----------------------------
-- Table structure for orderdetil
-- ----------------------------
DROP TABLE IF EXISTS `orderdetil`;
CREATE TABLE `orderdetil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` varchar(255) DEFAULT NULL,
  `jprice` varchar(255) DEFAULT NULL,
  `goodId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `supId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lvemcxt2bqfx4mwrkmqvywvfy` (`goodId`),
  KEY `FK_lu09nwphd2cqtbh8t93d90bkd` (`orderId`),
  KEY `FK_rxdp2w7ugts2w57kic8n1nai8` (`supId`),
  CONSTRAINT `FK_lu09nwphd2cqtbh8t93d90bkd` FOREIGN KEY (`orderId`) REFERENCES `orderinfo` (`id`),
  CONSTRAINT `FK_lvemcxt2bqfx4mwrkmqvywvfy` FOREIGN KEY (`goodId`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_rxdp2w7ugts2w57kic8n1nai8` FOREIGN KEY (`supId`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetil
-- ----------------------------
INSERT INTO `orderdetil` VALUES ('1', '5', '3', '1', '1', '1');
INSERT INTO `orderdetil` VALUES ('2', '5', '4', '2', '1', '1');
INSERT INTO `orderdetil` VALUES ('3', '5', '5', '3', '1', '1');
INSERT INTO `orderdetil` VALUES ('4', '55', '3', '1', '2', '1');
INSERT INTO `orderdetil` VALUES ('5', '5', '4', '2', '2', '1');
INSERT INTO `orderdetil` VALUES ('6', '5', '5', '5', '7', '2');
INSERT INTO `orderdetil` VALUES ('7', '5', '5', '5', '7', '2');
INSERT INTO `orderdetil` VALUES ('8', '51', '7', '7', '8', '2');
INSERT INTO `orderdetil` VALUES ('9', '51', '8', '8', '8', '2');

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderTime` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `orderTypeId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6399tya5rdxtc4aqt0yfgcd9c` (`orderTypeId`),
  KEY `FK_pjdoga923uy3miuoyycvkj9x6` (`userId`),
  CONSTRAINT `FK_6399tya5rdxtc4aqt0yfgcd9c` FOREIGN KEY (`orderTypeId`) REFERENCES `ordertype` (`id`),
  CONSTRAINT `FK_pjdoga923uy3miuoyycvkj9x6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO `orderinfo` VALUES ('1', '2016-08-17 14:42:06', '1', '1', '4');
INSERT INTO `orderinfo` VALUES ('2', '2016-08-17 16:03:52', '1', '2', '5');
INSERT INTO `orderinfo` VALUES ('7', '2016-08-18 16:44:23', '0', '1', '4');
INSERT INTO `orderinfo` VALUES ('8', '2018-01-21 09:41:16', '0', '2', '1');

-- ----------------------------
-- Table structure for ordertype
-- ----------------------------
DROP TABLE IF EXISTS `ordertype`;
CREATE TABLE `ordertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordertype
-- ----------------------------
INSERT INTO `ordertype` VALUES ('1', '入库单');
INSERT INTO `ordertype` VALUES ('2', '出库单');

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) DEFAULT NULL,
  `goodId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fe7rkh63i7vi34q0s1ex5fkqp` (`goodId`),
  KEY `FK_qeiffa0rdvo2c3abkd0u4mklb` (`userId`),
  CONSTRAINT `FK_fe7rkh63i7vi34q0s1ex5fkqp` FOREIGN KEY (`goodId`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_qeiffa0rdvo2c3abkd0u4mklb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '系统管理员');
INSERT INTO `role` VALUES ('2', '进货员');
INSERT INTO `role` VALUES ('3', '售货员');
INSERT INTO `role` VALUES ('4', '仓库管理员');
INSERT INTO `role` VALUES ('5', '供货商');
INSERT INTO `role` VALUES ('6', '顾客');

-- ----------------------------
-- Table structure for sell
-- ----------------------------
DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allprice` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mlh1o297vxjlqtyv2knpvewu1` (`customerId`),
  KEY `FK_2mfaol72xr8vke2mfeebx4pmi` (`userId`),
  CONSTRAINT `FK_2mfaol72xr8vke2mfeebx4pmi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_mlh1o297vxjlqtyv2knpvewu1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sell
-- ----------------------------
INSERT INTO `sell` VALUES ('1', '160', '0', '2018-01-21 11:29:59', '1', '7');
INSERT INTO `sell` VALUES ('2', '16.0', '0', '2018-01-21 12:57:36', '1', '7');

-- ----------------------------
-- Table structure for sellinfo
-- ----------------------------
DROP TABLE IF EXISTS `sellinfo`;
CREATE TABLE `sellinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `goodId` int(11) DEFAULT NULL,
  `sellId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_j91u58k4k526p21wj005jyo7v` (`goodId`),
  KEY `FK_qco6ru9w41apqa6drkp863p9b` (`sellId`),
  CONSTRAINT `FK_j91u58k4k526p21wj005jyo7v` FOREIGN KEY (`goodId`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_qco6ru9w41apqa6drkp863p9b` FOREIGN KEY (`sellId`) REFERENCES `sell` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sellinfo
-- ----------------------------
INSERT INTO `sellinfo` VALUES ('1', '33', '6.0', '60', '2', '1');
INSERT INTO `sellinfo` VALUES ('2', '33', '10', '60', '4', '1');
INSERT INTO `sellinfo` VALUES ('3', '1', '6.0', '6.0', '2', '2');
INSERT INTO `sellinfo` VALUES ('4', '1', '10', '6.0', '4', '2');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `supName` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'qweqwe', 'supplier1', '1234565');
INSERT INTO `supplier` VALUES ('2', 'asdasdasd', 'supplier2', '123123123');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `otherId` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aw9g9g03k19nb2386vyhppyes` (`roleId`),
  CONSTRAINT `FK_aw9g9g03k19nb2386vyhppyes` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '0', '123', 'admin', '1');
INSERT INTO `users` VALUES ('2', '1', '123456', 'supplier1', '5');
INSERT INTO `users` VALUES ('3', '2', '123456', 'supplier2', '5');
INSERT INTO `users` VALUES ('4', '0', '123', 'jin', '2');
INSERT INTO `users` VALUES ('5', '0', '123', 'shou', '3');
INSERT INTO `users` VALUES ('6', '0', '123', 'cang', '4');
INSERT INTO `users` VALUES ('7', '1', '123', 'customer1', '6');
INSERT INTO `users` VALUES ('8', '2', '123456', 'customer2', '6');
INSERT INTO `users` VALUES ('9', '0', '123', 'supplier1', '5');
INSERT INTO `users` VALUES ('10', '2', '123456', 'customer9', '6');
SET FOREIGN_KEY_CHECKS=1;
