/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50558
Source Host           : localhost:3306
Source Database       : nip

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2018-01-21 18:17:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pms_t_admin
-- ----------------------------
DROP TABLE IF EXISTS `pms_t_admin`;
CREATE TABLE `pms_t_admin` (
  `a_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `a_name` varchar(20) NOT NULL COMMENT '管理员名',
  `a_pwd` varchar(20) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用于存放管理员的信息';

-- ----------------------------
-- Records of pms_t_admin
-- ----------------------------
INSERT INTO `pms_t_admin` VALUES ('1', 'admin', 'admin123');

-- ----------------------------
-- Table structure for pms_t_card
-- ----------------------------
DROP TABLE IF EXISTS `pms_t_card`;
CREATE TABLE `pms_t_card` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '卡ID',
  `c_number` varchar(20) NOT NULL COMMENT '卡编号',
  `c_platenumber` varchar(10) NOT NULL COMMENT '车牌号',
  `c_starttime` varchar(20) NOT NULL COMMENT '开始时间',
  `c_endtime` varchar(10) DEFAULT NULL COMMENT '截止时间',
  `c_money` varchar(50) DEFAULT NULL COMMENT '余额',
  `c_type` varchar(20) NOT NULL COMMENT '停车卡类型',
  `c_user` varchar(10) DEFAULT NULL COMMENT '停停车卡属主',
  `c_tel` varchar(20) DEFAULT NULL COMMENT '属主电话',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用于存放用户信息';

-- ----------------------------
-- Records of pms_t_card
-- ----------------------------
INSERT INTO `pms_t_card` VALUES ('11', '1495204983960', '蒙ARF709', '2017-06-14 10:30:01', null, '0', '会员卡', 'user1', '15151515151');
INSERT INTO `pms_t_card` VALUES ('14', '1497325784262', '蒙ASL666', '2017-06-14 10:30:51', null, '298', '会员卡', 'user2', '15151515151');
INSERT INTO `pms_t_card` VALUES ('16', '1497341754706', '蒙A12345', '2017-06-13 16:16:30', null, '198', '会员卡', 'user3', '15151515151');

-- ----------------------------
-- Table structure for pms_t_charge
-- ----------------------------
DROP TABLE IF EXISTS `pms_t_charge`;
CREATE TABLE `pms_t_charge` (
  `ch_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '收费标准ID',
  `ch_name` varchar(20) NOT NULL COMMENT '收费标准名称',
  `ch_cardtype` varchar(10) NOT NULL COMMENT '停车卡类型',
  `ch_unitprise` varchar(10) NOT NULL COMMENT '单位金额',
  `ch_unittime` varchar(10) NOT NULL COMMENT '时间单位',
  PRIMARY KEY (`ch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用于存放收费标准的信息';

-- ----------------------------
-- Records of pms_t_charge
-- ----------------------------
INSERT INTO `pms_t_charge` VALUES ('10', '普通用户按小时收费', '临时卡', '3', '小时');
INSERT INTO `pms_t_charge` VALUES ('11', '普通用户按天收费', '临时卡', '20', '天');
INSERT INTO `pms_t_charge` VALUES ('12', '会员用户按小时收费', '会员卡', '2', '小时');
INSERT INTO `pms_t_charge` VALUES ('13', '会员用户按天收费', '会员卡', '15', '天');

-- ----------------------------
-- Table structure for pms_t_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_t_record`;
CREATE TABLE `pms_t_record` (
  `r_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `r_platenumber` varchar(10) NOT NULL COMMENT '车牌号',
  `r_cardtype` varchar(10) NOT NULL COMMENT '停车卡类型',
  `r_user` varchar(20) NOT NULL COMMENT '用户',
  `r_parking` varchar(10) NOT NULL COMMENT '停靠车位编号',
  `r_starttime` varchar(20) NOT NULL COMMENT '开始时间',
  `r_endtime` varchar(20) DEFAULT NULL COMMENT '截止时间',
  `r_prise` varchar(10) DEFAULT NULL COMMENT '收费金额',
  `r_prisetype` varchar(10) DEFAULT NULL COMMENT '支付状态',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用于存放车辆进出记录';

-- ----------------------------
-- Records of pms_t_record
-- ----------------------------
INSERT INTO `pms_t_record` VALUES ('8', '蒙ARF709', '会员卡', 'user1', 'D-1', '2017-06-09 09:55:29', '2017-06-14 10:30:22', '75', '线上未支付');
INSERT INTO `pms_t_record` VALUES ('9', '蒙B78925', '临时卡', '临时用户', 'C-3', '2017-06-09 10:04:57', '2017-06-13 14:21:10', '92', '线下未支付');
INSERT INTO `pms_t_record` VALUES ('10', '蒙ARF709', '会员卡', 'user1', 'A-5', '2017-06-10 16:34:15', '2017-06-14 10:30:22', '75', '线上未支付');
INSERT INTO `pms_t_record` VALUES ('11', '蒙M12345', '临时卡', '临时用户', 'D-5', '2017-06-13 14:20:51', '2018-01-20 18:43:01', '4432', '线下未支付');
INSERT INTO `pms_t_record` VALUES ('12', '蒙A12345', '会员卡', 'user3', 'E-3', '2017-06-13 16:16:30', '2017-06-13 16:16:57', '2', '线上已支付');
INSERT INTO `pms_t_record` VALUES ('13', '蒙ARF709', '会员卡', 'user1', 'A-9', '2017-06-14 10:30:01', '2017-06-14 10:30:22', '75', '线上未支付');
INSERT INTO `pms_t_record` VALUES ('14', '蒙ASL666', '会员卡', 'user2', 'B-3', '2017-06-14 10:30:51', '2017-06-14 10:31:10', '2', '线上已支付');

-- ----------------------------
-- Table structure for pms_t_space
-- ----------------------------
DROP TABLE IF EXISTS `pms_t_space`;
CREATE TABLE `pms_t_space` (
  `s_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '车位ID',
  `s_zone` varchar(10) NOT NULL COMMENT '所属区块',
  `s_platenumber` varchar(10) DEFAULT NULL COMMENT '停靠车牌号',
  `s_state` varchar(10) NOT NULL COMMENT '车位状态',
  `s_number` int(10) NOT NULL COMMENT '车位编号',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='用于存放车位信息';

-- ----------------------------
-- Records of pms_t_space
-- ----------------------------
INSERT INTO `pms_t_space` VALUES ('109', 'A', null, '0', '1');
INSERT INTO `pms_t_space` VALUES ('110', 'A', null, '0', '2');
INSERT INTO `pms_t_space` VALUES ('113', 'A', null, '0', '5');
INSERT INTO `pms_t_space` VALUES ('114', 'B', null, '0', '1');
INSERT INTO `pms_t_space` VALUES ('115', 'B', null, '0', '2');
INSERT INTO `pms_t_space` VALUES ('116', 'B', null, '0', '3');
INSERT INTO `pms_t_space` VALUES ('117', 'B', null, '0', '4');
INSERT INTO `pms_t_space` VALUES ('118', 'B', null, '0', '5');
INSERT INTO `pms_t_space` VALUES ('119', 'C', null, '0', '1');
INSERT INTO `pms_t_space` VALUES ('120', 'C', null, '0', '2');
INSERT INTO `pms_t_space` VALUES ('121', 'C', null, '0', '3');
INSERT INTO `pms_t_space` VALUES ('122', 'C', null, '0', '4');
INSERT INTO `pms_t_space` VALUES ('123', 'C', null, '0', '5');
INSERT INTO `pms_t_space` VALUES ('124', 'D', null, '0', '1');
INSERT INTO `pms_t_space` VALUES ('125', 'D', null, '0', '2');
INSERT INTO `pms_t_space` VALUES ('126', 'D', null, '0', '3');
INSERT INTO `pms_t_space` VALUES ('127', 'D', null, '0', '4');
INSERT INTO `pms_t_space` VALUES ('128', 'D', null, '0', '5');
INSERT INTO `pms_t_space` VALUES ('129', 'E', null, '0', '1');
INSERT INTO `pms_t_space` VALUES ('130', 'E', null, '0', '2');
INSERT INTO `pms_t_space` VALUES ('131', 'E', null, '0', '3');
INSERT INTO `pms_t_space` VALUES ('132', 'E', null, '0', '4');
INSERT INTO `pms_t_space` VALUES ('133', 'E', null, '0', '5');
INSERT INTO `pms_t_space` VALUES ('134', 'A', null, '0', '3');
INSERT INTO `pms_t_space` VALUES ('135', 'A', null, '0', '4');
INSERT INTO `pms_t_space` VALUES ('136', 'A', null, '0', '6');
INSERT INTO `pms_t_space` VALUES ('137', 'A', null, '0', '7');
INSERT INTO `pms_t_space` VALUES ('138', 'A', null, '0', '8');
INSERT INTO `pms_t_space` VALUES ('139', 'A', null, '0', '9');

-- ----------------------------
-- Table structure for pms_t_zone
-- ----------------------------
DROP TABLE IF EXISTS `pms_t_zone`;
CREATE TABLE `pms_t_zone` (
  `z_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '区块',
  `z_name` varchar(20) NOT NULL COMMENT '区块名称',
  PRIMARY KEY (`z_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 MIN_ROWS=1 MAX_ROWS=1 COMMENT='存放停车场参数信息';

-- ----------------------------
-- Records of pms_t_zone
-- ----------------------------
INSERT INTO `pms_t_zone` VALUES ('1', 'A');
INSERT INTO `pms_t_zone` VALUES ('2', 'B');
INSERT INTO `pms_t_zone` VALUES ('3', 'C');
INSERT INTO `pms_t_zone` VALUES ('4', 'D');
INSERT INTO `pms_t_zone` VALUES ('12', 'E');
SET FOREIGN_KEY_CHECKS=1;
