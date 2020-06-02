/*
MySQL Data Transfer
Source Host: localhost
Source Database: easybuycart
Target Host: localhost
Target Database: easybuycart
Date: 2020/2/21 14:08:40
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bbs
-- ----------------------------
DROP TABLE IF EXISTS `bbs`;
CREATE TABLE `bbs` (
  `Name` text,
  `Email` text,
  `Subject` text,
  `Memo` text,
  `gtime` date default NULL,
  `GID` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dingdan
-- ----------------------------
DROP TABLE IF EXISTS `dingdan`;
CREATE TABLE `dingdan` (
  `DID` int(10) NOT NULL auto_increment,
  `dname` text,
  `dgid` int(10) default NULL,
  `dhandle` int(2) default NULL,
  PRIMARY KEY  (`DID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `ID` int(11) NOT NULL auto_increment,
  `title` text,
  `content` text,
  `times` text,
  `keyw` text,
  `author` text,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `name` text NOT NULL,
  `sex` text NOT NULL,
  `age` int(2) NOT NULL,
  `zhuanye` text NOT NULL,
  `pass` text NOT NULL,
  `youxiang` text,
  `address` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `bbs` VALUES ('adas', 'vwsdgg', 'vgsdgg', 'afasfafa', '2019-05-05', '1');
INSERT INTO `bbs` VALUES ('南家里', '1079877@qq.com', '阿斯兰李会计', '撒擦伤开六井擦伤就', '2019-05-06', '1');
INSERT INTO `bbs` VALUES ('双方水利局', '发顺丰将军令', '1029', '法拉盛放假', '2019-05-06', '3');
INSERT INTO `bbs` VALUES ('爱是', '发送卡', '阿达撒', '发烧腊是否', '2019-05-06', '3');
INSERT INTO `bbs` VALUES ('fsf', 'fdsfdsf', 'dgdgdfg', 'gdfgdfgdfg', '2019-05-06', '5');
INSERT INTO `bbs` VALUES ('sfs', 'dsfdsf', 'afadgfd', 'dafdfdf', '2019-05-06', '6');
INSERT INTO `bbs` VALUES ('fsafs', 'fssfsdf', 'dfdsfdsf', 'dsfdsfsdf', '2019-05-06', '1');
INSERT INTO `bbs` VALUES ('adfas', 'faasf', 'fasfsaf', 'fssafasf', '2019-05-06', '3');
INSERT INTO `bbs` VALUES ('sadf', 'fsfasfas', 'fsasfsaf', 'fasfasfs', '2019-05-06', '1');
INSERT INTO `bbs` VALUES ('ada', 'faf', 'fsf', 'fsafasfa', '2019-05-06', '1');
INSERT INTO `bbs` VALUES ('ff', 'gsdf', 'gsg', 'gdsgdsg', '2019-05-06', '6');
INSERT INTO `bbs` VALUES ('sdfds', 'gdfgfg', 'gfdhf', 'hdfhfdhg', '2019-05-06', '3');
INSERT INTO `bbs` VALUES ('asdfasf', 'fasfa', 'fasf', 'fasfasf', '2019-05-06', '5');
INSERT INTO `bbs` VALUES ('sadas', 'asfdasf', 'fssafas', 'ffSFS', '2019-05-06', '5');
INSERT INTO `bbs` VALUES ('ffff', 'fsfff', 'ffsfsfsf', 'asafsafsf', '2019-05-06', '6');
INSERT INTO `bbs` VALUES ('asfsf', 'fasaff', 'fasfasf', 'ffsfgggg', '2019-05-06', '5');
INSERT INTO `bbs` VALUES ('sfaf', 'gdfgdfg', 'aksjka', 'cvbchdfhdfh', '2019-05-06', '5');
INSERT INTO `bbs` VALUES ('lkdfjas', '10101', 'fsofs', 'gds;sdgk', '2019-05-06', '5');
INSERT INTO `bbs` VALUES ('dfg', '113344', 'yuguiiu', 'y98y98y98h', '2019-05-06', '5>');
INSERT INTO `bbs` VALUES ('trdetr', '243243', 'njoiho', 'uygfuygyu', '2019-05-06', '6>');
INSERT INTO `bbs` VALUES ('asc', 'vv', 'bc', 'dg', '2019-05-06', '5');
INSERT INTO `bbs` VALUES ('fdsf', 'dsgdsgd', 'dsgdsg', 'gdsgdsgds', '2019-05-07', '7');
INSERT INTO `bbs` VALUES ('松风剑法', '1070079339@qq.com', '好东西啊', '在降点价啊    太贵了啊亲', '2019-05-09', '17');
INSERT INTO `bbs` VALUES ('卢星儒', '1070079339@qq.com', '好东西啊', '大江苏旷达烧烤蹲家里', '2019-05-09', '16');
INSERT INTO `bbs` VALUES ('松风剑法', 'sdasdas', 'fsfas', 'sdasdasd', '2019-05-16', '16');
INSERT INTO `bbs` VALUES ('松风剑法', '1817379@qq.com', '有意购买', '看着可以  咱可以聊聊吗', '2019-06-03', '18');
INSERT INTO `bbs` VALUES ('小玲', '18716317890@qq.com', '我想买', '真的想买   价格咱可以商量下吗', '2019-06-03', '18');
INSERT INTO `dingdan` VALUES ('27', '松风剑法', '12', '1');
INSERT INTO `dingdan` VALUES ('43', '松风剑法', '6', '1');
INSERT INTO `dingdan` VALUES ('44', '松风剑法', '18', '1');
INSERT INTO `dingdan` VALUES ('45', '周周', '17', '1');
INSERT INTO `dingdan` VALUES ('46', '松风剑法', '19', '1');
INSERT INTO `dingdan` VALUES ('47', '小玲', '18', '1');
INSERT INTO `dingdan` VALUES ('48', '卢星儒', '20', '1');
INSERT INTO `dingdan` VALUES ('49', '卢星儒', '19', '1');
INSERT INTO `dingdan` VALUES ('50', '松风剑法', '18', '1');
INSERT INTO `goods` VALUES ('1', '手机', 'HTC国行手机  八成新  8s', '2019-04-07', '450', '杨世远');
INSERT INTO `goods` VALUES ('5', '电脑', '新买国行三星平板电脑GALAXY Tab 3 7.0', '2019-05-05', '2000', '鸭鸭');
INSERT INTO `goods` VALUES ('6', '电脑', '高新能电脑急卖了  欢迎大家购买', '2019-5-6 10:35:42', '1000', '小鸡');
INSERT INTO `goods` VALUES ('12', 'ipad', 'ipad2（8GB)贱卖了！！', '2019-5-7 20:28:51', '2000', '卢星儒');
INSERT INTO `goods` VALUES ('15', '爱的时刻', '低价出售，就这一次机会', '2019-5-7 23:27:43', '200', '松风剑法');
INSERT INTO `goods` VALUES ('16', '电脑', '出售一台笔记本电脑华硕X550，才买3个月', '2019-5-8 21:03:21', '2999', '松风剑法');
INSERT INTO `goods` VALUES ('17', '自行车', '横好的自行车獒出售如有需要请联系', '2019-5-23 9:41:13', '260', '松风剑法');
INSERT INTO `goods` VALUES ('18', '电动小摩托', '现有一部全新小摩托请联系18716431578f', '2019-5-23 9:43:18', '2000', '卢星儒');
INSERT INTO `goods` VALUES ('19', '自行车', '现有一部山地自行车要出有需要的请联系我', '2019-6-3 13:05:00', '500', '周周');
INSERT INTO `user` VALUES ('20', '松风剑法对方的', '男', '22', '会计', '123', '18716321789', '重庆邮电大学移通学院15栋');
INSERT INTO `user` VALUES ('2010222', '喻培', '男', '21', '信管', '123', '18716498908', '重庆邮电大学移通学院16栋');
INSERT INTO `user` VALUES ('2010223', '林俊杰', '男', '21', '电商', '123', '18678907890', '重庆邮电大学移通学院5栋');
INSERT INTO `user` VALUES ('2010211000', '周周', '男', '22', '电商', '123', '18716321456', '重庆邮电大学移通学院18栋');
INSERT INTO `user` VALUES ('2010211111', '小玲', '女', '23', '信管', '123', '18764780087', '重庆邮电大学移通学院18栋');
INSERT INTO `user` VALUES ('2010211524', '张银', '女', '25', '信管', '241', '17897128989', '重庆邮电大学移通学院10栋');
INSERT INTO `user` VALUES ('2010211525', '爱华顿', '男', '23', '信管', '123', '13978978889', '重庆邮电大学移通学院13栋');
INSERT INTO `user` VALUES ('2010211529', '卢星儒', '女', '22', '信管', '234', '130002890874', '重庆邮电大学移通学院11栋');
INSERT INTO `user` VALUES ('2010211534', '来了房间', '男', '21', '电商', '123', '18761768999', '重庆邮电大学移通学院22栋');
INSERT INTO `user` VALUES ('2010211570', '大家聚', '男', '21', '电商', '123', '18971819698', '重庆邮电大学移通学院21栋');
INSERT INTO `user` VALUES ('2010211578', '刘得京', '男', '21', '电商', '123', '13731991919', '重庆邮电大学移通学院30栋');
INSERT INTO `user` VALUES ('2010211777', '只开船', '女', '21', '信管', '123', '18978967867', '重庆邮电大学移通学院28栋');
INSERT INTO `user` VALUES ('2010211889', '将哈斯大家', '男', '22', '信管', '123', '18766998077', '重庆邮电大学移通学院26栋');
