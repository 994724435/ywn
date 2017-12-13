/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : 1

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-11-20 18:45:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gs_activity_log`
-- ----------------------------
DROP TABLE IF EXISTS `gs_activity_log`;
CREATE TABLE `gs_activity_log` (
  `id` int(11) NOT NULL DEFAULT '0',
  `user_account` int(11) NOT NULL COMMENT '使用者',
  `create_time` int(11) NOT NULL COMMENT '时间',
  `friend_account` int(11) NOT NULL COMMENT '对谁使用',
  `friend_nick` varchar(20) DEFAULT NULL COMMENT '推荐人用户名',
  `nick` varchar(20) DEFAULT NULL COMMENT '用户名',
  `user_nick` varchar(20) DEFAULT NULL COMMENT ' 姓名',
  `wx` varchar(20) DEFAULT NULL,
  `zhifubao` varchar(20) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL COMMENT '1 男0 女'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源使用记录';

-- ----------------------------
-- Records of gs_activity_log
-- ----------------------------

-- ----------------------------
-- Table structure for `gs_beltline`
-- ----------------------------
DROP TABLE IF EXISTS `gs_beltline`;
CREATE TABLE `gs_beltline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `animal_on` char(18) NOT NULL COMMENT '给那个鸡喂养了',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 生产中 2生产结束,待收取 3收取成功',
  `amount` int(11) NOT NULL COMMENT '生产的个数',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `expired_time` int(11) NOT NULL COMMENT '生产结束的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生产线,队列任务';

-- ----------------------------
-- Records of gs_beltline
-- ----------------------------

-- ----------------------------
-- Table structure for `gs_bonus_log`
-- ----------------------------
DROP TABLE IF EXISTS `gs_bonus_log`;
CREATE TABLE `gs_bonus_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `touserid` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `desc` varchar(125) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='动态奖金记录';

-- ----------------------------
-- Records of gs_bonus_log
-- ----------------------------

-- ----------------------------
-- Table structure for `gs_brooding_log`
-- ----------------------------
DROP TABLE IF EXISTS `gs_brooding_log`;
CREATE TABLE `gs_brooding_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `animal_on` varchar(125) NOT NULL COMMENT '鸡的编号',
  `number` int(11) NOT NULL COMMENT '孵卵个数',
  `day` int(11) NOT NULL COMMENT '第几天产的蛋',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拾蛋日志';

-- ----------------------------
-- Records of gs_brooding_log
-- ----------------------------

-- ----------------------------
-- Table structure for `gs_clean_log`
-- ----------------------------
DROP TABLE IF EXISTS `gs_clean_log`;
CREATE TABLE `gs_clean_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '使用者',
  `rate` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '利润',
  `create_time` int(11) NOT NULL COMMENT '时间',
  `friendid` int(11) NOT NULL COMMENT '对谁使用',
  `task_id` int(1) DEFAULT NULL COMMENT '任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16980 DEFAULT CHARSET=utf8 COMMENT='资源使用记录';

-- ----------------------------
-- Records of gs_clean_log
-- ----------------------------
INSERT INTO `gs_clean_log` VALUES ('16970', '1', '0.00', '1493365406', '1357', null);
INSERT INTO `gs_clean_log` VALUES ('16971', '1', '0.00', '1493449811', '2', null);
INSERT INTO `gs_clean_log` VALUES ('16972', '1', '0.63', '1493489976', '1357', null);
INSERT INTO `gs_clean_log` VALUES ('16973', '1', '0.00', '1493489976', '1359', null);
INSERT INTO `gs_clean_log` VALUES ('16974', '1', '0.00', '1493567566', '2', null);
INSERT INTO `gs_clean_log` VALUES ('16975', '1', '0.66', '1493567566', '1357', null);
INSERT INTO `gs_clean_log` VALUES ('16976', '1', '0.00', '1493567566', '1359', null);
INSERT INTO `gs_clean_log` VALUES ('16977', '1', '0.00', '1493567566', '1361', null);
INSERT INTO `gs_clean_log` VALUES ('16978', '1', '0.00', '1493727506', '1362', null);
INSERT INTO `gs_clean_log` VALUES ('16979', '1', '0.00', '1511072432', '2', null);

-- ----------------------------
-- Table structure for `gs_dogmsg`
-- ----------------------------
DROP TABLE IF EXISTS `gs_dogmsg`;
CREATE TABLE `gs_dogmsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lev` smallint(6) NOT NULL COMMENT '等级',
  `rate` decimal(4,2) NOT NULL COMMENT '利益利率',
  `upgrade_percent` float(4,2) NOT NULL COMMENT '升级成功率',
  `create_time` int(11) DEFAULT NULL,
  `updatedog_num` int(11) DEFAULT '100' COMMENT '升级狗需要的蛋',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`lev`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_dogmsg
-- ----------------------------
INSERT INTO `gs_dogmsg` VALUES ('1', '2', '0.10', '80.00', '0', '200');
INSERT INTO `gs_dogmsg` VALUES ('2', '9', '0.45', '10.00', '1489850447', '900');
INSERT INTO `gs_dogmsg` VALUES ('3', '6', '0.30', '40.00', '1489850431', '600');
INSERT INTO `gs_dogmsg` VALUES ('5', '3', '0.15', '70.00', '1489850447', '300');
INSERT INTO `gs_dogmsg` VALUES ('6', '4', '0.20', '60.00', '1489850447', '400');
INSERT INTO `gs_dogmsg` VALUES ('7', '1', '0.05', '99.99', '1489850447', '100');
INSERT INTO `gs_dogmsg` VALUES ('8', '5', '0.25', '50.00', '1489850447', '500');
INSERT INTO `gs_dogmsg` VALUES ('10', '7', '0.35', '30.00', '1489850447', '700');
INSERT INTO `gs_dogmsg` VALUES ('11', '8', '0.40', '20.00', '1489850447', '800');

-- ----------------------------
-- Table structure for `gs_email`
-- ----------------------------
DROP TABLE IF EXISTS `gs_email`;
CREATE TABLE `gs_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `send` tinyint(1) NOT NULL COMMENT '0未读 1已读',
  `msg` varchar(256) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5222 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_email
-- ----------------------------
INSERT INTO `gs_email` VALUES ('5204', '15299999999', '1493364072', '0', '恭喜您，成为新农场主，已配送300只小天鹅到仓库中。');
INSERT INTO `gs_email` VALUES ('5205', '888888', '1493366114', '0', '恭喜！在幸运转盘中获得奖品 (六等奖奖励2只鹅)已派送到您的仓库中  ');
INSERT INTO `gs_email` VALUES ('5206', '888888', '1493431717', '0', '恭喜！在幸运转盘中获得奖品 (六等奖奖励2只鹅)已派送到您的仓库中  ');
INSERT INTO `gs_email` VALUES ('5207', '888888', '1493431729', '0', '恭喜！在幸运转盘中获得奖品 (六等奖奖励2只鹅)已派送到您的仓库中  ');
INSERT INTO `gs_email` VALUES ('5208', '888888', '1493431743', '0', '恭喜！在幸运转盘中获得奖品 (五等奖奖励8只鹅)已派送到您的仓库中  ');
INSERT INTO `gs_email` VALUES ('5209', '888888', '1493465840', '0', '恭喜！在幸运转盘中获得奖品 (五等奖奖励8只鹅)已派送到您的仓库中  ');
INSERT INTO `gs_email` VALUES ('5210', '888888', '1493519034', '0', '恭喜！在幸运转盘中获得奖品 (六等奖奖励2只鹅)已派送到您的仓库中  ');
INSERT INTO `gs_email` VALUES ('5211', '888888', '1493519157', '0', '恭喜！在幸运转盘中获得奖品 (六等奖奖励2只鹅)已派送到您的仓库中  ');
INSERT INTO `gs_email` VALUES ('5212', '888888', '1493572523', '0', '恭喜！在幸运转盘中获得奖品 (六等奖奖励2只鹅)已派送到您的仓库中  ');
INSERT INTO `gs_email` VALUES ('5213', '888888', '1493581009', '0', '恭喜！在幸运转盘中获得奖品 (六等奖奖励2只鹅)已派送到您的仓库中  ');
INSERT INTO `gs_email` VALUES ('5214', '888888', '1493597014', '0', '恭喜！在幸运转盘中获得奖品 (六等奖奖励2只鹅)已派送到您的仓库中  ');
INSERT INTO `gs_email` VALUES ('5215', '888888', '1493666900', '0', '恭喜！在幸运转盘中获得奖品 (六等奖奖励2只鹅)已派送到您的仓库中  ');
INSERT INTO `gs_email` VALUES ('5216', '888888', '1493683294', '0', '恭喜！在幸运转盘中获得奖品 (六等奖奖励2只鹅)已派送到您的仓库中  ');
INSERT INTO `gs_email` VALUES ('5217', '13852000001', '1493696104', '0', '恭喜您，成为新农场主，已配送300只小天鹅到仓库中。');
INSERT INTO `gs_email` VALUES ('5218', '888888', '1493702219', '0', '恭喜！在幸运转盘中获得奖品 (五等奖奖励8只鹅)已派送到您的仓库中  ');
INSERT INTO `gs_email` VALUES ('5219', '15233333333', '1493788198', '0', '恭喜您，成为新农场主，已配送300只小天鹅到仓库中。');
INSERT INTO `gs_email` VALUES ('5220', '13999999999', '1493788343', '0', '恭喜您，成为新农场主，已配送300只小天鹅到仓库中。');
INSERT INTO `gs_email` VALUES ('5221', '888888', '1493797385', '0', '恭喜！在幸运转盘中获得奖品 (六等奖奖励2只鹅)已派送到您的仓库中  ');

-- ----------------------------
-- Table structure for `gs_farm_log`
-- ----------------------------
DROP TABLE IF EXISTS `gs_farm_log`;
CREATE TABLE `gs_farm_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `desc` varchar(125) NOT NULL COMMENT '购买描述',
  `create_time` int(11) NOT NULL,
  `farm_type` int(1) NOT NULL COMMENT '类型:1绿地2金地',
  `number` float(11,2) NOT NULL COMMENT '金额/用富贵蛋的个数',
  `farm_id` int(11) DEFAULT NULL COMMENT '地id',
  `type` tinyint(1) DEFAULT NULL COMMENT '1 养鸡 2孵化蛋',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23972 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_farm_log
-- ----------------------------
INSERT INTO `gs_farm_log` VALUES ('23954', '1', '', '1493363834', '1', '100.00', '1487', '2');
INSERT INTO `gs_farm_log` VALUES ('23955', '1', '', '1493363971', '1', '600.00', '1487', '2');
INSERT INTO `gs_farm_log` VALUES ('23956', '1', '', '1493364904', '1', '5.00', '1487', '1');
INSERT INTO `gs_farm_log` VALUES ('23957', '1', '', '1493465516', '1', '93.00', '1487', '2');
INSERT INTO `gs_farm_log` VALUES ('23958', '1', '', '1493489823', '2', '3143.00', '1493', '2');
INSERT INTO `gs_farm_log` VALUES ('23959', '1', '', '1493509283', '2', '7188.00', '1501', '1');
INSERT INTO `gs_farm_log` VALUES ('23960', '1', '', '1493522247', '2', '7182.00', '1502', '1');
INSERT INTO `gs_farm_log` VALUES ('23961', '1', '', '1493522273', '2', '901.00', '1489', '2');
INSERT INTO `gs_farm_log` VALUES ('23962', '1', '', '1493567619', '2', '21.00', '1489', '2');
INSERT INTO `gs_farm_log` VALUES ('23963', '1', '', '1493581047', '1', '250.00', '1496', '2');
INSERT INTO `gs_farm_log` VALUES ('23964', '1', '', '1493605276', '1', '9.00', '1499', '2');
INSERT INTO `gs_farm_log` VALUES ('23965', '1', '', '1493606336', '2', '32.00', '1489', '1');
INSERT INTO `gs_farm_log` VALUES ('23966', '1', '', '1493606394', '2', '593.00', '1489', '2');
INSERT INTO `gs_farm_log` VALUES ('23967', '1', '', '1493610423', '2', '3209.00', '1489', '1');
INSERT INTO `gs_farm_log` VALUES ('23968', '1', '', '1493666749', '2', '100.00', '1489', '2');
INSERT INTO `gs_farm_log` VALUES ('23969', '1', '', '1493704448', '1', '200.00', '1487', '2');
INSERT INTO `gs_farm_log` VALUES ('23970', '1357', '', '1493788444', '1', '6.00', '1488', '2');
INSERT INTO `gs_farm_log` VALUES ('23971', '1', '', '1511017621', '1', '581.00', '1492', '1');

-- ----------------------------
-- Table structure for `gs_lottery`
-- ----------------------------
DROP TABLE IF EXISTS `gs_lottery`;
CREATE TABLE `gs_lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL COMMENT '0:鹅 ，1：实物',
  `name` varchar(30) NOT NULL,
  `animal_num` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_lottery
-- ----------------------------
INSERT INTO `gs_lottery` VALUES ('19', '0', '五等奖奖励8只鹅', '8', '30');
INSERT INTO `gs_lottery` VALUES ('20', '1', '二等奖奖励50元话费', '0', '0');
INSERT INTO `gs_lottery` VALUES ('21', '0', '四等奖奖励16鹅', '16', '2');
INSERT INTO `gs_lottery` VALUES ('22', '0', '三等奖奖励32只鹅', '32', '1');
INSERT INTO `gs_lottery` VALUES ('23', '1', '一等奖苹果732G一台', '0', '0');
INSERT INTO `gs_lottery` VALUES ('24', '0', '六等奖奖励2只鹅', '2', '67');

-- ----------------------------
-- Table structure for `gs_lottery_record`
-- ----------------------------
DROP TABLE IF EXISTS `gs_lottery_record`;
CREATE TABLE `gs_lottery_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `animal_num` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `create_time` int(11) NOT NULL,
  `send` tinyint(4) NOT NULL COMMENT '0：未发货 1：已发货',
  `address` varchar(200) NOT NULL,
  `receive` varchar(30) NOT NULL,
  `phone` char(15) NOT NULL,
  `kuaidi` varchar(1024) NOT NULL,
  `lotteryid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4905 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_lottery_record
-- ----------------------------
INSERT INTO `gs_lottery_record` VALUES ('4890', '1', '2', '六等奖奖励2只鹅', '1493362483', '1', '', '', '', '', '24');
INSERT INTO `gs_lottery_record` VALUES ('4891', '1', '2', '六等奖奖励2只鹅', '1493366114', '1', '', '', '', '', '24');
INSERT INTO `gs_lottery_record` VALUES ('4892', '1', '2', '六等奖奖励2只鹅', '1493431717', '1', '', '', '', '', '24');
INSERT INTO `gs_lottery_record` VALUES ('4893', '1', '2', '六等奖奖励2只鹅', '1493431729', '1', '', '', '', '', '24');
INSERT INTO `gs_lottery_record` VALUES ('4894', '1', '8', '五等奖奖励8只鹅', '1493431743', '1', '', '', '', '', '19');
INSERT INTO `gs_lottery_record` VALUES ('4895', '1', '8', '五等奖奖励8只鹅', '1493465840', '1', '', '', '', '', '19');
INSERT INTO `gs_lottery_record` VALUES ('4896', '1', '2', '六等奖奖励2只鹅', '1493519034', '1', '', '', '', '', '24');
INSERT INTO `gs_lottery_record` VALUES ('4897', '1', '2', '六等奖奖励2只鹅', '1493519157', '1', '', '', '', '', '24');
INSERT INTO `gs_lottery_record` VALUES ('4898', '1', '2', '六等奖奖励2只鹅', '1493572523', '1', '', '', '', '', '24');
INSERT INTO `gs_lottery_record` VALUES ('4899', '1', '2', '六等奖奖励2只鹅', '1493581009', '1', '', '', '', '', '24');
INSERT INTO `gs_lottery_record` VALUES ('4900', '1', '2', '六等奖奖励2只鹅', '1493597014', '1', '', '', '', '', '24');
INSERT INTO `gs_lottery_record` VALUES ('4901', '1', '2', '六等奖奖励2只鹅', '1493666900', '1', '', '', '', '', '24');
INSERT INTO `gs_lottery_record` VALUES ('4902', '1', '2', '六等奖奖励2只鹅', '1493683294', '1', '', '', '', '', '24');
INSERT INTO `gs_lottery_record` VALUES ('4903', '1', '8', '五等奖奖励8只鹅', '1493702219', '1', '', '', '', '', '19');
INSERT INTO `gs_lottery_record` VALUES ('4904', '1', '2', '六等奖奖励2只鹅', '1493797385', '1', '', '', '', '', '24');

-- ----------------------------
-- Table structure for `gs_market`
-- ----------------------------
DROP TABLE IF EXISTS `gs_market`;
CREATE TABLE `gs_market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `touserid` int(11) NOT NULL,
  `number` int(11) NOT NULL COMMENT '挂卖多少个',
  `price` int(11) NOT NULL COMMENT '价格',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 挂卖中 2买家锁定 3交易完成',
  `create_time` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1 市场 2 平台',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='市场';

-- ----------------------------
-- Records of gs_market
-- ----------------------------

-- ----------------------------
-- Table structure for `gs_market_price`
-- ----------------------------
DROP TABLE IF EXISTS `gs_market_price`;
CREATE TABLE `gs_market_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(22) NOT NULL,
  `start` varchar(20) NOT NULL,
  `price` decimal(4,2) NOT NULL COMMENT '利率',
  PRIMARY KEY (`id`),
  UNIQUE KEY `start` (`start`),
  KEY `start_2` (`start`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='市场价格';

-- ----------------------------
-- Records of gs_market_price
-- ----------------------------
INSERT INTO `gs_market_price` VALUES ('1', '当日利率:3.2%', '2017-04-03', '3.20');
INSERT INTO `gs_market_price` VALUES ('2', '当日利率:3.1%', '2017-04-04', '3.10');
INSERT INTO `gs_market_price` VALUES ('6', '当日利率:4.07%', '2017-04-05', '4.07');
INSERT INTO `gs_market_price` VALUES ('7', '当日利率:3.53%', '2017-04-06', '3.53');
INSERT INTO `gs_market_price` VALUES ('8', '当日利率:3.31%', '2017-04-07', '3.31');
INSERT INTO `gs_market_price` VALUES ('9', '当日利率:3.13%', '2017-04-08', '3.13');
INSERT INTO `gs_market_price` VALUES ('10', '当日利率:3.37%', '2017-04-09', '3.37');
INSERT INTO `gs_market_price` VALUES ('11', '当日利率:2.46%', '2017-04-10', '2.46');
INSERT INTO `gs_market_price` VALUES ('12', '当日利率:3.04%', '2017-04-11', '3.04');
INSERT INTO `gs_market_price` VALUES ('13', '当日利率:2.73%', '2017-04-12', '2.73');
INSERT INTO `gs_market_price` VALUES ('14', '当日利率:3.12%', '2017-04-13', '3.12');
INSERT INTO `gs_market_price` VALUES ('15', '当日利率:2.7%', '2017-04-14', '2.70');
INSERT INTO `gs_market_price` VALUES ('16', '当日利率:3.6%', '2017-04-15', '3.60');
INSERT INTO `gs_market_price` VALUES ('17', '当日利率:3.6%', '2017-04-16', '3.60');
INSERT INTO `gs_market_price` VALUES ('18', '当日利率:2.6%', '2017-04-17', '2.60');
INSERT INTO `gs_market_price` VALUES ('19', '当日利率:2.4%', '2017-04-18', '2.40');
INSERT INTO `gs_market_price` VALUES ('20', '当日利率:2.62%', '2017-04-19', '2.62');
INSERT INTO `gs_market_price` VALUES ('21', '当日利率:2.42%', '2017-04-20', '2.42');
INSERT INTO `gs_market_price` VALUES ('22', '当日利率:2.7%', '2017-04-21', '2.70');
INSERT INTO `gs_market_price` VALUES ('23', '当日利率:2.41%', '2017-04-22', '2.41');
INSERT INTO `gs_market_price` VALUES ('24', '当日利率:2.53%', '2017-04-23', '2.53');
INSERT INTO `gs_market_price` VALUES ('25', '当日利率:2.4%', '2017-04-24', '2.40');
INSERT INTO `gs_market_price` VALUES ('26', '当日利率:2.45%', '2017-04-25', '2.45');
INSERT INTO `gs_market_price` VALUES ('27', '当日利率:2.2%', '2017-04-26', '2.20');
INSERT INTO `gs_market_price` VALUES ('28', '当日利率:2.5%', '2017-04-28', '2.50');
INSERT INTO `gs_market_price` VALUES ('29', '当日利率:2.6%', '2017-04-29', '2.60');
INSERT INTO `gs_market_price` VALUES ('30', '当日利率:2.5%', '2017-04-30', '2.50');
INSERT INTO `gs_market_price` VALUES ('31', '当日利率:20%', '2017-05-03', '20.00');
INSERT INTO `gs_market_price` VALUES ('32', '当日利率:2.5%', '2017-05-04', '2.50');
INSERT INTO `gs_market_price` VALUES ('33', '当日利率:2.3%', '2017-05-02', '2.30');
INSERT INTO `gs_market_price` VALUES ('34', '当日利率:2.3%', '2017-11-19', '2.30');
INSERT INTO `gs_market_price` VALUES ('35', '当日利率:2.5%', '2017-11-18', '2.50');
INSERT INTO `gs_market_price` VALUES ('36', '当日利率:2.4%', '2017-11-17', '2.40');

-- ----------------------------
-- Table structure for `gs_member`
-- ----------------------------
DROP TABLE IF EXISTS `gs_member`;
CREATE TABLE `gs_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员编号',
  `account` varchar(20) NOT NULL COMMENT '会员账户',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '会员密码',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1男 2女',
  `token` varchar(32) NOT NULL DEFAULT '1' COMMENT '用户token',
  `nickname` varchar(20) DEFAULT '' COMMENT '会员昵称',
  `realname` varchar(20) DEFAULT '' COMMENT '真实姓名',
  `references` varchar(20) DEFAULT '' COMMENT '介绍人',
  `second_generation` varchar(255) DEFAULT NULL COMMENT '二代',
  `three_generations` varchar(255) DEFAULT NULL COMMENT '三代',
  `wechat` varchar(20) DEFAULT NULL COMMENT '会员微信号',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '会员等级 0刚注册 未购买 1 购买过  正式玩家',
  `status` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户状态0:正常  1:禁用',
  `path` text COMMENT '上级路径',
  `active` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '激活状态 0:未激活 1:激活',
  `active_time` int(11) unsigned DEFAULT NULL COMMENT '激活时间',
  `safe_question` varchar(20) DEFAULT NULL COMMENT '密保问题',
  `safe_answer` varchar(20) DEFAULT NULL COMMENT '密保答案',
  `reg_ip` varchar(20) DEFAULT NULL COMMENT '注册Ip',
  `reg_time` int(13) unsigned DEFAULT NULL COMMENT '注册时间',
  `last_ip` varchar(20) DEFAULT NULL COMMENT '上一次登录ip',
  `last_time` int(13) unsigned DEFAULT NULL COMMENT '上一次登录时间',
  `alipay` varchar(20) DEFAULT NULL COMMENT '支付宝',
  `highpass` char(32) DEFAULT '' COMMENT '二级密码',
  `bank_name` varchar(30) DEFAULT NULL COMMENT '银行名字',
  `bank_account` varchar(12) DEFAULT NULL COMMENT '银行账户名',
  `bank_code` varchar(30) DEFAULT NULL COMMENT '账户号码',
  `bank_address` varchar(120) DEFAULT NULL COMMENT '账户地址',
  `money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '用户金额',
  `currency` decimal(11,2) DEFAULT '0.00' COMMENT '货币(富贵蛋)',
  `action_code` int(11) NOT NULL DEFAULT '0' COMMENT '拥有的激活码个数',
  `feed` int(11) NOT NULL DEFAULT '0' COMMENT '饲料个数 弃用',
  `dog_lev` tinyint(1) DEFAULT '0' COMMENT '狗等级',
  `machine` tinyint(1) DEFAULT '0' COMMENT '机器',
  `animal_num` decimal(11,2) DEFAULT '0.00' COMMENT '鸡个数',
  `enclosure_lev` tinyint(1) DEFAULT '0' COMMENT '围栏等级',
  `egg_parent_status` tinyint(1) DEFAULT '1' COMMENT '1上级未打扫 2上级已经打扫',
  `machine_egg` decimal(11,2) DEFAULT '0.00' COMMENT '机器里面的蛋',
  `machine_animal` decimal(11,2) DEFAULT '0.00' COMMENT '机器里面的鸡',
  `one_clean` tinyint(1) DEFAULT '0' COMMENT '0 没有 1 有',
  `crean_time` int(11) DEFAULT '0' COMMENT '打扫过期时间',
  `all_rate` decimal(11,2) DEFAULT '0.00' COMMENT '上次任务的所获得总利润',
  `tixian_animal` decimal(11,2) DEFAULT '0.00' COMMENT '课提现的鸡',
  `icon` varchar(64) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=1365 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of gs_member
-- ----------------------------
INSERT INTO `gs_member` VALUES ('1', '888888', 'c4ca4238a0b923820dcc509a6f75849b', '1', 'b99a58f10cd7b45247e9436f303fac18', '888888', '888888', '15299999999', null, null, '1999321213', '18750628888', '0', '0', null, '1', null, null, null, null, null, null, '1511103617', '18888328843', '21218cca77804d2ba1922c33e0151105', null, null, '13123123131', null, '0.00', '210.91', '0', '0', '7', '1', '0.00', '4', '1', '0.00', '0.00', '1', '1496081953', '529.56', '48.00', '3');
INSERT INTO `gs_member` VALUES ('2', '123456', '21218cca77804d2ba1922c33e0151105', '1', '1', '', '000', '888888', null, null, null, '13975547555', '0', '0', null, '0', null, null, null, null, '1491315482', null, null, null, '21218cca77804d2ba1922c33e0151105', null, null, null, null, '0.00', '0.00', '0', '0', '0', '0', '300.00', '0', '2', '0.00', '0.00', '0', '0', '0.00', '0.00', null);
INSERT INTO `gs_member` VALUES ('1357', '15299999999', 'e10adc3949ba59abbe56e057f20f883e', '1', 'cf6cc342add6782590d140402c625fee', '123456', '123456', '888888', '18750628997', '', '123456', '15299999999', '0', '0', null, '1', null, null, null, null, '1493364072', null, '1493788562', '123466', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '0.00', '1.45', '0', '0', '0', '0', '6.00', '0', '1', '0.00', '0.00', '0', '0', '6.30', '0.00', null);
INSERT INTO `gs_member` VALUES ('1359', '1234567890', '96e79218965eb72c92a549dd5a330112', '1', '1', '', '1111111', '888888', null, null, null, '13456789012', '0', '0', null, '0', null, null, null, null, '1493455948', null, null, null, 'e3ceb5881a0a1fdaad01296d7554868d', null, null, null, null, '0.00', '0.00', '0', '0', '0', '0', '0.00', '0', '1', '0.00', '0.00', '0', '0', '0.00', '0.00', null);
INSERT INTO `gs_member` VALUES ('1360', '212312', '96e79218965eb72c92a549dd5a330112', '1', '1', '', '1111111', '', null, null, null, '13456789019', '0', '0', null, '0', null, null, null, null, '1493456198', null, null, null, 'e3ceb5881a0a1fdaad01296d7554868d', null, null, null, null, '0.00', '0.00', '0', '0', '0', '0', '330.00', '0', '1', '0.00', '0.00', '0', '0', '0.00', '0.00', null);
INSERT INTO `gs_member` VALUES ('1361', '123987', '125d0d502244655321fd3c3daf0dc440', '1', '1', '', '852', '888888', null, null, null, '13888888888', '0', '0', null, '0', null, null, null, null, '1493528963', null, null, null, 'a181c2fe7c505919cb269d44365088fc', null, null, null, null, '0.00', '0.00', '0', '0', '0', '0', '0.00', '0', '1', '0.00', '0.00', '0', '0', '0.00', '0.00', null);
INSERT INTO `gs_member` VALUES ('1362', '13852000001', 'e10adc3949ba59abbe56e057f20f883e', '1', '186ff23468786e25acf808398eeeeb86', '123123', '123123', '888888', '15299999999', '', '123123', '13852000001', '0', '0', null, '1', null, null, null, null, '1493696104', null, null, '123123', '4297f44b13955235245b2497399d7a93', null, null, null, null, '0.00', '0.00', '0', '0', '0', '0', '960.00', '0', '1', '0.00', '0.00', '0', '0', '0.00', '0.00', null);
INSERT INTO `gs_member` VALUES ('1363', '15233333333', 'e10adc3949ba59abbe56e057f20f883e', '1', 'ccf49bdf144e688c7d68801f24e8e061', '方法', '发发发', '888888', '15299999999', '', '15233333333', '15233333333', '0', '0', null, '1', null, null, null, null, '1493788198', null, null, '15233333333', '45d01cfa2125d4c01783da2140edd28a', null, null, null, null, '0.00', '0.00', '0', '0', '0', '0', '300.00', '0', '1', '0.00', '0.00', '0', '0', '0.00', '0.00', null);
INSERT INTO `gs_member` VALUES ('1364', '13999999999', 'e10adc3949ba59abbe56e057f20f883e', '1', '46b68474139b9a5bd56c58e88eb6f5e2', '13999999999', '13999999999', '888888', '15299999999', '', '13999999999', '13999999999', '0', '0', null, '1', null, null, null, null, '1493788343', null, null, '13999999999', '502193ee233715b4c40e172206d4dd45', null, null, null, null, '0.00', '0.00', '0', '0', '0', '0', '300.00', '0', '1', '0.00', '0.00', '0', '0', '0.00', '0.00', null);

-- ----------------------------
-- Table structure for `gs_member_cash`
-- ----------------------------
DROP TABLE IF EXISTS `gs_member_cash`;
CREATE TABLE `gs_member_cash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '钱包编号',
  `mid` int(10) unsigned NOT NULL COMMENT '会员id',
  `baoli_wallet` int(20) unsigned DEFAULT '0' COMMENT '保利',
  `baotong_wallet` int(20) unsigned DEFAULT '0' COMMENT '宝通',
  `gongyi_wallet` int(20) unsigned DEFAULT '0' COMMENT '公益',
  `gold_wallet` int(20) unsigned DEFAULT '0' COMMENT '金币',
  `baofeng_wallet` int(20) unsigned DEFAULT '0' COMMENT '宝丰',
  `make_wallet` int(20) unsigned DEFAULT '0' COMMENT '每天生产金币',
  `count_wallet` int(20) unsigned DEFAULT '0' COMMENT '累积挂卖金币',
  `test_wallet` int(20) unsigned DEFAULT '0',
  `financial_wallet` decimal(8,2) NOT NULL COMMENT '理财钱包',
  `reward_wallet` decimal(8,2) NOT NULL COMMENT '奖励钱包',
  `drawing_wallet` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '提现钱包',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of gs_member_cash
-- ----------------------------
INSERT INTO `gs_member_cash` VALUES ('1', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gs_member_cash` VALUES ('2', '1325', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gs_member_cash` VALUES ('3', '1326', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gs_member_cash` VALUES ('4', '1327', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gs_member_cash` VALUES ('5', '1328', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gs_member_cash` VALUES ('6', '1329', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gs_member_cash` VALUES ('7', '1359', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gs_member_cash` VALUES ('8', '1360', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00');
INSERT INTO `gs_member_cash` VALUES ('9', '1361', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for `gs_member_cash_log`
-- ----------------------------
DROP TABLE IF EXISTS `gs_member_cash_log`;
CREATE TABLE `gs_member_cash_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '交易记录信息',
  `before_prize` int(20) unsigned DEFAULT '0' COMMENT '当前奖励钱包',
  `prize` int(10) DEFAULT '0' COMMENT '奖励',
  `after_prize` int(20) unsigned DEFAULT '0' COMMENT '获得奖励之后的金额',
  `date` int(13) DEFAULT NULL COMMENT '生成时间',
  `touch_member` varchar(20) NOT NULL COMMENT '触发用户账户',
  `recep_member` varchar(20) NOT NULL COMMENT '接收用户',
  `status` int(1) unsigned DEFAULT '0' COMMENT '状态 0 收益 1支出',
  `content` varchar(128) DEFAULT NULL COMMENT '明细',
  `wallet` int(1) DEFAULT NULL COMMENT '钱包类型0:现金钱包 1:奖励钱包 2:排单币 3 理财钱包 4提现钱包',
  `drawing_name` varchar(122) DEFAULT NULL COMMENT '提款人的姓名',
  `drawing_code` varchar(122) NOT NULL COMMENT '提款人的卡号',
  `zhuangtai` int(1) NOT NULL DEFAULT '1' COMMENT '1 成功 2失败 3ing',
  `orderid` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of gs_member_cash_log
-- ----------------------------
INSERT INTO `gs_member_cash_log` VALUES ('176', '0', '5000', '5000', '1493318499', '888888', '系统', '0', '系统赠送', '2', null, '', '1', null, null);
INSERT INTO `gs_member_cash_log` VALUES ('177', null, '300', null, '1493455995', '123456', '系统', '0', '系统赠送', '1', null, '', '1', null, null);

-- ----------------------------
-- Table structure for `gs_notice`
-- ----------------------------
DROP TABLE IF EXISTS `gs_notice`;
CREATE TABLE `gs_notice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告显示的id',
  `content` text COMMENT '公告内容',
  `date` int(11) DEFAULT NULL COMMENT '公告时间',
  `title` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of gs_notice
-- ----------------------------
INSERT INTO `gs_notice` VALUES ('3', '					天鹅城火热开盘    									', '1488938886', '4.5号正式内排！');
INSERT INTO `gs_notice` VALUES ('7', '																								重大利好：\r\n【天鹅城】4.5号开始内测，即将迎来4.16正式开盘！\r\n隆重推出2.0新版本，系统更稳定，画面更精美敬请期待！                                     \r\n新版本公测即将来临之际，公司特推出以下活动：1.幸运转盘：话费，手机，小天鹅任你拿！只要你足够幸运，就有机会赢取苹果7手机一部的哦！ 2.从即日起，只要拥有栅栏的玩家就可申购500只天鹅，自愿排队购买，从此天鹅城不再是三百天鹅起步！																										', '1492061178', '新版本即将上线！');
INSERT INTO `gs_notice` VALUES ('8', '天鹅城正式开盘：2.0新版本完美上线！！幸运转盘即将开转多重好礼等你拿《实物奖励联系天鹅城2号客服领取》️即将增设更有趣味性的竞技游戏，力争打造全网最牛的模式！温馨提示：即日起分享指定文字及图片到朋友圈连续三天奖励5只小天鹅连续七天奖励10只天鹅活动持续一个月', '1492414058', '喜讯！喜讯！');
INSERT INTO `gs_notice` VALUES ('10', '					【天鹅城】安卓&amp;amp;苹果，双APP将于今日隆重推出，另一款新游戏也即将揭开神秘面纱，敬请各位玩家期待！				', '1493010566', '号外！号外！');

-- ----------------------------
-- Table structure for `gs_rate_log`
-- ----------------------------
DROP TABLE IF EXISTS `gs_rate_log`;
CREATE TABLE `gs_rate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL COMMENT '任务id',
  `base_rate` float(6,4) DEFAULT NULL COMMENT '每日利率基础利率',
  `dog_rate` float(6,4) DEFAULT NULL COMMENT '哈士奇利率',
  `enclosure_rate` float(6,3) DEFAULT NULL COMMENT '围栏利率',
  `machine_animal` int(11) DEFAULT NULL,
  `machine_rate` float(6,4) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL COMMENT '时间月 日',
  `all_currency` decimal(11,2) DEFAULT NULL COMMENT '蛋数量',
  `userid` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18673 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_rate_log
-- ----------------------------
INSERT INTO `gs_rate_log` VALUES ('18665', '26', '0.0250', '0.0030', '0.000', '39', '0.0250', '04-28', '336.00', '1', '1493447895');
INSERT INTO `gs_rate_log` VALUES ('18666', '26', '0.0250', '0.0000', '0.004', '0', '0.0250', '04-28', '6.30', '1357', '1493447895');
INSERT INTO `gs_rate_log` VALUES ('18667', '27', '0.0260', '0.0035', '0.000', '14', '0.0260', '04-29', '772.19', '1', '1493528142');
INSERT INTO `gs_rate_log` VALUES ('18668', '27', '0.0260', '0.0000', '0.004', '0', '0.0260', '04-29', '6.60', '1357', '1493528142');
INSERT INTO `gs_rate_log` VALUES ('18669', '28', '0.0250', '0.0035', '0.000', '0', '0.0250', '11-18', '529.56', '1', '1511062243');
INSERT INTO `gs_rate_log` VALUES ('18670', '28', '0.0250', '0.0000', '0.004', '0', '0.0250', '11-18', '6.30', '1357', '1511062243');
INSERT INTO `gs_rate_log` VALUES ('18671', '29', '0.0250', '0.0035', '0.000', '0', '0.0250', '11-18', '529.56', '1', '1511072056');
INSERT INTO `gs_rate_log` VALUES ('18672', '29', '0.0250', '0.0000', '0.004', '0', '0.0250', '11-18', '6.30', '1357', '1511072056');

-- ----------------------------
-- Table structure for `gs_rate_task`
-- ----------------------------
DROP TABLE IF EXISTS `gs_rate_task`;
CREATE TABLE `gs_rate_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `username` varchar(120) NOT NULL,
  `create_time` varchar(11) NOT NULL,
  `task_date` varchar(20) NOT NULL,
  `end_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of gs_rate_task
-- ----------------------------
INSERT INTO `gs_rate_task` VALUES ('1', '18750628997', '2017-04-04 ', '2017-04-03', '2017-04-04 23:14:49');
INSERT INTO `gs_rate_task` VALUES ('2', '18750628997', '2017-04-05 ', '2017-04-04', '2017-04-05 00:07:21');
INSERT INTO `gs_rate_task` VALUES ('3', '18750628997', '2017-04-06 ', '2017-04-05', '2017-04-06 00:04:30');
INSERT INTO `gs_rate_task` VALUES ('4', '18750628997', '2017-04-07 ', '2017-04-06', '2017-04-07 00:02:51');
INSERT INTO `gs_rate_task` VALUES ('5', '18750628997', '2017-04-08 ', '2017-04-07', '2017-04-08 00:02:31');
INSERT INTO `gs_rate_task` VALUES ('6', '18750628997', '2017-04-09 ', '2017-04-08', '2017-04-09 00:03:16');
INSERT INTO `gs_rate_task` VALUES ('7', '18750628997', '2017-04-10 ', '2017-04-09', '2017-04-10 00:07:23');
INSERT INTO `gs_rate_task` VALUES ('8', '13431379649', '2017-04-11 ', '2017-04-10', '2017-04-11 00:07:01');
INSERT INTO `gs_rate_task` VALUES ('9', '13431379649', '2017-04-12 ', '2017-04-11', '2017-04-12 00:02:48');
INSERT INTO `gs_rate_task` VALUES ('10', '13431379649', '2017-04-13 ', '2017-04-12', '2017-04-13 00:13:44');
INSERT INTO `gs_rate_task` VALUES ('11', 'ljt9988998', '2017-04-14 ', '2017-04-13', '2017-04-14 00:06:14');
INSERT INTO `gs_rate_task` VALUES ('12', 'ljt9988998', '2017-04-15 ', '2017-04-14', '2017-04-15 00:06:59');
INSERT INTO `gs_rate_task` VALUES ('13', 'ljt9988998', '2017-04-16 ', '2017-04-15', '2017-04-16 00:24:51');
INSERT INTO `gs_rate_task` VALUES ('14', 'ljt9988998', '2017-04-17 ', '2017-04-16', '2017-04-17 00:04:00');
INSERT INTO `gs_rate_task` VALUES ('15', 'ljt9988998', '2017-04-18 ', '2017-04-17', '2017-04-18 00:05:09');
INSERT INTO `gs_rate_task` VALUES ('16', 'ljt9988998', '2017-04-19 ', '2017-04-18', '2017-04-19 00:06:42');
INSERT INTO `gs_rate_task` VALUES ('17', 'ljt9988998', '2017-04-20 ', '2017-04-19', '2017-04-20 00:15:58');
INSERT INTO `gs_rate_task` VALUES ('18', 'ljt9988998', '2017-04-21 ', '2017-04-20', '2017-04-21 00:10:22');
INSERT INTO `gs_rate_task` VALUES ('19', 'ljt9988998', '2017-04-22 ', '2017-04-21', '2017-04-22 00:11:19');
INSERT INTO `gs_rate_task` VALUES ('20', 'ljt9988998', '2017-04-23 ', '2017-04-22', '2017-04-23 00:17:28');
INSERT INTO `gs_rate_task` VALUES ('21', 'ljt9988998', '2017-04-24 ', '2017-04-23', '2017-04-24 00:28:45');
INSERT INTO `gs_rate_task` VALUES ('22', 'ljt9988998', '2017-04-25 ', '2017-04-24', '2017-04-25 00:06:07');
INSERT INTO `gs_rate_task` VALUES ('23', 'ljt9988998', '2017-04-26 ', '2017-04-25', '2017-04-26 00:06:58');
INSERT INTO `gs_rate_task` VALUES ('25', 'ljt9988998', '2017-04-27 ', '2017-04-26', '2017-04-27 00:17:32');
INSERT INTO `gs_rate_task` VALUES ('26', 'admin', '2017-04-29 ', '2017-04-28', '2017-04-29 14:38:15');
INSERT INTO `gs_rate_task` VALUES ('27', 'admin', '2017-04-30 ', '2017-04-29', '2017-04-30 12:55:42');
INSERT INTO `gs_rate_task` VALUES ('28', 'admin', '2017-11-19 ', '2017-11-18', '2017-11-19 11:30:43');
INSERT INTO `gs_rate_task` VALUES ('29', 'admin', '2017-11-19 ', '2017-11-18', '2017-11-19 14:14:16');

-- ----------------------------
-- Table structure for `gs_resource_log`
-- ----------------------------
DROP TABLE IF EXISTS `gs_resource_log`;
CREATE TABLE `gs_resource_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '使用者',
  `type` int(11) NOT NULL COMMENT '1激活码 2私聊',
  `counts` int(1) NOT NULL DEFAULT '1' COMMENT '使用数量',
  `create_time` int(11) NOT NULL COMMENT '时间',
  `touserid` int(11) NOT NULL COMMENT '对谁使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源使用记录';

-- ----------------------------
-- Records of gs_resource_log
-- ----------------------------

-- ----------------------------
-- Table structure for `gs_sms_log`
-- ----------------------------
DROP TABLE IF EXISTS `gs_sms_log`;
CREATE TABLE `gs_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` char(11) NOT NULL,
  `code` int(6) NOT NULL,
  `content` varchar(125) NOT NULL,
  `expiration_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_sms_log
-- ----------------------------
INSERT INTO `gs_sms_log` VALUES ('158', '18888888888', '636648', '您正在重设密码，验证码：636648，TEC提醒您注意账号安全【天鹅城】', '1493374464');
INSERT INTO `gs_sms_log` VALUES ('159', '13345565672', '231265', '您正在重设密码，验证码：231265，TEC提醒您注意账号安全【天鹅城】', '1493457320');
INSERT INTO `gs_sms_log` VALUES ('160', '13142411393', '198996', '您正在重设密码，验证码：198996，TEC提醒您注意账号安全【天鹅城】', '1493566435');
INSERT INTO `gs_sms_log` VALUES ('161', '15233333333', '334453', '您正在重设密码，验证码：334453，TEC提醒您注意账号安全【天鹅城】', '1493790107');

-- ----------------------------
-- Table structure for `gs_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `gs_system_config`;
CREATE TABLE `gs_system_config` (
  `id` int(2) unsigned NOT NULL COMMENT '系统配置表',
  `web_title` varchar(20) DEFAULT NULL COMMENT '网站名字',
  `rank_name` varchar(50) DEFAULT NULL COMMENT '等级名称',
  `max_rank` varchar(2) DEFAULT '0' COMMENT '最大等级',
  `rank_default` varchar(10) DEFAULT '0' COMMENT '等级缺省值',
  `offspring_limit` varchar(50) DEFAULT '0' COMMENT '代数收益限制',
  `dynamic_income` varchar(50) DEFAULT '0' COMMENT '动态收益参数',
  `under_limit` varchar(50) DEFAULT '0' COMMENT '下属要求限制',
  `team_limit` varchar(50) DEFAULT '0' COMMENT '团队要求限制',
  `log_prize_name` varchar(20) DEFAULT NULL COMMENT '交易记录中的奖励名称',
  `debit_under_cash` int(10) unsigned DEFAULT '500' COMMENT '用户不打款扣除上级的费用',
  `ban_member_time` int(10) unsigned DEFAULT NULL COMMENT '用户封号时间',
  `to_start_time` int(11) DEFAULT NULL COMMENT '每日开始时间',
  `to_end_time` int(11) DEFAULT NULL COMMENT '每日结束时间',
  `to_switch_time` int(1) DEFAULT NULL COMMENT '开始结束开关',
  `admin_title` varchar(30) DEFAULT NULL COMMENT '后台标题',
  `limit_help_get` varchar(120) DEFAULT NULL COMMENT '提现限制',
  `limit_help_to` varchar(120) DEFAULT NULL COMMENT '帮助限制',
  `limit_help_get_switch` int(1) DEFAULT NULL COMMENT '提现限制开关0:关1:开',
  `limit_help_to_switch` int(1) DEFAULT NULL COMMENT '帮助限制开关',
  `economic_foam_switch` int(1) DEFAULT NULL COMMENT '烧伤开关',
  `economic_foam_i` int(1) DEFAULT NULL COMMENT '烧伤比例',
  `ticket_switch` int(1) DEFAULT NULL COMMENT '入场券开关 0:关1:开',
  `ticket_msg` varchar(30) DEFAULT NULL COMMENT '入场卷不足提示',
  `limit_to_money` varchar(30) DEFAULT NULL COMMENT '限制提供的钱',
  `limit_get_money` varchar(30) DEFAULT NULL COMMENT '限制取现',
  `member_level_get` varchar(60) DEFAULT NULL COMMENT '等级限制取现',
  `member_level_to` varchar(60) DEFAULT NULL COMMENT '等级限制拍单',
  `ticket_use` varchar(30) DEFAULT NULL COMMENT '入场券使用规则两种模式',
  `init_cash_wallet` int(11) DEFAULT NULL COMMENT '用户注册送钱',
  `init_prize_wallet` int(11) DEFAULT NULL COMMENT '用户',
  `init_ticket_wallet` int(11) DEFAULT NULL COMMENT '初始化入场卷',
  `before_interest` float(11,2) unsigned DEFAULT '0.00' COMMENT '排队利息',
  `after_interest` float(11,2) unsigned DEFAULT '0.00' COMMENT '打款后利息',
  `sms_uid` varchar(20) DEFAULT NULL COMMENT '短信uid',
  `sms_pass` varchar(20) DEFAULT NULL COMMENT '短信密码',
  `sms_type` int(1) DEFAULT NULL,
  `sms_mate` varchar(120) DEFAULT NULL,
  `all_count` varchar(60) DEFAULT NULL COMMENT '拍单数量',
  `prize_day` int(2) unsigned DEFAULT NULL,
  `sms_reg` varchar(60) DEFAULT NULL,
  `bili` varchar(10) DEFAULT NULL,
  `fenhong` int(11) NOT NULL COMMENT '分红百分比',
  `fee` int(2) NOT NULL COMMENT '手续费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of gs_system_config
-- ----------------------------

-- ----------------------------
-- Table structure for `gs_tool_admin`
-- ----------------------------
DROP TABLE IF EXISTS `gs_tool_admin`;
CREATE TABLE `gs_tool_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '后台管理',
  `username` varchar(20) DEFAULT NULL COMMENT '管理账号',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of gs_tool_admin
-- ----------------------------
INSERT INTO `gs_tool_admin` VALUES ('10', 'admin', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for `gs_tool_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `gs_tool_admin_log`;
CREATE TABLE `gs_tool_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(30) DEFAULT NULL,
  `content` varchar(120) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of gs_tool_admin_log
-- ----------------------------
INSERT INTO `gs_tool_admin_log` VALUES ('182', 'admin888', '登陆后台管理', '1493297119', '36.4.19.78');
INSERT INTO `gs_tool_admin_log` VALUES ('183', 'admin', '登陆后台管理', '1493318193', '180.124.151.213');
INSERT INTO `gs_tool_admin_log` VALUES ('184', 'admin', '登陆后台管理', '1493318707', '222.217.222.81');
INSERT INTO `gs_tool_admin_log` VALUES ('185', 'admin', '登陆后台管理', '1493319102', '106.114.218.51');
INSERT INTO `gs_tool_admin_log` VALUES ('186', 'admin', '登陆后台管理', '1493321425', '106.114.218.51');
INSERT INTO `gs_tool_admin_log` VALUES ('187', 'admin', '登陆后台管理', '1493324289', '106.114.78.192');
INSERT INTO `gs_tool_admin_log` VALUES ('188', 'admin', '登陆后台管理', '1493361940', '117.171.8.133');
INSERT INTO `gs_tool_admin_log` VALUES ('189', 'admin', '登陆后台管理', '1493362005', '180.124.151.213');
INSERT INTO `gs_tool_admin_log` VALUES ('190', 'admin', '登陆后台管理', '1493362944', '180.124.151.213');
INSERT INTO `gs_tool_admin_log` VALUES ('191', 'admin', '登陆后台管理', '1493447807', '222.140.87.101');
INSERT INTO `gs_tool_admin_log` VALUES ('192', 'admin', '登陆后台管理', '1493448835', '180.124.151.213');
INSERT INTO `gs_tool_admin_log` VALUES ('193', 'admin', '登陆后台管理', '1493451643', '110.16.3.189');
INSERT INTO `gs_tool_admin_log` VALUES ('194', 'admin123', '登陆后台管理', '1493461859', '110.16.3.189');
INSERT INTO `gs_tool_admin_log` VALUES ('195', 'admin', '登陆后台管理', '1493466584', '117.27.180.251');
INSERT INTO `gs_tool_admin_log` VALUES ('196', 'admin', '登陆后台管理', '1493466778', '180.124.151.213');
INSERT INTO `gs_tool_admin_log` VALUES ('197', 'admin123', '登陆后台管理', '1493469024', '110.16.3.189');
INSERT INTO `gs_tool_admin_log` VALUES ('198', 'admin', '登陆后台管理', '1493525814', '218.29.82.58');
INSERT INTO `gs_tool_admin_log` VALUES ('199', 'admin', '登陆后台管理', '1493527744', '115.50.187.133');
INSERT INTO `gs_tool_admin_log` VALUES ('200', 'admin', '登陆后台管理', '1493528189', '218.29.82.58');
INSERT INTO `gs_tool_admin_log` VALUES ('201', 'admin', '登陆后台管理', '1493540238', '122.96.41.151');
INSERT INTO `gs_tool_admin_log` VALUES ('202', 'admin123', '登陆后台管理', '1493557144', '1.182.61.226');
INSERT INTO `gs_tool_admin_log` VALUES ('203', 'admin123', '登陆后台管理', '1493557524', '1.182.61.226');
INSERT INTO `gs_tool_admin_log` VALUES ('204', 'admin123', '登陆后台管理', '1493562169', '180.124.148.166');
INSERT INTO `gs_tool_admin_log` VALUES ('205', 'admin', '登陆后台管理', '1493563447', '180.124.148.166');
INSERT INTO `gs_tool_admin_log` VALUES ('206', 'admin', '登陆后台管理', '1493568028', '27.200.140.211');
INSERT INTO `gs_tool_admin_log` VALUES ('207', 'admin', '登陆后台管理', '1493571135', '113.63.81.117');
INSERT INTO `gs_tool_admin_log` VALUES ('208', 'admin', '登陆后台管理', '1493580902', '111.113.69.129');
INSERT INTO `gs_tool_admin_log` VALUES ('209', 'admin', '登陆后台管理', '1493600201', '180.125.240.161');
INSERT INTO `gs_tool_admin_log` VALUES ('210', 'admin', '登陆后台管理', '1493600210', '222.140.84.133');
INSERT INTO `gs_tool_admin_log` VALUES ('211', 'admin', '登陆后台管理', '1493604970', '221.13.233.125');
INSERT INTO `gs_tool_admin_log` VALUES ('212', 'admin', '登陆后台管理', '1493642502', '218.26.54.112');
INSERT INTO `gs_tool_admin_log` VALUES ('213', 'admin', '登陆后台管理', '1493644404', '180.125.240.161');
INSERT INTO `gs_tool_admin_log` VALUES ('214', 'admin', '登陆后台管理', '1493644772', '222.140.84.133');
INSERT INTO `gs_tool_admin_log` VALUES ('215', 'admin', '登陆后台管理', '1493644951', '171.10.186.239');
INSERT INTO `gs_tool_admin_log` VALUES ('216', 'admin', '登陆后台管理', '1493656614', '180.125.240.161');
INSERT INTO `gs_tool_admin_log` VALUES ('217', 'admin', '登陆后台管理', '1493665845', '171.10.50.210');
INSERT INTO `gs_tool_admin_log` VALUES ('218', 'admin', '登陆后台管理', '1493695820', '180.125.240.161');
INSERT INTO `gs_tool_admin_log` VALUES ('219', 'admin', '登陆后台管理', '1493733195', '60.213.233.19');
INSERT INTO `gs_tool_admin_log` VALUES ('220', 'admin', '登陆后台管理', '1493733614', '182.46.167.134');
INSERT INTO `gs_tool_admin_log` VALUES ('221', 'admin', '登陆后台管理', '1493766872', '182.46.167.134');
INSERT INTO `gs_tool_admin_log` VALUES ('222', 'admin', '登陆后台管理', '1493768353', '182.46.167.134');
INSERT INTO `gs_tool_admin_log` VALUES ('223', 'admin', '登陆后台管理', '1493776985', '42.84.244.58');
INSERT INTO `gs_tool_admin_log` VALUES ('224', 'admin', '登陆后台管理', '1493787294', '180.125.240.161');
INSERT INTO `gs_tool_admin_log` VALUES ('225', 'admin', '登陆后台管理', '1510957548', '127.0.0.1');
INSERT INTO `gs_tool_admin_log` VALUES ('226', 'admin', '登陆后台管理', '1511003906', '127.0.0.1');
INSERT INTO `gs_tool_admin_log` VALUES ('227', 'admin', '登陆后台管理', '1511052894', '127.0.0.1');

-- ----------------------------
-- Table structure for `gs_transfer_log`
-- ----------------------------
DROP TABLE IF EXISTS `gs_transfer_log`;
CREATE TABLE `gs_transfer_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '使用者',
  `price` int(1) NOT NULL DEFAULT '1' COMMENT '使用数量',
  `create_time` int(11) NOT NULL COMMENT '时间',
  `touserid` int(11) NOT NULL COMMENT '对谁使用',
  `type` tinyint(1) DEFAULT '1' COMMENT '1 送鸡 2送蛋',
  `realprice` int(11) DEFAULT NULL COMMENT '给对方的数量',
  `status` tinyint(1) DEFAULT '1' COMMENT 'status 1转入2转出。',
  `super` tinyint(1) DEFAULT '0' COMMENT '1 超级转账不需要走流程',
  `paystatus` tinyint(1) DEFAULT '1' COMMENT '1 等待确认付款 2 确认付款 3确认收款',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='资源使用记录';

-- ----------------------------
-- Records of gs_transfer_log
-- ----------------------------
INSERT INTO `gs_transfer_log` VALUES ('1', '1', '330', '1493695898', '1360', '1', '330', '2', '1', '1');
INSERT INTO `gs_transfer_log` VALUES ('2', '1', '330', '1493696138', '1362', '1', '330', '2', '1', '1');
INSERT INTO `gs_transfer_log` VALUES ('3', '1', '330', '1493696176', '1362', '1', '330', '2', '1', '1');
INSERT INTO `gs_transfer_log` VALUES ('4', '1', '330', '1493696210', '1362', '1', '330', '2', '0', '1');
INSERT INTO `gs_transfer_log` VALUES ('5', '1', '3000', '1493788226', '1363', '1', '3000', '2', '0', '1');
INSERT INTO `gs_transfer_log` VALUES ('6', '1', '3000', '1493788360', '1364', '1', '3000', '2', '0', '1');
INSERT INTO `gs_transfer_log` VALUES ('7', '1', '2000', '1493788536', '1357', '1', '2000', '2', '0', '2');

-- ----------------------------
-- Table structure for `gs_user`
-- ----------------------------
DROP TABLE IF EXISTS `gs_user`;
CREATE TABLE `gs_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_user
-- ----------------------------

-- ----------------------------
-- Table structure for `gs_user_animal`
-- ----------------------------
DROP TABLE IF EXISTS `gs_user_animal`;
CREATE TABLE `gs_user_animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `animal_on` char(18) NOT NULL COMMENT '动物的唯一编号',
  `create_time` int(11) NOT NULL COMMENT '购买时间',
  `expired_time` int(11) NOT NULL COMMENT '过期时间',
  `hatchery` int(11) NOT NULL DEFAULT '0' COMMENT '孵卵个数',
  `used_day` int(11) NOT NULL DEFAULT '0' COMMENT '生命过几天--弃用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `animal_on` (`animal_on`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户拥有的动物';

-- ----------------------------
-- Records of gs_user_animal
-- ----------------------------

-- ----------------------------
-- Table structure for `gs_user_farm`
-- ----------------------------
DROP TABLE IF EXISTS `gs_user_farm`;
CREATE TABLE `gs_user_farm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1,绿地 2金地',
  `create_time` int(11) NOT NULL,
  `num` int(11) NOT NULL COMMENT '开地用到的鸡蛋数量',
  `add_num` int(11) DEFAULT '0' COMMENT '增量养鸡个数',
  `egg_rate` decimal(11,2) DEFAULT '0.00' COMMENT '今日生产蛋个数',
  `egg_allrate` decimal(11,2) DEFAULT '0.00' COMMENT '历史产蛋',
  `egg_status` tinyint(1) DEFAULT '2' COMMENT '1未收2已收',
  `task_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1503 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_user_farm
-- ----------------------------
INSERT INTO `gs_user_farm` VALUES ('1487', '1', '1', '1493308800', '300', '0', '8.55', '28.54', '2', '29');
INSERT INTO `gs_user_farm` VALUES ('1488', '1357', '1', '1493308800', '300', '0', '6.30', '6.60', '1', '29');
INSERT INTO `gs_user_farm` VALUES ('1489', '1', '2', '1493308800', '3000', '0', '85.50', '199.08', '1', '29');
INSERT INTO `gs_user_farm` VALUES ('1490', '1', '1', '1493308800', '300', '0', '8.55', '34.35', '2', '29');
INSERT INTO `gs_user_farm` VALUES ('1491', '1', '1', '1493308800', '300', '0', '8.55', '25.80', '2', '29');
INSERT INTO `gs_user_farm` VALUES ('1492', '1', '1', '1493308800', '300', '581', '25.11', '42.36', '2', '29');
INSERT INTO `gs_user_farm` VALUES ('1493', '1', '2', '1493308800', '3000', '0', '85.50', '172.50', '1', '29');
INSERT INTO `gs_user_farm` VALUES ('1494', '1', '1', '1493308800', '300', '0', '8.55', '25.80', '2', '29');
INSERT INTO `gs_user_farm` VALUES ('1495', '1', '1', '1493308800', '300', '0', '8.55', '25.80', '2', '29');
INSERT INTO `gs_user_farm` VALUES ('1496', '1', '1', '1493308800', '300', '0', '8.55', '25.80', '2', '29');
INSERT INTO `gs_user_farm` VALUES ('1497', '1', '1', '1493308800', '300', '0', '8.55', '25.80', '2', '29');
INSERT INTO `gs_user_farm` VALUES ('1498', '1', '1', '1493395200', '300', '0', '8.55', '25.80', '2', '29');
INSERT INTO `gs_user_farm` VALUES ('1499', '1', '1', '1493395200', '300', '0', '8.55', '25.80', '2', '29');
INSERT INTO `gs_user_farm` VALUES ('1500', '1', '2', '1493395200', '3000', '0', '85.50', '172.50', '1', '29');
INSERT INTO `gs_user_farm` VALUES ('1501', '1', '2', '1493395200', '3000', '0', '85.50', '88.50', '1', '29');
INSERT INTO `gs_user_farm` VALUES ('1502', '1', '2', '1493481600', '3000', '0', '85.50', '300.37', '1', '29');

-- ----------------------------
-- Table structure for `gs_user_finance`
-- ----------------------------
DROP TABLE IF EXISTS `gs_user_finance`;
CREATE TABLE `gs_user_finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `desc` varchar(125) DEFAULT NULL COMMENT '购买描述',
  `create_time` int(11) DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '类型:1购买牲畜,2购买饲料,3购买激活码 49充值 50提现',
  `number` float(11,2) DEFAULT NULL COMMENT '金额/用富贵蛋的个数',
  `counts` int(11) DEFAULT '1' COMMENT '个数',
  `state` int(1) DEFAULT '0' COMMENT '1 收入 2 支出 3 失败',
  `username` varchar(255) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32406 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gs_user_finance
-- ----------------------------
INSERT INTO `gs_user_finance` VALUES ('32234', '1', '孵化机孵化蛋花费100个', '1493362624', '10', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32235', '1', '开绿池花费动物300只', '1493362632', '4', '300.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32236', '1', '孵化机孵化蛋花费100个', '1493363807', '10', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32237', '1', '孵化蛋蛋100个', '1493363834', '5', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32238', '1', '孵化机孵化蛋花费100个', '1493363858', '10', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32239', '1', '孵化蛋蛋600个', '1493363971', '5', '600.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32240', '1', '激活用户888888扣除动物330只', '1493364072', '13', '330.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32241', '1357', '开绿池花费动物300只', '1493364208', '4', '300.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32242', '1', '增养动物5个', '1493364904', '6', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32243', '1', '开金池花费动物3000只', '1493364926', '4', '3000.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32244', '1', '打扫朋友888888收获蛋0个', '1493365406', '16', '0.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32245', '1', '抽奖花费动物数量5个', '1493366114', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32246', '1', '抽奖赠送动物数量2个', '1493366114', '18', '2.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32247', '1', '升级狗恭喜你!升级狗成功！ 花费数量600', '1493368748', '9', '600.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32248', '1', '开绿池花费动物300只', '1493375516', '4', '300.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32249', '1', '开绿池花费动物300只', '1493375520', '4', '300.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32250', '1', '开绿池花费动物300只', '1493375526', '4', '300.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32251', '1', '开金池花费动物3000只', '1493375796', '4', '3000.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32252', '1', '开绿池花费动物300只', '1493375802', '4', '300.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32253', '1', '开绿池花费动物300只', '1493375808', '4', '300.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32254', '1', '开绿池花费动物300只', '1493375811', '4', '300.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32255', '1', '开绿池花费动物300只', '1493375816', '4', '300.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32256', '1', '孵化机孵化蛋花费100个', '1493400396', '10', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32257', '1', '开绿池花费动物300只', '1493431495', '4', '300.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32258', '1', '开绿池花费动物300只', '1493431521', '4', '300.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32259', '1', '收取小天鹅705个', '1493431647', '7', '705.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32260', '1', '抽奖花费动物数量5个', '1493431717', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32261', '1', '抽奖赠送动物数量2个', '1493431717', '18', '2.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32262', '1', '抽奖花费动物数量5个', '1493431729', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32263', '1', '抽奖赠送动物数量2个', '1493431729', '18', '2.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32264', '1', '抽奖花费动物数量5个', '1493431742', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32265', '1', '抽奖赠送动物数量8个', '1493431743', '18', '8.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32266', '1', '开金池花费动物3000只', '1493441642', '4', '3000.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32267', '1', '收取蛋蛋8.40个', '1493449759', '8', '8.40', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32268', '1', '开金池花费动物3000只', '1493449774', '4', '3000.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32269', '1', '孵化机取出鹅', '1493449788', '11', '39.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32270', '1', '打扫朋友888888收获蛋0个', '1493449811', '16', '0.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32271', '1', '收取蛋蛋8.40个', '1493452125', '8', '8.40', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32272', '1', '收取蛋蛋8.40个', '1493452147', '8', '8.40', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32273', '1', '收取蛋蛋84.00个', '1493465440', '8', '84.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32274', '1', '收取蛋蛋84.00个', '1493465443', '8', '84.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32275', '1', '孵化蛋蛋93个', '1493465516', '5', '93.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32276', '1', '收取蛋蛋8.40个', '1493465518', '8', '8.40', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32277', '1', '抽奖花费动物数量5个', '1493465840', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32278', '1', '抽奖赠送动物数量8个', '1493465840', '18', '8.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32279', '1', '收取蛋蛋8.40个', '1493475141', '8', '8.40', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32280', '1', '收取蛋蛋8.40个', '1493489774', '8', '8.40', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32281', '1', '收取蛋蛋8.40个', '1493489787', '8', '8.40', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32282', '1', '收取蛋蛋8.40个', '1493489789', '8', '8.40', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32283', '1', '收取蛋蛋8.40个', '1493489792', '8', '8.40', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32284', '1', '收取蛋蛋8.40个', '1493489799', '8', '8.40', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32285', '1', '收取蛋蛋84.00个', '1493489803', '8', '84.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32286', '1', '孵化蛋蛋3143个', '1493489823', '5', '3143.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32287', '1', '升级狗倒霉了,升级狗失败了 -.-花费数量700', '1493489909', '9', '700.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32288', '1', '升级狗倒霉了,升级狗失败了 -.-花费数量700', '1493489912', '9', '700.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32289', '1', '升级狗倒霉了,升级狗失败了 -.-花费数量700', '1493489914', '9', '700.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32290', '1', '升级狗恭喜你!升级狗成功！ 花费数量700', '1493489914', '9', '700.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32291', '1', '孵化机取出鹅蛋', '1493489931', '11', '1400.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32292', '1', '一键打扫花费动物数量100', '1493489940', '10', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32293', '1', '一键打扫花费动物数量100', '1493489944', '10', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32294', '1', '一键打扫花费动物数量100', '1493489949', '10', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32295', '1', '一键打扫花费动物数量100', '1493489953', '10', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32296', '1', '打扫所有朋友收获蛋0.63个', '1493489976', '16', '0.63', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32297', '1', '孵化机孵化蛋花费100个', '1493509250', '10', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32298', '1', '开金池花费动物3000只', '1493509267', '4', '3000.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32299', '1', '增养动物7188个', '1493509283', '6', '7188.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32300', '1', '收取小天鹅7188个', '1493510466', '7', '7188.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32301', '1', '抽奖花费动物数量5个', '1493519034', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32302', '1', '抽奖赠送动物数量2个', '1493519034', '18', '2.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32303', '1', '抽奖花费动物数量5个', '1493519157', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32304', '1', '抽奖赠送动物数量2个', '1493519157', '18', '2.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32305', '1', '增养动物7182个', '1493522247', '6', '7182.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32306', '1', '孵化蛋蛋901个', '1493522273', '5', '901.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32307', '1', '收取小天鹅3143个', '1493526049', '7', '3143.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32308', '1', '收取小天鹅93个', '1493567509', '7', '93.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32309', '1', '收取蛋蛋11.59个', '1493567514', '8', '11.59', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32310', '1', '收取蛋蛋8.85个', '1493567525', '8', '8.85', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32311', '1', '打扫所有朋友收获蛋0.66个', '1493567566', '16', '0.66', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32312', '1', '孵化蛋蛋21个', '1493567619', '5', '21.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32313', '1', '抽奖花费动物数量5个', '1493572523', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32314', '1', '抽奖赠送动物数量2个', '1493572523', '18', '2.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32315', '1', '收取蛋蛋8.85个', '1493578525', '8', '8.85', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32316', '1', '收取蛋蛋8.85个', '1493578529', '8', '8.85', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32317', '1', '收取蛋蛋8.85个', '1493578545', '8', '8.85', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32318', '1', '收取蛋蛋115.08个', '1493578571', '8', '115.08', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32319', '1', '孵化机取出鹅蛋', '1493579431', '11', '500.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32320', '1', '抽奖花费动物数量5个', '1493581009', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32321', '1', '抽奖赠送动物数量2个', '1493581009', '18', '2.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32322', '1', '收取蛋蛋8.85个', '1493581037', '8', '8.85', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32323', '1', '孵化蛋蛋250个', '1493581047', '5', '250.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32324', '1', '抽奖花费动物数量5个', '1493597014', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32325', '1', '抽奖赠送动物数量2个', '1493597014', '18', '2.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32326', '1', '收取蛋蛋8.85个', '1493605136', '8', '8.85', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32327', '1', '孵化蛋蛋9个', '1493605276', '5', '9.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32328', '1', '收取蛋蛋8.85个', '1493605320', '8', '8.85', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32329', '1', '收取蛋蛋8.85个', '1493605323', '8', '8.85', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32330', '1', '收取蛋蛋88.50个', '1493605325', '8', '88.50', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32331', '1', '收取蛋蛋8.85个', '1493605328', '8', '8.85', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32332', '1', '收取蛋蛋88.50个', '1493605330', '8', '88.50', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32333', '1', '收取蛋蛋300.37个', '1493605332', '8', '300.37', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32334', '1', '收取蛋蛋88.50个', '1493605337', '8', '88.50', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32335', '1', '增养动物32个', '1493606336', '6', '32.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32336', '1', '孵化蛋蛋593个', '1493606394', '5', '593.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32337', '1', '孵化机取出鹅', '1493606429', '11', '14.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32338', '1', '增养动物3209个', '1493610424', '6', '3209.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32339', '1', '收取小天鹅7182个', '1493610460', '7', '7182.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32340', '1', '收取小天鹅9个', '1493610470', '7', '9.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32341', '1', '收取小天鹅250个', '1493645491', '7', '250.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32342', '1', '孵化机取出鹅蛋', '1493666723', '11', '400.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32343', '1', '孵化蛋蛋100个', '1493666749', '5', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32344', '1', '抽奖花费动物数量5个', '1493666900', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32345', '1', '抽奖赠送动物数量2个', '1493666900', '18', '2.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32346', '1', '抽奖花费动物数量5个', '1493683294', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32347', '1', '抽奖赠送动物数量2个', '1493683294', '18', '2.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32348', '1', '转账给账号:212312花费动物数量330', '1493695898', '14', '330.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32349', '1360', '账号:888888转账给我动物数量330', '1493695898', '14', '330.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32350', '1', '激活用户888888扣除动物330只', '1493696104', '13', '330.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32351', '1', '转账给账号:13852000001花费动物数量330', '1493696138', '14', '330.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32352', '1362', '账号:888888转账给我动物数量330', '1493696138', '14', '330.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32353', '1', '转账给账号:13852000001花费动物数量330', '1493696176', '14', '330.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32354', '1362', '账号:888888转账给我动物数量330', '1493696176', '14', '330.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32355', '1', '转账给账号:13852000001花费动物数量330', '1493696210', '14', '330.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32356', '1', '收取小天鹅4856个', '1493699495', '7', '4856.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32357', '1', '抽奖花费动物数量5个', '1493702219', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32358', '1', '抽奖赠送动物数量8个', '1493702219', '18', '8.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32359', '1', '孵化机取出鹅蛋', '1493704279', '11', '300.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32360', '1', '孵化机孵化蛋花费100个', '1493704383', '10', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32361', '1', '孵化机取出鹅蛋', '1493704427', '11', '300.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32362', '1', '孵化机取出鹅蛋', '1493704433', '11', '200.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32363', '1', '孵化蛋蛋200个', '1493704448', '5', '200.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32364', '1', '收取小天鹅200个', '1493704494', '7', '200.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32365', '1', '孵化机取出鹅蛋', '1493704528', '11', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32366', '1', '孵化机孵化蛋花费100个', '1493706389', '10', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32367', '1', '打扫所有朋友收获蛋0个', '1493727506', '16', '0.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32368', '1', '升级狗倒霉了,升级狗失败了 -.-花费数量800', '1493732551', '9', '800.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32369', '1', '升级狗倒霉了,升级狗失败了 -.-花费数量800', '1493732553', '9', '800.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32370', '1', '激活用户888888扣除动物330只', '1493788198', '13', '330.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32371', '1', '转账给账号:15233333333花费动物数量3000', '1493788226', '14', '3000.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32372', '1', '激活用户888888扣除动物330只', '1493788343', '13', '330.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32373', '1', '转账给账号:13999999999花费动物数量3000', '1493788360', '14', '3000.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32374', '1357', '收取蛋蛋6.60个', '1493788420', '8', '6.60', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32375', '1357', '孵化蛋蛋6个', '1493788444', '5', '6.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32376', '1357', '收取小天鹅6个', '1493788457', '7', '6.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32377', '1', '转账给账号:15299999999花费动物数量2000', '1493788536', '14', '2000.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32378', '1', '抽奖花费动物数量5个', '1493797385', '18', '5.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32379', '1', '抽奖赠送动物数量2个', '1493797385', '18', '2.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32380', '1', '孵化机取出鸡蛋', '1510978743', '11', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32381', '1', '微信提现', '1511010947', '50', '12.00', '1', '3', 'admin');
INSERT INTO `gs_user_finance` VALUES ('32382', '1', '增养动物581个', '1511017621', '6', '581.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32383', '1', '支付宝充值', '1511054010', '49', '0.10', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32384', '1', '收取蛋蛋8.55个', '1511068591', '8', '8.55', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32385', '1', '打扫朋友888888收获蛋0个', '1511072432', '16', '0.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32386', '1', '收取蛋蛋8.55个', '1511072529', '8', '8.55', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32387', '1', '收取蛋蛋8.55个', '1511072569', '8', '8.55', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32388', '1', '收取蛋蛋8.55个', '1511072581', '8', '8.55', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32389', '1', '收取蛋蛋8.55个', '1511072646', '8', '8.55', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32390', '1', '收取蛋蛋8.55个', '1511072938', '8', '8.55', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32391', '1', '收取蛋蛋25.11个', '1511073233', '8', '25.11', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32392', '1', '收取蛋蛋8.55个', '1511073782', '8', '8.55', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32393', '1', '收取蛋蛋8.55个', '1511074270', '8', '8.55', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32394', '1', '收取蛋蛋8.55个', '1511075105', '8', '8.55', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32395', '1', '支付宝充值', '1511091435', '49', '3000.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32396', '1', '支付宝充值', '1511096881', '49', '10.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32397', '1', '支付宝充值', '1511096955', '49', '10.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32398', '1', '收取蛋蛋8.55个', '1511098768', '8', '8.55', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32399', '1357', '一级推荐奖', '1511098768', '51', '0.85', '1', '1', '1');
INSERT INTO `gs_user_finance` VALUES ('32400', '1', '支付宝充值', '1511102133', '49', '10.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32401', '1', '支付宝充值', '1511103641', '49', '10.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32402', '1', '支付宝充值', '1511103667', '49', '10.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32403', '1', '支付宝充值', '1511103780', '49', '10.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32404', '1', '支付宝充值', '1511103799', '49', '100.00', '1', '0', null);
INSERT INTO `gs_user_finance` VALUES ('32405', '1', '支付宝充值', '1511103821', '49', '10.00', '1', '0', null);

-- ----------------------------
-- Table structure for `gs_verify`
-- ----------------------------
DROP TABLE IF EXISTS `gs_verify`;
CREATE TABLE `gs_verify` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '验证码',
  `code` varchar(6) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of gs_verify
-- ----------------------------
