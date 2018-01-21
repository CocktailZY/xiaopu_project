/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50558
Source Host           : localhost:3306
Source Database       : supermarket

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2018-01-21 18:59:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for txitongshezhi
-- ----------------------------
DROP TABLE IF EXISTS `txitongshezhi`;
CREATE TABLE `txitongshezhi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `xitongName` varchar(100) DEFAULT NULL COMMENT '系统名称',
  `banquan` varchar(100) DEFAULT NULL COMMENT '版权',
  `content` varchar(100) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统设置表';

-- ----------------------------
-- Records of txitongshezhi
-- ----------------------------
INSERT INTO `txitongshezhi` VALUES ('3', '大型连锁超市物品管理系统设计与实现', '执着', 'QQ:307155597');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', '123', '123');

-- ----------------------------
-- Table structure for t_brand
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isDelete` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `Category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_893pccjfcvay83qhve9xo2tcm` (`Category_id`),
  CONSTRAINT `FK_893pccjfcvay83qhve9xo2tcm` FOREIGN KEY (`Category_id`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_brand
-- ----------------------------

-- ----------------------------
-- Table structure for t_bumen
-- ----------------------------
DROP TABLE IF EXISTS `t_bumen`;
CREATE TABLE `t_bumen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bumen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of t_bumen
-- ----------------------------
INSERT INTO `t_bumen` VALUES ('2', '人力资源部');
INSERT INTO `t_bumen` VALUES ('3', '财务部');
INSERT INTO `t_bumen` VALUES ('4', '研发部');
INSERT INTO `t_bumen` VALUES ('6', '综合管理部');
INSERT INTO `t_bumen` VALUES ('7', '市场部');

-- ----------------------------
-- Table structure for t_cangku
-- ----------------------------
DROP TABLE IF EXISTS `t_cangku`;
CREATE TABLE `t_cangku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cangkuNo` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `beizhu` varchar(100) DEFAULT NULL,
  `istingyong` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='仓库设置表';

-- ----------------------------
-- Records of t_cangku
-- ----------------------------
INSERT INTO `t_cangku` VALUES ('3', 'ck001', '东八里仓库', '张翰', '仓库备注', '在用');
INSERT INTO `t_cangku` VALUES ('4', 'ck0022', '西八里仓库2', '张翰', '西八里仓库2', 'null');
INSERT INTO `t_cangku` VALUES ('5', 'cs1001', '京东临时仓库11', '张小飞', '21', 'null');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isDelete` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------

-- ----------------------------
-- Table structure for t_chuku
-- ----------------------------
DROP TABLE IF EXISTS `t_chuku`;
CREATE TABLE `t_chuku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chukutype` char(10) DEFAULT NULL,
  `chukuNo` varchar(100) DEFAULT NULL,
  `chukuriqi` varchar(100) DEFAULT NULL,
  `kehu` varchar(100) DEFAULT NULL,
  `cangku` varchar(100) DEFAULT NULL,
  `jingshouren` varchar(100) DEFAULT NULL,
  `goodsNo` varchar(100) DEFAULT NULL,
  `goodsName` varchar(100) DEFAULT NULL,
  `goodsGuige` varchar(100) DEFAULT NULL,
  `goodsPinpai` varchar(100) DEFAULT NULL,
  `goodsNum` varchar(100) DEFAULT NULL,
  `goodsPrice` varchar(100) DEFAULT NULL,
  `goodsTotal` varchar(100) DEFAULT NULL,
  `beizhu` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='出库表';

-- ----------------------------
-- Records of t_chuku
-- ----------------------------
INSERT INTO `t_chuku` VALUES ('7', '采购出库', '2017043093528668', '2017-04-30', '黄小琥', '西八里仓库2', '张翰', '4', '钢笔5', '1*15', '胜利5', '23', '4.35', '100.049995', '2');
INSERT INTO `t_chuku` VALUES ('8', '采购出库', '2017043093533470', '2016-04-13', '黄小琥', '东八里仓库', '张翰', '9', '平底锅', '12KG', '苏泊尔', '3', '168', '504.0', '2');
INSERT INTO `t_chuku` VALUES ('9', '采购出库', '2017051194487827', '2017-05-11', '黄小琥', '东八里仓库', '张翰', '10', '苹果', '大的', '红富士', '30', '60', '1800.0', '');
INSERT INTO `t_chuku` VALUES ('10', '新品销售', '2017051594846039', '2017-05-15', '黄小琥', '东八里仓库', '张翰', '3', '毛笔', '2B', '蓝光', '659', '3', '1977.0', '');
INSERT INTO `t_chuku` VALUES ('11', '新品销售', '2017051594846188', '2017-05-15', '小慧', '东八里仓库', '张翰', '3', '毛笔', '2B', '蓝光', '1000', '3', '3000.0', '');

-- ----------------------------
-- Table structure for t_gongyingshang
-- ----------------------------
DROP TABLE IF EXISTS `t_gongyingshang`;
CREATE TABLE `t_gongyingshang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `lianxiren` varchar(100) DEFAULT NULL,
  `dizhi` varchar(100) DEFAULT NULL,
  `tel1` varchar(100) DEFAULT NULL,
  `tel2` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `chuanzhen` varchar(100) DEFAULT NULL,
  `beizhu` varchar(100) DEFAULT NULL,
  `istingyong` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='供应商表';

-- ----------------------------
-- Records of t_gongyingshang
-- ----------------------------
INSERT INTO `t_gongyingshang` VALUES ('2', '王晓明', '张三毛', '东仪路', '13123123231', '13123123232', 'mao@163.com', '13123123233', '供货', '在用');
INSERT INTO `t_gongyingshang` VALUES ('3', '程健', '黄莹', '电子二路', '13123123231', '13123123232', 'yinjg@163.com', '13123123233', '测试', '在用');

-- ----------------------------
-- Table structure for t_gongzi
-- ----------------------------
DROP TABLE IF EXISTS `t_gongzi`;
CREATE TABLE `t_gongzi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `bumen` varchar(100) DEFAULT NULL,
  `riqi` varchar(100) DEFAULT NULL,
  `num` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='工资表';

-- ----------------------------
-- Records of t_gongzi
-- ----------------------------
INSERT INTO `t_gongzi` VALUES ('1', '张翰', '人力资源部', '2017-04-30', '2100');
INSERT INTO `t_gongzi` VALUES ('2', '李红', '人力资源部', '2017-04-30', '2600');
INSERT INTO `t_gongzi` VALUES ('3', '刘慧', '财务部', '2017-04-05', '3600');
INSERT INTO `t_gongzi` VALUES ('4', '张翰', '人力资源部', '2017-05-17', '2800');
INSERT INTO `t_gongzi` VALUES ('5', '张小飞', '市场部', '2017-04-30', '4600');
INSERT INTO `t_gongzi` VALUES ('6', '张小飞', '市场部', '2017-05-10', '5600');
INSERT INTO `t_gongzi` VALUES ('7', '李红', '人力资源部', '2017-05-11', '10000');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodNo` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `guige` varchar(100) DEFAULT NULL,
  `gongyingshang` varchar(100) DEFAULT NULL,
  `yanse` varchar(100) DEFAULT NULL,
  `pinpai` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `weizhi` varchar(100) DEFAULT NULL,
  `num` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `danwei` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('3', 'g1001', '毛笔', '2B', '王晓明', '黑色', '蓝光', '学习用品', '东三架', '9000', '3', null);
INSERT INTO `t_goods` VALUES ('4', 'g1002', '钢笔5', '1*15', '王晓明', '黑色5', '胜利5', '食品', '第二架5', '1088', '4.35', null);
INSERT INTO `t_goods` VALUES ('7', '111', '12', '23', '王晓明', '123', '123123', '食品', '东八里仓库', '23', '12', '包');
INSERT INTO `t_goods` VALUES ('8', '2014051500091729', '222222222222', '22222222222222222222222222', '王晓明', '22222222222222222222222', '222222222', '食品', '东八里仓库', '2222222222222', '2222', '包');
INSERT INTO `t_goods` VALUES ('9', '2017043093533313', '平底锅', '12KG', '王晓明', '白金不锈钢', '苏泊尔', '餐具类', '西八里仓库2', '209', '168', '包');
INSERT INTO `t_goods` VALUES ('10', '2017051194487704', '苹果', '大的', '王晓明', '红色', '红富士', '食品', '东八里仓库', '520', '60', '公斤');

-- ----------------------------
-- Table structure for t_introduction
-- ----------------------------
DROP TABLE IF EXISTS `t_introduction`;
CREATE TABLE `t_introduction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gg` varchar(255) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_introduction
-- ----------------------------

-- ----------------------------
-- Table structure for t_kehu
-- ----------------------------
DROP TABLE IF EXISTS `t_kehu`;
CREATE TABLE `t_kehu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kehuname` varchar(100) DEFAULT NULL,
  `kehutype` varchar(100) DEFAULT NULL,
  `dizhi` varchar(100) DEFAULT NULL,
  `lianxiren` varchar(100) DEFAULT NULL,
  `tel1` varchar(100) DEFAULT NULL,
  `tel2` varchar(100) DEFAULT NULL,
  `chuanzhen` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `beizhu` varchar(100) DEFAULT NULL,
  `iszaiyong` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of t_kehu
-- ----------------------------
INSERT INTO `t_kehu` VALUES ('3', '黄小琥', '潜在客户', '南二环', '黄小琥', '13123123231', '13123123232', '13123123233', 'hxh@163.com', '潜在客户', '在用');
INSERT INTO `t_kehu` VALUES ('4', '小慧', '潜在客户', '北二环', '小慧', '13123123231', '13123123232', '13123123233', 'xiaohui@163.com', '老客户', '在用');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` varchar(255) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `User_Fsr` int(11) DEFAULT NULL,
  `User_Jsr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oa4mv5qj0sqj0we556035uujp` (`User_Fsr`),
  KEY `FK_f8e6w63qcqq7ovck9p24tarfn` (`User_Jsr`),
  CONSTRAINT `FK_f8e6w63qcqq7ovck9p24tarfn` FOREIGN KEY (`User_Jsr`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_oa4mv5qj0sqj0we556035uujp` FOREIGN KEY (`User_Fsr`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_photo
-- ----------------------------
DROP TABLE IF EXISTS `t_photo`;
CREATE TABLE `t_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `fileName1` varchar(255) DEFAULT NULL,
  `fileName2` varchar(255) DEFAULT NULL,
  `fileName3` varchar(255) DEFAULT NULL,
  `fileName4` varchar(255) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  `jg` double NOT NULL,
  `js` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_auktpin78v83k3m853icf84pc` (`brand_id`),
  KEY `FK_2d9pnn6ktk352aa8dc7fjqgfv` (`category_id`),
  KEY `FK_pk1m1dnqq1ehyv197nf76moa3` (`user_id`),
  CONSTRAINT `FK_2d9pnn6ktk352aa8dc7fjqgfv` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`id`),
  CONSTRAINT `FK_auktpin78v83k3m853icf84pc` FOREIGN KEY (`brand_id`) REFERENCES `t_brand` (`id`),
  CONSTRAINT `FK_pk1m1dnqq1ehyv197nf76moa3` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_photo
-- ----------------------------

-- ----------------------------
-- Table structure for t_purchase
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase`;
CREATE TABLE `t_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  `money` double NOT NULL,
  `price` double NOT NULL,
  `time` datetime DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mk4hqspsn92mxmjoqydy99pla` (`photo_id`),
  KEY `FK_207dkr7b4an3av28b483722kt` (`user_id`),
  CONSTRAINT `FK_207dkr7b4an3av28b483722kt` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_mk4hqspsn92mxmjoqydy99pla` FOREIGN KEY (`photo_id`) REFERENCES `t_photo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_ruku
-- ----------------------------
DROP TABLE IF EXISTS `t_ruku`;
CREATE TABLE `t_ruku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rukuType` varchar(100) DEFAULT NULL,
  `rukuNo` varchar(100) DEFAULT NULL,
  `rukuriqi` varchar(100) DEFAULT NULL,
  `gongyingshang` varchar(100) DEFAULT NULL,
  `lianxiren` varchar(100) DEFAULT NULL,
  `cangku` varchar(100) DEFAULT NULL,
  `jingshouren` varchar(100) DEFAULT NULL,
  `goodsNo` varchar(100) DEFAULT NULL,
  `goodsName` varchar(100) DEFAULT NULL,
  `goodsGuige` varchar(100) DEFAULT NULL,
  `goodsPinpai` varchar(100) DEFAULT NULL,
  `goodsNum` varchar(100) DEFAULT NULL,
  `goodsPrice` varchar(100) DEFAULT NULL,
  `goodsTotal` varchar(100) DEFAULT NULL,
  `beizhu` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='入库表';

-- ----------------------------
-- Records of t_ruku
-- ----------------------------
INSERT INTO `t_ruku` VALUES ('16', '采购入库', '2017043093522646', '2017-04-28  ', '王晓明', '张二茂', '东八里仓库', '张翰', '3', '毛笔', '2B', '蓝光', '2', '3', '6.0', '3');
INSERT INTO `t_ruku` VALUES ('17', '采购入库', '2017043093525495', '2017-04-26  ', '王晓明', '王二小', '东八里仓库', '张翰', '3', '毛笔', '2B', '蓝光', '1', '3', '3.0', '2');
INSERT INTO `t_ruku` VALUES ('18', '采购入库', '2017043093525798', '2017-03-22  ', '王晓明', '33', '东八里仓库', '张翰', '3', '毛笔', '2B', '蓝光', '3', '3', '9.0', '1');
INSERT INTO `t_ruku` VALUES ('19', '采购入库', '2017043093528395', '2016-04-20  ', '王晓明', '22', '东八里仓库', '张翰', '3', '毛笔', '2B', '蓝光', '3', '3', '9.0', '2');
INSERT INTO `t_ruku` VALUES ('20', '采购入库', '2017043093528535', '2016-05-26  ', '王晓明', '666', '西八里仓库2', '李红', '4', '钢笔5', '1*15', '胜利5', '6', '4.35', '26.099998', '2');
INSERT INTO `t_ruku` VALUES ('21', '采购入库', '2017043093533374', '2017-04-26  ', '王晓明', '张二茂', '京东临时仓库11', '张小飞', '3', '毛笔', '2B', '蓝光', '2', '3', '6.0', '3');
INSERT INTO `t_ruku` VALUES ('22', '采购入库', '2017043093533429', '2017-04-19  ', '王晓明', '88', '东八里仓库', '张翰', '9', '平底锅', '12KG', '苏泊尔', '2', '168', '336.0', '3');
INSERT INTO `t_ruku` VALUES ('23', '采购入库', '2017051194487759', '2017-05-10  ', '王晓明', '张三', '东八里仓库', '张翰', '10', '苹果', '大的', '红富士', '50', '60', '3000.0', '');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品类别';

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('1', '食品');
INSERT INTO `t_type` VALUES ('2', '学习用品');
INSERT INTO `t_type` VALUES ('3', '娱乐用品');
INSERT INTO `t_type` VALUES ('4', '餐具类');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userNo` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `qq` varchar(100) DEFAULT NULL,
  `daozhiriqi` varchar(100) DEFAULT NULL,
  `bumen` varchar(100) DEFAULT NULL,
  `wenhuachengdu` varchar(100) DEFAULT NULL,
  `hunyinzhuangkuang` varchar(100) DEFAULT NULL,
  `dizhi` varchar(100) DEFAULT NULL,
  `shifouzaizhi` varchar(100) DEFAULT NULL,
  `isSh` int(11) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2qjfg4ive1qmy8ev91c0mwvlm` (`role_id`),
  CONSTRAINT `FK_2qjfg4ive1qmy8ev91c0mwvlm` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('5', 'u1001', '张翰', '男', '23', '13888888888', '307155597', '2014-03-18  ', '人力资源部', '研究生', '未婚', '高新路', '在职', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('6', 'u1002', '李红', '男', '212', '13727890981', '307155597', '2014-03-31  ', '人力资源部', '研究生', '已婚', '雁塔路', '在职', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('7', 'u1003', '刘慧', '女', '32', '13878597859', '213123', '2017-04-30', '财务部', '研究生', '已婚', '上海路', '在职', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('8', 'u1005', '张小飞', '男', '26', '13856894879', '123123', '2017-04-30', '市场部', '研究生', '已婚', '上海路', '在职', null, null, null, null, null);

-- ----------------------------
-- Table structure for t_xiaoshou
-- ----------------------------
DROP TABLE IF EXISTS `t_xiaoshou`;
CREATE TABLE `t_xiaoshou` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `xiaoshouType` varchar(255) DEFAULT NULL,
  `xiaoshouNo` varchar(100) DEFAULT NULL,
  `xiaoshouriqi` datetime DEFAULT NULL,
  `kehu` varchar(100) DEFAULT NULL COMMENT '客户',
  `cangku` varchar(100) DEFAULT NULL COMMENT '仓库',
  `jingshouren` varchar(255) DEFAULT NULL,
  `goodsNo` int(11) DEFAULT NULL COMMENT '商品编号',
  `goodsName` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `goodsGuige` varchar(100) DEFAULT NULL COMMENT '商品规格',
  `goodsPinpai` varchar(100) DEFAULT NULL COMMENT '品牌',
  `goodsNum` int(11) DEFAULT NULL COMMENT '商品数量',
  `goodsPrice` double(10,1) DEFAULT '0.0' COMMENT '成本价',
  `xiaoshouPrice` double(10,1) DEFAULT '0.0' COMMENT '售价',
  `cangkunum` int(10) DEFAULT NULL COMMENT '库存',
  `备注` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售表';

-- ----------------------------
-- Records of t_xiaoshou
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
