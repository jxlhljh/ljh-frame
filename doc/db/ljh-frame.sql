/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : ljh-frame

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2014-11-16 19:52:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dctdata`
-- ----------------------------
DROP TABLE IF EXISTS `dctdata`;
CREATE TABLE `dctdata` (
  `id` int(11) NOT NULL auto_increment,
  `dcttypenote` varchar(100) default ' ' COMMENT '字典类型中文解析',
  `dcttypeen` varchar(100) default ' ' COMMENT '字典类型的英文名称，同一名称为相同的一数据源。',
  `selecttype` varchar(20) default ' ' COMMENT '选择类型，一种是text,类型，一种是sql',
  `selectsql` varchar(200) default ' ' COMMENT '查询的sql语句，需要合符一定的语法',
  `displayname` varchar(200) default ' ' COMMENT '显示字段的名称\0eral_\0',
  `valuename` varchar(20) default ' ' COMMENT '值字段的名称\0\0e\0\0e',
  `displayvalue` varchar(100) default ' ' COMMENT '显示值\0e\0',
  `valuetext` varchar(100) default NULL,
  `otherfieldname` varchar(20) default ' ' COMMENT '其他显示字段的名称',
  `otherfieldvalue` varchar(200) default ' ' COMMENT '其他字段的名称',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='字典数据';

-- ----------------------------
-- Records of dctdata
-- ----------------------------
INSERT INTO `dctdata` VALUES ('1', '流程运行状态', 'workflowstatus', 'text', '', 'workflowStatustxt', 'workflowStatus', '结束', 'end', '', '');
INSERT INTO `dctdata` VALUES ('2', '流程运行状态', 'workflowstatus', 'text', '', 'workflowStatustxt', 'workflowStatus', '运行中', 'running', '', '');
INSERT INTO `dctdata` VALUES ('3', '日志操作类型', 'syslogoperatername', 'text', '', 'lognametxt', 'lognamevalu', 'login', 'login', '', '');
INSERT INTO `dctdata` VALUES ('4', '日志操作类型', 'syslogoperatername', 'text', '', 'lognametxt', 'lognamevalu', 'logout', 'logout', '', '');
INSERT INTO `dctdata` VALUES ('5', '日志操作类型', 'syslogoperatername', 'text', '', 'lognametxt', 'lognamevalu', 'modify', 'modify', '', '');
INSERT INTO `dctdata` VALUES ('6', '日志操作类型', 'syslogoperatername', 'text', '', 'lognametxt', 'lognamevalu', 'save', 'save', '', '');
INSERT INTO `dctdata` VALUES ('7', '日志控制状态', 'isbeansyslog', 'text', '', 'islogtext', 'islogvalue', 'on', 'on', '', '');
INSERT INTO `dctdata` VALUES ('8', '日志控制状态', 'isbeansyslog', 'text', '', 'islogtext', 'islogvalue', 'off', 'off', '', '');
INSERT INTO `dctdata` VALUES ('9', '系统标识', 'systemid', 'text', '', '省信令系统', '省信令系统', '国际信令中创系统', 'gjxl_zctt', '', '');
INSERT INTO `dctdata` VALUES ('10', '系统标识', 'systemid', 'text', '', '省信令系统', '省信令系统', '河南中兴信令系统', 'henan_zet', '', '');
INSERT INTO `dctdata` VALUES ('11', '系统标识', 'systemid', 'text', '', '省信令系统', '省信令系统', '广东凯通信令系统', 'guangdong_kt', '', '');
INSERT INTO `dctdata` VALUES ('12', '系统标识', 'systemid', 'text', '', '省信令系统', '省信令系统', 'DC1申迪信令系统', 'dc1_sd', '', '');
INSERT INTO `dctdata` VALUES ('13', '省份信令CDR数据表', 'province_cdr_tables', 'text', '', '省份编号', 'CDR表名', '371', 'zte_dr_a1_cdr', '河南中兴A口CDR', '');
INSERT INTO `dctdata` VALUES ('14', '省份信令CDR数据表', 'province_cdr_tables', null, '', '省份编号', 'CDR表名', '371', 'zte_dr_call_cdr', '河南中兴CALL_CDR', '');
INSERT INTO `dctdata` VALUES ('15', '省份信令CDR数据表', 'province_cdr_tables', 'text', '', '省份编号', 'CDR表名', '371', 'zte_dr_cap_inap_win_cdr', '河南中兴cap_inap_win', '');
INSERT INTO `dctdata` VALUES ('16', '省份信令CDR数据表', 'province_cdr_tables', 'text', '', '省份编号', 'CDR表名', '371', 'zte_dr_map_cdr', '河南中兴MAP_CDR', '');
INSERT INTO `dctdata` VALUES ('17', '省份信令CDR数据表', 'province_cdr_tables', 'text', '', '省份编号', 'CDR表名', '111', 'zctt_gjxl_CMAP_cdr', '国际信令中创CMAP', '');
INSERT INTO `dctdata` VALUES ('18', '省份信令CDR数据表', 'province_cdr_tables', 'text', '', '省份编号', 'CDR表名', '111', 'zctt_gjxl_GMAP_cdr', '国际信令中创GMAP', '');
INSERT INTO `dctdata` VALUES ('19', '省份信令CDR数据表', 'province_cdr_tables', 'text', '', '省份编号', 'CDR表名', '111', 'zctt_gjxl_ISUP_cdr', '国际信令中创ISUP', '');
INSERT INTO `dctdata` VALUES ('20', '省份信令CDR数据表', 'province_cdr_tables', 'text', '', '省份编号', 'CDR表名', '111', 'zctt_gjxl_TUP_cdr', '国际信令中创TUP', '');
INSERT INTO `dctdata` VALUES ('21', '平台接口XDR数据表', 'platform_xdr_tables', 'text', '', '平台名称', 'xdr表名', 'oidd', 'oidd_cm_xdr', 'oidd呼叫接口数据', '1');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL auto_increment,
  `departname` varchar(100) default NULL COMMENT '部门名称\0\0R\0',
  `departtype` varchar(50) default NULL COMMENT '部门d、组g\0\0pe',
  `parentid` int(11) default NULL COMMENT '对于部门、组可能存在上下级关系\0alhost [sendi\0',
  `departarea` varchar(200) default ' ' COMMENT '所属城市\0\0R\0',
  `departstatus` varchar(20) default ' ' COMMENT '机构状态\0\0R\0',
  `departdesc` varchar(200) default ' ' COMMENT '机构描述\0\0R\0',
  `departcode` varchar(100) default ' ' COMMENT '机构编码\0\0R\0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='组件架构管理，部门，组';

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '用户组1', 'group', '-1', '广州', 'active', '', '1111');
INSERT INTO `department` VALUES ('2', '用户组11', 'dept', '1', '广州', 'active', '', 'usergroup11');
INSERT INTO `department` VALUES ('3', '用户组12', 'dept', '1', '广州', 'active', '', '12dsaf');
INSERT INTO `department` VALUES ('4', '用户组12', 'dept', '1', 'GZ', 'active', '', 'adfadf');
INSERT INTO `department` VALUES ('5', '用户组121', 'dept', '3', 'GZ', 'active', 'adf', 'asdf');

-- ----------------------------
-- Table structure for `esb_wap_aaa`
-- ----------------------------
DROP TABLE IF EXISTS `esb_wap_aaa`;
CREATE TABLE `esb_wap_aaa` (
  `id` int(11) NOT NULL auto_increment,
  `mdn` varchar(50) default NULL,
  `starttime` varchar(50) default NULL,
  `endtime` varchar(50) default NULL,
  `upcount` int(11) default NULL,
  `downcount` int(11) default NULL,
  `timelength` int(11) default NULL,
  `termtype` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of esb_wap_aaa
-- ----------------------------
INSERT INTO `esb_wap_aaa` VALUES ('1', '13302261099', '20140622122451', '20140622122551', '9409', '8413', '60', 'end', 'http://m.weathercn.com/image/top.png,http://loc.map.baidu.com/sdk.php,http://m.weathercn.com/image/search_m.png,http://m.weathercn.com/image/logobai.png');
INSERT INTO `esb_wap_aaa` VALUES ('2', '13318695543', '20140622121451', '20140622122455', '1699', '3243', '604', 'TY-K Touch E806', 'http://3glogo.gtimg.com/wap30/info/info5/css/ptlogin_info.css,http://info.3g.qq.com/g/s?aid=index&g_ut=3&g_f=1283,http://3gimg.qq.com/wap30/css/template/touch_base_20140619.css,http://3g.qq.com/,http://3glogo.gtimg.com/wap30/info/template/js/jq.mobi.min.j');
INSERT INTO `esb_wap_aaa` VALUES ('3', '13318695543', '20140622122629', '20140622123636', '1807', '3435', '607', 'TY-K Touch E806', 'http://info.3g.qq.com/g/s?aid=index&g_ut=3&g_f=1283,http://3gimg.qq.com/wap30/css/template/touch_base_20140619.css,http://3g.qq.com/,http://3glogo.gtimg.com/wap30/info/template/js/jq.mobi.min.js,http://3glogo.gtimg.com/wap30/info/template/js/touch_base_20');
INSERT INTO `esb_wap_aaa` VALUES ('4', '13318695543', '20140622123656', '20140622124706', '1817', '3599', '610', 'TY-K Touch E806', 'http://3glogo.gtimg.com/wap30/info/info5/css/ptlogin_info.css,http://info.3g.qq.com/g/s?aid=index&g_ut=3&g_f=1283,http://3gimg.qq.com/wap30/css/template/touch_base_20140619.css,http://3g.qq.com/,http://3glogo.gtimg.com/wap30/info/template/js/jq.mobi.min.j');
INSERT INTO `esb_wap_aaa` VALUES ('5', '13318695543', '20140622124841', '20140622125847', '1762', '3322', '606', 'TY-K Touch E806', 'http://3gimg.qq.com/wap30/css/template/touch_base_20140619.css,http://3g.qq.com/,http://3glogo.gtimg.com/wap30/info/template/js/jq.mobi.min.js,http://3glogo.gtimg.com/wap30/info/template/js/touch_base_2014060699001.js,http://3gimg.qq.com/ptlogin/touch/js/');
INSERT INTO `esb_wap_aaa` VALUES ('6', '13322685639', '20140622122626', '20140622124130', '0', '0', '904', 'YCT-C6589', 'http://pub.idqqimg.com/qqmobile/config/webview_whitelist2.json');
INSERT INTO `esb_wap_aaa` VALUES ('7', '13352621093', '20140622120116', '20140622120117', '0', '0', '1', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('8', '13352621093', '20140622120216', '20140622120219', '8218', '6736', '3', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('9', '13352621093', '20140622120317', '20140622120318', '0', '0', '1', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('10', '13352621093', '20140622120418', '20140622120418', '0', '0', '0', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('11', '13352621093', '20140622120520', '20140622120521', '0', '0', '1', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('12', '13352621093', '20140622120621', '20140622120621', '0', '0', '0', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('13', '13352621093', '20140622121126', '20140622121130', '9038', '7247', '4', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('14', '13352621093', '20140622121328', '20140622121329', '0', '0', '1', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('15', '13352621093', '20140622121532', '20140622121533', '0', '0', '1', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('16', '13352621093', '20140622121927', '20140622121930', '8748', '7415', '3', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('17', '13352621093', '20140622122034', '20140622122038', '9743', '7335', '4', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('18', '13352621093', '20140622122134', '20140622122136', '709', '367', '2', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('19', '13352621093', '20140622122230', '20140622122230', '0', '0', '0', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('20', '13352621093', '20140622122331', '20140622122332', '0', '0', '1', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('21', '13352621093', '20140622122533', '20140622122536', '4620', '3873', '3', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r');
INSERT INTO `esb_wap_aaa` VALUES ('22', '13352621093', '20140622122634', '20140622122635', '0', '0', '1', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('23', '13352621093', '20140622122737', '20140622122743', '11313', '10202', '6', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('24', '13352621093', '20140622122838', '20140622122838', '0', '0', '0', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('25', '13352621093', '20140622122937', '20140622122938', '0', '0', '1', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('26', '13352621093', '20140622123040', '20140622123041', '0', '0', '1', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('27', '13352621093', '20140622124448', '20140622124449', '0', '0', '1', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('28', '13352621093', '20140622124552', '20140622124552', '0', '0', '0', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('29', '13352621093', '20140622124651', '20140622124654', '15137', '13425', '3', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('30', '13352621093', '20140622124851', '20140622124856', '13047', '16948', '5', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('31', '13352621093', '20140622125054', '20140622125054', '0', '0', '0', 'HTC-802d', 'http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('32', '13352621093', '20140622125156', '20140622125157', '0', '0', '1', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('33', '13352621093', '20140622125254', '20140622125302', '11781', '10243', '8', 'HTC-802d', 'http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/,http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall');
INSERT INTO `esb_wap_aaa` VALUES ('34', '13352621093', '20140622125356', '20140622125356', '0', '0', '0', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('35', '13352621093', '20140622125500', '20140622125501', '0', '0', '1', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('36', '13352621093', '20140622125700', '20140622125700', '0', '0', '0', 'HTC-802d', 'http://aps.amap.com/APS/r,http://aps.amap.com/APS/r,https://110.75.131.13/,http://stat.khd.at321.cn/netinstall,http://monitor.uu.qq.com/analytics/upload,http://aps.amap.com/APS/r,https://110.75.131.13/');
INSERT INTO `esb_wap_aaa` VALUES ('37', '13360309798', '20140622125434', '20140622125434', '0', '0', '0', 'SM-Kingpad R518', 'http://sync.coolyun.com/funambol/ds,http://sync.coolyun.com/funambol/ds,http://sync.coolyun.com/funambol/ds;jsessionid=99B8FE9237B208C1F0C0D2D86404B5B9.c8,http://sync.coolyun.com/funambol/ds,http://sync.coolyun.com/funambol/ds;jsessionid=1AFBB260059427383');
INSERT INTO `esb_wap_aaa` VALUES ('38', '13360492287', '20140622123201', '20140622123313', '16208', '19221', '72', 'HW-HUAWEI C8813Q', 'http://cdn.play.cn/f/pkg/ph/000/001/473/bd38c9bah167c5af.jpg,http://cdn.play.cn/f/pkg/ph/000/000/332/6333235c8h512f3d.jpg,http://open.play.cn/api/v2/egame/log.json,http://cdn.play.cn/f/pkg/ph/view/000/000/439/969e5e13eh6b5dbb.jpg,http://cdn.play.cn/f/pkg/');
INSERT INTO `esb_wap_aaa` VALUES ('39', '18025355989', '20140622011846', '20140622011851', '3171', '1467', '5', 'QY-E6', 'http://channel.api.duapp.com/rest/2.0/channel/3919889430611958309,http://www.feidee.com/money/sync,http://alog.umeng.com/app_logs,http://www.feidee.com/money/pull-message,http://loc.map.baidu.com/sdk.php,http://loc.map.baidu.com/sdk.php,http://data.flurry');
INSERT INTO `esb_wap_aaa` VALUES ('40', '18025355989', '20140622020725', '20140622020729', '3171', '1467', '4', 'QY-E6', 'http://channel.api.duapp.com/rest/2.0/channel/3919889430611958309,http://www.feidee.com/money/sync,http://alog.umeng.com/app_logs,http://www.feidee.com/money/pull-message,http://loc.map.baidu.com/sdk.php,http://loc.map.baidu.com/sdk.php,http://data.flurry');
INSERT INTO `esb_wap_aaa` VALUES ('41', '18025355989', '20140622033854', '20140622033858', '3171', '1467', '4', 'QY-E6', 'http://channel.api.duapp.com/rest/2.0/channel/3919889430611958309,http://www.feidee.com/money/sync,http://alog.umeng.com/app_logs,http://www.feidee.com/money/pull-message,http://loc.map.baidu.com/sdk.php,http://loc.map.baidu.com/sdk.php,http://data.flurry');
INSERT INTO `esb_wap_aaa` VALUES ('42', '18025355989', '20140622123556', '20140622123600', '3171', '1467', '4', 'QY-E6', 'http://channel.api.duapp.com/rest/2.0/channel/3919889430611958309,http://www.feidee.com/money/sync,http://alog.umeng.com/app_logs,http://www.feidee.com/money/pull-message,http://loc.map.baidu.com/sdk.php,http://loc.map.baidu.com/sdk.php,http://data.flurry');
INSERT INTO `esb_wap_aaa` VALUES ('43', '18025355989', '20140622125423', '20140622125428', '3171', '1467', '5', 'QY-E6', 'http://data.flurry.com/aap.do');
INSERT INTO `esb_wap_aaa` VALUES ('44', '18025364938', '20140622123250', '20140622123952', '218395', '1575413', '422', 'SCH-I959', 'http://eventlog.beacon.qq.com/analytics/upload?mType=beacon,http://s.mse.360.cn/reqi/weather_reci,http://weather.51wnl.com/weatherinfo/GetMoreWeather?cityCode=101281901&weatherType=1,http://weather.51wnl.com/weatherinfo/GetMoreWeather?cityCode=101281901&w');
INSERT INTO `esb_wap_aaa` VALUES ('45', '18026271963', '20140622122041', '20140622125243', '77247', '370096', '1922', 'YL-Coolpad 5951', 'http://gamecenter.coolyun.com/coolmart/API/getConfigManager?key=0,http://gamecenter.coolyun.com/coolmart/API/getConfigManager?key=0,http://gamecenter.coolyun.com/coolmart/API/resUpdate?key=0');
INSERT INTO `esb_wap_aaa` VALUES ('46', '18026290890', '20140622121650', '20140622123740', '15609', '12612', '1250', 'YX-LA2 E', 'http://book.soso.com/ajax?m=show_bookdetail&encrypt=1&resourceid=1000257265&serialid=10&readSerialid=9&serialmd5=0011f3796d62aa70469f69b923ed16e5&ffrand=7472,http://weblog.html5.qq.com/,http://book.soso.com/ajax?m=show_bookdetail&encrypt=1&resourceid=1000');
INSERT INTO `esb_wap_aaa` VALUES ('47', '18026331470', '20140622120135', '20140622121639', '1828', '1255', '904', 'YL-Coolpad 5820', 'http://channel.api.duapp.com/rest/2.0/channel/channel');
INSERT INTO `esb_wap_aaa` VALUES ('48', '18026331470', '20140622121642', '20140622123146', '2558', '1269', '904', 'YL-Coolpad 5820', 'http://channel.api.duapp.com/rest/2.0/channel/channel');
INSERT INTO `esb_wap_aaa` VALUES ('49', '18026331470', '20140622123148', '20140622124652', '2618', '1757', '904', 'YL-Coolpad 5820', 'http://channel.api.duapp.com/rest/2.0/channel/channel');
INSERT INTO `esb_wap_aaa` VALUES ('50', '18026350891', '20140622122946', '20140622122946', '0', '0', '0', 'KON-EG350', 'http://q4.qlogo.cn/g?b=qq&k=icCCuxqm2jxOyJRxnHsM6jQ&s=100,http://q4.qlogo.cn/g?b=qq&k=z5nEZ68Qibicq0uxFtpblLmA&s=100,http://q3.qlogo.cn/g?b=qq&k=s8C36siajasP7sxm76UOYuQ&s=100,http://q1.qlogo.cn/g?b=qq&k=nibY0mm45ic1NNIHMribGq8rA&s=100,http://q2.qlogo.cn/g');
INSERT INTO `esb_wap_aaa` VALUES ('51', '18127607787', '20140622120615', '20140622121616', '0', '0', '601', 'BRS-BROR S9R', 'http://m.baidu.com/static/tf/nopic.gif?r=1403406265497&tj=alaxs&ftj=xschp_normal_8_0_10&hasRp=1&from=0&ac=nextgp,http://m.baidu.com/static/tf/nopic.gif?r=1403406263758&tj=alaxs&ftj=xschp_normal_8_0_10&hasRp=1&from=0&ac=nextgp,http://m.baidu.com/static/tf/');
INSERT INTO `esb_wap_aaa` VALUES ('52', '18127607787', '20140622122623', '20140622123625', '0', '0', '602', 'BRS-BROR S9R', 'http://m.baidu.com/static/tf/nopic.gif?r=1403409088767&tj=alaxs&ftj=xschp_normal_8_0_10&hasRp=1&from=0&ac=nextgp');
INSERT INTO `esb_wap_aaa` VALUES ('53', '18127614642', '20140622121019', '20140622122345', '41603', '100368', '806', 'HS-E926', 'http://push.gxpan.cn/Push/appid?pkg=com.imangi.templerun2&sign=a16b8302f613d80bca59f1f978e85ece,http://push.gxpan.cn/Push/appid?pkg=com.imangi.templerun2&sign=a16b8302f613d80bca59f1f978e85ece,http://push.gxpan.cn/Push/appid?pkg=com.imangi.templerun2&sign=');
INSERT INTO `esb_wap_aaa` VALUES ('54', '18127858862', '20140622122611', '20140622122746', '67076', '99418', '95', 'SCH-I829', 'http://ma.3g.qq.com/');
INSERT INTO `esb_wap_aaa` VALUES ('55', '18127858862', '20140622122840', '20140622122843', '5029', '2617', '3', 'SCH-I829', 'http://ma.3g.qq.com/');
INSERT INTO `esb_wap_aaa` VALUES ('56', '18128347950', '20140622120004', '20140622120213', '185060', '3557032', '129', 'HW-HUAWEI B199', 'http://upoll.umengcloud.com/activeip/?agoo_apn=CTWAP&app_version_code=902350432&agoo_network=3g&agoo_operators=china_telecom&agoo_version_code=20131220');
INSERT INTO `esb_wap_aaa` VALUES ('57', '18128383088', '20140622121111', '20140622122614', '0', '0', '903', 'SCH-SM G9009D', 'http://121.14.53.175:8500/astat-1.0/astat/FlowStat.do');
INSERT INTO `esb_wap_aaa` VALUES ('58', '18128383088', '20140622122746', '20140622124252', '0', '0', '906', 'SCH-SM G9009D', 'http://121.14.53.175:8500/astat-1.0/astat/FlowStat.do');
INSERT INTO `esb_wap_aaa` VALUES ('59', '18128383088', '20140622124302', '20140622125803', '0', '0', '901', 'SCH-SM G9009D', 'http://121.14.53.175:8500/astat-1.0/astat/FlowStat.do');
INSERT INTO `esb_wap_aaa` VALUES ('60', '18128709693', '20140622120159', '20140622120650', '13568', '12824', '291', 'SCH-SM N9009', 'http://api.yixia.com/m/v4_remind.json?channel=yixia&token=NadZVltfOb~dBhUze6CrkPuGeh~-aoIy&vend=miaopai&push=2024');
INSERT INTO `esb_wap_aaa` VALUES ('61', '18128899316', '20140622122017', '20140622122055', '4311', '1575', '38', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301');
INSERT INTO `esb_wap_aaa` VALUES ('62', '18128899316', '20140622124821', '20140622124850', '3573', '2770', '29', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('63', '18128899316', '20140622124857', '20140622124925', '1996', '413', '28', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('64', '18128899316', '20140622124932', '20140622125004', '4102', '1380', '32', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('65', '18128899316', '20140622125011', '20140622125041', '2809', '1093', '30', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('66', '18128899316', '20140622125047', '20140622125119', '2868', '897', '32', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('67', '18128899316', '20140622125125', '20140622125151', '3050', '681', '26', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('68', '18128899316', '20140622125158', '20140622125226', '2020', '441', '28', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('69', '18128899316', '20140622125233', '20140622125309', '4723', '2208', '36', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('70', '18128899316', '20140622125316', '20140622125342', '3178', '2387', '26', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('71', '18128899316', '20140622125348', '20140622125419', '4522', '2339', '31', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('72', '18128899316', '20140622125425', '20140622125454', '3706', '973', '29', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('73', '18128899316', '20140622125501', '20140622125526', '2120', '501', '25', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('74', '18128899316', '20140622125533', '20140622125557', '2607', '1160', '24', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('75', '18128899316', '20140622125604', '20140622125629', '2768', '837', '25', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('76', '18128899316', '20140622125635', '20140622125659', '2587', '803', '24', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('77', '18128899316', '20140622125706', '20140622125732', '2668', '777', '26', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('78', '18128899316', '20140622125738', '20140622125804', '3812', '1684', '26', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('79', '18128899316', '20140622125810', '20140622125843', '6300', '5303', '33', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('80', '18128899316', '20140622125849', '20140622125922', '3928', '2417', '33', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('81', '18128899316', '20140622125929', '20140622125958', '1996', '413', '29', 'LNV-Lenovo A305e', 'http://market.hiapk.com/service/api2.php?qt=5301,http://market.hiapk.com/service/api2.php?qt=5301,http://121.207.242.12/service/api2.php?qt=5301,http://loc.map.baidu.com/sdk.php');
INSERT INTO `esb_wap_aaa` VALUES ('82', '18924026436', '20140622122920', '20140622122930', '12139', '11026', '10', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('83', '18924026436', '20140622123022', '20140622123056', '21351', '80713', '34', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('84', '18924026436', '20140622123124', '20140622123139', '7143', '7300', '15', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('85', '18924026436', '20140622123815', '20140622123816', '0', '0', '1', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('86', '18924026436', '20140622123908', '20140622123923', '9655', '9232', '15', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('87', '18924026436', '20140622124257', '20140622124312', '10044', '52687', '15', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('88', '18924026436', '20140622124414', '20140622124414', '0', '0', '0', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('89', '18924026436', '20140622124602', '20140622124602', '0', '0', '0', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('90', '18924026436', '20140622124631', '20140622124646', '7226', '8395', '15', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('91', '18924026436', '20140622124716', '20140622124804', '14756', '59515', '48', 'SNM-M35c', 'http://goupdate.3g.cn/GOClientData/DR?ptl=10&is_zip=1,http://14.17.111.87/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=f3.mi-stat.gslb.mi-idc.com%2Cresolver.gslb.mi-idc.com%2Capp.chat.xiaomi.net');
INSERT INTO `esb_wap_aaa` VALUES ('92', '18924026436', '20140622124925', '20140622124955', '18215', '175192', '30', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('93', '18924026436', '20140622125018', '20140622125033', '8479', '8082', '15', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('94', '18924026436', '20140622125058', '20140622125059', '0', '0', '1', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload');
INSERT INTO `esb_wap_aaa` VALUES ('95', '18924026436', '20140622125120', '20140622125222', '42955', '835727', '62', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('96', '18924026436', '20140622125740', '20140622125744', '2079', '975', '4', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('97', '18924026436', '20140622125758', '20140622125829', '13234', '33098', '31', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('98', '18924026436', '20140622125840', '20140622125915', '11606', '11574', '35', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');
INSERT INTO `esb_wap_aaa` VALUES ('99', '18924026436', '20140622125941', '20140622125944', '6164', '5616', '3', 'SNM-M35c', 'http://wx.qlogo.cn/mmhead/le1D2uwOTUPvp2Riau0BmS3ibmCibZnDbYEpGicNLagELEInXPb7bpD0qg/96,http://new-event.sng.qq.com/analytics/upload,http://resolver.gslb.mi-idc.com/gslb/gslb/getbucket.asp?ver=3.0&type=wap&uuid=0&list=app.chat.xiaomi.net%2Cresolver.gslb.m');

-- ----------------------------
-- Table structure for `functionmoudle`
-- ----------------------------
DROP TABLE IF EXISTS `functionmoudle`;
CREATE TABLE `functionmoudle` (
  `id` int(11) NOT NULL auto_increment,
  `moudletitle` varchar(150) default NULL COMMENT '模块标题\0\0R\0',
  `moudleid` varchar(50) default NULL COMMENT '模块自身的ID\0\0rs\0',
  `moudletype` varchar(5) default NULL COMMENT '模块的类型，分一级模块f,二级模块模块s,三级模块模块t,三级模块为二级模块中为叶子的具体功能模块的按钮\0\r\0\0\0''\0n\0t\0n\0e\0a\0p\0y\0\r\0\0\0\n\0p\0l\0''\0\n\0a\0p\0y\0\r\0\0\0b',
  `isleaf` varchar(5) default NULL COMMENT '是否为叶子节点y,n\0ner\0\0\0',
  `openurl` varchar(255) default '',
  `icon` varchar(100) default NULL,
  `parentid` int(11) default NULL,
  `orderid` int(11) default NULL,
  `iconcls` varchar(20) default ' ',
  `addshutcut` varchar(20) default 'off',
  `shutcuturl` varchar(200) default ' ',
  `dependtree` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `moudleid` (`moudleid`),
  UNIQUE KEY `UK_p815dwol4ueveejrlqlm3kk8w` (`moudleid`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 COMMENT='模块的管理信息';

-- ----------------------------
-- Records of functionmoudle
-- ----------------------------
INSERT INTO `functionmoudle` VALUES ('1', '系统管理', 'systemmanager', 'f', 'off', '', '', '-1', '1', ' ', 'off', ' ', 'off');
INSERT INTO `functionmoudle` VALUES ('2', '模块管理', 'moudlemanager', 't', 'on', 'system/functionmoudle.jsp', 'icons/home_page_icon/model_manage.png', '1', '1', ' ', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('19', '字典数据管理', 'dictionnarydate', 't', 'on', 'system/dctdata.jsp', 'icons/home_page_icon/data_dic.png', '1', '4', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('21', '日志管理', 'syslogmanager', 't', 'on', 'system/logquery.jsp', 'icons/home_page_icon/log_manage.png', '1', '6', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('51', 'push配置', 'sys_push_config', 't', 'on', 'system/pushconfig.jsp', 'icons/home_page_icon/push_config.png', '1', '7', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('52', '在线用户', 'sys_online_user', 't', 'on', 'system/onLineUser.jsp', 'icons/home_page_icon/user_online.png', '1', '8', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('55', '用户组管理', 'sys_usergroup', 't', 'on', 'system/department.jsp', 'icons/home_page_icon/users_manger.png', '1', '9', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('57', 'socket配置', 'socket_interface_conf', 't', 'on', 'system/socketconfig.jsp', 'icons/home_page_icon/socket_config.png', '1', '9', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('59', '系统参数配置', 'sys_parameter_config', 't', 'on', 'system/sysConfigPara.jsp', 'icons/home_page_icon/sys_parameter_config.png', '1', '11', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('61', '总览', 'overview', 't', 'on', 'page/overview/overView.jsp', 'icons/home_page_icon/overview.png', '1', '12', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('62', '预加载配置', 'sys_preload_config', 't', 'on', 'system/sysPreloadconfig.jsp', 'icons/home_page_icon/preload.png', '1', '13', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('63', '定时任务配置', 'sys_scheduler_config', 't', 'on', 'system/sysJobInterface.jsp', 'icons/home_page_icon/timing_task_set.png', '1', '13', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('65', '修改密码', 'user_pwd_change', 't', 'on', 'system/modipwd.jsp', 'icons/home_page_icon/modify_key.png', '1', '13', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('155', 'Action配置管理', 'ActionConf', 't', 'on', 'system/sysActionlogConf.jsp', 'icons/home_page_icon/data_subscribe.png', '1', '15', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('157', '用户日志管理', 'userlogquery', 't', 'on', 'system/userlogquery.jsp', 'icons/home_page_icon/overview.png', '1', '20', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('180', '工作流程管理', 'workflowManage', 'f', 'off', '', '', '-1', '2', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('181', '流程定义及部署管理', 'processList', 't', 'on', 'page/workflow/processList.jsp', 'icons/home_page_icon/entiry_business.png', '180', '6', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('182', '发起新流程', 'leaveApply', 't', 'on', '/myframe/dynamicReportController.do?list&configId=t_s_log', 'icons/home_page_icon/frontend_kpi_config.png', '180', '1', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('183', '待办任务列表', 'taskList', 't', 'on', 'page/workflow/taskList.jsp', 'icons/home_page_icon/isup_analysis.png', '180', '2', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('184', '运行中流程', 'runningList', 't', 'on', 'page/workflow/runningList.jsp', 'icons/home_page_icon/kpi_ifle_subscribe.png', '180', '4', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('185', '已结束流程', 'finishedList', 't', 'on', 'page/workflow/finishedList.jsp', 'icons/home_page_icon/source_cdr_query.png', '180', '5', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('186', '参与的流程', 'involvedProcessInstancesList', 't', 'on', 'page/workflow/involvedProcessInstancesList', 'icons/home_page_icon/resident_program.png', '180', '3', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('200', '安全管理', 'center_auth', 'f', 'off', '', '', '-1', '4', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('202', '用户管理', 'sysusermanager', 't', 'on', 'system/userList.jsp', 'icons/home_page_icon/user_manager.png', '200', '2', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('203', '角色管理', 'userrolemanager', 't', 'on', 'system/userrole.jsp', 'icons/home_page_icon/role_manage.png', '200', '3', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('204', '区域管理', 'userZone', 't', 'on', 'system/userZone.jsp', 'icons/home_page_icon/local_info.png', '200', '11', '', 'off', '', 'off');
INSERT INTO `functionmoudle` VALUES ('220', '动态报表配置', 'dynamicreport', 't', 'on', 'page/dynamicReport/dynamic_report_config.jsp', 'icons/home_page_icon/socket_config.png', '1', '21', '', 'off', '', 'off');

-- ----------------------------
-- Table structure for `jform_cgreport_head`
-- ----------------------------
DROP TABLE IF EXISTS `jform_cgreport_head`;
CREATE TABLE `jform_cgreport_head` (
  `ID` varchar(36) NOT NULL,
  `CGR_SQL` longtext NOT NULL,
  `CODE` varchar(36) NOT NULL,
  `CONTENT` longtext NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jform_cgreport_head
-- ----------------------------
INSERT INTO `jform_cgreport_head` VALUES ('4028946a47e81c840147e82503ad0181', 'select mdn,url as starttime,date_format(endtime,\'%Y-%m-%d %T\') as endtime,url,termtype as workflowstatus,timelength as systemid from esb_wap_aaa', 't_s_log', 't_s_log', '固网AAA查询');

-- ----------------------------
-- Table structure for `jform_cgreport_item`
-- ----------------------------
DROP TABLE IF EXISTS `jform_cgreport_item`;
CREATE TABLE `jform_cgreport_item` (
  `ID` varchar(36) NOT NULL,
  `S_FLAG` varchar(2) default NULL,
  `S_MODE` varchar(10) default NULL,
  `CGRHEAD_ID` varchar(36) default NULL,
  `DICT_CODE` varchar(36) default NULL,
  `FIELD_HREF` varchar(120) default NULL,
  `FIELD_NAME` varchar(36) default NULL,
  `FIELD_TXT` longtext,
  `FIELD_WIDTH` int(11) default NULL,
  `FIELD_TYPE` varchar(10) default NULL,
  `IS_SHOW` varchar(5) default NULL,
  `ORDER_NUM` int(11) default NULL,
  `REPLACE_VA` varchar(36) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jform_cgreport_item
-- ----------------------------
INSERT INTO `jform_cgreport_item` VALUES ('a4b7ce92c307408f814dca47f65ec316', 'Y', 'single', '4028946a47e81c840147e82503ad0181', 'workflowstatus', '', 'workflowstatus', '终端类型', '100', 'ComboBox', 'Y', '3', '');
INSERT INTO `jform_cgreport_item` VALUES ('26462b6cb23c46c8a18474ba07cd5207', 'Y', 'single', '4028946a47e81c840147e82503ad0181', '', '', 'endtime', '结束时间', '200', 'Date', 'Y', '2', '');
INSERT INTO `jform_cgreport_item` VALUES ('0bf6c3ca02c54c8e9e088c758693c9f3', 'Y', 'single', '4028946a47e81c840147e82503ad0181', '', '', 'mdn', '电话号码', '100', 'String', 'Y', '1', '');
INSERT INTO `jform_cgreport_item` VALUES ('f9cb2ea9700845b88b3ccd391880927e', 'N', 'single', '4028946a47e81c840147e82503ad0181', '', '', 'starttime', '开始时间', '100', 'Date', 'Y', '0', '');
INSERT INTO `jform_cgreport_item` VALUES ('6d8b0ae95539470c898380fc8a0feeba', 'Y', 'single', '4028946a47e81c840147e82503ad0181', '', '', 'systemid', '系统标识', '100', 'String', 'Y', '3', '0_结束2,start_开始');

-- ----------------------------
-- Table structure for `local_socket`
-- ----------------------------
DROP TABLE IF EXISTS `local_socket`;
CREATE TABLE `local_socket` (
  `id` int(11) NOT NULL auto_increment,
  `ip` varchar(30) default NULL,
  `port` varchar(10) default NULL,
  `is_open` varchar(10) default NULL,
  `type` varchar(10) default NULL,
  `description` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of local_socket
-- ----------------------------
INSERT INTO `local_socket` VALUES ('5', '132.129.5.45', '3002', '0', '2', null);
INSERT INTO `local_socket` VALUES ('6', '132.129.5.45', '3000', '0', '3', null);
INSERT INTO `local_socket` VALUES ('7', '132.129.5.45', '3003', '0', '4', null);

-- ----------------------------
-- Table structure for `syslogs`
-- ----------------------------
DROP TABLE IF EXISTS `syslogs`;
CREATE TABLE `syslogs` (
  `id` int(11) NOT NULL auto_increment,
  `logname` varchar(20) default NULL COMMENT '操作名称,login,logout,opera\0\0\0\0',
  `loguser` varchar(30) default NULL COMMENT '操作对象\0\0R\0',
  `logterminal` varchar(20) default NULL COMMENT '操作终端,ip,OR HOSTname\0\0\0\0',
  `logresult` varchar(20) default NULL COMMENT '操作结果,success,fail\0\0\0\0',
  `logcontent` varchar(200) default NULL COMMENT '操作内容\0\0R\0',
  `logtime` varchar(60) default NULL COMMENT '操作时间\0\0R\0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8732 DEFAULT CHARSET=utf8 COMMENT='系统操作日志';

-- ----------------------------
-- Records of syslogs
-- ----------------------------
INSERT INTO `syslogs` VALUES ('5698', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-21 10:19:40');
INSERT INTO `syslogs` VALUES ('5699', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-21 10:20:43');
INSERT INTO `syslogs` VALUES ('5700', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-21 10:40:03');
INSERT INTO `syslogs` VALUES ('5701', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-21 11:51:27');
INSERT INTO `syslogs` VALUES ('5702', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-21 11:56:19');
INSERT INTO `syslogs` VALUES ('5703', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-7-21 11:58:15');
INSERT INTO `syslogs` VALUES ('5704', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-21 11:58:20');
INSERT INTO `syslogs` VALUES ('5705', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-21 11:58:50');
INSERT INTO `syslogs` VALUES ('5706', 'login', 'user', '0:0:0:0:0:0:0:1', 'fail', 'unknow user:userlogin to system', '2014-7-21 12:50:07');
INSERT INTO `syslogs` VALUES ('5707', 'login', 'user', '0:0:0:0:0:0:0:1', 'fail', 'unknow user:userlogin to system', '2014-7-21 12:50:13');
INSERT INTO `syslogs` VALUES ('5708', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-21 12:50:20');
INSERT INTO `syslogs` VALUES ('5709', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-21 14:29:30');
INSERT INTO `syslogs` VALUES ('5710', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-21 15:27:18');
INSERT INTO `syslogs` VALUES ('5711', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-21 16:59:31');
INSERT INTO `syslogs` VALUES ('5712', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 14:06:54');
INSERT INTO `syslogs` VALUES ('5713', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 14:10:44');
INSERT INTO `syslogs` VALUES ('5714', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 14:10:44');
INSERT INTO `syslogs` VALUES ('5715', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 14:10:57');
INSERT INTO `syslogs` VALUES ('5716', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 14:17:53');
INSERT INTO `syslogs` VALUES ('5717', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 14:16:08');
INSERT INTO `syslogs` VALUES ('5718', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 14:16:12');
INSERT INTO `syslogs` VALUES ('5719', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 14:23:37');
INSERT INTO `syslogs` VALUES ('5720', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 14:20:24');
INSERT INTO `syslogs` VALUES ('5721', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 14:20:29');
INSERT INTO `syslogs` VALUES ('5722', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 14:21:53');
INSERT INTO `syslogs` VALUES ('5723', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 14:21:53');
INSERT INTO `syslogs` VALUES ('5724', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 14:21:55');
INSERT INTO `syslogs` VALUES ('5725', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-22 14:26:35');
INSERT INTO `syslogs` VALUES ('5726', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 14:26:41');
INSERT INTO `syslogs` VALUES ('5727', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 14:35:24');
INSERT INTO `syslogs` VALUES ('5728', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 14:32:34');
INSERT INTO `syslogs` VALUES ('5729', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 14:32:34');
INSERT INTO `syslogs` VALUES ('5730', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 14:32:35');
INSERT INTO `syslogs` VALUES ('5731', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 14:36:56');
INSERT INTO `syslogs` VALUES ('5732', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-22 14:36:56');
INSERT INTO `syslogs` VALUES ('5733', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 14:37:17');
INSERT INTO `syslogs` VALUES ('5734', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-22 14:38:14');
INSERT INTO `syslogs` VALUES ('5735', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 14:38:17');
INSERT INTO `syslogs` VALUES ('5736', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 14:34:43');
INSERT INTO `syslogs` VALUES ('5737', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 14:34:43');
INSERT INTO `syslogs` VALUES ('5738', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 14:34:49');
INSERT INTO `syslogs` VALUES ('5739', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-22 14:38:59');
INSERT INTO `syslogs` VALUES ('5740', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 14:39:03');
INSERT INTO `syslogs` VALUES ('5741', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 14:35:16');
INSERT INTO `syslogs` VALUES ('5742', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 14:35:20');
INSERT INTO `syslogs` VALUES ('5743', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 14:41:17');
INSERT INTO `syslogs` VALUES ('5744', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 14:55:20');
INSERT INTO `syslogs` VALUES ('5745', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-22 14:57:52');
INSERT INTO `syslogs` VALUES ('5746', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 14:57:58');
INSERT INTO `syslogs` VALUES ('5747', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 15:10:28');
INSERT INTO `syslogs` VALUES ('5748', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:09:19');
INSERT INTO `syslogs` VALUES ('5749', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 15:09:19');
INSERT INTO `syslogs` VALUES ('5750', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:09:21');
INSERT INTO `syslogs` VALUES ('5751', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:16:25');
INSERT INTO `syslogs` VALUES ('5752', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 15:16:25');
INSERT INTO `syslogs` VALUES ('5753', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:16:28');
INSERT INTO `syslogs` VALUES ('5754', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:19:04');
INSERT INTO `syslogs` VALUES ('5755', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 15:19:04');
INSERT INTO `syslogs` VALUES ('5756', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:19:06');
INSERT INTO `syslogs` VALUES ('5757', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 15:23:51');
INSERT INTO `syslogs` VALUES ('5758', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 15:27:29');
INSERT INTO `syslogs` VALUES ('5759', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 15:28:17');
INSERT INTO `syslogs` VALUES ('5760', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-22 15:28:17');
INSERT INTO `syslogs` VALUES ('5761', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 15:28:33');
INSERT INTO `syslogs` VALUES ('5762', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 15:30:24');
INSERT INTO `syslogs` VALUES ('5763', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 15:35:11');
INSERT INTO `syslogs` VALUES ('5764', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:32:52');
INSERT INTO `syslogs` VALUES ('5765', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:32:55');
INSERT INTO `syslogs` VALUES ('5766', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:32:55');
INSERT INTO `syslogs` VALUES ('5767', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:34:04');
INSERT INTO `syslogs` VALUES ('5768', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 15:38:07');
INSERT INTO `syslogs` VALUES ('5769', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:34:53');
INSERT INTO `syslogs` VALUES ('5770', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 15:34:53');
INSERT INTO `syslogs` VALUES ('5771', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:35:09');
INSERT INTO `syslogs` VALUES ('5772', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:40:01');
INSERT INTO `syslogs` VALUES ('5773', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 15:40:01');
INSERT INTO `syslogs` VALUES ('5774', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:40:02');
INSERT INTO `syslogs` VALUES ('5775', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:40:28');
INSERT INTO `syslogs` VALUES ('5776', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 15:40:28');
INSERT INTO `syslogs` VALUES ('5777', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:40:32');
INSERT INTO `syslogs` VALUES ('5778', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 15:46:21');
INSERT INTO `syslogs` VALUES ('5779', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:45:42');
INSERT INTO `syslogs` VALUES ('5780', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 15:45:42');
INSERT INTO `syslogs` VALUES ('5781', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:45:59');
INSERT INTO `syslogs` VALUES ('5782', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 15:52:18');
INSERT INTO `syslogs` VALUES ('5783', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 15:51:05');
INSERT INTO `syslogs` VALUES ('5784', 'login', 'center', '0:0:0:0:0:0:0:1', 'fail', 'user:centerlogin to system', '2014-7-22 15:51:15');
INSERT INTO `syslogs` VALUES ('5785', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:51:27');
INSERT INTO `syslogs` VALUES ('5786', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:51:34');
INSERT INTO `syslogs` VALUES ('5787', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 15:51:34');
INSERT INTO `syslogs` VALUES ('5788', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:51:38');
INSERT INTO `syslogs` VALUES ('5789', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 15:51:56');
INSERT INTO `syslogs` VALUES ('5790', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:52:02');
INSERT INTO `syslogs` VALUES ('5791', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:54:44');
INSERT INTO `syslogs` VALUES ('5792', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 15:54:44');
INSERT INTO `syslogs` VALUES ('5793', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:54:56');
INSERT INTO `syslogs` VALUES ('5794', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 16:01:12');
INSERT INTO `syslogs` VALUES ('5795', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 15:59:38');
INSERT INTO `syslogs` VALUES ('5796', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:00:55');
INSERT INTO `syslogs` VALUES ('5797', 'login', 'user', '0:0:0:0:0:0:0:1', 'fail', 'unknow user:userlogin to system', '2014-7-22 16:12:54');
INSERT INTO `syslogs` VALUES ('5798', 'login', 'user', '0:0:0:0:0:0:0:1', 'fail', 'unknow user:userlogin to system', '2014-7-22 16:13:04');
INSERT INTO `syslogs` VALUES ('5799', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:13:13');
INSERT INTO `syslogs` VALUES ('5800', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-7-22 16:22:13');
INSERT INTO `syslogs` VALUES ('5801', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:22:57');
INSERT INTO `syslogs` VALUES ('5802', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:24:22');
INSERT INTO `syslogs` VALUES ('5803', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 16:24:22');
INSERT INTO `syslogs` VALUES ('5804', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:24:24');
INSERT INTO `syslogs` VALUES ('5805', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:30:01');
INSERT INTO `syslogs` VALUES ('5806', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:30:18');
INSERT INTO `syslogs` VALUES ('5807', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 16:30:18');
INSERT INTO `syslogs` VALUES ('5808', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:30:21');
INSERT INTO `syslogs` VALUES ('5809', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:31:12');
INSERT INTO `syslogs` VALUES ('5810', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 16:31:12');
INSERT INTO `syslogs` VALUES ('5811', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:31:17');
INSERT INTO `syslogs` VALUES ('5812', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:49:27');
INSERT INTO `syslogs` VALUES ('5813', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 16:49:27');
INSERT INTO `syslogs` VALUES ('5814', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:49:30');
INSERT INTO `syslogs` VALUES ('5815', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:54:08');
INSERT INTO `syslogs` VALUES ('5816', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-7-22 16:56:03');
INSERT INTO `syslogs` VALUES ('5817', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:56:07');
INSERT INTO `syslogs` VALUES ('5818', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 16:54:39');
INSERT INTO `syslogs` VALUES ('5819', 'login', 'user', '0:0:0:0:0:0:0:1', 'fail', 'user:userlogin to system', '2014-7-22 16:54:48');
INSERT INTO `syslogs` VALUES ('5820', 'login', 'user', '0:0:0:0:0:0:0:1', 'fail', 'user:userlogin to system', '2014-7-22 16:55:07');
INSERT INTO `syslogs` VALUES ('5821', 'login', 'user2', '0:0:0:0:0:0:0:1', 'fail', 'user:user2login to system', '2014-7-22 16:55:28');
INSERT INTO `syslogs` VALUES ('5822', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:55:40');
INSERT INTO `syslogs` VALUES ('5823', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 16:56:21');
INSERT INTO `syslogs` VALUES ('5824', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:59:32');
INSERT INTO `syslogs` VALUES ('5825', 'login', 'user', '0:0:0:0:0:0:0:1', 'fail', 'user:userlogin to system', '2014-7-22 16:56:30');
INSERT INTO `syslogs` VALUES ('5826', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:57:01');
INSERT INTO `syslogs` VALUES ('5827', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-22 16:57:10');
INSERT INTO `syslogs` VALUES ('5828', 'login', 'user2', '0:0:0:0:0:0:0:1', 'fail', 'user:user2login to system', '2014-7-22 16:57:23');
INSERT INTO `syslogs` VALUES ('5829', 'login', 'user', '0:0:0:0:0:0:0:1', 'fail', 'user:userlogin to system', '2014-7-22 16:57:59');
INSERT INTO `syslogs` VALUES ('5830', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 16:58:04');
INSERT INTO `syslogs` VALUES ('5831', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:07:25');
INSERT INTO `syslogs` VALUES ('5832', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-7-22 17:08:44');
INSERT INTO `syslogs` VALUES ('5833', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:08:48');
INSERT INTO `syslogs` VALUES ('5834', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-7-22 17:16:09');
INSERT INTO `syslogs` VALUES ('5835', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:16:16');
INSERT INTO `syslogs` VALUES ('5836', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:17:16');
INSERT INTO `syslogs` VALUES ('5837', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-22 17:30:22');
INSERT INTO `syslogs` VALUES ('5838', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:28:59');
INSERT INTO `syslogs` VALUES ('5839', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:33:40');
INSERT INTO `syslogs` VALUES ('5840', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:38:38');
INSERT INTO `syslogs` VALUES ('5841', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:40:13');
INSERT INTO `syslogs` VALUES ('5842', 'login', 'user', '0:0:0:0:0:0:0:1', 'fail', 'user:userlogin to system', '2014-7-22 17:41:11');
INSERT INTO `syslogs` VALUES ('5843', 'login', 'admin', '0:0:0:0:0:0:0:1', 'fail', 'user:adminlogin to system', '2014-7-22 17:41:57');
INSERT INTO `syslogs` VALUES ('5844', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:42:08');
INSERT INTO `syslogs` VALUES ('5845', 'login', 'user', '0:0:0:0:0:0:0:1', 'fail', 'user:userlogin to system', '2014-7-22 17:43:18');
INSERT INTO `syslogs` VALUES ('5846', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:43:30');
INSERT INTO `syslogs` VALUES ('5847', 'login', 'user', '0:0:0:0:0:0:0:1', 'fail', 'user:userlogin to system', '2014-7-22 17:44:01');
INSERT INTO `syslogs` VALUES ('5848', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:44:09');
INSERT INTO `syslogs` VALUES ('5849', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:44:42');
INSERT INTO `syslogs` VALUES ('5850', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:45:39');
INSERT INTO `syslogs` VALUES ('5851', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:45:46');
INSERT INTO `syslogs` VALUES ('5852', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:50:43');
INSERT INTO `syslogs` VALUES ('5853', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-7-22 17:48:00');
INSERT INTO `syslogs` VALUES ('5854', 'login', 'center', '127.0.0.1', 'success', 'login to system', '2014-7-22 17:48:07');
INSERT INTO `syslogs` VALUES ('5855', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-22 17:52:28');
INSERT INTO `syslogs` VALUES ('5856', 'login', 'center', '127.0.0.1', 'success', 'login to system', '2014-7-22 18:01:43');
INSERT INTO `syslogs` VALUES ('5857', 'login', 'center', '127.0.0.1', 'success', 'login to system', '2014-7-22 18:03:20');
INSERT INTO `syslogs` VALUES ('5858', 'login', 'center', '127.0.0.1', 'success', 'login to system', '2014-7-22 18:05:10');
INSERT INTO `syslogs` VALUES ('5859', 'login', 'center', '127.0.0.1', 'success', 'login to system', '2014-7-22 18:09:38');
INSERT INTO `syslogs` VALUES ('5860', 'logout', 'center', '127.0.0.1', 'success', 'logout to system', '2014-7-22 18:10:04');
INSERT INTO `syslogs` VALUES ('5861', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 9:14:25');
INSERT INTO `syslogs` VALUES ('5862', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 9:28:50');
INSERT INTO `syslogs` VALUES ('5863', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 9:28:59');
INSERT INTO `syslogs` VALUES ('5864', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 9:29:29');
INSERT INTO `syslogs` VALUES ('5865', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 9:29:30');
INSERT INTO `syslogs` VALUES ('5866', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 9:29:42');
INSERT INTO `syslogs` VALUES ('5867', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 9:33:15');
INSERT INTO `syslogs` VALUES ('5868', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 9:33:15');
INSERT INTO `syslogs` VALUES ('5869', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 9:33:17');
INSERT INTO `syslogs` VALUES ('5870', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 9:33:39');
INSERT INTO `syslogs` VALUES ('5871', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 9:33:39');
INSERT INTO `syslogs` VALUES ('5872', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 9:33:47');
INSERT INTO `syslogs` VALUES ('5873', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 9:37:05');
INSERT INTO `syslogs` VALUES ('5874', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 9:37:05');
INSERT INTO `syslogs` VALUES ('5875', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 9:37:08');
INSERT INTO `syslogs` VALUES ('5876', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:05:06');
INSERT INTO `syslogs` VALUES ('5877', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:10:18');
INSERT INTO `syslogs` VALUES ('5878', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 10:10:18');
INSERT INTO `syslogs` VALUES ('5879', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:10:20');
INSERT INTO `syslogs` VALUES ('5880', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 10:12:10');
INSERT INTO `syslogs` VALUES ('5881', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:12:19');
INSERT INTO `syslogs` VALUES ('5882', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 10:13:03');
INSERT INTO `syslogs` VALUES ('5883', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:13:11');
INSERT INTO `syslogs` VALUES ('5884', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 10:13:55');
INSERT INTO `syslogs` VALUES ('5885', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:14:02');
INSERT INTO `syslogs` VALUES ('5886', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-7-23 10:15:45');
INSERT INTO `syslogs` VALUES ('5887', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-7-23 10:15:56');
INSERT INTO `syslogs` VALUES ('5888', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:17:13');
INSERT INTO `syslogs` VALUES ('5889', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 10:17:13');
INSERT INTO `syslogs` VALUES ('5890', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:17:14');
INSERT INTO `syslogs` VALUES ('5891', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:19:32');
INSERT INTO `syslogs` VALUES ('5892', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 10:19:32');
INSERT INTO `syslogs` VALUES ('5893', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:19:34');
INSERT INTO `syslogs` VALUES ('5894', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:31:02');
INSERT INTO `syslogs` VALUES ('5895', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 10:31:02');
INSERT INTO `syslogs` VALUES ('5896', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:31:13');
INSERT INTO `syslogs` VALUES ('5897', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 10:34:24');
INSERT INTO `syslogs` VALUES ('5898', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:34:31');
INSERT INTO `syslogs` VALUES ('5899', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-23 10:34:37');
INSERT INTO `syslogs` VALUES ('5900', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-23 10:34:46');
INSERT INTO `syslogs` VALUES ('5901', 'logout', 'user', '127.0.0.1', 'success', 'logout to system', '2014-7-23 10:35:46');
INSERT INTO `syslogs` VALUES ('5902', 'login', 'center', '127.0.0.1', 'success', 'login to system', '2014-7-23 10:35:55');
INSERT INTO `syslogs` VALUES ('5903', 'logout', 'center', '127.0.0.1', 'success', 'logout to system', '2014-7-23 10:36:53');
INSERT INTO `syslogs` VALUES ('5904', 'login', 'center', '127.0.0.1', 'success', 'login to system', '2014-7-23 10:36:57');
INSERT INTO `syslogs` VALUES ('5905', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 11:04:17');
INSERT INTO `syslogs` VALUES ('5906', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 11:44:48');
INSERT INTO `syslogs` VALUES ('5907', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 11:47:39');
INSERT INTO `syslogs` VALUES ('5908', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 11:54:30');
INSERT INTO `syslogs` VALUES ('5909', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 11:57:00');
INSERT INTO `syslogs` VALUES ('5910', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 12:04:36');
INSERT INTO `syslogs` VALUES ('5911', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 12:06:22');
INSERT INTO `syslogs` VALUES ('5912', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 12:23:14');
INSERT INTO `syslogs` VALUES ('5913', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 12:38:43');
INSERT INTO `syslogs` VALUES ('5914', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 12:40:23');
INSERT INTO `syslogs` VALUES ('5915', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-23 12:40:24');
INSERT INTO `syslogs` VALUES ('5916', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 12:41:40');
INSERT INTO `syslogs` VALUES ('5917', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 12:44:49');
INSERT INTO `syslogs` VALUES ('5918', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 12:46:35');
INSERT INTO `syslogs` VALUES ('5919', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 12:49:19');
INSERT INTO `syslogs` VALUES ('5920', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 12:52:32');
INSERT INTO `syslogs` VALUES ('5921', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 14:19:20');
INSERT INTO `syslogs` VALUES ('5922', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 14:29:29');
INSERT INTO `syslogs` VALUES ('5923', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 15:07:38');
INSERT INTO `syslogs` VALUES ('5924', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 15:11:00');
INSERT INTO `syslogs` VALUES ('5925', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 15:13:27');
INSERT INTO `syslogs` VALUES ('5926', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 15:15:09');
INSERT INTO `syslogs` VALUES ('5927', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 15:25:13');
INSERT INTO `syslogs` VALUES ('5928', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 15:27:59');
INSERT INTO `syslogs` VALUES ('5929', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 15:36:16');
INSERT INTO `syslogs` VALUES ('5930', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 15:37:35');
INSERT INTO `syslogs` VALUES ('5931', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 15:49:18');
INSERT INTO `syslogs` VALUES ('5932', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-23 15:49:47');
INSERT INTO `syslogs` VALUES ('5933', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 15:52:28');
INSERT INTO `syslogs` VALUES ('5934', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 16:02:05');
INSERT INTO `syslogs` VALUES ('5935', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 16:09:01');
INSERT INTO `syslogs` VALUES ('5936', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 16:12:39');
INSERT INTO `syslogs` VALUES ('5937', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 16:15:05');
INSERT INTO `syslogs` VALUES ('5938', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 16:28:23');
INSERT INTO `syslogs` VALUES ('5939', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 16:49:09');
INSERT INTO `syslogs` VALUES ('5940', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 16:52:33');
INSERT INTO `syslogs` VALUES ('5941', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 17:11:20');
INSERT INTO `syslogs` VALUES ('5942', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 17:19:35');
INSERT INTO `syslogs` VALUES ('5943', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 17:25:36');
INSERT INTO `syslogs` VALUES ('5944', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 17:34:04');
INSERT INTO `syslogs` VALUES ('5945', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 17:44:14');
INSERT INTO `syslogs` VALUES ('5946', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-23 17:48:54');
INSERT INTO `syslogs` VALUES ('5947', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 17:49:03');
INSERT INTO `syslogs` VALUES ('5948', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 17:53:16');
INSERT INTO `syslogs` VALUES ('5949', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-23 17:53:17');
INSERT INTO `syslogs` VALUES ('5950', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-23 18:05:08');
INSERT INTO `syslogs` VALUES ('5951', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-23 18:08:39');
INSERT INTO `syslogs` VALUES ('5952', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-24 9:15:29');
INSERT INTO `syslogs` VALUES ('5953', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-24 9:18:49');
INSERT INTO `syslogs` VALUES ('5954', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-24 9:21:21');
INSERT INTO `syslogs` VALUES ('5955', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-24 9:24:22');
INSERT INTO `syslogs` VALUES ('5956', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-24 9:33:07');
INSERT INTO `syslogs` VALUES ('5957', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-24 9:34:34');
INSERT INTO `syslogs` VALUES ('5958', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-24 9:34:42');
INSERT INTO `syslogs` VALUES ('5959', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-24 9:37:30');
INSERT INTO `syslogs` VALUES ('5960', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-24 9:41:21');
INSERT INTO `syslogs` VALUES ('5961', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-24 9:44:35');
INSERT INTO `syslogs` VALUES ('5962', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-24 9:46:06');
INSERT INTO `syslogs` VALUES ('5963', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-24 9:46:06');
INSERT INTO `syslogs` VALUES ('5964', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-24 9:47:13');
INSERT INTO `syslogs` VALUES ('5965', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-24 9:49:43');
INSERT INTO `syslogs` VALUES ('5966', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-24 9:51:18');
INSERT INTO `syslogs` VALUES ('5967', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-24 17:12:51');
INSERT INTO `syslogs` VALUES ('5968', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-24 17:14:45');
INSERT INTO `syslogs` VALUES ('5969', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-24 17:15:14');
INSERT INTO `syslogs` VALUES ('5970', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-28 15:39:12');
INSERT INTO `syslogs` VALUES ('5971', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-7-28 15:45:56');
INSERT INTO `syslogs` VALUES ('5972', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-28 15:49:17');
INSERT INTO `syslogs` VALUES ('5973', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-28 15:57:28');
INSERT INTO `syslogs` VALUES ('5974', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-28 16:37:13');
INSERT INTO `syslogs` VALUES ('5975', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-28 16:43:21');
INSERT INTO `syslogs` VALUES ('5976', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 16:52:09');
INSERT INTO `syslogs` VALUES ('5977', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-28 17:00:36');
INSERT INTO `syslogs` VALUES ('5978', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:00:40');
INSERT INTO `syslogs` VALUES ('5979', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-28 17:02:35');
INSERT INTO `syslogs` VALUES ('5980', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:11:36');
INSERT INTO `syslogs` VALUES ('5981', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-28 17:11:36');
INSERT INTO `syslogs` VALUES ('5982', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:11:40');
INSERT INTO `syslogs` VALUES ('5983', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:16:04');
INSERT INTO `syslogs` VALUES ('5984', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:20:41');
INSERT INTO `syslogs` VALUES ('5985', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-28 17:20:41');
INSERT INTO `syslogs` VALUES ('5986', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:20:44');
INSERT INTO `syslogs` VALUES ('5987', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:34:16');
INSERT INTO `syslogs` VALUES ('5988', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:35:21');
INSERT INTO `syslogs` VALUES ('5989', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:36:29');
INSERT INTO `syslogs` VALUES ('5990', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:42:31');
INSERT INTO `syslogs` VALUES ('5991', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:47:16');
INSERT INTO `syslogs` VALUES ('5992', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-28 17:51:41');
INSERT INTO `syslogs` VALUES ('5993', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:53:09');
INSERT INTO `syslogs` VALUES ('5994', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-7-28 17:54:41');
INSERT INTO `syslogs` VALUES ('5995', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:54:20');
INSERT INTO `syslogs` VALUES ('5996', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:55:05');
INSERT INTO `syslogs` VALUES ('5997', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 17:56:20');
INSERT INTO `syslogs` VALUES ('5998', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-28 18:09:33');
INSERT INTO `syslogs` VALUES ('5999', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:26:10');
INSERT INTO `syslogs` VALUES ('6000', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:28:51');
INSERT INTO `syslogs` VALUES ('6001', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:29:59');
INSERT INTO `syslogs` VALUES ('6002', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:30:57');
INSERT INTO `syslogs` VALUES ('6003', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:37:04');
INSERT INTO `syslogs` VALUES ('6004', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:37:23');
INSERT INTO `syslogs` VALUES ('6005', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:43:51');
INSERT INTO `syslogs` VALUES ('6006', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:45:01');
INSERT INTO `syslogs` VALUES ('6007', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:45:36');
INSERT INTO `syslogs` VALUES ('6008', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:47:15');
INSERT INTO `syslogs` VALUES ('6009', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:50:08');
INSERT INTO `syslogs` VALUES ('6010', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:51:44');
INSERT INTO `syslogs` VALUES ('6011', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:54:03');
INSERT INTO `syslogs` VALUES ('6012', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:53:55');
INSERT INTO `syslogs` VALUES ('6013', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:57:00');
INSERT INTO `syslogs` VALUES ('6014', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:58:37');
INSERT INTO `syslogs` VALUES ('6015', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:57:32');
INSERT INTO `syslogs` VALUES ('6016', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:59:13');
INSERT INTO `syslogs` VALUES ('6017', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 9:59:39');
INSERT INTO `syslogs` VALUES ('6018', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:02:04');
INSERT INTO `syslogs` VALUES ('6019', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-29 10:02:04');
INSERT INTO `syslogs` VALUES ('6020', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:02:07');
INSERT INTO `syslogs` VALUES ('6021', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:03:38');
INSERT INTO `syslogs` VALUES ('6022', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:03:38');
INSERT INTO `syslogs` VALUES ('6023', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-29 10:03:38');
INSERT INTO `syslogs` VALUES ('6024', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:03:55');
INSERT INTO `syslogs` VALUES ('6025', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:04:30');
INSERT INTO `syslogs` VALUES ('6026', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-29 10:04:30');
INSERT INTO `syslogs` VALUES ('6027', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:04:31');
INSERT INTO `syslogs` VALUES ('6028', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:06:51');
INSERT INTO `syslogs` VALUES ('6029', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:08:09');
INSERT INTO `syslogs` VALUES ('6030', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-29 10:08:09');
INSERT INTO `syslogs` VALUES ('6031', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:08:11');
INSERT INTO `syslogs` VALUES ('6032', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:11:10');
INSERT INTO `syslogs` VALUES ('6033', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:14:08');
INSERT INTO `syslogs` VALUES ('6034', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:14:10');
INSERT INTO `syslogs` VALUES ('6035', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:14:12');
INSERT INTO `syslogs` VALUES ('6036', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:14:30');
INSERT INTO `syslogs` VALUES ('6037', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:15:08');
INSERT INTO `syslogs` VALUES ('6038', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:16:51');
INSERT INTO `syslogs` VALUES ('6039', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-29 10:16:51');
INSERT INTO `syslogs` VALUES ('6040', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:16:54');
INSERT INTO `syslogs` VALUES ('6041', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:19:37');
INSERT INTO `syslogs` VALUES ('6042', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-29 10:19:37');
INSERT INTO `syslogs` VALUES ('6043', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:19:39');
INSERT INTO `syslogs` VALUES ('6044', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:21:16');
INSERT INTO `syslogs` VALUES ('6045', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:21:19');
INSERT INTO `syslogs` VALUES ('6046', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:21:21');
INSERT INTO `syslogs` VALUES ('6047', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:22:01');
INSERT INTO `syslogs` VALUES ('6048', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:22:02');
INSERT INTO `syslogs` VALUES ('6049', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:23:17');
INSERT INTO `syslogs` VALUES ('6050', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-29 10:23:17');
INSERT INTO `syslogs` VALUES ('6051', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:23:20');
INSERT INTO `syslogs` VALUES ('6052', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:25:42');
INSERT INTO `syslogs` VALUES ('6053', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:26:04');
INSERT INTO `syslogs` VALUES ('6054', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-29 10:26:04');
INSERT INTO `syslogs` VALUES ('6055', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 10:26:07');
INSERT INTO `syslogs` VALUES ('6056', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-29 11:09:42');
INSERT INTO `syslogs` VALUES ('6057', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 11:09:47');
INSERT INTO `syslogs` VALUES ('6058', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 13:08:14');
INSERT INTO `syslogs` VALUES ('6059', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 14:06:40');
INSERT INTO `syslogs` VALUES ('6060', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 14:13:58');
INSERT INTO `syslogs` VALUES ('6061', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 14:22:17');
INSERT INTO `syslogs` VALUES ('6062', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 14:29:20');
INSERT INTO `syslogs` VALUES ('6063', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 14:29:25');
INSERT INTO `syslogs` VALUES ('6064', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 14:29:29');
INSERT INTO `syslogs` VALUES ('6065', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 14:33:22');
INSERT INTO `syslogs` VALUES ('6066', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 14:34:51');
INSERT INTO `syslogs` VALUES ('6067', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 14:40:09');
INSERT INTO `syslogs` VALUES ('6068', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 14:46:15');
INSERT INTO `syslogs` VALUES ('6069', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-29 14:46:18');
INSERT INTO `syslogs` VALUES ('6070', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 14:47:46');
INSERT INTO `syslogs` VALUES ('6071', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 15:03:56');
INSERT INTO `syslogs` VALUES ('6072', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 15:14:53');
INSERT INTO `syslogs` VALUES ('6073', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 17:58:10');
INSERT INTO `syslogs` VALUES ('6074', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-29 18:13:15');
INSERT INTO `syslogs` VALUES ('6075', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-29 18:14:57');
INSERT INTO `syslogs` VALUES ('6076', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 8:40:19');
INSERT INTO `syslogs` VALUES ('6077', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 8:56:32');
INSERT INTO `syslogs` VALUES ('6078', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 9:15:33');
INSERT INTO `syslogs` VALUES ('6079', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 9:15:33');
INSERT INTO `syslogs` VALUES ('6080', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 9:16:03');
INSERT INTO `syslogs` VALUES ('6081', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 9:28:12');
INSERT INTO `syslogs` VALUES ('6082', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 9:39:13');
INSERT INTO `syslogs` VALUES ('6083', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 9:56:58');
INSERT INTO `syslogs` VALUES ('6084', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 10:02:32');
INSERT INTO `syslogs` VALUES ('6085', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 10:07:55');
INSERT INTO `syslogs` VALUES ('6086', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 10:13:50');
INSERT INTO `syslogs` VALUES ('6087', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 10:14:58');
INSERT INTO `syslogs` VALUES ('6088', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 10:14:58');
INSERT INTO `syslogs` VALUES ('6089', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 10:15:14');
INSERT INTO `syslogs` VALUES ('6090', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 10:25:17');
INSERT INTO `syslogs` VALUES ('6091', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 10:28:42');
INSERT INTO `syslogs` VALUES ('6092', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 10:28:42');
INSERT INTO `syslogs` VALUES ('6093', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 10:28:58');
INSERT INTO `syslogs` VALUES ('6094', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 10:35:43');
INSERT INTO `syslogs` VALUES ('6095', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 10:44:59');
INSERT INTO `syslogs` VALUES ('6096', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:08:06');
INSERT INTO `syslogs` VALUES ('6097', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:11:48');
INSERT INTO `syslogs` VALUES ('6098', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:12:14');
INSERT INTO `syslogs` VALUES ('6099', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 11:14:16');
INSERT INTO `syslogs` VALUES ('6100', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:14:20');
INSERT INTO `syslogs` VALUES ('6101', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:16:30');
INSERT INTO `syslogs` VALUES ('6102', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:15:56');
INSERT INTO `syslogs` VALUES ('6103', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 11:15:56');
INSERT INTO `syslogs` VALUES ('6104', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:16:01');
INSERT INTO `syslogs` VALUES ('6105', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:17:55');
INSERT INTO `syslogs` VALUES ('6106', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 11:17:55');
INSERT INTO `syslogs` VALUES ('6107', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:18:00');
INSERT INTO `syslogs` VALUES ('6108', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:22:46');
INSERT INTO `syslogs` VALUES ('6109', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:25:36');
INSERT INTO `syslogs` VALUES ('6110', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:27:03');
INSERT INTO `syslogs` VALUES ('6111', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 11:27:03');
INSERT INTO `syslogs` VALUES ('6112', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:27:06');
INSERT INTO `syslogs` VALUES ('6113', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:28:56');
INSERT INTO `syslogs` VALUES ('6114', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 11:28:56');
INSERT INTO `syslogs` VALUES ('6115', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:28:58');
INSERT INTO `syslogs` VALUES ('6116', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:31:03');
INSERT INTO `syslogs` VALUES ('6117', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:35:11');
INSERT INTO `syslogs` VALUES ('6118', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:36:57');
INSERT INTO `syslogs` VALUES ('6119', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:39:18');
INSERT INTO `syslogs` VALUES ('6120', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:41:08');
INSERT INTO `syslogs` VALUES ('6121', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:43:02');
INSERT INTO `syslogs` VALUES ('6122', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:42:14');
INSERT INTO `syslogs` VALUES ('6123', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:43:16');
INSERT INTO `syslogs` VALUES ('6124', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:45:27');
INSERT INTO `syslogs` VALUES ('6125', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:46:44');
INSERT INTO `syslogs` VALUES ('6126', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:48:29');
INSERT INTO `syslogs` VALUES ('6127', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:49:41');
INSERT INTO `syslogs` VALUES ('6128', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 11:49:41');
INSERT INTO `syslogs` VALUES ('6129', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:49:58');
INSERT INTO `syslogs` VALUES ('6130', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:49:13');
INSERT INTO `syslogs` VALUES ('6131', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 11:54:59');
INSERT INTO `syslogs` VALUES ('6132', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 12:05:33');
INSERT INTO `syslogs` VALUES ('6133', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 12:07:20');
INSERT INTO `syslogs` VALUES ('6134', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 12:06:26');
INSERT INTO `syslogs` VALUES ('6135', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 12:07:07');
INSERT INTO `syslogs` VALUES ('6136', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 12:07:07');
INSERT INTO `syslogs` VALUES ('6137', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 12:07:13');
INSERT INTO `syslogs` VALUES ('6138', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 12:12:11');
INSERT INTO `syslogs` VALUES ('6139', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 12:17:31');
INSERT INTO `syslogs` VALUES ('6140', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 12:20:40');
INSERT INTO `syslogs` VALUES ('6141', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 13:06:59');
INSERT INTO `syslogs` VALUES ('6142', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 13:10:56');
INSERT INTO `syslogs` VALUES ('6143', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 13:12:33');
INSERT INTO `syslogs` VALUES ('6144', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 13:16:11');
INSERT INTO `syslogs` VALUES ('6145', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 13:19:41');
INSERT INTO `syslogs` VALUES ('6146', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 14:10:04');
INSERT INTO `syslogs` VALUES ('6147', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 14:22:20');
INSERT INTO `syslogs` VALUES ('6148', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 14:29:27');
INSERT INTO `syslogs` VALUES ('6149', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 14:30:04');
INSERT INTO `syslogs` VALUES ('6150', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 14:30:04');
INSERT INTO `syslogs` VALUES ('6151', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 14:30:31');
INSERT INTO `syslogs` VALUES ('6152', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 14:31:46');
INSERT INTO `syslogs` VALUES ('6153', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 14:31:51');
INSERT INTO `syslogs` VALUES ('6154', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 14:31:59');
INSERT INTO `syslogs` VALUES ('6155', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 14:33:04');
INSERT INTO `syslogs` VALUES ('6156', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 14:40:48');
INSERT INTO `syslogs` VALUES ('6157', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 14:40:56');
INSERT INTO `syslogs` VALUES ('6158', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 14:41:05');
INSERT INTO `syslogs` VALUES ('6159', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 14:44:47');
INSERT INTO `syslogs` VALUES ('6160', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 14:44:47');
INSERT INTO `syslogs` VALUES ('6161', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 15:27:46');
INSERT INTO `syslogs` VALUES ('6162', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 15:34:22');
INSERT INTO `syslogs` VALUES ('6163', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 15:42:18');
INSERT INTO `syslogs` VALUES ('6164', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 15:49:02');
INSERT INTO `syslogs` VALUES ('6165', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 15:58:54');
INSERT INTO `syslogs` VALUES ('6166', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 16:03:24');
INSERT INTO `syslogs` VALUES ('6167', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 16:06:58');
INSERT INTO `syslogs` VALUES ('6168', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 16:09:35');
INSERT INTO `syslogs` VALUES ('6169', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 16:13:54');
INSERT INTO `syslogs` VALUES ('6170', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 16:22:42');
INSERT INTO `syslogs` VALUES ('6171', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 16:29:03');
INSERT INTO `syslogs` VALUES ('6172', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 16:34:36');
INSERT INTO `syslogs` VALUES ('6173', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-30 16:34:44');
INSERT INTO `syslogs` VALUES ('6174', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 16:34:53');
INSERT INTO `syslogs` VALUES ('6175', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 16:40:10');
INSERT INTO `syslogs` VALUES ('6176', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 16:44:52');
INSERT INTO `syslogs` VALUES ('6177', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 16:54:07');
INSERT INTO `syslogs` VALUES ('6178', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 17:03:54');
INSERT INTO `syslogs` VALUES ('6179', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 17:15:11');
INSERT INTO `syslogs` VALUES ('6180', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 17:18:43');
INSERT INTO `syslogs` VALUES ('6181', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 17:27:21');
INSERT INTO `syslogs` VALUES ('6182', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 17:49:23');
INSERT INTO `syslogs` VALUES ('6183', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 18:03:01');
INSERT INTO `syslogs` VALUES ('6184', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-30 18:11:33');
INSERT INTO `syslogs` VALUES ('6185', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 9:09:56');
INSERT INTO `syslogs` VALUES ('6186', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 9:30:01');
INSERT INTO `syslogs` VALUES ('6187', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-31 9:30:57');
INSERT INTO `syslogs` VALUES ('6188', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 9:31:40');
INSERT INTO `syslogs` VALUES ('6189', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 9:37:20');
INSERT INTO `syslogs` VALUES ('6190', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 9:38:54');
INSERT INTO `syslogs` VALUES ('6191', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-31 9:42:21');
INSERT INTO `syslogs` VALUES ('6192', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 9:42:41');
INSERT INTO `syslogs` VALUES ('6193', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 9:59:28');
INSERT INTO `syslogs` VALUES ('6194', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:03:15');
INSERT INTO `syslogs` VALUES ('6195', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-31 10:03:15');
INSERT INTO `syslogs` VALUES ('6196', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:03:35');
INSERT INTO `syslogs` VALUES ('6197', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:05:16');
INSERT INTO `syslogs` VALUES ('6198', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:06:47');
INSERT INTO `syslogs` VALUES ('6199', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:08:51');
INSERT INTO `syslogs` VALUES ('6200', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:10:01');
INSERT INTO `syslogs` VALUES ('6201', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-31 10:10:06');
INSERT INTO `syslogs` VALUES ('6202', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:12:11');
INSERT INTO `syslogs` VALUES ('6203', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:13:31');
INSERT INTO `syslogs` VALUES ('6204', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:14:57');
INSERT INTO `syslogs` VALUES ('6205', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-31 10:15:29');
INSERT INTO `syslogs` VALUES ('6206', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:24:17');
INSERT INTO `syslogs` VALUES ('6207', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:29:53');
INSERT INTO `syslogs` VALUES ('6208', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:39:05');
INSERT INTO `syslogs` VALUES ('6209', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:40:10');
INSERT INTO `syslogs` VALUES ('6210', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-31 10:40:10');
INSERT INTO `syslogs` VALUES ('6211', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:40:14');
INSERT INTO `syslogs` VALUES ('6212', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:41:55');
INSERT INTO `syslogs` VALUES ('6213', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-31 10:41:55');
INSERT INTO `syslogs` VALUES ('6214', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:41:58');
INSERT INTO `syslogs` VALUES ('6215', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 10:49:14');
INSERT INTO `syslogs` VALUES ('6216', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 11:17:10');
INSERT INTO `syslogs` VALUES ('6217', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 11:17:21');
INSERT INTO `syslogs` VALUES ('6218', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 11:21:35');
INSERT INTO `syslogs` VALUES ('6219', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 11:25:01');
INSERT INTO `syslogs` VALUES ('6220', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 11:36:19');
INSERT INTO `syslogs` VALUES ('6221', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 12:43:23');
INSERT INTO `syslogs` VALUES ('6222', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 16:27:55');
INSERT INTO `syslogs` VALUES ('6223', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 16:39:52');
INSERT INTO `syslogs` VALUES ('6224', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-31 16:42:32');
INSERT INTO `syslogs` VALUES ('6225', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 16:42:49');
INSERT INTO `syslogs` VALUES ('6226', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 16:55:51');
INSERT INTO `syslogs` VALUES ('6227', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 17:01:40');
INSERT INTO `syslogs` VALUES ('6228', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 17:38:23');
INSERT INTO `syslogs` VALUES ('6229', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-7-31 17:47:58');
INSERT INTO `syslogs` VALUES ('6230', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-7-31 18:07:36');
INSERT INTO `syslogs` VALUES ('6231', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 12:08:06');
INSERT INTO `syslogs` VALUES ('6232', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 12:10:54');
INSERT INTO `syslogs` VALUES ('6233', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-1 12:10:55');
INSERT INTO `syslogs` VALUES ('6234', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 12:14:36');
INSERT INTO `syslogs` VALUES ('6235', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 12:22:12');
INSERT INTO `syslogs` VALUES ('6236', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 12:25:27');
INSERT INTO `syslogs` VALUES ('6237', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 12:25:30');
INSERT INTO `syslogs` VALUES ('6238', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 12:25:30');
INSERT INTO `syslogs` VALUES ('6239', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-1 12:25:30');
INSERT INTO `syslogs` VALUES ('6240', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 12:25:33');
INSERT INTO `syslogs` VALUES ('6241', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 14:21:34');
INSERT INTO `syslogs` VALUES ('6242', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 14:23:49');
INSERT INTO `syslogs` VALUES ('6243', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 14:51:35');
INSERT INTO `syslogs` VALUES ('6244', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 15:43:50');
INSERT INTO `syslogs` VALUES ('6245', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 15:44:36');
INSERT INTO `syslogs` VALUES ('6246', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-1 15:44:36');
INSERT INTO `syslogs` VALUES ('6247', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 15:44:38');
INSERT INTO `syslogs` VALUES ('6248', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 15:45:01');
INSERT INTO `syslogs` VALUES ('6249', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-1 15:45:01');
INSERT INTO `syslogs` VALUES ('6250', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 15:45:05');
INSERT INTO `syslogs` VALUES ('6251', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 15:45:37');
INSERT INTO `syslogs` VALUES ('6252', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-1 15:45:37');
INSERT INTO `syslogs` VALUES ('6253', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 15:45:38');
INSERT INTO `syslogs` VALUES ('6254', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-1 15:47:08');
INSERT INTO `syslogs` VALUES ('6255', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-1 15:47:16');
INSERT INTO `syslogs` VALUES ('6256', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 15:48:35');
INSERT INTO `syslogs` VALUES ('6257', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-1 15:48:35');
INSERT INTO `syslogs` VALUES ('6258', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 15:48:36');
INSERT INTO `syslogs` VALUES ('6259', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 15:51:31');
INSERT INTO `syslogs` VALUES ('6260', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-1 15:51:31');
INSERT INTO `syslogs` VALUES ('6261', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-1 15:51:34');
INSERT INTO `syslogs` VALUES ('6262', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-1 17:55:11');
INSERT INTO `syslogs` VALUES ('6263', 'logout', 'user', '127.0.0.1', 'success', 'logout to system', '2014-8-1 17:55:23');
INSERT INTO `syslogs` VALUES ('6264', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 9:37:57');
INSERT INTO `syslogs` VALUES ('6265', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 10:28:48');
INSERT INTO `syslogs` VALUES ('6266', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-4 10:30:15');
INSERT INTO `syslogs` VALUES ('6267', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-4 10:30:20');
INSERT INTO `syslogs` VALUES ('6268', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-4 11:58:44');
INSERT INTO `syslogs` VALUES ('6269', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 11:59:01');
INSERT INTO `syslogs` VALUES ('6270', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 11:59:38');
INSERT INTO `syslogs` VALUES ('6271', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 11:59:39');
INSERT INTO `syslogs` VALUES ('6272', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 11:59:46');
INSERT INTO `syslogs` VALUES ('6273', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-4 12:12:27');
INSERT INTO `syslogs` VALUES ('6274', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:11:31');
INSERT INTO `syslogs` VALUES ('6275', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-4 14:11:48');
INSERT INTO `syslogs` VALUES ('6276', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-4 14:12:21');
INSERT INTO `syslogs` VALUES ('6277', 'logout', 'user', '127.0.0.1', 'success', 'logout to system', '2014-8-4 14:12:21');
INSERT INTO `syslogs` VALUES ('6278', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-4 14:12:24');
INSERT INTO `syslogs` VALUES ('6279', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-4 14:12:27');
INSERT INTO `syslogs` VALUES ('6280', 'logout', 'user', '127.0.0.1', 'success', 'logout to system', '2014-8-4 14:13:52');
INSERT INTO `syslogs` VALUES ('6281', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-4 14:13:58');
INSERT INTO `syslogs` VALUES ('6282', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:14:42');
INSERT INTO `syslogs` VALUES ('6283', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:14:52');
INSERT INTO `syslogs` VALUES ('6284', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-4 14:15:46');
INSERT INTO `syslogs` VALUES ('6285', 'logout', 'user', '127.0.0.1', 'success', 'logout to system', '2014-8-4 14:15:46');
INSERT INTO `syslogs` VALUES ('6286', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-4 14:15:49');
INSERT INTO `syslogs` VALUES ('6287', 'logout', 'user', '127.0.0.1', 'success', 'logout to system', '2014-8-4 14:15:57');
INSERT INTO `syslogs` VALUES ('6288', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:23:10');
INSERT INTO `syslogs` VALUES ('6289', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:23:10');
INSERT INTO `syslogs` VALUES ('6290', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:23:13');
INSERT INTO `syslogs` VALUES ('6291', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:23:29');
INSERT INTO `syslogs` VALUES ('6292', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:23:29');
INSERT INTO `syslogs` VALUES ('6293', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:23:36');
INSERT INTO `syslogs` VALUES ('6294', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:26:34');
INSERT INTO `syslogs` VALUES ('6295', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:27:04');
INSERT INTO `syslogs` VALUES ('6296', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:29:10');
INSERT INTO `syslogs` VALUES ('6297', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:28:02');
INSERT INTO `syslogs` VALUES ('6298', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:32:08');
INSERT INTO `syslogs` VALUES ('6299', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:32:08');
INSERT INTO `syslogs` VALUES ('6300', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:30:52');
INSERT INTO `syslogs` VALUES ('6301', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:32:29');
INSERT INTO `syslogs` VALUES ('6302', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:34:46');
INSERT INTO `syslogs` VALUES ('6303', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:34:53');
INSERT INTO `syslogs` VALUES ('6304', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:33:36');
INSERT INTO `syslogs` VALUES ('6305', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:33:36');
INSERT INTO `syslogs` VALUES ('6306', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:33:39');
INSERT INTO `syslogs` VALUES ('6307', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:34:16');
INSERT INTO `syslogs` VALUES ('6308', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:34:16');
INSERT INTO `syslogs` VALUES ('6309', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:34:19');
INSERT INTO `syslogs` VALUES ('6310', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:35:10');
INSERT INTO `syslogs` VALUES ('6311', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:35:10');
INSERT INTO `syslogs` VALUES ('6312', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:35:12');
INSERT INTO `syslogs` VALUES ('6313', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:35:34');
INSERT INTO `syslogs` VALUES ('6314', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:35:34');
INSERT INTO `syslogs` VALUES ('6315', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:35:36');
INSERT INTO `syslogs` VALUES ('6316', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:37:58');
INSERT INTO `syslogs` VALUES ('6317', 'login', 'admin', '0:0:0:0:0:0:0:1', 'fail', 'user:adminlogin to system', '2014-8-4 14:38:16');
INSERT INTO `syslogs` VALUES ('6318', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:38:26');
INSERT INTO `syslogs` VALUES ('6319', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:38:06');
INSERT INTO `syslogs` VALUES ('6320', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:38:06');
INSERT INTO `syslogs` VALUES ('6321', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:38:07');
INSERT INTO `syslogs` VALUES ('6322', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:39:35');
INSERT INTO `syslogs` VALUES ('6323', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:39:35');
INSERT INTO `syslogs` VALUES ('6324', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:39:37');
INSERT INTO `syslogs` VALUES ('6325', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:40:14');
INSERT INTO `syslogs` VALUES ('6326', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:40:14');
INSERT INTO `syslogs` VALUES ('6327', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:40:16');
INSERT INTO `syslogs` VALUES ('6328', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:40:39');
INSERT INTO `syslogs` VALUES ('6329', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:40:39');
INSERT INTO `syslogs` VALUES ('6330', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:40:41');
INSERT INTO `syslogs` VALUES ('6331', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:44:06');
INSERT INTO `syslogs` VALUES ('6332', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:44:06');
INSERT INTO `syslogs` VALUES ('6333', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:44:07');
INSERT INTO `syslogs` VALUES ('6334', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:44:26');
INSERT INTO `syslogs` VALUES ('6335', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:44:27');
INSERT INTO `syslogs` VALUES ('6336', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:44:29');
INSERT INTO `syslogs` VALUES ('6337', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:45:14');
INSERT INTO `syslogs` VALUES ('6338', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:45:14');
INSERT INTO `syslogs` VALUES ('6339', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:45:18');
INSERT INTO `syslogs` VALUES ('6340', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:45:25');
INSERT INTO `syslogs` VALUES ('6341', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:45:32');
INSERT INTO `syslogs` VALUES ('6342', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:47:10');
INSERT INTO `syslogs` VALUES ('6343', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:50:27');
INSERT INTO `syslogs` VALUES ('6344', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:50:27');
INSERT INTO `syslogs` VALUES ('6345', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:50:30');
INSERT INTO `syslogs` VALUES ('6346', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:50:43');
INSERT INTO `syslogs` VALUES ('6347', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:50:43');
INSERT INTO `syslogs` VALUES ('6348', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:50:46');
INSERT INTO `syslogs` VALUES ('6349', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:52:05');
INSERT INTO `syslogs` VALUES ('6350', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:52:05');
INSERT INTO `syslogs` VALUES ('6351', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:52:07');
INSERT INTO `syslogs` VALUES ('6352', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:55:12');
INSERT INTO `syslogs` VALUES ('6353', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:55:23');
INSERT INTO `syslogs` VALUES ('6354', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:54:05');
INSERT INTO `syslogs` VALUES ('6355', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:54:05');
INSERT INTO `syslogs` VALUES ('6356', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:54:06');
INSERT INTO `syslogs` VALUES ('6357', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:54:23');
INSERT INTO `syslogs` VALUES ('6358', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:54:23');
INSERT INTO `syslogs` VALUES ('6359', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:54:25');
INSERT INTO `syslogs` VALUES ('6360', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:54:41');
INSERT INTO `syslogs` VALUES ('6361', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:54:41');
INSERT INTO `syslogs` VALUES ('6362', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:54:43');
INSERT INTO `syslogs` VALUES ('6363', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:58:30');
INSERT INTO `syslogs` VALUES ('6364', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 14:58:30');
INSERT INTO `syslogs` VALUES ('6365', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 14:58:31');
INSERT INTO `syslogs` VALUES ('6366', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:02:31');
INSERT INTO `syslogs` VALUES ('6367', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:04:00');
INSERT INTO `syslogs` VALUES ('6368', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:07:02');
INSERT INTO `syslogs` VALUES ('6369', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:10:05');
INSERT INTO `syslogs` VALUES ('6370', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 15:10:05');
INSERT INTO `syslogs` VALUES ('6371', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:10:24');
INSERT INTO `syslogs` VALUES ('6372', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:10:43');
INSERT INTO `syslogs` VALUES ('6373', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 15:10:43');
INSERT INTO `syslogs` VALUES ('6374', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:10:45');
INSERT INTO `syslogs` VALUES ('6375', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:11:42');
INSERT INTO `syslogs` VALUES ('6376', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 15:11:42');
INSERT INTO `syslogs` VALUES ('6377', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:11:44');
INSERT INTO `syslogs` VALUES ('6378', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:12:07');
INSERT INTO `syslogs` VALUES ('6379', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 15:12:08');
INSERT INTO `syslogs` VALUES ('6380', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:12:08');
INSERT INTO `syslogs` VALUES ('6381', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:12:54');
INSERT INTO `syslogs` VALUES ('6382', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 15:12:54');
INSERT INTO `syslogs` VALUES ('6383', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:12:56');
INSERT INTO `syslogs` VALUES ('6384', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:15:13');
INSERT INTO `syslogs` VALUES ('6385', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:19:31');
INSERT INTO `syslogs` VALUES ('6386', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:19:46');
INSERT INTO `syslogs` VALUES ('6387', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:22:13');
INSERT INTO `syslogs` VALUES ('6388', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:25:04');
INSERT INTO `syslogs` VALUES ('6389', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:27:11');
INSERT INTO `syslogs` VALUES ('6390', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:27:26');
INSERT INTO `syslogs` VALUES ('6391', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 15:27:27');
INSERT INTO `syslogs` VALUES ('6392', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:27:29');
INSERT INTO `syslogs` VALUES ('6393', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:34:33');
INSERT INTO `syslogs` VALUES ('6394', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:33:41');
INSERT INTO `syslogs` VALUES ('6395', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 15:33:41');
INSERT INTO `syslogs` VALUES ('6396', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:33:43');
INSERT INTO `syslogs` VALUES ('6397', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:39:30');
INSERT INTO `syslogs` VALUES ('6398', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:40:31');
INSERT INTO `syslogs` VALUES ('6399', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:42:10');
INSERT INTO `syslogs` VALUES ('6400', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 15:42:10');
INSERT INTO `syslogs` VALUES ('6401', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:42:12');
INSERT INTO `syslogs` VALUES ('6402', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:42:48');
INSERT INTO `syslogs` VALUES ('6403', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 15:42:48');
INSERT INTO `syslogs` VALUES ('6404', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:42:50');
INSERT INTO `syslogs` VALUES ('6405', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:44:18');
INSERT INTO `syslogs` VALUES ('6406', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:44:05');
INSERT INTO `syslogs` VALUES ('6407', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 15:44:05');
INSERT INTO `syslogs` VALUES ('6408', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:44:06');
INSERT INTO `syslogs` VALUES ('6409', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:45:32');
INSERT INTO `syslogs` VALUES ('6410', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 15:45:32');
INSERT INTO `syslogs` VALUES ('6411', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:45:34');
INSERT INTO `syslogs` VALUES ('6412', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:51:01');
INSERT INTO `syslogs` VALUES ('6413', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:53:27');
INSERT INTO `syslogs` VALUES ('6414', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:52:52');
INSERT INTO `syslogs` VALUES ('6415', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:52:52');
INSERT INTO `syslogs` VALUES ('6416', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:54:14');
INSERT INTO `syslogs` VALUES ('6417', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:56:43');
INSERT INTO `syslogs` VALUES ('6418', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:58:23');
INSERT INTO `syslogs` VALUES ('6419', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:58:04');
INSERT INTO `syslogs` VALUES ('6420', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:58:52');
INSERT INTO `syslogs` VALUES ('6421', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 15:58:53');
INSERT INTO `syslogs` VALUES ('6422', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:58:55');
INSERT INTO `syslogs` VALUES ('6423', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:59:04');
INSERT INTO `syslogs` VALUES ('6424', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 15:59:05');
INSERT INTO `syslogs` VALUES ('6425', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 15:59:06');
INSERT INTO `syslogs` VALUES ('6426', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:00:32');
INSERT INTO `syslogs` VALUES ('6427', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 16:00:32');
INSERT INTO `syslogs` VALUES ('6428', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:00:34');
INSERT INTO `syslogs` VALUES ('6429', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:00:43');
INSERT INTO `syslogs` VALUES ('6430', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 16:00:43');
INSERT INTO `syslogs` VALUES ('6431', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:00:44');
INSERT INTO `syslogs` VALUES ('6432', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:02:38');
INSERT INTO `syslogs` VALUES ('6433', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:06:47');
INSERT INTO `syslogs` VALUES ('6434', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 16:06:47');
INSERT INTO `syslogs` VALUES ('6435', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:06:48');
INSERT INTO `syslogs` VALUES ('6436', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:09:01');
INSERT INTO `syslogs` VALUES ('6437', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:13:07');
INSERT INTO `syslogs` VALUES ('6438', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:16:30');
INSERT INTO `syslogs` VALUES ('6439', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:19:25');
INSERT INTO `syslogs` VALUES ('6440', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 16:21:12');
INSERT INTO `syslogs` VALUES ('6441', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:21:21');
INSERT INTO `syslogs` VALUES ('6442', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:22:23');
INSERT INTO `syslogs` VALUES ('6443', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:27:13');
INSERT INTO `syslogs` VALUES ('6444', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:31:10');
INSERT INTO `syslogs` VALUES ('6445', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 16:31:11');
INSERT INTO `syslogs` VALUES ('6446', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:31:12');
INSERT INTO `syslogs` VALUES ('6447', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:32:02');
INSERT INTO `syslogs` VALUES ('6448', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:34:06');
INSERT INTO `syslogs` VALUES ('6449', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:32:50');
INSERT INTO `syslogs` VALUES ('6450', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 16:32:50');
INSERT INTO `syslogs` VALUES ('6451', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:32:52');
INSERT INTO `syslogs` VALUES ('6452', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:33:31');
INSERT INTO `syslogs` VALUES ('6453', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 16:33:31');
INSERT INTO `syslogs` VALUES ('6454', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:33:33');
INSERT INTO `syslogs` VALUES ('6455', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:33:53');
INSERT INTO `syslogs` VALUES ('6456', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 16:33:53');
INSERT INTO `syslogs` VALUES ('6457', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:33:55');
INSERT INTO `syslogs` VALUES ('6458', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:34:22');
INSERT INTO `syslogs` VALUES ('6459', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 16:34:22');
INSERT INTO `syslogs` VALUES ('6460', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:34:24');
INSERT INTO `syslogs` VALUES ('6461', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:36:34');
INSERT INTO `syslogs` VALUES ('6462', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 16:37:10');
INSERT INTO `syslogs` VALUES ('6463', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:38:50');
INSERT INTO `syslogs` VALUES ('6464', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:52:29');
INSERT INTO `syslogs` VALUES ('6465', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:51:41');
INSERT INTO `syslogs` VALUES ('6466', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 16:51:41');
INSERT INTO `syslogs` VALUES ('6467', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:51:43');
INSERT INTO `syslogs` VALUES ('6468', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:51:44');
INSERT INTO `syslogs` VALUES ('6469', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 16:58:23');
INSERT INTO `syslogs` VALUES ('6470', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:02:27');
INSERT INTO `syslogs` VALUES ('6471', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:21:02');
INSERT INTO `syslogs` VALUES ('6472', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:22:50');
INSERT INTO `syslogs` VALUES ('6473', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 17:22:50');
INSERT INTO `syslogs` VALUES ('6474', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:23:01');
INSERT INTO `syslogs` VALUES ('6475', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 17:23:01');
INSERT INTO `syslogs` VALUES ('6476', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:23:03');
INSERT INTO `syslogs` VALUES ('6477', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:23:24');
INSERT INTO `syslogs` VALUES ('6478', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 17:23:25');
INSERT INTO `syslogs` VALUES ('6479', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:23:27');
INSERT INTO `syslogs` VALUES ('6480', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:24:22');
INSERT INTO `syslogs` VALUES ('6481', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 17:24:22');
INSERT INTO `syslogs` VALUES ('6482', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:24:24');
INSERT INTO `syslogs` VALUES ('6483', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:25:07');
INSERT INTO `syslogs` VALUES ('6484', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 17:25:07');
INSERT INTO `syslogs` VALUES ('6485', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:25:11');
INSERT INTO `syslogs` VALUES ('6486', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:26:53');
INSERT INTO `syslogs` VALUES ('6487', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:28:37');
INSERT INTO `syslogs` VALUES ('6488', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 17:28:37');
INSERT INTO `syslogs` VALUES ('6489', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:28:39');
INSERT INTO `syslogs` VALUES ('6490', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:31:33');
INSERT INTO `syslogs` VALUES ('6491', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 17:31:33');
INSERT INTO `syslogs` VALUES ('6492', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:31:34');
INSERT INTO `syslogs` VALUES ('6493', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:42:06');
INSERT INTO `syslogs` VALUES ('6494', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:48:33');
INSERT INTO `syslogs` VALUES ('6495', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:54:47');
INSERT INTO `syslogs` VALUES ('6496', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:53:54');
INSERT INTO `syslogs` VALUES ('6497', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 17:53:54');
INSERT INTO `syslogs` VALUES ('6498', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:53:56');
INSERT INTO `syslogs` VALUES ('6499', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:54:19');
INSERT INTO `syslogs` VALUES ('6500', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 17:54:19');
INSERT INTO `syslogs` VALUES ('6501', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:54:20');
INSERT INTO `syslogs` VALUES ('6502', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:54:21');
INSERT INTO `syslogs` VALUES ('6503', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:55:13');
INSERT INTO `syslogs` VALUES ('6504', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 17:55:13');
INSERT INTO `syslogs` VALUES ('6505', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:55:15');
INSERT INTO `syslogs` VALUES ('6506', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:56:32');
INSERT INTO `syslogs` VALUES ('6507', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:56:32');
INSERT INTO `syslogs` VALUES ('6508', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 17:56:35');
INSERT INTO `syslogs` VALUES ('6509', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 17:56:37');
INSERT INTO `syslogs` VALUES ('6510', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 18:01:44');
INSERT INTO `syslogs` VALUES ('6511', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 18:02:30');
INSERT INTO `syslogs` VALUES ('6512', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 18:05:14');
INSERT INTO `syslogs` VALUES ('6513', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 18:08:14');
INSERT INTO `syslogs` VALUES ('6514', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 18:10:31');
INSERT INTO `syslogs` VALUES ('6515', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 18:15:37');
INSERT INTO `syslogs` VALUES ('6516', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 18:18:48');
INSERT INTO `syslogs` VALUES ('6517', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 18:21:01');
INSERT INTO `syslogs` VALUES ('6518', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 18:23:18');
INSERT INTO `syslogs` VALUES ('6519', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-4 18:23:18');
INSERT INTO `syslogs` VALUES ('6520', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 18:23:39');
INSERT INTO `syslogs` VALUES ('6521', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-4 18:25:44');
INSERT INTO `syslogs` VALUES ('6522', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:25:19');
INSERT INTO `syslogs` VALUES ('6523', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:27:16');
INSERT INTO `syslogs` VALUES ('6524', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:27:16');
INSERT INTO `syslogs` VALUES ('6525', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:27:19');
INSERT INTO `syslogs` VALUES ('6526', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:28:34');
INSERT INTO `syslogs` VALUES ('6527', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:28:34');
INSERT INTO `syslogs` VALUES ('6528', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:28:37');
INSERT INTO `syslogs` VALUES ('6529', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:28:56');
INSERT INTO `syslogs` VALUES ('6530', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:28:56');
INSERT INTO `syslogs` VALUES ('6531', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:43:46');
INSERT INTO `syslogs` VALUES ('6532', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:44:09');
INSERT INTO `syslogs` VALUES ('6533', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:44:09');
INSERT INTO `syslogs` VALUES ('6534', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:44:10');
INSERT INTO `syslogs` VALUES ('6535', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:45:03');
INSERT INTO `syslogs` VALUES ('6536', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:45:03');
INSERT INTO `syslogs` VALUES ('6537', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:45:04');
INSERT INTO `syslogs` VALUES ('6538', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:45:48');
INSERT INTO `syslogs` VALUES ('6539', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:45:48');
INSERT INTO `syslogs` VALUES ('6540', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:45:50');
INSERT INTO `syslogs` VALUES ('6541', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:46:02');
INSERT INTO `syslogs` VALUES ('6542', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:46:02');
INSERT INTO `syslogs` VALUES ('6543', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:46:03');
INSERT INTO `syslogs` VALUES ('6544', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:46:22');
INSERT INTO `syslogs` VALUES ('6545', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:46:22');
INSERT INTO `syslogs` VALUES ('6546', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:46:23');
INSERT INTO `syslogs` VALUES ('6547', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:47:50');
INSERT INTO `syslogs` VALUES ('6548', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:47:51');
INSERT INTO `syslogs` VALUES ('6549', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:47:53');
INSERT INTO `syslogs` VALUES ('6550', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:48:18');
INSERT INTO `syslogs` VALUES ('6551', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:48:18');
INSERT INTO `syslogs` VALUES ('6552', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:48:20');
INSERT INTO `syslogs` VALUES ('6553', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:49:50');
INSERT INTO `syslogs` VALUES ('6554', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:49:50');
INSERT INTO `syslogs` VALUES ('6555', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:49:53');
INSERT INTO `syslogs` VALUES ('6556', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:51:47');
INSERT INTO `syslogs` VALUES ('6557', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:51:47');
INSERT INTO `syslogs` VALUES ('6558', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:51:49');
INSERT INTO `syslogs` VALUES ('6559', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:55:16');
INSERT INTO `syslogs` VALUES ('6560', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:55:16');
INSERT INTO `syslogs` VALUES ('6561', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:55:16');
INSERT INTO `syslogs` VALUES ('6562', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:57:39');
INSERT INTO `syslogs` VALUES ('6563', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:57:39');
INSERT INTO `syslogs` VALUES ('6564', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:57:40');
INSERT INTO `syslogs` VALUES ('6565', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:58:14');
INSERT INTO `syslogs` VALUES ('6566', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:58:14');
INSERT INTO `syslogs` VALUES ('6567', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:58:16');
INSERT INTO `syslogs` VALUES ('6568', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:58:51');
INSERT INTO `syslogs` VALUES ('6569', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:58:51');
INSERT INTO `syslogs` VALUES ('6570', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:58:53');
INSERT INTO `syslogs` VALUES ('6571', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:59:29');
INSERT INTO `syslogs` VALUES ('6572', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 9:59:29');
INSERT INTO `syslogs` VALUES ('6573', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 9:59:32');
INSERT INTO `syslogs` VALUES ('6574', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:00:36');
INSERT INTO `syslogs` VALUES ('6575', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:00:36');
INSERT INTO `syslogs` VALUES ('6576', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:00:37');
INSERT INTO `syslogs` VALUES ('6577', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:02:15');
INSERT INTO `syslogs` VALUES ('6578', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:02:16');
INSERT INTO `syslogs` VALUES ('6579', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:02:17');
INSERT INTO `syslogs` VALUES ('6580', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:02:52');
INSERT INTO `syslogs` VALUES ('6581', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:02:52');
INSERT INTO `syslogs` VALUES ('6582', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:02:55');
INSERT INTO `syslogs` VALUES ('6583', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:03:15');
INSERT INTO `syslogs` VALUES ('6584', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:03:15');
INSERT INTO `syslogs` VALUES ('6585', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:03:17');
INSERT INTO `syslogs` VALUES ('6586', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:03:32');
INSERT INTO `syslogs` VALUES ('6587', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:03:32');
INSERT INTO `syslogs` VALUES ('6588', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:03:33');
INSERT INTO `syslogs` VALUES ('6589', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:03:46');
INSERT INTO `syslogs` VALUES ('6590', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:03:46');
INSERT INTO `syslogs` VALUES ('6591', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:03:46');
INSERT INTO `syslogs` VALUES ('6592', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:04:10');
INSERT INTO `syslogs` VALUES ('6593', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:04:10');
INSERT INTO `syslogs` VALUES ('6594', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:04:11');
INSERT INTO `syslogs` VALUES ('6595', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:04:25');
INSERT INTO `syslogs` VALUES ('6596', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:04:25');
INSERT INTO `syslogs` VALUES ('6597', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:04:26');
INSERT INTO `syslogs` VALUES ('6598', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:04:44');
INSERT INTO `syslogs` VALUES ('6599', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:04:44');
INSERT INTO `syslogs` VALUES ('6600', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:04:45');
INSERT INTO `syslogs` VALUES ('6601', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:06:59');
INSERT INTO `syslogs` VALUES ('6602', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:06:59');
INSERT INTO `syslogs` VALUES ('6603', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:07:00');
INSERT INTO `syslogs` VALUES ('6604', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:07:26');
INSERT INTO `syslogs` VALUES ('6605', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:07:26');
INSERT INTO `syslogs` VALUES ('6606', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:07:28');
INSERT INTO `syslogs` VALUES ('6607', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:07:46');
INSERT INTO `syslogs` VALUES ('6608', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:07:46');
INSERT INTO `syslogs` VALUES ('6609', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:07:47');
INSERT INTO `syslogs` VALUES ('6610', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:08:12');
INSERT INTO `syslogs` VALUES ('6611', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:08:12');
INSERT INTO `syslogs` VALUES ('6612', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:08:13');
INSERT INTO `syslogs` VALUES ('6613', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:09:36');
INSERT INTO `syslogs` VALUES ('6614', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:09:36');
INSERT INTO `syslogs` VALUES ('6615', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:09:39');
INSERT INTO `syslogs` VALUES ('6616', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:09:57');
INSERT INTO `syslogs` VALUES ('6617', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:09:57');
INSERT INTO `syslogs` VALUES ('6618', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:09:58');
INSERT INTO `syslogs` VALUES ('6619', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:10:17');
INSERT INTO `syslogs` VALUES ('6620', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:10:17');
INSERT INTO `syslogs` VALUES ('6621', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:10:18');
INSERT INTO `syslogs` VALUES ('6622', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:10:53');
INSERT INTO `syslogs` VALUES ('6623', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:10:53');
INSERT INTO `syslogs` VALUES ('6624', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:10:54');
INSERT INTO `syslogs` VALUES ('6625', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:11:17');
INSERT INTO `syslogs` VALUES ('6626', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:11:17');
INSERT INTO `syslogs` VALUES ('6627', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:11:20');
INSERT INTO `syslogs` VALUES ('6628', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:11:50');
INSERT INTO `syslogs` VALUES ('6629', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:11:50');
INSERT INTO `syslogs` VALUES ('6630', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:11:52');
INSERT INTO `syslogs` VALUES ('6631', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:12:03');
INSERT INTO `syslogs` VALUES ('6632', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:12:03');
INSERT INTO `syslogs` VALUES ('6633', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:12:04');
INSERT INTO `syslogs` VALUES ('6634', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:12:21');
INSERT INTO `syslogs` VALUES ('6635', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:12:22');
INSERT INTO `syslogs` VALUES ('6636', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:12:22');
INSERT INTO `syslogs` VALUES ('6637', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:12:43');
INSERT INTO `syslogs` VALUES ('6638', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:12:43');
INSERT INTO `syslogs` VALUES ('6639', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:12:44');
INSERT INTO `syslogs` VALUES ('6640', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:12:53');
INSERT INTO `syslogs` VALUES ('6641', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:12:53');
INSERT INTO `syslogs` VALUES ('6642', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:12:54');
INSERT INTO `syslogs` VALUES ('6643', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:13:06');
INSERT INTO `syslogs` VALUES ('6644', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:13:06');
INSERT INTO `syslogs` VALUES ('6645', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:13:07');
INSERT INTO `syslogs` VALUES ('6646', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:13:25');
INSERT INTO `syslogs` VALUES ('6647', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:13:25');
INSERT INTO `syslogs` VALUES ('6648', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:13:26');
INSERT INTO `syslogs` VALUES ('6649', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:13:52');
INSERT INTO `syslogs` VALUES ('6650', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:13:52');
INSERT INTO `syslogs` VALUES ('6651', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:13:52');
INSERT INTO `syslogs` VALUES ('6652', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:14:10');
INSERT INTO `syslogs` VALUES ('6653', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:14:10');
INSERT INTO `syslogs` VALUES ('6654', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:14:11');
INSERT INTO `syslogs` VALUES ('6655', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:14:44');
INSERT INTO `syslogs` VALUES ('6656', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:14:44');
INSERT INTO `syslogs` VALUES ('6657', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:14:45');
INSERT INTO `syslogs` VALUES ('6658', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:15:15');
INSERT INTO `syslogs` VALUES ('6659', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:15:15');
INSERT INTO `syslogs` VALUES ('6660', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:15:16');
INSERT INTO `syslogs` VALUES ('6661', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:16:00');
INSERT INTO `syslogs` VALUES ('6662', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:16:00');
INSERT INTO `syslogs` VALUES ('6663', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:16:01');
INSERT INTO `syslogs` VALUES ('6664', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:16:17');
INSERT INTO `syslogs` VALUES ('6665', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:16:18');
INSERT INTO `syslogs` VALUES ('6666', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:16:18');
INSERT INTO `syslogs` VALUES ('6667', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:16:41');
INSERT INTO `syslogs` VALUES ('6668', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:16:41');
INSERT INTO `syslogs` VALUES ('6669', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:16:42');
INSERT INTO `syslogs` VALUES ('6670', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:16:54');
INSERT INTO `syslogs` VALUES ('6671', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:16:54');
INSERT INTO `syslogs` VALUES ('6672', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:16:55');
INSERT INTO `syslogs` VALUES ('6673', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:17:13');
INSERT INTO `syslogs` VALUES ('6674', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:17:13');
INSERT INTO `syslogs` VALUES ('6675', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:17:15');
INSERT INTO `syslogs` VALUES ('6676', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:17:49');
INSERT INTO `syslogs` VALUES ('6677', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:17:49');
INSERT INTO `syslogs` VALUES ('6678', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:17:50');
INSERT INTO `syslogs` VALUES ('6679', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:17:59');
INSERT INTO `syslogs` VALUES ('6680', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:17:59');
INSERT INTO `syslogs` VALUES ('6681', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:18:00');
INSERT INTO `syslogs` VALUES ('6682', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:18:19');
INSERT INTO `syslogs` VALUES ('6683', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:18:20');
INSERT INTO `syslogs` VALUES ('6684', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:18:22');
INSERT INTO `syslogs` VALUES ('6685', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:19:25');
INSERT INTO `syslogs` VALUES ('6686', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:19:26');
INSERT INTO `syslogs` VALUES ('6687', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:19:26');
INSERT INTO `syslogs` VALUES ('6688', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:20:02');
INSERT INTO `syslogs` VALUES ('6689', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:20:02');
INSERT INTO `syslogs` VALUES ('6690', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:20:04');
INSERT INTO `syslogs` VALUES ('6691', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:20:15');
INSERT INTO `syslogs` VALUES ('6692', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:20:15');
INSERT INTO `syslogs` VALUES ('6693', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:20:16');
INSERT INTO `syslogs` VALUES ('6694', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:20:25');
INSERT INTO `syslogs` VALUES ('6695', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:20:25');
INSERT INTO `syslogs` VALUES ('6696', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:20:26');
INSERT INTO `syslogs` VALUES ('6697', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-5 10:20:34');
INSERT INTO `syslogs` VALUES ('6698', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:20:38');
INSERT INTO `syslogs` VALUES ('6699', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:21:03');
INSERT INTO `syslogs` VALUES ('6700', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:21:15');
INSERT INTO `syslogs` VALUES ('6701', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:21:42');
INSERT INTO `syslogs` VALUES ('6702', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:21:53');
INSERT INTO `syslogs` VALUES ('6703', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:22:09');
INSERT INTO `syslogs` VALUES ('6704', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:22:44');
INSERT INTO `syslogs` VALUES ('6705', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:22:44');
INSERT INTO `syslogs` VALUES ('6706', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:22:44');
INSERT INTO `syslogs` VALUES ('6707', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:23:50');
INSERT INTO `syslogs` VALUES ('6708', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:23:50');
INSERT INTO `syslogs` VALUES ('6709', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:23:52');
INSERT INTO `syslogs` VALUES ('6710', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:24:31');
INSERT INTO `syslogs` VALUES ('6711', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:24:31');
INSERT INTO `syslogs` VALUES ('6712', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:24:31');
INSERT INTO `syslogs` VALUES ('6713', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:24:44');
INSERT INTO `syslogs` VALUES ('6714', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:24:44');
INSERT INTO `syslogs` VALUES ('6715', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:24:44');
INSERT INTO `syslogs` VALUES ('6716', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:25:02');
INSERT INTO `syslogs` VALUES ('6717', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:25:02');
INSERT INTO `syslogs` VALUES ('6718', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:25:03');
INSERT INTO `syslogs` VALUES ('6719', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:25:13');
INSERT INTO `syslogs` VALUES ('6720', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:25:13');
INSERT INTO `syslogs` VALUES ('6721', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:25:13');
INSERT INTO `syslogs` VALUES ('6722', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:25:34');
INSERT INTO `syslogs` VALUES ('6723', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:25:34');
INSERT INTO `syslogs` VALUES ('6724', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:25:34');
INSERT INTO `syslogs` VALUES ('6725', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:25:48');
INSERT INTO `syslogs` VALUES ('6726', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:25:48');
INSERT INTO `syslogs` VALUES ('6727', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:25:48');
INSERT INTO `syslogs` VALUES ('6728', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:27:33');
INSERT INTO `syslogs` VALUES ('6729', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:27:33');
INSERT INTO `syslogs` VALUES ('6730', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:27:33');
INSERT INTO `syslogs` VALUES ('6731', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:27:58');
INSERT INTO `syslogs` VALUES ('6732', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:27:58');
INSERT INTO `syslogs` VALUES ('6733', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:27:59');
INSERT INTO `syslogs` VALUES ('6734', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:28:57');
INSERT INTO `syslogs` VALUES ('6735', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:28:57');
INSERT INTO `syslogs` VALUES ('6736', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:28:58');
INSERT INTO `syslogs` VALUES ('6737', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:32:58');
INSERT INTO `syslogs` VALUES ('6738', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:32:58');
INSERT INTO `syslogs` VALUES ('6739', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:32:59');
INSERT INTO `syslogs` VALUES ('6740', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:35:14');
INSERT INTO `syslogs` VALUES ('6741', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:35:15');
INSERT INTO `syslogs` VALUES ('6742', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:35:15');
INSERT INTO `syslogs` VALUES ('6743', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:36:22');
INSERT INTO `syslogs` VALUES ('6744', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:36:22');
INSERT INTO `syslogs` VALUES ('6745', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:36:23');
INSERT INTO `syslogs` VALUES ('6746', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:36:49');
INSERT INTO `syslogs` VALUES ('6747', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:36:49');
INSERT INTO `syslogs` VALUES ('6748', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:36:50');
INSERT INTO `syslogs` VALUES ('6749', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:37:06');
INSERT INTO `syslogs` VALUES ('6750', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:37:06');
INSERT INTO `syslogs` VALUES ('6751', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:37:06');
INSERT INTO `syslogs` VALUES ('6752', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:37:54');
INSERT INTO `syslogs` VALUES ('6753', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:37:54');
INSERT INTO `syslogs` VALUES ('6754', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:37:55');
INSERT INTO `syslogs` VALUES ('6755', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:38:44');
INSERT INTO `syslogs` VALUES ('6756', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:38:44');
INSERT INTO `syslogs` VALUES ('6757', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:38:45');
INSERT INTO `syslogs` VALUES ('6758', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:40:02');
INSERT INTO `syslogs` VALUES ('6759', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:40:02');
INSERT INTO `syslogs` VALUES ('6760', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:40:03');
INSERT INTO `syslogs` VALUES ('6761', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:41:23');
INSERT INTO `syslogs` VALUES ('6762', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:41:26');
INSERT INTO `syslogs` VALUES ('6763', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:41:26');
INSERT INTO `syslogs` VALUES ('6764', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:41:28');
INSERT INTO `syslogs` VALUES ('6765', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:41:52');
INSERT INTO `syslogs` VALUES ('6766', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:41:52');
INSERT INTO `syslogs` VALUES ('6767', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:41:53');
INSERT INTO `syslogs` VALUES ('6768', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:42:38');
INSERT INTO `syslogs` VALUES ('6769', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:42:38');
INSERT INTO `syslogs` VALUES ('6770', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:42:39');
INSERT INTO `syslogs` VALUES ('6771', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:46:00');
INSERT INTO `syslogs` VALUES ('6772', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:46:00');
INSERT INTO `syslogs` VALUES ('6773', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:46:01');
INSERT INTO `syslogs` VALUES ('6774', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:47:50');
INSERT INTO `syslogs` VALUES ('6775', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:47:50');
INSERT INTO `syslogs` VALUES ('6776', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:47:51');
INSERT INTO `syslogs` VALUES ('6777', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:48:49');
INSERT INTO `syslogs` VALUES ('6778', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:48:49');
INSERT INTO `syslogs` VALUES ('6779', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:48:49');
INSERT INTO `syslogs` VALUES ('6780', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:51:26');
INSERT INTO `syslogs` VALUES ('6781', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:51:26');
INSERT INTO `syslogs` VALUES ('6782', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:51:26');
INSERT INTO `syslogs` VALUES ('6783', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:52:42');
INSERT INTO `syslogs` VALUES ('6784', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:52:42');
INSERT INTO `syslogs` VALUES ('6785', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:52:43');
INSERT INTO `syslogs` VALUES ('6786', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:53:39');
INSERT INTO `syslogs` VALUES ('6787', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:53:40');
INSERT INTO `syslogs` VALUES ('6788', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:53:40');
INSERT INTO `syslogs` VALUES ('6789', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:53:51');
INSERT INTO `syslogs` VALUES ('6790', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:53:52');
INSERT INTO `syslogs` VALUES ('6791', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:53:52');
INSERT INTO `syslogs` VALUES ('6792', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:59:44');
INSERT INTO `syslogs` VALUES ('6793', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 10:59:44');
INSERT INTO `syslogs` VALUES ('6794', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 10:59:44');
INSERT INTO `syslogs` VALUES ('6795', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:00:44');
INSERT INTO `syslogs` VALUES ('6796', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 11:00:44');
INSERT INTO `syslogs` VALUES ('6797', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:00:45');
INSERT INTO `syslogs` VALUES ('6798', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:01:40');
INSERT INTO `syslogs` VALUES ('6799', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 11:01:40');
INSERT INTO `syslogs` VALUES ('6800', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:01:40');
INSERT INTO `syslogs` VALUES ('6801', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:03:43');
INSERT INTO `syslogs` VALUES ('6802', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 11:03:43');
INSERT INTO `syslogs` VALUES ('6803', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:03:44');
INSERT INTO `syslogs` VALUES ('6804', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:05:12');
INSERT INTO `syslogs` VALUES ('6805', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:10:46');
INSERT INTO `syslogs` VALUES ('6806', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:12:01');
INSERT INTO `syslogs` VALUES ('6807', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:12:55');
INSERT INTO `syslogs` VALUES ('6808', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 11:12:55');
INSERT INTO `syslogs` VALUES ('6809', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:12:58');
INSERT INTO `syslogs` VALUES ('6810', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:14:01');
INSERT INTO `syslogs` VALUES ('6811', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 11:14:01');
INSERT INTO `syslogs` VALUES ('6812', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:14:02');
INSERT INTO `syslogs` VALUES ('6813', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:20:40');
INSERT INTO `syslogs` VALUES ('6814', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:28:53');
INSERT INTO `syslogs` VALUES ('6815', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:28:54');
INSERT INTO `syslogs` VALUES ('6816', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 11:28:57');
INSERT INTO `syslogs` VALUES ('6817', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:28:58');
INSERT INTO `syslogs` VALUES ('6818', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:34:53');
INSERT INTO `syslogs` VALUES ('6819', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:38:56');
INSERT INTO `syslogs` VALUES ('6820', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:44:26');
INSERT INTO `syslogs` VALUES ('6821', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:44:30');
INSERT INTO `syslogs` VALUES ('6822', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 11:44:30');
INSERT INTO `syslogs` VALUES ('6823', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:44:33');
INSERT INTO `syslogs` VALUES ('6824', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:51:14');
INSERT INTO `syslogs` VALUES ('6825', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:55:59');
INSERT INTO `syslogs` VALUES ('6826', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-5 11:55:59');
INSERT INTO `syslogs` VALUES ('6827', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:56:01');
INSERT INTO `syslogs` VALUES ('6828', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 11:58:33');
INSERT INTO `syslogs` VALUES ('6829', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-5 16:50:12');
INSERT INTO `syslogs` VALUES ('6830', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 9:13:29');
INSERT INTO `syslogs` VALUES ('6831', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:20:09');
INSERT INTO `syslogs` VALUES ('6832', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:24:36');
INSERT INTO `syslogs` VALUES ('6833', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 10:24:36');
INSERT INTO `syslogs` VALUES ('6834', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:25:07');
INSERT INTO `syslogs` VALUES ('6835', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:28:27');
INSERT INTO `syslogs` VALUES ('6836', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 10:28:27');
INSERT INTO `syslogs` VALUES ('6837', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:28:44');
INSERT INTO `syslogs` VALUES ('6838', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:30:14');
INSERT INTO `syslogs` VALUES ('6839', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 10:30:14');
INSERT INTO `syslogs` VALUES ('6840', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:30:27');
INSERT INTO `syslogs` VALUES ('6841', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:37:45');
INSERT INTO `syslogs` VALUES ('6842', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:39:21');
INSERT INTO `syslogs` VALUES ('6843', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 10:39:21');
INSERT INTO `syslogs` VALUES ('6844', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:39:22');
INSERT INTO `syslogs` VALUES ('6845', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-6 10:39:43');
INSERT INTO `syslogs` VALUES ('6846', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:39:51');
INSERT INTO `syslogs` VALUES ('6847', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 10:39:51');
INSERT INTO `syslogs` VALUES ('6848', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-6 10:39:53');
INSERT INTO `syslogs` VALUES ('6849', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:40:00');
INSERT INTO `syslogs` VALUES ('6850', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:42:01');
INSERT INTO `syslogs` VALUES ('6851', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 10:42:01');
INSERT INTO `syslogs` VALUES ('6852', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:42:01');
INSERT INTO `syslogs` VALUES ('6853', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:44:56');
INSERT INTO `syslogs` VALUES ('6854', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 10:44:56');
INSERT INTO `syslogs` VALUES ('6855', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:44:56');
INSERT INTO `syslogs` VALUES ('6856', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:45:09');
INSERT INTO `syslogs` VALUES ('6857', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 10:45:09');
INSERT INTO `syslogs` VALUES ('6858', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:45:15');
INSERT INTO `syslogs` VALUES ('6859', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:45:44');
INSERT INTO `syslogs` VALUES ('6860', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 10:45:44');
INSERT INTO `syslogs` VALUES ('6861', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:45:45');
INSERT INTO `syslogs` VALUES ('6862', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-6 10:48:07');
INSERT INTO `syslogs` VALUES ('6863', 'logout', 'user', '127.0.0.1', 'success', 'logout to system', '2014-8-6 10:48:07');
INSERT INTO `syslogs` VALUES ('6864', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-6 10:48:09');
INSERT INTO `syslogs` VALUES ('6865', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-6 10:56:34');
INSERT INTO `syslogs` VALUES ('6866', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-6 10:56:35');
INSERT INTO `syslogs` VALUES ('6867', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-6 10:57:56');
INSERT INTO `syslogs` VALUES ('6868', 'logout', 'user', '127.0.0.1', 'success', 'logout to system', '2014-8-6 10:57:56');
INSERT INTO `syslogs` VALUES ('6869', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-6 10:57:58');
INSERT INTO `syslogs` VALUES ('6870', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-6 10:59:35');
INSERT INTO `syslogs` VALUES ('6871', 'logout', 'user', '127.0.0.1', 'success', 'logout to system', '2014-8-6 10:59:35');
INSERT INTO `syslogs` VALUES ('6872', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-6 10:59:36');
INSERT INTO `syslogs` VALUES ('6873', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 10:59:59');
INSERT INTO `syslogs` VALUES ('6874', 'logout', 'user', '127.0.0.1', 'success', 'logout to system', '2014-8-6 11:04:43');
INSERT INTO `syslogs` VALUES ('6875', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-6 11:05:13');
INSERT INTO `syslogs` VALUES ('6876', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-6 11:05:19');
INSERT INTO `syslogs` VALUES ('6877', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:17:33');
INSERT INTO `syslogs` VALUES ('6878', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:18:12');
INSERT INTO `syslogs` VALUES ('6879', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 11:18:12');
INSERT INTO `syslogs` VALUES ('6880', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:18:48');
INSERT INTO `syslogs` VALUES ('6881', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:22:25');
INSERT INTO `syslogs` VALUES ('6882', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:26:57');
INSERT INTO `syslogs` VALUES ('6883', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 11:26:57');
INSERT INTO `syslogs` VALUES ('6884', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:27:10');
INSERT INTO `syslogs` VALUES ('6885', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-6 11:39:41');
INSERT INTO `syslogs` VALUES ('6886', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:40:31');
INSERT INTO `syslogs` VALUES ('6887', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-6 11:40:47');
INSERT INTO `syslogs` VALUES ('6888', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-6 11:40:52');
INSERT INTO `syslogs` VALUES ('6889', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:46:13');
INSERT INTO `syslogs` VALUES ('6890', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:46:45');
INSERT INTO `syslogs` VALUES ('6891', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:48:45');
INSERT INTO `syslogs` VALUES ('6892', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:49:57');
INSERT INTO `syslogs` VALUES ('6893', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 11:49:57');
INSERT INTO `syslogs` VALUES ('6894', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:50:00');
INSERT INTO `syslogs` VALUES ('6895', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:50:36');
INSERT INTO `syslogs` VALUES ('6896', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 11:50:36');
INSERT INTO `syslogs` VALUES ('6897', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:50:37');
INSERT INTO `syslogs` VALUES ('6898', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:52:03');
INSERT INTO `syslogs` VALUES ('6899', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:54:03');
INSERT INTO `syslogs` VALUES ('6900', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 11:54:03');
INSERT INTO `syslogs` VALUES ('6901', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:54:07');
INSERT INTO `syslogs` VALUES ('6902', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:54:54');
INSERT INTO `syslogs` VALUES ('6903', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 11:54:54');
INSERT INTO `syslogs` VALUES ('6904', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:54:56');
INSERT INTO `syslogs` VALUES ('6905', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-6 11:55:54');
INSERT INTO `syslogs` VALUES ('6906', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:57:39');
INSERT INTO `syslogs` VALUES ('6907', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 11:57:39');
INSERT INTO `syslogs` VALUES ('6908', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:57:51');
INSERT INTO `syslogs` VALUES ('6909', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:58:28');
INSERT INTO `syslogs` VALUES ('6910', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 11:58:28');
INSERT INTO `syslogs` VALUES ('6911', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 11:58:39');
INSERT INTO `syslogs` VALUES ('6912', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:01:41');
INSERT INTO `syslogs` VALUES ('6913', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:01:47');
INSERT INTO `syslogs` VALUES ('6914', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:02:14');
INSERT INTO `syslogs` VALUES ('6915', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-6 12:02:25');
INSERT INTO `syslogs` VALUES ('6916', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:03:45');
INSERT INTO `syslogs` VALUES ('6917', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:03:45');
INSERT INTO `syslogs` VALUES ('6918', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:03:47');
INSERT INTO `syslogs` VALUES ('6919', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:04:33');
INSERT INTO `syslogs` VALUES ('6920', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:04:33');
INSERT INTO `syslogs` VALUES ('6921', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:04:34');
INSERT INTO `syslogs` VALUES ('6922', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:07:37');
INSERT INTO `syslogs` VALUES ('6923', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:07:38');
INSERT INTO `syslogs` VALUES ('6924', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:07:38');
INSERT INTO `syslogs` VALUES ('6925', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:09:00');
INSERT INTO `syslogs` VALUES ('6926', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:09:08');
INSERT INTO `syslogs` VALUES ('6927', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:09:44');
INSERT INTO `syslogs` VALUES ('6928', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:09:44');
INSERT INTO `syslogs` VALUES ('6929', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:09:46');
INSERT INTO `syslogs` VALUES ('6930', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:09:59');
INSERT INTO `syslogs` VALUES ('6931', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:09:59');
INSERT INTO `syslogs` VALUES ('6932', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:10:00');
INSERT INTO `syslogs` VALUES ('6933', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:10:11');
INSERT INTO `syslogs` VALUES ('6934', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:10:18');
INSERT INTO `syslogs` VALUES ('6935', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:10:43');
INSERT INTO `syslogs` VALUES ('6936', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:10:43');
INSERT INTO `syslogs` VALUES ('6937', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:10:48');
INSERT INTO `syslogs` VALUES ('6938', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:11:11');
INSERT INTO `syslogs` VALUES ('6939', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:11:11');
INSERT INTO `syslogs` VALUES ('6940', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:11:12');
INSERT INTO `syslogs` VALUES ('6941', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:11:27');
INSERT INTO `syslogs` VALUES ('6942', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:11:27');
INSERT INTO `syslogs` VALUES ('6943', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:11:28');
INSERT INTO `syslogs` VALUES ('6944', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:11:59');
INSERT INTO `syslogs` VALUES ('6945', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:11:59');
INSERT INTO `syslogs` VALUES ('6946', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:12:00');
INSERT INTO `syslogs` VALUES ('6947', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:13:16');
INSERT INTO `syslogs` VALUES ('6948', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:13:16');
INSERT INTO `syslogs` VALUES ('6949', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:13:18');
INSERT INTO `syslogs` VALUES ('6950', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:14:59');
INSERT INTO `syslogs` VALUES ('6951', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:14:59');
INSERT INTO `syslogs` VALUES ('6952', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:15:00');
INSERT INTO `syslogs` VALUES ('6953', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:15:23');
INSERT INTO `syslogs` VALUES ('6954', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:15:23');
INSERT INTO `syslogs` VALUES ('6955', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:15:23');
INSERT INTO `syslogs` VALUES ('6956', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:15:48');
INSERT INTO `syslogs` VALUES ('6957', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:15:48');
INSERT INTO `syslogs` VALUES ('6958', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:15:48');
INSERT INTO `syslogs` VALUES ('6959', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:16:13');
INSERT INTO `syslogs` VALUES ('6960', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 12:16:13');
INSERT INTO `syslogs` VALUES ('6961', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 12:16:14');
INSERT INTO `syslogs` VALUES ('6962', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:11:51');
INSERT INTO `syslogs` VALUES ('6963', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:22:56');
INSERT INTO `syslogs` VALUES ('6964', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:22:08');
INSERT INTO `syslogs` VALUES ('6965', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:31:56');
INSERT INTO `syslogs` VALUES ('6966', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:34:14');
INSERT INTO `syslogs` VALUES ('6967', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 14:34:14');
INSERT INTO `syslogs` VALUES ('6968', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:34:26');
INSERT INTO `syslogs` VALUES ('6969', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:36:30');
INSERT INTO `syslogs` VALUES ('6970', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:39:33');
INSERT INTO `syslogs` VALUES ('6971', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:41:02');
INSERT INTO `syslogs` VALUES ('6972', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 14:41:03');
INSERT INTO `syslogs` VALUES ('6973', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:41:28');
INSERT INTO `syslogs` VALUES ('6974', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:42:20');
INSERT INTO `syslogs` VALUES ('6975', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:43:35');
INSERT INTO `syslogs` VALUES ('6976', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 14:43:35');
INSERT INTO `syslogs` VALUES ('6977', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:43:47');
INSERT INTO `syslogs` VALUES ('6978', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:49:32');
INSERT INTO `syslogs` VALUES ('6979', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 14:49:32');
INSERT INTO `syslogs` VALUES ('6980', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:49:43');
INSERT INTO `syslogs` VALUES ('6981', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 14:54:54');
INSERT INTO `syslogs` VALUES ('6982', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 14:55:00');
INSERT INTO `syslogs` VALUES ('6983', 'login', null, '192.168.73.52', 'fail', 'unknow user:nulllogin to system', '2014-8-6 14:58:59');
INSERT INTO `syslogs` VALUES ('6984', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-6 14:59:00');
INSERT INTO `syslogs` VALUES ('6985', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-6 14:59:08');
INSERT INTO `syslogs` VALUES ('6986', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-6 15:26:00');
INSERT INTO `syslogs` VALUES ('6987', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 15:26:09');
INSERT INTO `syslogs` VALUES ('6988', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 16:47:22');
INSERT INTO `syslogs` VALUES ('6989', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:07:45');
INSERT INTO `syslogs` VALUES ('6990', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:20:59');
INSERT INTO `syslogs` VALUES ('6991', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:21:22');
INSERT INTO `syslogs` VALUES ('6992', 'logout', 'user2', '192.168.73.52', 'success', 'logout to system', '2014-8-6 17:21:22');
INSERT INTO `syslogs` VALUES ('6993', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:21:25');
INSERT INTO `syslogs` VALUES ('6994', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:25:06');
INSERT INTO `syslogs` VALUES ('6995', 'logout', 'user2', '192.168.73.52', 'success', 'logout to system', '2014-8-6 17:25:06');
INSERT INTO `syslogs` VALUES ('6996', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:25:08');
INSERT INTO `syslogs` VALUES ('6997', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:26:44');
INSERT INTO `syslogs` VALUES ('6998', 'logout', 'user2', '192.168.73.52', 'success', 'logout to system', '2014-8-6 17:26:44');
INSERT INTO `syslogs` VALUES ('6999', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:26:45');
INSERT INTO `syslogs` VALUES ('7000', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:30:08');
INSERT INTO `syslogs` VALUES ('7001', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:32:40');
INSERT INTO `syslogs` VALUES ('7002', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:36:49');
INSERT INTO `syslogs` VALUES ('7003', 'logout', 'user2', '192.168.73.52', 'success', 'logout to system', '2014-8-6 17:38:12');
INSERT INTO `syslogs` VALUES ('7004', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:38:18');
INSERT INTO `syslogs` VALUES ('7005', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-6 17:39:27');
INSERT INTO `syslogs` VALUES ('7006', 'login', 'center', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:39:35');
INSERT INTO `syslogs` VALUES ('7007', 'logout', 'center', '192.168.73.52', 'success', 'logout to system', '2014-8-6 17:41:01');
INSERT INTO `syslogs` VALUES ('7008', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:41:08');
INSERT INTO `syslogs` VALUES ('7009', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:53:59');
INSERT INTO `syslogs` VALUES ('7010', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:56:21');
INSERT INTO `syslogs` VALUES ('7011', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:56:24');
INSERT INTO `syslogs` VALUES ('7012', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-6 17:56:49');
INSERT INTO `syslogs` VALUES ('7013', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 18:19:27');
INSERT INTO `syslogs` VALUES ('7014', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-6 18:20:22');
INSERT INTO `syslogs` VALUES ('7015', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 9:52:15');
INSERT INTO `syslogs` VALUES ('7016', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:04:04');
INSERT INTO `syslogs` VALUES ('7017', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:04:05');
INSERT INTO `syslogs` VALUES ('7018', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 10:04:07');
INSERT INTO `syslogs` VALUES ('7019', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:04:07');
INSERT INTO `syslogs` VALUES ('7020', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-7 10:13:54');
INSERT INTO `syslogs` VALUES ('7021', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:14:17');
INSERT INTO `syslogs` VALUES ('7022', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 10:14:17');
INSERT INTO `syslogs` VALUES ('7023', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:14:19');
INSERT INTO `syslogs` VALUES ('7024', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:15:46');
INSERT INTO `syslogs` VALUES ('7025', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 10:15:46');
INSERT INTO `syslogs` VALUES ('7026', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:15:47');
INSERT INTO `syslogs` VALUES ('7027', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:16:12');
INSERT INTO `syslogs` VALUES ('7028', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 10:16:12');
INSERT INTO `syslogs` VALUES ('7029', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:16:15');
INSERT INTO `syslogs` VALUES ('7030', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:17:04');
INSERT INTO `syslogs` VALUES ('7031', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 10:17:04');
INSERT INTO `syslogs` VALUES ('7032', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:17:04');
INSERT INTO `syslogs` VALUES ('7033', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:17:16');
INSERT INTO `syslogs` VALUES ('7034', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 10:17:16');
INSERT INTO `syslogs` VALUES ('7035', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:17:17');
INSERT INTO `syslogs` VALUES ('7036', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:17:41');
INSERT INTO `syslogs` VALUES ('7037', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 10:17:41');
INSERT INTO `syslogs` VALUES ('7038', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:17:42');
INSERT INTO `syslogs` VALUES ('7039', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:17:52');
INSERT INTO `syslogs` VALUES ('7040', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 10:17:52');
INSERT INTO `syslogs` VALUES ('7041', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:17:53');
INSERT INTO `syslogs` VALUES ('7042', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:29:08');
INSERT INTO `syslogs` VALUES ('7043', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:29:09');
INSERT INTO `syslogs` VALUES ('7044', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:43:33');
INSERT INTO `syslogs` VALUES ('7045', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:43:34');
INSERT INTO `syslogs` VALUES ('7046', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:43:37');
INSERT INTO `syslogs` VALUES ('7047', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:45:04');
INSERT INTO `syslogs` VALUES ('7048', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 10:45:04');
INSERT INTO `syslogs` VALUES ('7049', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:45:04');
INSERT INTO `syslogs` VALUES ('7050', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:47:21');
INSERT INTO `syslogs` VALUES ('7051', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 10:56:53');
INSERT INTO `syslogs` VALUES ('7052', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:57:02');
INSERT INTO `syslogs` VALUES ('7053', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:58:25');
INSERT INTO `syslogs` VALUES ('7054', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:59:46');
INSERT INTO `syslogs` VALUES ('7055', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:59:47');
INSERT INTO `syslogs` VALUES ('7056', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:59:49');
INSERT INTO `syslogs` VALUES ('7057', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 10:59:51');
INSERT INTO `syslogs` VALUES ('7058', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:09:37');
INSERT INTO `syslogs` VALUES ('7059', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 11:09:37');
INSERT INTO `syslogs` VALUES ('7060', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:09:38');
INSERT INTO `syslogs` VALUES ('7061', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 11:11:45');
INSERT INTO `syslogs` VALUES ('7062', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:11:52');
INSERT INTO `syslogs` VALUES ('7063', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:13:11');
INSERT INTO `syslogs` VALUES ('7064', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 11:13:11');
INSERT INTO `syslogs` VALUES ('7065', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:13:15');
INSERT INTO `syslogs` VALUES ('7066', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:13:51');
INSERT INTO `syslogs` VALUES ('7067', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 11:13:51');
INSERT INTO `syslogs` VALUES ('7068', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:13:52');
INSERT INTO `syslogs` VALUES ('7069', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:14:35');
INSERT INTO `syslogs` VALUES ('7070', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 11:14:36');
INSERT INTO `syslogs` VALUES ('7071', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:14:36');
INSERT INTO `syslogs` VALUES ('7072', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:15:09');
INSERT INTO `syslogs` VALUES ('7073', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 11:15:09');
INSERT INTO `syslogs` VALUES ('7074', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:15:10');
INSERT INTO `syslogs` VALUES ('7075', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:15:23');
INSERT INTO `syslogs` VALUES ('7076', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 11:15:23');
INSERT INTO `syslogs` VALUES ('7077', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:15:24');
INSERT INTO `syslogs` VALUES ('7078', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:16:05');
INSERT INTO `syslogs` VALUES ('7079', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 11:16:05');
INSERT INTO `syslogs` VALUES ('7080', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:16:05');
INSERT INTO `syslogs` VALUES ('7081', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 11:56:50');
INSERT INTO `syslogs` VALUES ('7082', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 11:56:50');
INSERT INTO `syslogs` VALUES ('7083', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 18:07:48');
INSERT INTO `syslogs` VALUES ('7084', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-7 18:09:25');
INSERT INTO `syslogs` VALUES ('7085', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-7 18:09:35');
INSERT INTO `syslogs` VALUES ('7086', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 8:47:43');
INSERT INTO `syslogs` VALUES ('7087', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:31:57');
INSERT INTO `syslogs` VALUES ('7088', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:32:44');
INSERT INTO `syslogs` VALUES ('7089', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-8 9:33:52');
INSERT INTO `syslogs` VALUES ('7090', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:34:11');
INSERT INTO `syslogs` VALUES ('7091', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 9:34:11');
INSERT INTO `syslogs` VALUES ('7092', 'login', 'user', '127.0.0.1', 'success', 'login to system', '2014-8-8 9:34:13');
INSERT INTO `syslogs` VALUES ('7093', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:37:41');
INSERT INTO `syslogs` VALUES ('7094', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 9:37:41');
INSERT INTO `syslogs` VALUES ('7095', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:37:48');
INSERT INTO `syslogs` VALUES ('7096', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:39:20');
INSERT INTO `syslogs` VALUES ('7097', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 9:39:20');
INSERT INTO `syslogs` VALUES ('7098', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:39:21');
INSERT INTO `syslogs` VALUES ('7099', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:40:42');
INSERT INTO `syslogs` VALUES ('7100', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 9:40:42');
INSERT INTO `syslogs` VALUES ('7101', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:40:43');
INSERT INTO `syslogs` VALUES ('7102', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:41:58');
INSERT INTO `syslogs` VALUES ('7103', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 9:41:58');
INSERT INTO `syslogs` VALUES ('7104', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:42:00');
INSERT INTO `syslogs` VALUES ('7105', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 9:42:18');
INSERT INTO `syslogs` VALUES ('7106', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:42:24');
INSERT INTO `syslogs` VALUES ('7107', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:43:43');
INSERT INTO `syslogs` VALUES ('7108', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 9:43:43');
INSERT INTO `syslogs` VALUES ('7109', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:43:44');
INSERT INTO `syslogs` VALUES ('7110', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:43:57');
INSERT INTO `syslogs` VALUES ('7111', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 9:43:58');
INSERT INTO `syslogs` VALUES ('7112', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:43:59');
INSERT INTO `syslogs` VALUES ('7113', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:44:21');
INSERT INTO `syslogs` VALUES ('7114', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 9:44:21');
INSERT INTO `syslogs` VALUES ('7115', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:44:23');
INSERT INTO `syslogs` VALUES ('7116', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 9:54:56');
INSERT INTO `syslogs` VALUES ('7117', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 9:55:03');
INSERT INTO `syslogs` VALUES ('7118', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:01:54');
INSERT INTO `syslogs` VALUES ('7119', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:08:28');
INSERT INTO `syslogs` VALUES ('7120', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:10:49');
INSERT INTO `syslogs` VALUES ('7121', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:10:49');
INSERT INTO `syslogs` VALUES ('7122', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:12:02');
INSERT INTO `syslogs` VALUES ('7123', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:12:08');
INSERT INTO `syslogs` VALUES ('7124', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:16:47');
INSERT INTO `syslogs` VALUES ('7125', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:16:47');
INSERT INTO `syslogs` VALUES ('7126', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:16:53');
INSERT INTO `syslogs` VALUES ('7127', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:26:12');
INSERT INTO `syslogs` VALUES ('7128', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:30:25');
INSERT INTO `syslogs` VALUES ('7129', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:30:40');
INSERT INTO `syslogs` VALUES ('7130', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:30:40');
INSERT INTO `syslogs` VALUES ('7131', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:30:42');
INSERT INTO `syslogs` VALUES ('7132', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:33:40');
INSERT INTO `syslogs` VALUES ('7133', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:33:40');
INSERT INTO `syslogs` VALUES ('7134', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:33:41');
INSERT INTO `syslogs` VALUES ('7135', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:36:52');
INSERT INTO `syslogs` VALUES ('7136', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:36:52');
INSERT INTO `syslogs` VALUES ('7137', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:36:54');
INSERT INTO `syslogs` VALUES ('7138', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:37:01');
INSERT INTO `syslogs` VALUES ('7139', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:37:01');
INSERT INTO `syslogs` VALUES ('7140', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:37:02');
INSERT INTO `syslogs` VALUES ('7141', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:38:45');
INSERT INTO `syslogs` VALUES ('7142', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:38:53');
INSERT INTO `syslogs` VALUES ('7143', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:39:49');
INSERT INTO `syslogs` VALUES ('7144', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:39:49');
INSERT INTO `syslogs` VALUES ('7145', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:39:50');
INSERT INTO `syslogs` VALUES ('7146', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:45:35');
INSERT INTO `syslogs` VALUES ('7147', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:45:41');
INSERT INTO `syslogs` VALUES ('7148', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:46:20');
INSERT INTO `syslogs` VALUES ('7149', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:46:21');
INSERT INTO `syslogs` VALUES ('7150', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:46:31');
INSERT INTO `syslogs` VALUES ('7151', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:53:31');
INSERT INTO `syslogs` VALUES ('7152', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:54:51');
INSERT INTO `syslogs` VALUES ('7153', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:54:51');
INSERT INTO `syslogs` VALUES ('7154', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:54:52');
INSERT INTO `syslogs` VALUES ('7155', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:55:06');
INSERT INTO `syslogs` VALUES ('7156', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:55:06');
INSERT INTO `syslogs` VALUES ('7157', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:55:07');
INSERT INTO `syslogs` VALUES ('7158', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:55:23');
INSERT INTO `syslogs` VALUES ('7159', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:55:23');
INSERT INTO `syslogs` VALUES ('7160', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:55:24');
INSERT INTO `syslogs` VALUES ('7161', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 10:56:25');
INSERT INTO `syslogs` VALUES ('7162', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 10:56:33');
INSERT INTO `syslogs` VALUES ('7163', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 11:04:10');
INSERT INTO `syslogs` VALUES ('7164', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 11:04:11');
INSERT INTO `syslogs` VALUES ('7165', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 11:09:12');
INSERT INTO `syslogs` VALUES ('7166', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 11:20:22');
INSERT INTO `syslogs` VALUES ('7167', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 11:21:21');
INSERT INTO `syslogs` VALUES ('7168', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 11:21:21');
INSERT INTO `syslogs` VALUES ('7169', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 11:21:22');
INSERT INTO `syslogs` VALUES ('7170', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 12:20:39');
INSERT INTO `syslogs` VALUES ('7171', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 12:20:40');
INSERT INTO `syslogs` VALUES ('7172', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 12:21:44');
INSERT INTO `syslogs` VALUES ('7173', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 12:21:45');
INSERT INTO `syslogs` VALUES ('7174', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 12:21:46');
INSERT INTO `syslogs` VALUES ('7175', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 12:23:38');
INSERT INTO `syslogs` VALUES ('7176', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 12:23:39');
INSERT INTO `syslogs` VALUES ('7177', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 12:23:40');
INSERT INTO `syslogs` VALUES ('7178', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 12:23:41');
INSERT INTO `syslogs` VALUES ('7179', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 12:23:42');
INSERT INTO `syslogs` VALUES ('7180', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:07:06');
INSERT INTO `syslogs` VALUES ('7181', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:09:54');
INSERT INTO `syslogs` VALUES ('7182', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:10:02');
INSERT INTO `syslogs` VALUES ('7183', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:10:22');
INSERT INTO `syslogs` VALUES ('7184', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:10:33');
INSERT INTO `syslogs` VALUES ('7185', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:13:13');
INSERT INTO `syslogs` VALUES ('7186', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:13:25');
INSERT INTO `syslogs` VALUES ('7187', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:16:56');
INSERT INTO `syslogs` VALUES ('7188', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:17:03');
INSERT INTO `syslogs` VALUES ('7189', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:21:31');
INSERT INTO `syslogs` VALUES ('7190', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:21:32');
INSERT INTO `syslogs` VALUES ('7191', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:21:34');
INSERT INTO `syslogs` VALUES ('7192', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:25:57');
INSERT INTO `syslogs` VALUES ('7193', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:26:55');
INSERT INTO `syslogs` VALUES ('7194', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:28:09');
INSERT INTO `syslogs` VALUES ('7195', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:28:09');
INSERT INTO `syslogs` VALUES ('7196', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:28:10');
INSERT INTO `syslogs` VALUES ('7197', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:39:35');
INSERT INTO `syslogs` VALUES ('7198', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:39:35');
INSERT INTO `syslogs` VALUES ('7199', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:39:39');
INSERT INTO `syslogs` VALUES ('7200', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:42:36');
INSERT INTO `syslogs` VALUES ('7201', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:43:05');
INSERT INTO `syslogs` VALUES ('7202', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:43:10');
INSERT INTO `syslogs` VALUES ('7203', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:43:11');
INSERT INTO `syslogs` VALUES ('7204', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:43:21');
INSERT INTO `syslogs` VALUES ('7205', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:45:04');
INSERT INTO `syslogs` VALUES ('7206', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:45:04');
INSERT INTO `syslogs` VALUES ('7207', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:45:06');
INSERT INTO `syslogs` VALUES ('7208', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:46:43');
INSERT INTO `syslogs` VALUES ('7209', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:51:04');
INSERT INTO `syslogs` VALUES ('7210', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:51:05');
INSERT INTO `syslogs` VALUES ('7211', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:51:09');
INSERT INTO `syslogs` VALUES ('7212', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:51:38');
INSERT INTO `syslogs` VALUES ('7213', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:51:44');
INSERT INTO `syslogs` VALUES ('7214', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:53:04');
INSERT INTO `syslogs` VALUES ('7215', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:53:09');
INSERT INTO `syslogs` VALUES ('7216', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:53:48');
INSERT INTO `syslogs` VALUES ('7217', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:53:54');
INSERT INTO `syslogs` VALUES ('7218', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:54:59');
INSERT INTO `syslogs` VALUES ('7219', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:55:08');
INSERT INTO `syslogs` VALUES ('7220', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:55:47');
INSERT INTO `syslogs` VALUES ('7221', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:55:48');
INSERT INTO `syslogs` VALUES ('7222', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:55:49');
INSERT INTO `syslogs` VALUES ('7223', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:56:17');
INSERT INTO `syslogs` VALUES ('7224', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:56:17');
INSERT INTO `syslogs` VALUES ('7225', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:56:18');
INSERT INTO `syslogs` VALUES ('7226', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:56:46');
INSERT INTO `syslogs` VALUES ('7227', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:56:47');
INSERT INTO `syslogs` VALUES ('7228', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:56:48');
INSERT INTO `syslogs` VALUES ('7229', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:56:55');
INSERT INTO `syslogs` VALUES ('7230', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 14:59:29');
INSERT INTO `syslogs` VALUES ('7231', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 14:59:37');
INSERT INTO `syslogs` VALUES ('7232', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 15:04:23');
INSERT INTO `syslogs` VALUES ('7233', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:04:32');
INSERT INTO `syslogs` VALUES ('7234', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 15:05:22');
INSERT INTO `syslogs` VALUES ('7235', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:05:27');
INSERT INTO `syslogs` VALUES ('7236', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:09:59');
INSERT INTO `syslogs` VALUES ('7237', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 15:09:59');
INSERT INTO `syslogs` VALUES ('7238', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:10:04');
INSERT INTO `syslogs` VALUES ('7239', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:10:14');
INSERT INTO `syslogs` VALUES ('7240', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 15:10:14');
INSERT INTO `syslogs` VALUES ('7241', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:10:14');
INSERT INTO `syslogs` VALUES ('7242', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:10:54');
INSERT INTO `syslogs` VALUES ('7243', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 15:10:54');
INSERT INTO `syslogs` VALUES ('7244', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:10:54');
INSERT INTO `syslogs` VALUES ('7245', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:43:02');
INSERT INTO `syslogs` VALUES ('7246', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:43:07');
INSERT INTO `syslogs` VALUES ('7247', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:43:10');
INSERT INTO `syslogs` VALUES ('7248', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:53:59');
INSERT INTO `syslogs` VALUES ('7249', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:56:29');
INSERT INTO `syslogs` VALUES ('7250', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:56:29');
INSERT INTO `syslogs` VALUES ('7251', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 15:56:43');
INSERT INTO `syslogs` VALUES ('7252', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 15:56:50');
INSERT INTO `syslogs` VALUES ('7253', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:00:38');
INSERT INTO `syslogs` VALUES ('7254', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 16:00:38');
INSERT INTO `syslogs` VALUES ('7255', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:00:38');
INSERT INTO `syslogs` VALUES ('7256', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:01:44');
INSERT INTO `syslogs` VALUES ('7257', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:01:45');
INSERT INTO `syslogs` VALUES ('7258', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:01:47');
INSERT INTO `syslogs` VALUES ('7259', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:04:29');
INSERT INTO `syslogs` VALUES ('7260', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:04:30');
INSERT INTO `syslogs` VALUES ('7261', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:04:32');
INSERT INTO `syslogs` VALUES ('7262', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 16:04:34');
INSERT INTO `syslogs` VALUES ('7263', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:04:37');
INSERT INTO `syslogs` VALUES ('7264', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 16:04:55');
INSERT INTO `syslogs` VALUES ('7265', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:05:00');
INSERT INTO `syslogs` VALUES ('7266', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:10:45');
INSERT INTO `syslogs` VALUES ('7267', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:10:45');
INSERT INTO `syslogs` VALUES ('7268', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:10:52');
INSERT INTO `syslogs` VALUES ('7269', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:15:10');
INSERT INTO `syslogs` VALUES ('7270', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 16:15:10');
INSERT INTO `syslogs` VALUES ('7271', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:15:10');
INSERT INTO `syslogs` VALUES ('7272', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:15:39');
INSERT INTO `syslogs` VALUES ('7273', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 16:15:39');
INSERT INTO `syslogs` VALUES ('7274', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:15:39');
INSERT INTO `syslogs` VALUES ('7275', 'login', 'user2', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-8 16:27:05');
INSERT INTO `syslogs` VALUES ('7276', 'login', null, '192.168.73.52', 'fail', 'unknow user:nulllogin to system', '2014-8-8 16:40:14');
INSERT INTO `syslogs` VALUES ('7277', 'logout', 'user2', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-8 16:40:14');
INSERT INTO `syslogs` VALUES ('7278', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:40:30');
INSERT INTO `syslogs` VALUES ('7279', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:45:08');
INSERT INTO `syslogs` VALUES ('7280', 'logout', 'user2', '192.168.73.52', 'success', 'logout to system', '2014-8-8 16:45:08');
INSERT INTO `syslogs` VALUES ('7281', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:45:09');
INSERT INTO `syslogs` VALUES ('7282', 'logout', 'user2', '192.168.73.52', 'success', 'logout to system', '2014-8-8 16:46:09');
INSERT INTO `syslogs` VALUES ('7283', 'login', 'center', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:46:17');
INSERT INTO `syslogs` VALUES ('7284', 'login', 'center', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:47:51');
INSERT INTO `syslogs` VALUES ('7285', 'logout', 'center', '192.168.73.52', 'success', 'logout to system', '2014-8-8 16:47:51');
INSERT INTO `syslogs` VALUES ('7286', 'login', 'center', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:47:51');
INSERT INTO `syslogs` VALUES ('7287', 'login', 'center', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:48:06');
INSERT INTO `syslogs` VALUES ('7288', 'logout', 'center', '192.168.73.52', 'success', 'logout to system', '2014-8-8 16:48:06');
INSERT INTO `syslogs` VALUES ('7289', 'login', 'center', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:48:07');
INSERT INTO `syslogs` VALUES ('7290', 'login', 'center', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:48:22');
INSERT INTO `syslogs` VALUES ('7291', 'logout', 'center', '192.168.73.52', 'success', 'logout to system', '2014-8-8 16:48:22');
INSERT INTO `syslogs` VALUES ('7292', 'login', 'center', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:48:22');
INSERT INTO `syslogs` VALUES ('7293', 'login', 'center', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:49:54');
INSERT INTO `syslogs` VALUES ('7294', 'logout', 'center', '192.168.73.52', 'success', 'logout to system', '2014-8-8 16:49:54');
INSERT INTO `syslogs` VALUES ('7295', 'login', 'center', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:49:55');
INSERT INTO `syslogs` VALUES ('7296', 'login', 'center', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:50:04');
INSERT INTO `syslogs` VALUES ('7297', 'logout', 'center', '192.168.73.52', 'success', 'logout to system', '2014-8-8 16:50:04');
INSERT INTO `syslogs` VALUES ('7298', 'login', 'center', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:50:05');
INSERT INTO `syslogs` VALUES ('7299', 'logout', 'center', '192.168.73.52', 'success', 'logout to system', '2014-8-8 16:52:36');
INSERT INTO `syslogs` VALUES ('7300', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:52:49');
INSERT INTO `syslogs` VALUES ('7301', 'logout', 'user2', '192.168.73.52', 'success', 'logout to system', '2014-8-8 16:54:52');
INSERT INTO `syslogs` VALUES ('7302', 'login', 'center', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:55:05');
INSERT INTO `syslogs` VALUES ('7303', 'logout', 'center', '192.168.73.52', 'success', 'logout to system', '2014-8-8 16:56:17');
INSERT INTO `syslogs` VALUES ('7304', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:56:25');
INSERT INTO `syslogs` VALUES ('7305', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:57:51');
INSERT INTO `syslogs` VALUES ('7306', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 16:57:51');
INSERT INTO `syslogs` VALUES ('7307', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 16:57:52');
INSERT INTO `syslogs` VALUES ('7308', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:11:39');
INSERT INTO `syslogs` VALUES ('7309', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:11:39');
INSERT INTO `syslogs` VALUES ('7310', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:11:40');
INSERT INTO `syslogs` VALUES ('7311', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:13:52');
INSERT INTO `syslogs` VALUES ('7312', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:13:56');
INSERT INTO `syslogs` VALUES ('7313', 'logout', 'user2', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:14:24');
INSERT INTO `syslogs` VALUES ('7314', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:14:32');
INSERT INTO `syslogs` VALUES ('7315', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:18:53');
INSERT INTO `syslogs` VALUES ('7316', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:18:53');
INSERT INTO `syslogs` VALUES ('7317', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:18:53');
INSERT INTO `syslogs` VALUES ('7318', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:19:14');
INSERT INTO `syslogs` VALUES ('7319', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:19:14');
INSERT INTO `syslogs` VALUES ('7320', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:19:14');
INSERT INTO `syslogs` VALUES ('7321', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:20:45');
INSERT INTO `syslogs` VALUES ('7322', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:20:45');
INSERT INTO `syslogs` VALUES ('7323', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:20:45');
INSERT INTO `syslogs` VALUES ('7324', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:21:42');
INSERT INTO `syslogs` VALUES ('7325', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:21:42');
INSERT INTO `syslogs` VALUES ('7326', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:21:42');
INSERT INTO `syslogs` VALUES ('7327', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:26:05');
INSERT INTO `syslogs` VALUES ('7328', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:26:11');
INSERT INTO `syslogs` VALUES ('7329', 'logout', 'user2', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:26:49');
INSERT INTO `syslogs` VALUES ('7330', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:26:55');
INSERT INTO `syslogs` VALUES ('7331', 'login', null, '192.168.73.52', 'fail', 'unknow user:nulllogin to system', '2014-8-8 17:27:26');
INSERT INTO `syslogs` VALUES ('7332', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:27:55');
INSERT INTO `syslogs` VALUES ('7333', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:30:57');
INSERT INTO `syslogs` VALUES ('7334', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:30:57');
INSERT INTO `syslogs` VALUES ('7335', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:30:57');
INSERT INTO `syslogs` VALUES ('7336', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:37:18');
INSERT INTO `syslogs` VALUES ('7337', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:37:18');
INSERT INTO `syslogs` VALUES ('7338', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:37:18');
INSERT INTO `syslogs` VALUES ('7339', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:37:52');
INSERT INTO `syslogs` VALUES ('7340', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:37:52');
INSERT INTO `syslogs` VALUES ('7341', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:37:53');
INSERT INTO `syslogs` VALUES ('7342', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:38:21');
INSERT INTO `syslogs` VALUES ('7343', 'logout', 'user2', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:38:21');
INSERT INTO `syslogs` VALUES ('7344', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:38:23');
INSERT INTO `syslogs` VALUES ('7345', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:38:23');
INSERT INTO `syslogs` VALUES ('7346', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:38:24');
INSERT INTO `syslogs` VALUES ('7347', 'login', null, '192.168.73.52', 'fail', 'unknow user:nulllogin to system', '2014-8-8 17:45:21');
INSERT INTO `syslogs` VALUES ('7348', 'login', null, '192.168.73.52', 'fail', 'unknow user:nulllogin to system', '2014-8-8 17:45:21');
INSERT INTO `syslogs` VALUES ('7349', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:45:30');
INSERT INTO `syslogs` VALUES ('7350', 'login', 'user2', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:48:02');
INSERT INTO `syslogs` VALUES ('7351', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:49:03');
INSERT INTO `syslogs` VALUES ('7352', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:49:04');
INSERT INTO `syslogs` VALUES ('7353', 'login', 'user', '192.168.73.52', 'success', 'login to system', '2014-8-8 17:49:05');
INSERT INTO `syslogs` VALUES ('7354', 'logout', 'user2', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:52:32');
INSERT INTO `syslogs` VALUES ('7355', 'logout', 'user', '192.168.73.52', 'success', 'logout to system', '2014-8-8 17:52:33');
INSERT INTO `syslogs` VALUES ('7356', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 9:09:38');
INSERT INTO `syslogs` VALUES ('7357', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 9:44:07');
INSERT INTO `syslogs` VALUES ('7358', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 9:56:40');
INSERT INTO `syslogs` VALUES ('7359', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 9:59:46');
INSERT INTO `syslogs` VALUES ('7360', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-11 9:59:46');
INSERT INTO `syslogs` VALUES ('7361', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 10:00:03');
INSERT INTO `syslogs` VALUES ('7362', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 10:09:18');
INSERT INTO `syslogs` VALUES ('7363', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 11:51:53');
INSERT INTO `syslogs` VALUES ('7364', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 11:57:20');
INSERT INTO `syslogs` VALUES ('7365', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 12:01:17');
INSERT INTO `syslogs` VALUES ('7366', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 12:05:50');
INSERT INTO `syslogs` VALUES ('7367', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 12:16:15');
INSERT INTO `syslogs` VALUES ('7368', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 14:19:54');
INSERT INTO `syslogs` VALUES ('7369', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 14:37:38');
INSERT INTO `syslogs` VALUES ('7370', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 14:38:17');
INSERT INTO `syslogs` VALUES ('7371', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-11 14:38:17');
INSERT INTO `syslogs` VALUES ('7372', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 14:38:31');
INSERT INTO `syslogs` VALUES ('7373', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 14:47:56');
INSERT INTO `syslogs` VALUES ('7374', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 15:01:09');
INSERT INTO `syslogs` VALUES ('7375', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 15:15:58');
INSERT INTO `syslogs` VALUES ('7376', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 15:18:16');
INSERT INTO `syslogs` VALUES ('7377', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-11 15:18:16');
INSERT INTO `syslogs` VALUES ('7378', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 15:18:27');
INSERT INTO `syslogs` VALUES ('7379', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 15:23:33');
INSERT INTO `syslogs` VALUES ('7380', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-11 16:27:21');
INSERT INTO `syslogs` VALUES ('7381', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 10:27:21');
INSERT INTO `syslogs` VALUES ('7382', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 10:29:01');
INSERT INTO `syslogs` VALUES ('7383', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-12 10:29:01');
INSERT INTO `syslogs` VALUES ('7384', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 10:29:31');
INSERT INTO `syslogs` VALUES ('7385', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 10:48:17');
INSERT INTO `syslogs` VALUES ('7386', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 11:52:04');
INSERT INTO `syslogs` VALUES ('7387', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 11:52:25');
INSERT INTO `syslogs` VALUES ('7388', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-12 11:52:25');
INSERT INTO `syslogs` VALUES ('7389', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 11:53:07');
INSERT INTO `syslogs` VALUES ('7390', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 14:18:55');
INSERT INTO `syslogs` VALUES ('7391', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 14:39:31');
INSERT INTO `syslogs` VALUES ('7392', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-12 14:39:31');
INSERT INTO `syslogs` VALUES ('7393', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 14:40:23');
INSERT INTO `syslogs` VALUES ('7394', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 15:09:29');
INSERT INTO `syslogs` VALUES ('7395', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 15:09:35');
INSERT INTO `syslogs` VALUES ('7396', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-12 15:09:35');
INSERT INTO `syslogs` VALUES ('7397', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 15:10:00');
INSERT INTO `syslogs` VALUES ('7398', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-12 15:11:38');
INSERT INTO `syslogs` VALUES ('7399', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 15:11:48');
INSERT INTO `syslogs` VALUES ('7400', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 15:17:29');
INSERT INTO `syslogs` VALUES ('7401', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 15:21:33');
INSERT INTO `syslogs` VALUES ('7402', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 16:06:28');
INSERT INTO `syslogs` VALUES ('7403', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 16:46:46');
INSERT INTO `syslogs` VALUES ('7404', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 17:08:22');
INSERT INTO `syslogs` VALUES ('7405', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 17:11:50');
INSERT INTO `syslogs` VALUES ('7406', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 17:26:38');
INSERT INTO `syslogs` VALUES ('7407', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-12 17:33:16');
INSERT INTO `syslogs` VALUES ('7408', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 9:04:21');
INSERT INTO `syslogs` VALUES ('7409', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 9:16:04');
INSERT INTO `syslogs` VALUES ('7410', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 9:41:15');
INSERT INTO `syslogs` VALUES ('7411', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 9:44:41');
INSERT INTO `syslogs` VALUES ('7412', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 9:48:23');
INSERT INTO `syslogs` VALUES ('7413', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 10:07:06');
INSERT INTO `syslogs` VALUES ('7414', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 10:10:43');
INSERT INTO `syslogs` VALUES ('7415', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 10:24:49');
INSERT INTO `syslogs` VALUES ('7416', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 10:33:23');
INSERT INTO `syslogs` VALUES ('7417', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 10:44:55');
INSERT INTO `syslogs` VALUES ('7418', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 11:05:47');
INSERT INTO `syslogs` VALUES ('7419', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 11:06:45');
INSERT INTO `syslogs` VALUES ('7420', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-13 11:06:46');
INSERT INTO `syslogs` VALUES ('7421', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 11:06:59');
INSERT INTO `syslogs` VALUES ('7422', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 11:07:53');
INSERT INTO `syslogs` VALUES ('7423', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-13 11:07:53');
INSERT INTO `syslogs` VALUES ('7424', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 11:08:17');
INSERT INTO `syslogs` VALUES ('7425', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 11:13:16');
INSERT INTO `syslogs` VALUES ('7426', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 11:19:58');
INSERT INTO `syslogs` VALUES ('7427', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 11:52:09');
INSERT INTO `syslogs` VALUES ('7428', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 12:09:08');
INSERT INTO `syslogs` VALUES ('7429', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 12:12:10');
INSERT INTO `syslogs` VALUES ('7430', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 14:04:13');
INSERT INTO `syslogs` VALUES ('7431', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 14:26:03');
INSERT INTO `syslogs` VALUES ('7432', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 14:42:18');
INSERT INTO `syslogs` VALUES ('7433', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 14:47:59');
INSERT INTO `syslogs` VALUES ('7434', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 15:43:00');
INSERT INTO `syslogs` VALUES ('7435', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 15:44:52');
INSERT INTO `syslogs` VALUES ('7436', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-13 15:44:57');
INSERT INTO `syslogs` VALUES ('7437', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 15:52:26');
INSERT INTO `syslogs` VALUES ('7438', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 15:54:59');
INSERT INTO `syslogs` VALUES ('7439', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 15:59:41');
INSERT INTO `syslogs` VALUES ('7440', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 16:49:31');
INSERT INTO `syslogs` VALUES ('7441', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 17:25:48');
INSERT INTO `syslogs` VALUES ('7442', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 17:36:26');
INSERT INTO `syslogs` VALUES ('7443', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 17:40:52');
INSERT INTO `syslogs` VALUES ('7444', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 17:43:00');
INSERT INTO `syslogs` VALUES ('7445', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 17:46:15');
INSERT INTO `syslogs` VALUES ('7446', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 17:57:40');
INSERT INTO `syslogs` VALUES ('7447', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 18:00:50');
INSERT INTO `syslogs` VALUES ('7448', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-13 18:00:50');
INSERT INTO `syslogs` VALUES ('7449', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 18:01:03');
INSERT INTO `syslogs` VALUES ('7450', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 18:02:56');
INSERT INTO `syslogs` VALUES ('7451', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 18:07:38');
INSERT INTO `syslogs` VALUES ('7452', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-13 18:08:32');
INSERT INTO `syslogs` VALUES ('7453', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-13 18:09:57');
INSERT INTO `syslogs` VALUES ('7454', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-13 18:11:03');
INSERT INTO `syslogs` VALUES ('7455', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 8:41:05');
INSERT INTO `syslogs` VALUES ('7456', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 9:17:10');
INSERT INTO `syslogs` VALUES ('7457', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-14 9:17:10');
INSERT INTO `syslogs` VALUES ('7458', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 9:17:50');
INSERT INTO `syslogs` VALUES ('7459', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 9:23:03');
INSERT INTO `syslogs` VALUES ('7460', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 9:41:34');
INSERT INTO `syslogs` VALUES ('7461', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 9:59:03');
INSERT INTO `syslogs` VALUES ('7462', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 10:09:40');
INSERT INTO `syslogs` VALUES ('7463', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 10:20:42');
INSERT INTO `syslogs` VALUES ('7464', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 10:29:48');
INSERT INTO `syslogs` VALUES ('7465', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 10:48:28');
INSERT INTO `syslogs` VALUES ('7466', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 10:54:23');
INSERT INTO `syslogs` VALUES ('7467', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 11:03:14');
INSERT INTO `syslogs` VALUES ('7468', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 11:05:45');
INSERT INTO `syslogs` VALUES ('7469', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 11:12:33');
INSERT INTO `syslogs` VALUES ('7470', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 11:18:24');
INSERT INTO `syslogs` VALUES ('7471', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 11:20:26');
INSERT INTO `syslogs` VALUES ('7472', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 11:21:48');
INSERT INTO `syslogs` VALUES ('7473', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-14 11:24:48');
INSERT INTO `syslogs` VALUES ('7474', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 11:24:57');
INSERT INTO `syslogs` VALUES ('7475', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 11:29:24');
INSERT INTO `syslogs` VALUES ('7476', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 11:33:18');
INSERT INTO `syslogs` VALUES ('7477', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 12:07:09');
INSERT INTO `syslogs` VALUES ('7478', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 12:26:40');
INSERT INTO `syslogs` VALUES ('7479', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 12:29:30');
INSERT INTO `syslogs` VALUES ('7480', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 14:15:10');
INSERT INTO `syslogs` VALUES ('7481', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 14:43:51');
INSERT INTO `syslogs` VALUES ('7482', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 14:45:03');
INSERT INTO `syslogs` VALUES ('7483', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 15:10:00');
INSERT INTO `syslogs` VALUES ('7484', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 15:20:13');
INSERT INTO `syslogs` VALUES ('7485', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 15:21:10');
INSERT INTO `syslogs` VALUES ('7486', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-14 15:23:22');
INSERT INTO `syslogs` VALUES ('7487', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-14 15:23:28');
INSERT INTO `syslogs` VALUES ('7488', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 15:25:36');
INSERT INTO `syslogs` VALUES ('7489', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 15:26:47');
INSERT INTO `syslogs` VALUES ('7490', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 15:33:22');
INSERT INTO `syslogs` VALUES ('7491', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-14 15:35:52');
INSERT INTO `syslogs` VALUES ('7492', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 15:36:01');
INSERT INTO `syslogs` VALUES ('7493', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-14 15:43:45');
INSERT INTO `syslogs` VALUES ('7494', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 15:43:53');
INSERT INTO `syslogs` VALUES ('7495', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-14 15:55:22');
INSERT INTO `syslogs` VALUES ('7496', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 15:56:48');
INSERT INTO `syslogs` VALUES ('7497', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 15:59:44');
INSERT INTO `syslogs` VALUES ('7498', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 18:08:26');
INSERT INTO `syslogs` VALUES ('7499', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 18:11:26');
INSERT INTO `syslogs` VALUES ('7500', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-14 18:14:35');
INSERT INTO `syslogs` VALUES ('7501', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 18:14:50');
INSERT INTO `syslogs` VALUES ('7502', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 18:16:46');
INSERT INTO `syslogs` VALUES ('7503', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-14 18:17:51');
INSERT INTO `syslogs` VALUES ('7504', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-14 18:18:01');
INSERT INTO `syslogs` VALUES ('7505', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 10:48:02');
INSERT INTO `syslogs` VALUES ('7506', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 11:06:13');
INSERT INTO `syslogs` VALUES ('7507', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 11:07:35');
INSERT INTO `syslogs` VALUES ('7508', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 11:07:40');
INSERT INTO `syslogs` VALUES ('7509', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 11:08:16');
INSERT INTO `syslogs` VALUES ('7510', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 11:13:39');
INSERT INTO `syslogs` VALUES ('7511', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 11:13:39');
INSERT INTO `syslogs` VALUES ('7512', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 11:18:30');
INSERT INTO `syslogs` VALUES ('7513', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 11:18:30');
INSERT INTO `syslogs` VALUES ('7514', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 11:18:47');
INSERT INTO `syslogs` VALUES ('7515', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 11:25:05');
INSERT INTO `syslogs` VALUES ('7516', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 11:25:12');
INSERT INTO `syslogs` VALUES ('7517', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 11:26:25');
INSERT INTO `syslogs` VALUES ('7518', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 11:27:43');
INSERT INTO `syslogs` VALUES ('7519', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 11:29:08');
INSERT INTO `syslogs` VALUES ('7520', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 11:29:17');
INSERT INTO `syslogs` VALUES ('7521', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 11:30:18');
INSERT INTO `syslogs` VALUES ('7522', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 11:49:45');
INSERT INTO `syslogs` VALUES ('7523', 'login', 'admin', '0:0:0:0:0:0:0:1', 'fail', 'user:adminlogin to system', '2014-8-15 11:50:55');
INSERT INTO `syslogs` VALUES ('7524', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 11:51:08');
INSERT INTO `syslogs` VALUES ('7525', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 11:52:21');
INSERT INTO `syslogs` VALUES ('7526', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 12:06:30');
INSERT INTO `syslogs` VALUES ('7527', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 12:07:07');
INSERT INTO `syslogs` VALUES ('7528', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 12:07:20');
INSERT INTO `syslogs` VALUES ('7529', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 12:07:52');
INSERT INTO `syslogs` VALUES ('7530', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 12:08:11');
INSERT INTO `syslogs` VALUES ('7531', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 12:11:54');
INSERT INTO `syslogs` VALUES ('7532', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 12:12:00');
INSERT INTO `syslogs` VALUES ('7533', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 12:47:26');
INSERT INTO `syslogs` VALUES ('7534', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 12:47:30');
INSERT INTO `syslogs` VALUES ('7535', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 14:27:31');
INSERT INTO `syslogs` VALUES ('7536', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 14:33:06');
INSERT INTO `syslogs` VALUES ('7537', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 14:34:52');
INSERT INTO `syslogs` VALUES ('7538', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 14:36:58');
INSERT INTO `syslogs` VALUES ('7539', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 14:37:04');
INSERT INTO `syslogs` VALUES ('7540', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 14:37:46');
INSERT INTO `syslogs` VALUES ('7541', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 14:38:21');
INSERT INTO `syslogs` VALUES ('7542', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 14:42:03');
INSERT INTO `syslogs` VALUES ('7543', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 14:42:12');
INSERT INTO `syslogs` VALUES ('7544', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 14:43:37');
INSERT INTO `syslogs` VALUES ('7545', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 14:43:43');
INSERT INTO `syslogs` VALUES ('7546', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 14:47:03');
INSERT INTO `syslogs` VALUES ('7547', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 14:47:09');
INSERT INTO `syslogs` VALUES ('7548', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 14:48:35');
INSERT INTO `syslogs` VALUES ('7549', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 14:48:42');
INSERT INTO `syslogs` VALUES ('7550', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 15:11:35');
INSERT INTO `syslogs` VALUES ('7551', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 15:17:51');
INSERT INTO `syslogs` VALUES ('7552', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 15:18:00');
INSERT INTO `syslogs` VALUES ('7553', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 15:29:57');
INSERT INTO `syslogs` VALUES ('7554', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 15:30:04');
INSERT INTO `syslogs` VALUES ('7555', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 15:37:35');
INSERT INTO `syslogs` VALUES ('7556', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 15:40:04');
INSERT INTO `syslogs` VALUES ('7557', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 15:42:32');
INSERT INTO `syslogs` VALUES ('7558', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 15:42:42');
INSERT INTO `syslogs` VALUES ('7559', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 15:43:34');
INSERT INTO `syslogs` VALUES ('7560', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 15:43:41');
INSERT INTO `syslogs` VALUES ('7561', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 15:44:36');
INSERT INTO `syslogs` VALUES ('7562', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 15:45:07');
INSERT INTO `syslogs` VALUES ('7563', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 15:47:04');
INSERT INTO `syslogs` VALUES ('7564', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 15:47:14');
INSERT INTO `syslogs` VALUES ('7565', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 15:51:07');
INSERT INTO `syslogs` VALUES ('7566', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 15:57:24');
INSERT INTO `syslogs` VALUES ('7567', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 15:58:05');
INSERT INTO `syslogs` VALUES ('7568', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 15:58:14');
INSERT INTO `syslogs` VALUES ('7569', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 16:23:19');
INSERT INTO `syslogs` VALUES ('7570', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 16:30:17');
INSERT INTO `syslogs` VALUES ('7571', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 16:30:29');
INSERT INTO `syslogs` VALUES ('7572', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 16:31:18');
INSERT INTO `syslogs` VALUES ('7573', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 16:31:28');
INSERT INTO `syslogs` VALUES ('7574', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 16:35:28');
INSERT INTO `syslogs` VALUES ('7575', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 16:35:39');
INSERT INTO `syslogs` VALUES ('7576', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 16:39:13');
INSERT INTO `syslogs` VALUES ('7577', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 16:39:24');
INSERT INTO `syslogs` VALUES ('7578', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 16:41:29');
INSERT INTO `syslogs` VALUES ('7579', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 16:41:39');
INSERT INTO `syslogs` VALUES ('7580', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 16:44:04');
INSERT INTO `syslogs` VALUES ('7581', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 16:44:12');
INSERT INTO `syslogs` VALUES ('7582', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 16:44:54');
INSERT INTO `syslogs` VALUES ('7583', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 16:45:06');
INSERT INTO `syslogs` VALUES ('7584', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 16:48:41');
INSERT INTO `syslogs` VALUES ('7585', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 16:50:06');
INSERT INTO `syslogs` VALUES ('7586', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 16:50:14');
INSERT INTO `syslogs` VALUES ('7587', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 16:51:01');
INSERT INTO `syslogs` VALUES ('7588', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 16:51:17');
INSERT INTO `syslogs` VALUES ('7589', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 16:55:22');
INSERT INTO `syslogs` VALUES ('7590', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 16:55:32');
INSERT INTO `syslogs` VALUES ('7591', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 16:57:40');
INSERT INTO `syslogs` VALUES ('7592', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 16:57:46');
INSERT INTO `syslogs` VALUES ('7593', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 17:02:00');
INSERT INTO `syslogs` VALUES ('7594', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 17:02:07');
INSERT INTO `syslogs` VALUES ('7595', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 17:03:18');
INSERT INTO `syslogs` VALUES ('7596', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 17:03:27');
INSERT INTO `syslogs` VALUES ('7597', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 17:08:55');
INSERT INTO `syslogs` VALUES ('7598', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 17:09:05');
INSERT INTO `syslogs` VALUES ('7599', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 17:12:42');
INSERT INTO `syslogs` VALUES ('7600', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 17:13:05');
INSERT INTO `syslogs` VALUES ('7601', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 17:22:30');
INSERT INTO `syslogs` VALUES ('7602', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 17:30:40');
INSERT INTO `syslogs` VALUES ('7603', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 17:30:54');
INSERT INTO `syslogs` VALUES ('7604', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 17:32:08');
INSERT INTO `syslogs` VALUES ('7605', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 17:32:14');
INSERT INTO `syslogs` VALUES ('7606', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 17:40:52');
INSERT INTO `syslogs` VALUES ('7607', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 17:41:19');
INSERT INTO `syslogs` VALUES ('7608', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 17:51:51');
INSERT INTO `syslogs` VALUES ('7609', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 17:52:19');
INSERT INTO `syslogs` VALUES ('7610', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 17:55:17');
INSERT INTO `syslogs` VALUES ('7611', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 17:55:34');
INSERT INTO `syslogs` VALUES ('7612', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-15 17:56:37');
INSERT INTO `syslogs` VALUES ('7613', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-15 17:56:45');
INSERT INTO `syslogs` VALUES ('7614', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 10:55:27');
INSERT INTO `syslogs` VALUES ('7615', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 11:09:08');
INSERT INTO `syslogs` VALUES ('7616', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 11:22:53');
INSERT INTO `syslogs` VALUES ('7617', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 11:25:45');
INSERT INTO `syslogs` VALUES ('7618', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 11:25:57');
INSERT INTO `syslogs` VALUES ('7619', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 11:26:52');
INSERT INTO `syslogs` VALUES ('7620', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 11:35:22');
INSERT INTO `syslogs` VALUES ('7621', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 11:35:31');
INSERT INTO `syslogs` VALUES ('7622', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 11:39:46');
INSERT INTO `syslogs` VALUES ('7623', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 11:39:50');
INSERT INTO `syslogs` VALUES ('7624', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 11:41:17');
INSERT INTO `syslogs` VALUES ('7625', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 11:41:17');
INSERT INTO `syslogs` VALUES ('7626', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 11:41:19');
INSERT INTO `syslogs` VALUES ('7627', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 11:51:46');
INSERT INTO `syslogs` VALUES ('7628', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 11:51:46');
INSERT INTO `syslogs` VALUES ('7629', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 11:53:05');
INSERT INTO `syslogs` VALUES ('7630', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 14:24:35');
INSERT INTO `syslogs` VALUES ('7631', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 14:36:09');
INSERT INTO `syslogs` VALUES ('7632', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 14:36:09');
INSERT INTO `syslogs` VALUES ('7633', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 14:36:12');
INSERT INTO `syslogs` VALUES ('7634', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 14:36:20');
INSERT INTO `syslogs` VALUES ('7635', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 14:41:46');
INSERT INTO `syslogs` VALUES ('7636', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 14:42:01');
INSERT INTO `syslogs` VALUES ('7637', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 14:42:09');
INSERT INTO `syslogs` VALUES ('7638', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 14:53:11');
INSERT INTO `syslogs` VALUES ('7639', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 14:53:29');
INSERT INTO `syslogs` VALUES ('7640', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 14:53:29');
INSERT INTO `syslogs` VALUES ('7641', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 14:53:33');
INSERT INTO `syslogs` VALUES ('7642', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 14:54:03');
INSERT INTO `syslogs` VALUES ('7643', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 14:54:03');
INSERT INTO `syslogs` VALUES ('7644', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 14:54:05');
INSERT INTO `syslogs` VALUES ('7645', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:06:41');
INSERT INTO `syslogs` VALUES ('7646', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-18 15:10:08');
INSERT INTO `syslogs` VALUES ('7647', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:10:17');
INSERT INTO `syslogs` VALUES ('7648', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:13:07');
INSERT INTO `syslogs` VALUES ('7649', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-18 15:13:42');
INSERT INTO `syslogs` VALUES ('7650', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:13:54');
INSERT INTO `syslogs` VALUES ('7651', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:14:21');
INSERT INTO `syslogs` VALUES ('7652', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-18 15:14:29');
INSERT INTO `syslogs` VALUES ('7653', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:14:37');
INSERT INTO `syslogs` VALUES ('7654', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:19:43');
INSERT INTO `syslogs` VALUES ('7655', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 15:19:43');
INSERT INTO `syslogs` VALUES ('7656', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:19:46');
INSERT INTO `syslogs` VALUES ('7657', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 15:19:56');
INSERT INTO `syslogs` VALUES ('7658', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-18 15:19:59');
INSERT INTO `syslogs` VALUES ('7659', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:20:08');
INSERT INTO `syslogs` VALUES ('7660', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:24:20');
INSERT INTO `syslogs` VALUES ('7661', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:30:01');
INSERT INTO `syslogs` VALUES ('7662', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 15:35:04');
INSERT INTO `syslogs` VALUES ('7663', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:43:06');
INSERT INTO `syslogs` VALUES ('7664', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:44:50');
INSERT INTO `syslogs` VALUES ('7665', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:49:40');
INSERT INTO `syslogs` VALUES ('7666', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 15:59:13');
INSERT INTO `syslogs` VALUES ('7667', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:59:21');
INSERT INTO `syslogs` VALUES ('7668', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 15:59:55');
INSERT INTO `syslogs` VALUES ('7669', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 16:02:26');
INSERT INTO `syslogs` VALUES ('7670', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 16:02:38');
INSERT INTO `syslogs` VALUES ('7671', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 16:05:37');
INSERT INTO `syslogs` VALUES ('7672', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 16:48:49');
INSERT INTO `syslogs` VALUES ('7673', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 16:50:11');
INSERT INTO `syslogs` VALUES ('7674', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 16:53:18');
INSERT INTO `syslogs` VALUES ('7675', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 16:57:19');
INSERT INTO `syslogs` VALUES ('7676', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 17:21:07');
INSERT INTO `syslogs` VALUES ('7677', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 17:50:16');
INSERT INTO `syslogs` VALUES ('7678', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 17:51:09');
INSERT INTO `syslogs` VALUES ('7679', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 17:51:17');
INSERT INTO `syslogs` VALUES ('7680', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 17:56:03');
INSERT INTO `syslogs` VALUES ('7681', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-18 17:56:03');
INSERT INTO `syslogs` VALUES ('7682', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-18 17:56:38');
INSERT INTO `syslogs` VALUES ('7683', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-18 17:56:44');
INSERT INTO `syslogs` VALUES ('7684', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-19 9:25:13');
INSERT INTO `syslogs` VALUES ('7685', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-19 10:16:19');
INSERT INTO `syslogs` VALUES ('7686', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-19 10:16:27');
INSERT INTO `syslogs` VALUES ('7687', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-19 11:01:13');
INSERT INTO `syslogs` VALUES ('7688', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-19 11:01:20');
INSERT INTO `syslogs` VALUES ('7689', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-19 11:09:14');
INSERT INTO `syslogs` VALUES ('7690', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-19 14:14:50');
INSERT INTO `syslogs` VALUES ('7691', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 10:01:23');
INSERT INTO `syslogs` VALUES ('7692', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-20 10:10:58');
INSERT INTO `syslogs` VALUES ('7693', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 10:11:09');
INSERT INTO `syslogs` VALUES ('7694', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 10:15:36');
INSERT INTO `syslogs` VALUES ('7695', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 10:35:40');
INSERT INTO `syslogs` VALUES ('7696', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-20 10:42:09');
INSERT INTO `syslogs` VALUES ('7697', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 10:42:37');
INSERT INTO `syslogs` VALUES ('7698', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 10:46:13');
INSERT INTO `syslogs` VALUES ('7699', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-20 10:49:15');
INSERT INTO `syslogs` VALUES ('7700', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-20 10:49:47');
INSERT INTO `syslogs` VALUES ('7701', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-8-20 10:49:54');
INSERT INTO `syslogs` VALUES ('7702', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-20 10:50:05');
INSERT INTO `syslogs` VALUES ('7703', 'login', null, '192.168.30.137', 'fail', 'unknow user:nulllogin to system', '2014-8-20 10:48:38');
INSERT INTO `syslogs` VALUES ('7704', 'login', 'admin', '192.168.30.137', 'success', 'login to system', '2014-8-20 10:48:54');
INSERT INTO `syslogs` VALUES ('7705', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 11:05:57');
INSERT INTO `syslogs` VALUES ('7706', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-20 11:10:48');
INSERT INTO `syslogs` VALUES ('7707', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 11:25:16');
INSERT INTO `syslogs` VALUES ('7708', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 11:31:33');
INSERT INTO `syslogs` VALUES ('7709', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-8-20 11:45:27');
INSERT INTO `syslogs` VALUES ('7710', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-20 11:45:34');
INSERT INTO `syslogs` VALUES ('7711', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 11:48:08');
INSERT INTO `syslogs` VALUES ('7712', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 12:02:33');
INSERT INTO `syslogs` VALUES ('7713', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-20 14:02:06');
INSERT INTO `syslogs` VALUES ('7714', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 14:02:17');
INSERT INTO `syslogs` VALUES ('7715', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-20 14:12:18');
INSERT INTO `syslogs` VALUES ('7716', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 14:12:26');
INSERT INTO `syslogs` VALUES ('7717', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-8-20 14:34:09');
INSERT INTO `syslogs` VALUES ('7718', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-20 14:36:27');
INSERT INTO `syslogs` VALUES ('7719', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-20 14:36:37');
INSERT INTO `syslogs` VALUES ('7720', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 14:38:46');
INSERT INTO `syslogs` VALUES ('7721', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 14:40:05');
INSERT INTO `syslogs` VALUES ('7722', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 14:40:47');
INSERT INTO `syslogs` VALUES ('7723', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 14:47:46');
INSERT INTO `syslogs` VALUES ('7724', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 15:08:06');
INSERT INTO `syslogs` VALUES ('7725', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-20 15:08:06');
INSERT INTO `syslogs` VALUES ('7726', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 15:08:20');
INSERT INTO `syslogs` VALUES ('7727', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-20 15:39:31');
INSERT INTO `syslogs` VALUES ('7728', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 15:39:38');
INSERT INTO `syslogs` VALUES ('7729', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 15:40:00');
INSERT INTO `syslogs` VALUES ('7730', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-20 15:57:02');
INSERT INTO `syslogs` VALUES ('7731', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-8-20 15:57:02');
INSERT INTO `syslogs` VALUES ('7732', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-20 15:57:15');
INSERT INTO `syslogs` VALUES ('7733', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 16:06:04');
INSERT INTO `syslogs` VALUES ('7734', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 16:07:27');
INSERT INTO `syslogs` VALUES ('7735', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 16:07:36');
INSERT INTO `syslogs` VALUES ('7736', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-20 16:07:36');
INSERT INTO `syslogs` VALUES ('7737', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 16:07:54');
INSERT INTO `syslogs` VALUES ('7738', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 16:16:14');
INSERT INTO `syslogs` VALUES ('7739', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-8-20 16:33:59');
INSERT INTO `syslogs` VALUES ('7740', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-20 16:34:06');
INSERT INTO `syslogs` VALUES ('7741', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-20 16:34:26');
INSERT INTO `syslogs` VALUES ('7742', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 16:34:35');
INSERT INTO `syslogs` VALUES ('7743', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 16:41:59');
INSERT INTO `syslogs` VALUES ('7744', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 16:45:52');
INSERT INTO `syslogs` VALUES ('7745', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-20 16:57:35');
INSERT INTO `syslogs` VALUES ('7746', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 16:57:43');
INSERT INTO `syslogs` VALUES ('7747', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-20 17:01:07');
INSERT INTO `syslogs` VALUES ('7748', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 17:01:14');
INSERT INTO `syslogs` VALUES ('7749', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-20 17:03:56');
INSERT INTO `syslogs` VALUES ('7750', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 17:04:02');
INSERT INTO `syslogs` VALUES ('7751', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 17:06:52');
INSERT INTO `syslogs` VALUES ('7752', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 17:09:27');
INSERT INTO `syslogs` VALUES ('7753', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 17:17:14');
INSERT INTO `syslogs` VALUES ('7754', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-20 17:53:41');
INSERT INTO `syslogs` VALUES ('7755', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-20 17:59:24');
INSERT INTO `syslogs` VALUES ('7756', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 17:59:37');
INSERT INTO `syslogs` VALUES ('7757', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-20 19:18:54');
INSERT INTO `syslogs` VALUES ('7758', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 19:19:02');
INSERT INTO `syslogs` VALUES ('7759', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 19:20:03');
INSERT INTO `syslogs` VALUES ('7760', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-20 19:38:34');
INSERT INTO `syslogs` VALUES ('7761', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-20 19:39:17');
INSERT INTO `syslogs` VALUES ('7762', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 8:42:07');
INSERT INTO `syslogs` VALUES ('7763', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 9:06:54');
INSERT INTO `syslogs` VALUES ('7764', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 9:15:14');
INSERT INTO `syslogs` VALUES ('7765', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 9:17:04');
INSERT INTO `syslogs` VALUES ('7766', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 9:20:30');
INSERT INTO `syslogs` VALUES ('7767', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 9:55:03');
INSERT INTO `syslogs` VALUES ('7768', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 9:59:03');
INSERT INTO `syslogs` VALUES ('7769', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-21 10:02:54');
INSERT INTO `syslogs` VALUES ('7770', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:02:00');
INSERT INTO `syslogs` VALUES ('7771', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-21 10:03:05');
INSERT INTO `syslogs` VALUES ('7772', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:10:18');
INSERT INTO `syslogs` VALUES ('7773', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:10:52');
INSERT INTO `syslogs` VALUES ('7774', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:11:50');
INSERT INTO `syslogs` VALUES ('7775', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:15:31');
INSERT INTO `syslogs` VALUES ('7776', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 10:17:26');
INSERT INTO `syslogs` VALUES ('7777', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:17:36');
INSERT INTO `syslogs` VALUES ('7778', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 10:18:46');
INSERT INTO `syslogs` VALUES ('7779', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:21:01');
INSERT INTO `syslogs` VALUES ('7780', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-21 10:22:01');
INSERT INTO `syslogs` VALUES ('7781', 'login', 'zous', '0:0:0:0:0:0:0:1', 'fail', 'unknow user:zouslogin to system', '2014-8-21 10:22:09');
INSERT INTO `syslogs` VALUES ('7782', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:22:17');
INSERT INTO `syslogs` VALUES ('7783', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 10:22:12');
INSERT INTO `syslogs` VALUES ('7784', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:22:42');
INSERT INTO `syslogs` VALUES ('7785', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:28:53');
INSERT INTO `syslogs` VALUES ('7786', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:33:59');
INSERT INTO `syslogs` VALUES ('7787', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:41:23');
INSERT INTO `syslogs` VALUES ('7788', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:48:30');
INSERT INTO `syslogs` VALUES ('7789', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:56:33');
INSERT INTO `syslogs` VALUES ('7790', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 10:59:59');
INSERT INTO `syslogs` VALUES ('7791', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 11:09:41');
INSERT INTO `syslogs` VALUES ('7792', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 11:13:57');
INSERT INTO `syslogs` VALUES ('7793', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 11:18:43');
INSERT INTO `syslogs` VALUES ('7794', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 11:24:22');
INSERT INTO `syslogs` VALUES ('7795', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 11:24:31');
INSERT INTO `syslogs` VALUES ('7796', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 11:29:39');
INSERT INTO `syslogs` VALUES ('7797', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 11:30:03');
INSERT INTO `syslogs` VALUES ('7798', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 11:30:33');
INSERT INTO `syslogs` VALUES ('7799', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 11:34:32');
INSERT INTO `syslogs` VALUES ('7800', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 11:38:29');
INSERT INTO `syslogs` VALUES ('7801', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 11:38:55');
INSERT INTO `syslogs` VALUES ('7802', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 11:42:41');
INSERT INTO `syslogs` VALUES ('7803', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 11:47:30');
INSERT INTO `syslogs` VALUES ('7804', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 11:52:31');
INSERT INTO `syslogs` VALUES ('7805', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 12:03:50');
INSERT INTO `syslogs` VALUES ('7806', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 12:08:19');
INSERT INTO `syslogs` VALUES ('7807', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 14:03:43');
INSERT INTO `syslogs` VALUES ('7808', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 14:03:55');
INSERT INTO `syslogs` VALUES ('7809', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-21 14:13:35');
INSERT INTO `syslogs` VALUES ('7810', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-21 14:14:39');
INSERT INTO `syslogs` VALUES ('7811', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-21 14:14:49');
INSERT INTO `syslogs` VALUES ('7812', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 14:16:09');
INSERT INTO `syslogs` VALUES ('7813', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 14:17:26');
INSERT INTO `syslogs` VALUES ('7814', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 14:17:38');
INSERT INTO `syslogs` VALUES ('7815', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 14:19:37');
INSERT INTO `syslogs` VALUES ('7816', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 14:19:50');
INSERT INTO `syslogs` VALUES ('7817', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-21 14:22:23');
INSERT INTO `syslogs` VALUES ('7818', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 14:26:34');
INSERT INTO `syslogs` VALUES ('7819', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 14:42:08');
INSERT INTO `syslogs` VALUES ('7820', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 15:15:57');
INSERT INTO `syslogs` VALUES ('7821', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 15:16:04');
INSERT INTO `syslogs` VALUES ('7822', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 15:16:29');
INSERT INTO `syslogs` VALUES ('7823', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 15:16:37');
INSERT INTO `syslogs` VALUES ('7824', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 15:17:59');
INSERT INTO `syslogs` VALUES ('7825', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 15:18:03');
INSERT INTO `syslogs` VALUES ('7826', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 15:18:33');
INSERT INTO `syslogs` VALUES ('7827', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 15:18:38');
INSERT INTO `syslogs` VALUES ('7828', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 15:27:38');
INSERT INTO `syslogs` VALUES ('7829', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 16:17:56');
INSERT INTO `syslogs` VALUES ('7830', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 16:35:30');
INSERT INTO `syslogs` VALUES ('7831', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 16:37:59');
INSERT INTO `syslogs` VALUES ('7832', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 16:38:08');
INSERT INTO `syslogs` VALUES ('7833', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 16:41:17');
INSERT INTO `syslogs` VALUES ('7834', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 16:41:27');
INSERT INTO `syslogs` VALUES ('7835', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 16:45:14');
INSERT INTO `syslogs` VALUES ('7836', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 16:45:21');
INSERT INTO `syslogs` VALUES ('7837', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-8-21 16:50:58');
INSERT INTO `syslogs` VALUES ('7838', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-21 16:51:14');
INSERT INTO `syslogs` VALUES ('7839', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-21 16:53:29');
INSERT INTO `syslogs` VALUES ('7840', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 16:52:44');
INSERT INTO `syslogs` VALUES ('7841', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 16:54:48');
INSERT INTO `syslogs` VALUES ('7842', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 16:54:53');
INSERT INTO `syslogs` VALUES ('7843', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 16:56:40');
INSERT INTO `syslogs` VALUES ('7844', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 16:56:44');
INSERT INTO `syslogs` VALUES ('7845', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 16:58:35');
INSERT INTO `syslogs` VALUES ('7846', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 16:58:40');
INSERT INTO `syslogs` VALUES ('7847', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-8-21 17:03:14');
INSERT INTO `syslogs` VALUES ('7848', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-21 17:06:29');
INSERT INTO `syslogs` VALUES ('7849', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 17:15:47');
INSERT INTO `syslogs` VALUES ('7850', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 17:18:11');
INSERT INTO `syslogs` VALUES ('7851', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 17:19:04');
INSERT INTO `syslogs` VALUES ('7852', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-21 17:20:07');
INSERT INTO `syslogs` VALUES ('7853', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-8-21 17:20:08');
INSERT INTO `syslogs` VALUES ('7854', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 17:20:51');
INSERT INTO `syslogs` VALUES ('7855', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 17:20:56');
INSERT INTO `syslogs` VALUES ('7856', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-21 17:23:12');
INSERT INTO `syslogs` VALUES ('7857', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 17:28:26');
INSERT INTO `syslogs` VALUES ('7858', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 17:37:31');
INSERT INTO `syslogs` VALUES ('7859', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 17:44:58');
INSERT INTO `syslogs` VALUES ('7860', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 17:45:02');
INSERT INTO `syslogs` VALUES ('7861', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 17:52:17');
INSERT INTO `syslogs` VALUES ('7862', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 17:58:32');
INSERT INTO `syslogs` VALUES ('7863', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:06:40');
INSERT INTO `syslogs` VALUES ('7864', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:14:11');
INSERT INTO `syslogs` VALUES ('7865', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 18:17:51');
INSERT INTO `syslogs` VALUES ('7866', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:17:59');
INSERT INTO `syslogs` VALUES ('7867', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:24:21');
INSERT INTO `syslogs` VALUES ('7868', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-21 18:26:45');
INSERT INTO `syslogs` VALUES ('7869', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 18:29:54');
INSERT INTO `syslogs` VALUES ('7870', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:29:59');
INSERT INTO `syslogs` VALUES ('7871', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 18:31:18');
INSERT INTO `syslogs` VALUES ('7872', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:31:22');
INSERT INTO `syslogs` VALUES ('7873', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 18:33:23');
INSERT INTO `syslogs` VALUES ('7874', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:33:28');
INSERT INTO `syslogs` VALUES ('7875', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 18:36:00');
INSERT INTO `syslogs` VALUES ('7876', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:36:04');
INSERT INTO `syslogs` VALUES ('7877', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:37:00');
INSERT INTO `syslogs` VALUES ('7878', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 18:37:31');
INSERT INTO `syslogs` VALUES ('7879', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:37:35');
INSERT INTO `syslogs` VALUES ('7880', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-21 18:38:58');
INSERT INTO `syslogs` VALUES ('7881', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 18:38:07');
INSERT INTO `syslogs` VALUES ('7882', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:38:12');
INSERT INTO `syslogs` VALUES ('7883', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:51:05');
INSERT INTO `syslogs` VALUES ('7884', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 18:56:41');
INSERT INTO `syslogs` VALUES ('7885', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:56:48');
INSERT INTO `syslogs` VALUES ('7886', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 18:59:37');
INSERT INTO `syslogs` VALUES ('7887', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 18:59:42');
INSERT INTO `syslogs` VALUES ('7888', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 19:02:10');
INSERT INTO `syslogs` VALUES ('7889', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 19:02:16');
INSERT INTO `syslogs` VALUES ('7890', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-21 19:05:45');
INSERT INTO `syslogs` VALUES ('7891', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-21 19:05:48');
INSERT INTO `syslogs` VALUES ('7892', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-21 19:09:33');
INSERT INTO `syslogs` VALUES ('7893', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-21 19:09:41');
INSERT INTO `syslogs` VALUES ('7894', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 9:17:03');
INSERT INTO `syslogs` VALUES ('7895', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 9:46:31');
INSERT INTO `syslogs` VALUES ('7896', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-22 9:50:41');
INSERT INTO `syslogs` VALUES ('7897', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 9:52:03');
INSERT INTO `syslogs` VALUES ('7898', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 10:07:40');
INSERT INTO `syslogs` VALUES ('7899', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 10:13:42');
INSERT INTO `syslogs` VALUES ('7900', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 10:20:05');
INSERT INTO `syslogs` VALUES ('7901', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 10:20:10');
INSERT INTO `syslogs` VALUES ('7902', 'login', null, '127.0.0.1', 'fail', 'unknow user:nulllogin to system', '2014-8-22 10:24:53');
INSERT INTO `syslogs` VALUES ('7903', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-22 10:25:02');
INSERT INTO `syslogs` VALUES ('7904', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 10:27:48');
INSERT INTO `syslogs` VALUES ('7905', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 10:27:57');
INSERT INTO `syslogs` VALUES ('7906', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 10:45:25');
INSERT INTO `syslogs` VALUES ('7907', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-22 10:56:58');
INSERT INTO `syslogs` VALUES ('7908', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 10:57:09');
INSERT INTO `syslogs` VALUES ('7909', 'logout', 'admin', '127.0.0.1', 'success', 'logout to system', '2014-8-22 11:12:01');
INSERT INTO `syslogs` VALUES ('7910', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-8-22 11:12:14');
INSERT INTO `syslogs` VALUES ('7911', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 11:11:43');
INSERT INTO `syslogs` VALUES ('7912', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 11:25:33');
INSERT INTO `syslogs` VALUES ('7913', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 11:39:55');
INSERT INTO `syslogs` VALUES ('7914', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 11:41:03');
INSERT INTO `syslogs` VALUES ('7915', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 11:41:10');
INSERT INTO `syslogs` VALUES ('7916', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 11:47:24');
INSERT INTO `syslogs` VALUES ('7917', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 11:49:28');
INSERT INTO `syslogs` VALUES ('7918', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 11:51:16');
INSERT INTO `syslogs` VALUES ('7919', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 11:53:24');
INSERT INTO `syslogs` VALUES ('7920', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 11:59:30');
INSERT INTO `syslogs` VALUES ('7921', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 11:59:37');
INSERT INTO `syslogs` VALUES ('7922', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 12:00:09');
INSERT INTO `syslogs` VALUES ('7923', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 12:06:10');
INSERT INTO `syslogs` VALUES ('7924', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 12:07:49');
INSERT INTO `syslogs` VALUES ('7925', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 12:07:57');
INSERT INTO `syslogs` VALUES ('7926', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 14:04:37');
INSERT INTO `syslogs` VALUES ('7927', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 14:07:31');
INSERT INTO `syslogs` VALUES ('7928', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 14:10:55');
INSERT INTO `syslogs` VALUES ('7929', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 14:16:13');
INSERT INTO `syslogs` VALUES ('7930', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-22 14:17:16');
INSERT INTO `syslogs` VALUES ('7931', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 14:17:24');
INSERT INTO `syslogs` VALUES ('7932', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 14:23:04');
INSERT INTO `syslogs` VALUES ('7933', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-22 14:33:39');
INSERT INTO `syslogs` VALUES ('7934', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 14:33:48');
INSERT INTO `syslogs` VALUES ('7935', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 14:38:38');
INSERT INTO `syslogs` VALUES ('7936', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 14:38:42');
INSERT INTO `syslogs` VALUES ('7937', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 14:43:09');
INSERT INTO `syslogs` VALUES ('7938', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 14:43:13');
INSERT INTO `syslogs` VALUES ('7939', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:08:50');
INSERT INTO `syslogs` VALUES ('7940', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:12:19');
INSERT INTO `syslogs` VALUES ('7941', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 15:21:49');
INSERT INTO `syslogs` VALUES ('7942', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:21:55');
INSERT INTO `syslogs` VALUES ('7943', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 15:22:19');
INSERT INTO `syslogs` VALUES ('7944', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:22:29');
INSERT INTO `syslogs` VALUES ('7945', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 15:23:25');
INSERT INTO `syslogs` VALUES ('7946', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:23:36');
INSERT INTO `syslogs` VALUES ('7947', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 15:24:28');
INSERT INTO `syslogs` VALUES ('7948', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:24:37');
INSERT INTO `syslogs` VALUES ('7949', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 15:26:15');
INSERT INTO `syslogs` VALUES ('7950', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:26:22');
INSERT INTO `syslogs` VALUES ('7951', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 15:25:27');
INSERT INTO `syslogs` VALUES ('7952', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:27:37');
INSERT INTO `syslogs` VALUES ('7953', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:35:20');
INSERT INTO `syslogs` VALUES ('7954', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 15:35:51');
INSERT INTO `syslogs` VALUES ('7955', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:36:02');
INSERT INTO `syslogs` VALUES ('7956', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:41:27');
INSERT INTO `syslogs` VALUES ('7957', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 15:43:08');
INSERT INTO `syslogs` VALUES ('7958', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:43:16');
INSERT INTO `syslogs` VALUES ('7959', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 15:47:22');
INSERT INTO `syslogs` VALUES ('7960', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:47:28');
INSERT INTO `syslogs` VALUES ('7961', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 15:52:36');
INSERT INTO `syslogs` VALUES ('7962', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 16:01:38');
INSERT INTO `syslogs` VALUES ('7963', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 16:06:50');
INSERT INTO `syslogs` VALUES ('7964', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 16:05:18');
INSERT INTO `syslogs` VALUES ('7965', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-22 16:10:27');
INSERT INTO `syslogs` VALUES ('7966', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 16:10:36');
INSERT INTO `syslogs` VALUES ('7967', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 16:17:02');
INSERT INTO `syslogs` VALUES ('7968', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 16:35:31');
INSERT INTO `syslogs` VALUES ('7969', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 16:40:18');
INSERT INTO `syslogs` VALUES ('7970', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 16:53:41');
INSERT INTO `syslogs` VALUES ('7971', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 17:05:26');
INSERT INTO `syslogs` VALUES ('7972', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 17:02:24');
INSERT INTO `syslogs` VALUES ('7973', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 17:05:33');
INSERT INTO `syslogs` VALUES ('7974', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 17:03:24');
INSERT INTO `syslogs` VALUES ('7975', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 17:06:46');
INSERT INTO `syslogs` VALUES ('7976', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 17:03:35');
INSERT INTO `syslogs` VALUES ('7977', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 17:06:56');
INSERT INTO `syslogs` VALUES ('7978', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 17:09:05');
INSERT INTO `syslogs` VALUES ('7979', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 17:09:25');
INSERT INTO `syslogs` VALUES ('7980', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 17:14:25');
INSERT INTO `syslogs` VALUES ('7981', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 17:20:06');
INSERT INTO `syslogs` VALUES ('7982', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 17:31:58');
INSERT INTO `syslogs` VALUES ('7983', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 18:25:15');
INSERT INTO `syslogs` VALUES ('7984', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 18:25:19');
INSERT INTO `syslogs` VALUES ('7985', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-22 18:35:00');
INSERT INTO `syslogs` VALUES ('7986', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 18:50:58');
INSERT INTO `syslogs` VALUES ('7987', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-22 18:51:24');
INSERT INTO `syslogs` VALUES ('7988', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-22 18:51:59');
INSERT INTO `syslogs` VALUES ('7989', 'login', 'admin', '192.168.1.112', 'success', 'login to system', '2014-8-24 21:59:35');
INSERT INTO `syslogs` VALUES ('7990', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 10:28:50');
INSERT INTO `syslogs` VALUES ('7991', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 10:33:18');
INSERT INTO `syslogs` VALUES ('7992', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 15:47:31');
INSERT INTO `syslogs` VALUES ('7993', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-25 15:47:46');
INSERT INTO `syslogs` VALUES ('7994', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 15:47:50');
INSERT INTO `syslogs` VALUES ('7995', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-25 15:51:23');
INSERT INTO `syslogs` VALUES ('7996', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 15:51:28');
INSERT INTO `syslogs` VALUES ('7997', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 15:51:32');
INSERT INTO `syslogs` VALUES ('7998', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-25 15:54:04');
INSERT INTO `syslogs` VALUES ('7999', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 15:59:36');
INSERT INTO `syslogs` VALUES ('8000', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 16:07:34');
INSERT INTO `syslogs` VALUES ('8001', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 16:08:02');
INSERT INTO `syslogs` VALUES ('8002', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-25 16:08:02');
INSERT INTO `syslogs` VALUES ('8003', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 16:08:07');
INSERT INTO `syslogs` VALUES ('8004', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-25 16:13:59');
INSERT INTO `syslogs` VALUES ('8005', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 16:14:02');
INSERT INTO `syslogs` VALUES ('8006', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-25 16:22:53');
INSERT INTO `syslogs` VALUES ('8007', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 16:22:56');
INSERT INTO `syslogs` VALUES ('8008', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-25 16:28:24');
INSERT INTO `syslogs` VALUES ('8009', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 16:28:32');
INSERT INTO `syslogs` VALUES ('8010', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-25 16:34:52');
INSERT INTO `syslogs` VALUES ('8011', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 16:34:55');
INSERT INTO `syslogs` VALUES ('8012', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-25 16:43:18');
INSERT INTO `syslogs` VALUES ('8013', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-25 16:43:18');
INSERT INTO `syslogs` VALUES ('8014', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 16:43:21');
INSERT INTO `syslogs` VALUES ('8015', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-25 16:44:50');
INSERT INTO `syslogs` VALUES ('8016', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 16:44:58');
INSERT INTO `syslogs` VALUES ('8017', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-25 16:51:46');
INSERT INTO `syslogs` VALUES ('8018', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-25 16:51:46');
INSERT INTO `syslogs` VALUES ('8019', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-25 16:51:50');
INSERT INTO `syslogs` VALUES ('8020', 'login', 'admin', '192.168.2.11', 'success', 'login to system', '2014-8-26 9:43:26');
INSERT INTO `syslogs` VALUES ('8021', 'login', 'admin', '192.168.20.234', 'success', 'login to system', '2014-8-26 14:06:45');
INSERT INTO `syslogs` VALUES ('8022', 'login', 'admin', '192.168.20.234', 'success', 'login to system', '2014-8-26 14:08:27');
INSERT INTO `syslogs` VALUES ('8023', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-26 14:09:40');
INSERT INTO `syslogs` VALUES ('8024', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 14:09:45');
INSERT INTO `syslogs` VALUES ('8025', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-26 14:11:34');
INSERT INTO `syslogs` VALUES ('8026', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 14:11:42');
INSERT INTO `syslogs` VALUES ('8027', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-26 14:12:20');
INSERT INTO `syslogs` VALUES ('8028', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-26 14:12:23');
INSERT INTO `syslogs` VALUES ('8029', 'login', null, '192.168.20.234', 'fail', 'unknow user:nulllogin to system', '2014-8-26 14:12:31');
INSERT INTO `syslogs` VALUES ('8030', 'login', 'admin', '192.168.20.234', 'success', 'login to system', '2014-8-26 14:12:38');
INSERT INTO `syslogs` VALUES ('8031', 'login', 'admin', '192.168.20.234', 'success', 'login to system', '2014-8-26 14:13:12');
INSERT INTO `syslogs` VALUES ('8032', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 15:55:57');
INSERT INTO `syslogs` VALUES ('8033', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-26 16:14:05');
INSERT INTO `syslogs` VALUES ('8034', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 16:14:11');
INSERT INTO `syslogs` VALUES ('8035', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-26 16:22:08');
INSERT INTO `syslogs` VALUES ('8036', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-26 16:22:22');
INSERT INTO `syslogs` VALUES ('8037', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 16:22:27');
INSERT INTO `syslogs` VALUES ('8038', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-26 16:23:15');
INSERT INTO `syslogs` VALUES ('8039', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 16:23:19');
INSERT INTO `syslogs` VALUES ('8040', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-26 16:25:34');
INSERT INTO `syslogs` VALUES ('8041', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 16:45:38');
INSERT INTO `syslogs` VALUES ('8042', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 17:09:41');
INSERT INTO `syslogs` VALUES ('8043', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 17:17:10');
INSERT INTO `syslogs` VALUES ('8044', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 17:22:18');
INSERT INTO `syslogs` VALUES ('8045', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 17:35:37');
INSERT INTO `syslogs` VALUES ('8046', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 17:48:02');
INSERT INTO `syslogs` VALUES ('8047', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-26 17:48:31');
INSERT INTO `syslogs` VALUES ('8048', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 17:53:11');
INSERT INTO `syslogs` VALUES ('8049', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-26 17:58:19');
INSERT INTO `syslogs` VALUES ('8050', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-26 17:58:26');
INSERT INTO `syslogs` VALUES ('8051', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-26 18:06:04');
INSERT INTO `syslogs` VALUES ('8052', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-27 9:42:05');
INSERT INTO `syslogs` VALUES ('8053', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-27 9:45:07');
INSERT INTO `syslogs` VALUES ('8054', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-27 9:45:11');
INSERT INTO `syslogs` VALUES ('8055', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-8-27 9:46:20');
INSERT INTO `syslogs` VALUES ('8056', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-27 9:46:25');
INSERT INTO `syslogs` VALUES ('8057', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-27 9:50:45');
INSERT INTO `syslogs` VALUES ('8058', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-27 9:50:51');
INSERT INTO `syslogs` VALUES ('8059', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-27 9:52:20');
INSERT INTO `syslogs` VALUES ('8060', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-27 9:52:41');
INSERT INTO `syslogs` VALUES ('8061', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-28 18:31:20');
INSERT INTO `syslogs` VALUES ('8062', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-28 18:32:56');
INSERT INTO `syslogs` VALUES ('8063', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-28 18:35:20');
INSERT INTO `syslogs` VALUES ('8064', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-28 18:37:08');
INSERT INTO `syslogs` VALUES ('8065', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-28 18:37:09');
INSERT INTO `syslogs` VALUES ('8066', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-28 18:38:25');
INSERT INTO `syslogs` VALUES ('8067', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-28 18:38:32');
INSERT INTO `syslogs` VALUES ('8068', 'logout', 'user', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-28 18:38:35');
INSERT INTO `syslogs` VALUES ('8069', 'login', 'center', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-28 18:38:41');
INSERT INTO `syslogs` VALUES ('8070', 'logout', 'center', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-28 18:38:54');
INSERT INTO `syslogs` VALUES ('8071', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-8-28 18:39:00');
INSERT INTO `syslogs` VALUES ('8072', 'logout', 'admin', '0:0:0:0:0:0:0:1', 'success', 'logout to system', '2014-8-28 18:39:10');
INSERT INTO `syslogs` VALUES ('8073', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:32:21');
INSERT INTO `syslogs` VALUES ('8074', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:33:10');
INSERT INTO `syslogs` VALUES ('8075', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:33:30');
INSERT INTO `syslogs` VALUES ('8076', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:33:45');
INSERT INTO `syslogs` VALUES ('8077', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:33:54');
INSERT INTO `syslogs` VALUES ('8078', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:34:03');
INSERT INTO `syslogs` VALUES ('8079', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:34:12');
INSERT INTO `syslogs` VALUES ('8080', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:34:15');
INSERT INTO `syslogs` VALUES ('8081', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:37:41');
INSERT INTO `syslogs` VALUES ('8082', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:37:44');
INSERT INTO `syslogs` VALUES ('8083', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:40:14');
INSERT INTO `syslogs` VALUES ('8084', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:40:17');
INSERT INTO `syslogs` VALUES ('8085', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:40:30');
INSERT INTO `syslogs` VALUES ('8086', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:41:06');
INSERT INTO `syslogs` VALUES ('8087', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:41:08');
INSERT INTO `syslogs` VALUES ('8088', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:41:34');
INSERT INTO `syslogs` VALUES ('8089', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:41:39');
INSERT INTO `syslogs` VALUES ('8090', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:41:52');
INSERT INTO `syslogs` VALUES ('8091', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:42:45');
INSERT INTO `syslogs` VALUES ('8092', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:45:40');
INSERT INTO `syslogs` VALUES ('8093', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:45:50');
INSERT INTO `syslogs` VALUES ('8094', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:45:58');
INSERT INTO `syslogs` VALUES ('8095', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:46:14');
INSERT INTO `syslogs` VALUES ('8096', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:47:11');
INSERT INTO `syslogs` VALUES ('8097', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:47:25');
INSERT INTO `syslogs` VALUES ('8098', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:47:34');
INSERT INTO `syslogs` VALUES ('8099', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:47:43');
INSERT INTO `syslogs` VALUES ('8100', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:48:40');
INSERT INTO `syslogs` VALUES ('8101', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:48:51');
INSERT INTO `syslogs` VALUES ('8102', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:48:59');
INSERT INTO `syslogs` VALUES ('8103', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:49:08');
INSERT INTO `syslogs` VALUES ('8104', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:49:17');
INSERT INTO `syslogs` VALUES ('8105', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:49:51');
INSERT INTO `syslogs` VALUES ('8106', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:50:03');
INSERT INTO `syslogs` VALUES ('8107', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:50:24');
INSERT INTO `syslogs` VALUES ('8108', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:50:40');
INSERT INTO `syslogs` VALUES ('8109', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:52:28');
INSERT INTO `syslogs` VALUES ('8110', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:53:07');
INSERT INTO `syslogs` VALUES ('8111', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:53:14');
INSERT INTO `syslogs` VALUES ('8112', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:53:29');
INSERT INTO `syslogs` VALUES ('8113', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:54:06');
INSERT INTO `syslogs` VALUES ('8114', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:54:27');
INSERT INTO `syslogs` VALUES ('8115', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:54:30');
INSERT INTO `syslogs` VALUES ('8116', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:54:41');
INSERT INTO `syslogs` VALUES ('8117', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:55:06');
INSERT INTO `syslogs` VALUES ('8118', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:55:11');
INSERT INTO `syslogs` VALUES ('8119', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:55:23');
INSERT INTO `syslogs` VALUES ('8120', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:55:29');
INSERT INTO `syslogs` VALUES ('8121', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:55:37');
INSERT INTO `syslogs` VALUES ('8122', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:55:45');
INSERT INTO `syslogs` VALUES ('8123', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:56:00');
INSERT INTO `syslogs` VALUES ('8124', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:56:27');
INSERT INTO `syslogs` VALUES ('8125', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:58:09');
INSERT INTO `syslogs` VALUES ('8126', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:58:32');
INSERT INTO `syslogs` VALUES ('8127', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:59:26');
INSERT INTO `syslogs` VALUES ('8128', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:59:47');
INSERT INTO `syslogs` VALUES ('8129', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 11:59:54');
INSERT INTO `syslogs` VALUES ('8130', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 12:00:13');
INSERT INTO `syslogs` VALUES ('8131', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 12:00:18');
INSERT INTO `syslogs` VALUES ('8132', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 12:00:35');
INSERT INTO `syslogs` VALUES ('8133', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 12:00:38');
INSERT INTO `syslogs` VALUES ('8134', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 12:00:40');
INSERT INTO `syslogs` VALUES ('8135', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 12:00:44');
INSERT INTO `syslogs` VALUES ('8136', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 12:01:09');
INSERT INTO `syslogs` VALUES ('8137', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 12:02:06');
INSERT INTO `syslogs` VALUES ('8138', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 12:02:14');
INSERT INTO `syslogs` VALUES ('8139', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 13:28:04');
INSERT INTO `syslogs` VALUES ('8140', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 13:28:09');
INSERT INTO `syslogs` VALUES ('8141', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 13:37:31');
INSERT INTO `syslogs` VALUES ('8142', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-17 13:37:45');
INSERT INTO `syslogs` VALUES ('8143', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 11:59:15');
INSERT INTO `syslogs` VALUES ('8144', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 11:59:49');
INSERT INTO `syslogs` VALUES ('8145', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-9-22 11:59:56');
INSERT INTO `syslogs` VALUES ('8146', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:00:02');
INSERT INTO `syslogs` VALUES ('8147', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:00:53');
INSERT INTO `syslogs` VALUES ('8148', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:01:17');
INSERT INTO `syslogs` VALUES ('8149', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:01:59');
INSERT INTO `syslogs` VALUES ('8150', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:02:25');
INSERT INTO `syslogs` VALUES ('8151', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:03:22');
INSERT INTO `syslogs` VALUES ('8152', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:03:52');
INSERT INTO `syslogs` VALUES ('8153', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:04:10');
INSERT INTO `syslogs` VALUES ('8154', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:04:33');
INSERT INTO `syslogs` VALUES ('8155', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:04:41');
INSERT INTO `syslogs` VALUES ('8156', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:04:54');
INSERT INTO `syslogs` VALUES ('8157', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:05:33');
INSERT INTO `syslogs` VALUES ('8158', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:05:43');
INSERT INTO `syslogs` VALUES ('8159', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:06:51');
INSERT INTO `syslogs` VALUES ('8160', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:07:49');
INSERT INTO `syslogs` VALUES ('8161', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:08:37');
INSERT INTO `syslogs` VALUES ('8162', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:09:50');
INSERT INTO `syslogs` VALUES ('8163', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:10:16');
INSERT INTO `syslogs` VALUES ('8164', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:11:33');
INSERT INTO `syslogs` VALUES ('8165', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:11:59');
INSERT INTO `syslogs` VALUES ('8166', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:12:25');
INSERT INTO `syslogs` VALUES ('8167', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:13:11');
INSERT INTO `syslogs` VALUES ('8168', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:14:09');
INSERT INTO `syslogs` VALUES ('8169', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:15:19');
INSERT INTO `syslogs` VALUES ('8170', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:15:31');
INSERT INTO `syslogs` VALUES ('8171', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:15:51');
INSERT INTO `syslogs` VALUES ('8172', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:16:01');
INSERT INTO `syslogs` VALUES ('8173', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:16:26');
INSERT INTO `syslogs` VALUES ('8174', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:16:38');
INSERT INTO `syslogs` VALUES ('8175', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:17:03');
INSERT INTO `syslogs` VALUES ('8176', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:17:18');
INSERT INTO `syslogs` VALUES ('8177', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:19:06');
INSERT INTO `syslogs` VALUES ('8178', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:19:22');
INSERT INTO `syslogs` VALUES ('8179', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:19:57');
INSERT INTO `syslogs` VALUES ('8180', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:20:02');
INSERT INTO `syslogs` VALUES ('8181', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-22 12:20:53');
INSERT INTO `syslogs` VALUES ('8182', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 10:12:30');
INSERT INTO `syslogs` VALUES ('8183', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-9-30 10:49:40');
INSERT INTO `syslogs` VALUES ('8184', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 10:49:45');
INSERT INTO `syslogs` VALUES ('8185', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-9-30 11:14:07');
INSERT INTO `syslogs` VALUES ('8186', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 11:14:12');
INSERT INTO `syslogs` VALUES ('8187', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-9-30 11:16:34');
INSERT INTO `syslogs` VALUES ('8188', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 11:16:39');
INSERT INTO `syslogs` VALUES ('8189', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 11:21:58');
INSERT INTO `syslogs` VALUES ('8190', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 14:43:06');
INSERT INTO `syslogs` VALUES ('8191', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-9-30 14:49:51');
INSERT INTO `syslogs` VALUES ('8192', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 14:49:57');
INSERT INTO `syslogs` VALUES ('8193', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 14:52:41');
INSERT INTO `syslogs` VALUES ('8194', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 14:58:52');
INSERT INTO `syslogs` VALUES ('8195', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-9-30 15:13:16');
INSERT INTO `syslogs` VALUES ('8196', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 15:13:21');
INSERT INTO `syslogs` VALUES ('8197', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 15:20:18');
INSERT INTO `syslogs` VALUES ('8198', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 15:24:39');
INSERT INTO `syslogs` VALUES ('8199', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 15:32:16');
INSERT INTO `syslogs` VALUES ('8200', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 15:34:25');
INSERT INTO `syslogs` VALUES ('8201', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-9-30 15:59:00');
INSERT INTO `syslogs` VALUES ('8202', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-9-30 15:59:07');
INSERT INTO `syslogs` VALUES ('8203', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 9:57:12');
INSERT INTO `syslogs` VALUES ('8204', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 10:08:20');
INSERT INTO `syslogs` VALUES ('8205', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 10:44:08');
INSERT INTO `syslogs` VALUES ('8206', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:29:04');
INSERT INTO `syslogs` VALUES ('8207', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:30:34');
INSERT INTO `syslogs` VALUES ('8208', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:32:17');
INSERT INTO `syslogs` VALUES ('8209', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:33:02');
INSERT INTO `syslogs` VALUES ('8210', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:33:04');
INSERT INTO `syslogs` VALUES ('8211', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:33:26');
INSERT INTO `syslogs` VALUES ('8212', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:35:51');
INSERT INTO `syslogs` VALUES ('8213', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:36:18');
INSERT INTO `syslogs` VALUES ('8214', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:36:33');
INSERT INTO `syslogs` VALUES ('8215', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:37:00');
INSERT INTO `syslogs` VALUES ('8216', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:38:04');
INSERT INTO `syslogs` VALUES ('8217', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:38:19');
INSERT INTO `syslogs` VALUES ('8218', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:39:29');
INSERT INTO `syslogs` VALUES ('8219', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:40:22');
INSERT INTO `syslogs` VALUES ('8220', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:40:36');
INSERT INTO `syslogs` VALUES ('8221', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:43:45');
INSERT INTO `syslogs` VALUES ('8222', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:44:09');
INSERT INTO `syslogs` VALUES ('8223', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:46:57');
INSERT INTO `syslogs` VALUES ('8224', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:47:44');
INSERT INTO `syslogs` VALUES ('8225', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:48:28');
INSERT INTO `syslogs` VALUES ('8226', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:51:35');
INSERT INTO `syslogs` VALUES ('8227', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:52:00');
INSERT INTO `syslogs` VALUES ('8228', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:52:21');
INSERT INTO `syslogs` VALUES ('8229', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:53:05');
INSERT INTO `syslogs` VALUES ('8230', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:54:53');
INSERT INTO `syslogs` VALUES ('8231', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:55:19');
INSERT INTO `syslogs` VALUES ('8232', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:55:22');
INSERT INTO `syslogs` VALUES ('8233', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:56:34');
INSERT INTO `syslogs` VALUES ('8234', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 15:56:50');
INSERT INTO `syslogs` VALUES ('8235', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:00:36');
INSERT INTO `syslogs` VALUES ('8236', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:00:39');
INSERT INTO `syslogs` VALUES ('8237', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:00:53');
INSERT INTO `syslogs` VALUES ('8238', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:00:55');
INSERT INTO `syslogs` VALUES ('8239', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:01:33');
INSERT INTO `syslogs` VALUES ('8240', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:01:44');
INSERT INTO `syslogs` VALUES ('8241', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:01:52');
INSERT INTO `syslogs` VALUES ('8242', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:01:57');
INSERT INTO `syslogs` VALUES ('8243', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:02:09');
INSERT INTO `syslogs` VALUES ('8244', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:02:17');
INSERT INTO `syslogs` VALUES ('8245', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:02:25');
INSERT INTO `syslogs` VALUES ('8246', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:02:36');
INSERT INTO `syslogs` VALUES ('8247', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:03:56');
INSERT INTO `syslogs` VALUES ('8248', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:04:13');
INSERT INTO `syslogs` VALUES ('8249', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:04:33');
INSERT INTO `syslogs` VALUES ('8250', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:05:07');
INSERT INTO `syslogs` VALUES ('8251', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:05:24');
INSERT INTO `syslogs` VALUES ('8252', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:05:27');
INSERT INTO `syslogs` VALUES ('8253', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:06:14');
INSERT INTO `syslogs` VALUES ('8254', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:06:26');
INSERT INTO `syslogs` VALUES ('8255', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:06:29');
INSERT INTO `syslogs` VALUES ('8256', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:08:15');
INSERT INTO `syslogs` VALUES ('8257', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:09:32');
INSERT INTO `syslogs` VALUES ('8258', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:09:45');
INSERT INTO `syslogs` VALUES ('8259', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:09:52');
INSERT INTO `syslogs` VALUES ('8260', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:10:01');
INSERT INTO `syslogs` VALUES ('8261', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:10:04');
INSERT INTO `syslogs` VALUES ('8262', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:10:07');
INSERT INTO `syslogs` VALUES ('8263', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:10:25');
INSERT INTO `syslogs` VALUES ('8264', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:10:40');
INSERT INTO `syslogs` VALUES ('8265', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:10:43');
INSERT INTO `syslogs` VALUES ('8266', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:10:53');
INSERT INTO `syslogs` VALUES ('8267', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:11:02');
INSERT INTO `syslogs` VALUES ('8268', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:11:16');
INSERT INTO `syslogs` VALUES ('8269', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:31:12');
INSERT INTO `syslogs` VALUES ('8270', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:34:26');
INSERT INTO `syslogs` VALUES ('8271', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:34:29');
INSERT INTO `syslogs` VALUES ('8272', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:35:54');
INSERT INTO `syslogs` VALUES ('8273', 'login', 'admin', '0:0:0:0:0:0:0:1', 'fail', 'user:adminlogin to system', '2014-10-11 16:36:06');
INSERT INTO `syslogs` VALUES ('8274', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:36:18');
INSERT INTO `syslogs` VALUES ('8275', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:36:49');
INSERT INTO `syslogs` VALUES ('8276', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:37:28');
INSERT INTO `syslogs` VALUES ('8277', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:39:06');
INSERT INTO `syslogs` VALUES ('8278', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:39:35');
INSERT INTO `syslogs` VALUES ('8279', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:40:04');
INSERT INTO `syslogs` VALUES ('8280', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:40:33');
INSERT INTO `syslogs` VALUES ('8281', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:41:17');
INSERT INTO `syslogs` VALUES ('8282', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:41:56');
INSERT INTO `syslogs` VALUES ('8283', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:42:31');
INSERT INTO `syslogs` VALUES ('8284', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:42:56');
INSERT INTO `syslogs` VALUES ('8285', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:43:23');
INSERT INTO `syslogs` VALUES ('8286', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:43:51');
INSERT INTO `syslogs` VALUES ('8287', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:45:25');
INSERT INTO `syslogs` VALUES ('8288', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:45:57');
INSERT INTO `syslogs` VALUES ('8289', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:46:17');
INSERT INTO `syslogs` VALUES ('8290', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:46:45');
INSERT INTO `syslogs` VALUES ('8291', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:47:17');
INSERT INTO `syslogs` VALUES ('8292', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:48:39');
INSERT INTO `syslogs` VALUES ('8293', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:48:52');
INSERT INTO `syslogs` VALUES ('8294', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:50:11');
INSERT INTO `syslogs` VALUES ('8295', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:50:33');
INSERT INTO `syslogs` VALUES ('8296', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:50:52');
INSERT INTO `syslogs` VALUES ('8297', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 16:51:26');
INSERT INTO `syslogs` VALUES ('8298', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:00:28');
INSERT INTO `syslogs` VALUES ('8299', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:05:54');
INSERT INTO `syslogs` VALUES ('8300', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:06:46');
INSERT INTO `syslogs` VALUES ('8301', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:08:29');
INSERT INTO `syslogs` VALUES ('8302', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:10:02');
INSERT INTO `syslogs` VALUES ('8303', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:11:12');
INSERT INTO `syslogs` VALUES ('8304', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:12:43');
INSERT INTO `syslogs` VALUES ('8305', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:15:34');
INSERT INTO `syslogs` VALUES ('8306', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:16:33');
INSERT INTO `syslogs` VALUES ('8307', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:17:02');
INSERT INTO `syslogs` VALUES ('8308', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:17:22');
INSERT INTO `syslogs` VALUES ('8309', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:17:31');
INSERT INTO `syslogs` VALUES ('8310', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:18:07');
INSERT INTO `syslogs` VALUES ('8311', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:18:50');
INSERT INTO `syslogs` VALUES ('8312', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:18:58');
INSERT INTO `syslogs` VALUES ('8313', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:25:00');
INSERT INTO `syslogs` VALUES ('8314', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:26:24');
INSERT INTO `syslogs` VALUES ('8315', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:27:25');
INSERT INTO `syslogs` VALUES ('8316', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:28:01');
INSERT INTO `syslogs` VALUES ('8317', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:28:15');
INSERT INTO `syslogs` VALUES ('8318', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:28:55');
INSERT INTO `syslogs` VALUES ('8319', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:29:40');
INSERT INTO `syslogs` VALUES ('8320', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:29:53');
INSERT INTO `syslogs` VALUES ('8321', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:30:02');
INSERT INTO `syslogs` VALUES ('8322', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:30:31');
INSERT INTO `syslogs` VALUES ('8323', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:31:43');
INSERT INTO `syslogs` VALUES ('8324', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:31:57');
INSERT INTO `syslogs` VALUES ('8325', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:32:12');
INSERT INTO `syslogs` VALUES ('8326', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:32:47');
INSERT INTO `syslogs` VALUES ('8327', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:32:50');
INSERT INTO `syslogs` VALUES ('8328', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:33:02');
INSERT INTO `syslogs` VALUES ('8329', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:33:40');
INSERT INTO `syslogs` VALUES ('8330', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:33:49');
INSERT INTO `syslogs` VALUES ('8331', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:34:41');
INSERT INTO `syslogs` VALUES ('8332', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:35:04');
INSERT INTO `syslogs` VALUES ('8333', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:35:35');
INSERT INTO `syslogs` VALUES ('8334', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:36:57');
INSERT INTO `syslogs` VALUES ('8335', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:37:20');
INSERT INTO `syslogs` VALUES ('8336', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:37:34');
INSERT INTO `syslogs` VALUES ('8337', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:37:54');
INSERT INTO `syslogs` VALUES ('8338', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:38:23');
INSERT INTO `syslogs` VALUES ('8339', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:38:41');
INSERT INTO `syslogs` VALUES ('8340', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:40:20');
INSERT INTO `syslogs` VALUES ('8341', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:41:57');
INSERT INTO `syslogs` VALUES ('8342', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:42:31');
INSERT INTO `syslogs` VALUES ('8343', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:42:51');
INSERT INTO `syslogs` VALUES ('8344', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:43:06');
INSERT INTO `syslogs` VALUES ('8345', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:44:06');
INSERT INTO `syslogs` VALUES ('8346', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:45:02');
INSERT INTO `syslogs` VALUES ('8347', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:46:05');
INSERT INTO `syslogs` VALUES ('8348', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:46:18');
INSERT INTO `syslogs` VALUES ('8349', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:48:01');
INSERT INTO `syslogs` VALUES ('8350', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:49:27');
INSERT INTO `syslogs` VALUES ('8351', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:50:38');
INSERT INTO `syslogs` VALUES ('8352', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:51:18');
INSERT INTO `syslogs` VALUES ('8353', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:51:57');
INSERT INTO `syslogs` VALUES ('8354', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-11 17:52:28');
INSERT INTO `syslogs` VALUES ('8355', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-12 21:34:51');
INSERT INTO `syslogs` VALUES ('8356', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:34:57');
INSERT INTO `syslogs` VALUES ('8357', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:36:33');
INSERT INTO `syslogs` VALUES ('8358', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:36:57');
INSERT INTO `syslogs` VALUES ('8359', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:37:06');
INSERT INTO `syslogs` VALUES ('8360', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:37:28');
INSERT INTO `syslogs` VALUES ('8361', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:38:21');
INSERT INTO `syslogs` VALUES ('8362', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:38:41');
INSERT INTO `syslogs` VALUES ('8363', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:39:29');
INSERT INTO `syslogs` VALUES ('8364', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:39:48');
INSERT INTO `syslogs` VALUES ('8365', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:39:59');
INSERT INTO `syslogs` VALUES ('8366', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:40:20');
INSERT INTO `syslogs` VALUES ('8367', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:40:39');
INSERT INTO `syslogs` VALUES ('8368', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:41:25');
INSERT INTO `syslogs` VALUES ('8369', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:41:32');
INSERT INTO `syslogs` VALUES ('8370', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:42:05');
INSERT INTO `syslogs` VALUES ('8371', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:42:19');
INSERT INTO `syslogs` VALUES ('8372', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:43:45');
INSERT INTO `syslogs` VALUES ('8373', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:44:08');
INSERT INTO `syslogs` VALUES ('8374', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:45:24');
INSERT INTO `syslogs` VALUES ('8375', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:48:48');
INSERT INTO `syslogs` VALUES ('8376', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:48:56');
INSERT INTO `syslogs` VALUES ('8377', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:52:12');
INSERT INTO `syslogs` VALUES ('8378', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:52:53');
INSERT INTO `syslogs` VALUES ('8379', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:53:07');
INSERT INTO `syslogs` VALUES ('8380', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-12 21:53:17');
INSERT INTO `syslogs` VALUES ('8381', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:53:22');
INSERT INTO `syslogs` VALUES ('8382', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-12 21:54:53');
INSERT INTO `syslogs` VALUES ('8383', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:32:13');
INSERT INTO `syslogs` VALUES ('8384', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:33:10');
INSERT INTO `syslogs` VALUES ('8385', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:33:45');
INSERT INTO `syslogs` VALUES ('8386', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:36:07');
INSERT INTO `syslogs` VALUES ('8387', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:39:02');
INSERT INTO `syslogs` VALUES ('8388', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:39:44');
INSERT INTO `syslogs` VALUES ('8389', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:40:03');
INSERT INTO `syslogs` VALUES ('8390', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:41:01');
INSERT INTO `syslogs` VALUES ('8391', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:49:58');
INSERT INTO `syslogs` VALUES ('8392', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:50:13');
INSERT INTO `syslogs` VALUES ('8393', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:50:58');
INSERT INTO `syslogs` VALUES ('8394', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:51:13');
INSERT INTO `syslogs` VALUES ('8395', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:53:19');
INSERT INTO `syslogs` VALUES ('8396', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:53:35');
INSERT INTO `syslogs` VALUES ('8397', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 10:54:27');
INSERT INTO `syslogs` VALUES ('8398', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 11:56:47');
INSERT INTO `syslogs` VALUES ('8399', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 11:57:42');
INSERT INTO `syslogs` VALUES ('8400', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 12:33:56');
INSERT INTO `syslogs` VALUES ('8401', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 12:34:06');
INSERT INTO `syslogs` VALUES ('8402', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 12:38:27');
INSERT INTO `syslogs` VALUES ('8403', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 12:38:32');
INSERT INTO `syslogs` VALUES ('8404', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 12:39:17');
INSERT INTO `syslogs` VALUES ('8405', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 12:39:20');
INSERT INTO `syslogs` VALUES ('8406', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 12:39:34');
INSERT INTO `syslogs` VALUES ('8407', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 12:39:48');
INSERT INTO `syslogs` VALUES ('8408', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 12:40:30');
INSERT INTO `syslogs` VALUES ('8409', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 12:42:27');
INSERT INTO `syslogs` VALUES ('8410', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 12:42:42');
INSERT INTO `syslogs` VALUES ('8411', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 12:43:04');
INSERT INTO `syslogs` VALUES ('8412', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 12:52:08');
INSERT INTO `syslogs` VALUES ('8413', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-10-13 12:57:11');
INSERT INTO `syslogs` VALUES ('8414', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:08:00');
INSERT INTO `syslogs` VALUES ('8415', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-13 13:09:15');
INSERT INTO `syslogs` VALUES ('8416', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:09:19');
INSERT INTO `syslogs` VALUES ('8417', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:11:41');
INSERT INTO `syslogs` VALUES ('8418', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:14:38');
INSERT INTO `syslogs` VALUES ('8419', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:15:33');
INSERT INTO `syslogs` VALUES ('8420', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-13 13:15:48');
INSERT INTO `syslogs` VALUES ('8421', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:15:53');
INSERT INTO `syslogs` VALUES ('8422', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:17:21');
INSERT INTO `syslogs` VALUES ('8423', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-13 13:19:03');
INSERT INTO `syslogs` VALUES ('8424', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:19:07');
INSERT INTO `syslogs` VALUES ('8425', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-13 13:20:07');
INSERT INTO `syslogs` VALUES ('8426', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:20:10');
INSERT INTO `syslogs` VALUES ('8427', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-13 13:21:29');
INSERT INTO `syslogs` VALUES ('8428', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:21:32');
INSERT INTO `syslogs` VALUES ('8429', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-13 13:22:57');
INSERT INTO `syslogs` VALUES ('8430', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:23:01');
INSERT INTO `syslogs` VALUES ('8431', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:24:08');
INSERT INTO `syslogs` VALUES ('8432', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:24:36');
INSERT INTO `syslogs` VALUES ('8433', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:31:27');
INSERT INTO `syslogs` VALUES ('8434', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 13:44:08');
INSERT INTO `syslogs` VALUES ('8435', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-13 14:10:41');
INSERT INTO `syslogs` VALUES ('8436', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 14:10:46');
INSERT INTO `syslogs` VALUES ('8437', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 14:13:07');
INSERT INTO `syslogs` VALUES ('8438', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 14:13:55');
INSERT INTO `syslogs` VALUES ('8439', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 14:21:46');
INSERT INTO `syslogs` VALUES ('8440', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 14:41:35');
INSERT INTO `syslogs` VALUES ('8441', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 14:46:04');
INSERT INTO `syslogs` VALUES ('8442', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:18:00');
INSERT INTO `syslogs` VALUES ('8443', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:22:12');
INSERT INTO `syslogs` VALUES ('8444', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:25:40');
INSERT INTO `syslogs` VALUES ('8445', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:27:17');
INSERT INTO `syslogs` VALUES ('8446', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:29:04');
INSERT INTO `syslogs` VALUES ('8447', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:30:38');
INSERT INTO `syslogs` VALUES ('8448', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:31:29');
INSERT INTO `syslogs` VALUES ('8449', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:33:05');
INSERT INTO `syslogs` VALUES ('8450', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:48:02');
INSERT INTO `syslogs` VALUES ('8451', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:48:24');
INSERT INTO `syslogs` VALUES ('8452', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:48:32');
INSERT INTO `syslogs` VALUES ('8453', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:49:52');
INSERT INTO `syslogs` VALUES ('8454', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:50:15');
INSERT INTO `syslogs` VALUES ('8455', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:51:01');
INSERT INTO `syslogs` VALUES ('8456', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:51:09');
INSERT INTO `syslogs` VALUES ('8457', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:51:15');
INSERT INTO `syslogs` VALUES ('8458', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:51:18');
INSERT INTO `syslogs` VALUES ('8459', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:51:37');
INSERT INTO `syslogs` VALUES ('8460', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:51:46');
INSERT INTO `syslogs` VALUES ('8461', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:52:55');
INSERT INTO `syslogs` VALUES ('8462', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:53:36');
INSERT INTO `syslogs` VALUES ('8463', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:53:53');
INSERT INTO `syslogs` VALUES ('8464', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:54:15');
INSERT INTO `syslogs` VALUES ('8465', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:55:33');
INSERT INTO `syslogs` VALUES ('8466', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:55:53');
INSERT INTO `syslogs` VALUES ('8467', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:57:06');
INSERT INTO `syslogs` VALUES ('8468', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:58:08');
INSERT INTO `syslogs` VALUES ('8469', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:58:27');
INSERT INTO `syslogs` VALUES ('8470', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 15:59:02');
INSERT INTO `syslogs` VALUES ('8471', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:03:18');
INSERT INTO `syslogs` VALUES ('8472', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:03:36');
INSERT INTO `syslogs` VALUES ('8473', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:04:12');
INSERT INTO `syslogs` VALUES ('8474', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:04:52');
INSERT INTO `syslogs` VALUES ('8475', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:05:07');
INSERT INTO `syslogs` VALUES ('8476', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:07:51');
INSERT INTO `syslogs` VALUES ('8477', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:09:21');
INSERT INTO `syslogs` VALUES ('8478', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:10:05');
INSERT INTO `syslogs` VALUES ('8479', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:10:18');
INSERT INTO `syslogs` VALUES ('8480', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:11:32');
INSERT INTO `syslogs` VALUES ('8481', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:11:43');
INSERT INTO `syslogs` VALUES ('8482', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:11:53');
INSERT INTO `syslogs` VALUES ('8483', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:12:35');
INSERT INTO `syslogs` VALUES ('8484', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:13:24');
INSERT INTO `syslogs` VALUES ('8485', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:13:37');
INSERT INTO `syslogs` VALUES ('8486', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:13:45');
INSERT INTO `syslogs` VALUES ('8487', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:14:01');
INSERT INTO `syslogs` VALUES ('8488', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:14:42');
INSERT INTO `syslogs` VALUES ('8489', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:19:28');
INSERT INTO `syslogs` VALUES ('8490', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:19:59');
INSERT INTO `syslogs` VALUES ('8491', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:20:23');
INSERT INTO `syslogs` VALUES ('8492', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:20:26');
INSERT INTO `syslogs` VALUES ('8493', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:20:34');
INSERT INTO `syslogs` VALUES ('8494', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:20:44');
INSERT INTO `syslogs` VALUES ('8495', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:21:38');
INSERT INTO `syslogs` VALUES ('8496', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:22:05');
INSERT INTO `syslogs` VALUES ('8497', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:26:03');
INSERT INTO `syslogs` VALUES ('8498', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:37:13');
INSERT INTO `syslogs` VALUES ('8499', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:37:28');
INSERT INTO `syslogs` VALUES ('8500', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:39:55');
INSERT INTO `syslogs` VALUES ('8501', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:40:28');
INSERT INTO `syslogs` VALUES ('8502', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:40:44');
INSERT INTO `syslogs` VALUES ('8503', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:41:19');
INSERT INTO `syslogs` VALUES ('8504', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:41:37');
INSERT INTO `syslogs` VALUES ('8505', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:46:37');
INSERT INTO `syslogs` VALUES ('8506', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:52:48');
INSERT INTO `syslogs` VALUES ('8507', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:54:24');
INSERT INTO `syslogs` VALUES ('8508', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:57:00');
INSERT INTO `syslogs` VALUES ('8509', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:58:24');
INSERT INTO `syslogs` VALUES ('8510', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:58:36');
INSERT INTO `syslogs` VALUES ('8511', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 16:59:36');
INSERT INTO `syslogs` VALUES ('8512', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:00:02');
INSERT INTO `syslogs` VALUES ('8513', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:00:18');
INSERT INTO `syslogs` VALUES ('8514', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:00:30');
INSERT INTO `syslogs` VALUES ('8515', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:00:58');
INSERT INTO `syslogs` VALUES ('8516', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:01:44');
INSERT INTO `syslogs` VALUES ('8517', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:05:22');
INSERT INTO `syslogs` VALUES ('8518', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:07:00');
INSERT INTO `syslogs` VALUES ('8519', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:07:54');
INSERT INTO `syslogs` VALUES ('8520', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:18:47');
INSERT INTO `syslogs` VALUES ('8521', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:18:58');
INSERT INTO `syslogs` VALUES ('8522', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:19:33');
INSERT INTO `syslogs` VALUES ('8523', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:20:03');
INSERT INTO `syslogs` VALUES ('8524', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:20:50');
INSERT INTO `syslogs` VALUES ('8525', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:32:43');
INSERT INTO `syslogs` VALUES ('8526', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:33:03');
INSERT INTO `syslogs` VALUES ('8527', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-13 17:33:27');
INSERT INTO `syslogs` VALUES ('8528', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 10:28:43');
INSERT INTO `syslogs` VALUES ('8529', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 10:29:20');
INSERT INTO `syslogs` VALUES ('8530', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 10:32:20');
INSERT INTO `syslogs` VALUES ('8531', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-14 10:51:30');
INSERT INTO `syslogs` VALUES ('8532', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 10:51:36');
INSERT INTO `syslogs` VALUES ('8533', 'login', 'admin', '0:0:0:0:0:0:0:1', 'fail', 'user:adminlogin to system', '2014-10-14 11:01:07');
INSERT INTO `syslogs` VALUES ('8534', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:01:13');
INSERT INTO `syslogs` VALUES ('8535', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-14 11:02:07');
INSERT INTO `syslogs` VALUES ('8536', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:02:13');
INSERT INTO `syslogs` VALUES ('8537', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-14 11:05:07');
INSERT INTO `syslogs` VALUES ('8538', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:05:13');
INSERT INTO `syslogs` VALUES ('8539', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:06:08');
INSERT INTO `syslogs` VALUES ('8540', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-14 11:07:14');
INSERT INTO `syslogs` VALUES ('8541', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:07:17');
INSERT INTO `syslogs` VALUES ('8542', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:08:51');
INSERT INTO `syslogs` VALUES ('8543', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:11:02');
INSERT INTO `syslogs` VALUES ('8544', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:13:52');
INSERT INTO `syslogs` VALUES ('8545', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:15:58');
INSERT INTO `syslogs` VALUES ('8546', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:16:31');
INSERT INTO `syslogs` VALUES ('8547', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:34:59');
INSERT INTO `syslogs` VALUES ('8548', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:36:45');
INSERT INTO `syslogs` VALUES ('8549', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:39:03');
INSERT INTO `syslogs` VALUES ('8550', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:39:21');
INSERT INTO `syslogs` VALUES ('8551', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:40:11');
INSERT INTO `syslogs` VALUES ('8552', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:40:20');
INSERT INTO `syslogs` VALUES ('8553', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:40:31');
INSERT INTO `syslogs` VALUES ('8554', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:40:47');
INSERT INTO `syslogs` VALUES ('8555', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 11:55:24');
INSERT INTO `syslogs` VALUES ('8556', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:15:12');
INSERT INTO `syslogs` VALUES ('8557', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:16:01');
INSERT INTO `syslogs` VALUES ('8558', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:16:40');
INSERT INTO `syslogs` VALUES ('8559', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:21:07');
INSERT INTO `syslogs` VALUES ('8560', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:29:47');
INSERT INTO `syslogs` VALUES ('8561', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:33:27');
INSERT INTO `syslogs` VALUES ('8562', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:36:09');
INSERT INTO `syslogs` VALUES ('8563', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:37:32');
INSERT INTO `syslogs` VALUES ('8564', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:38:59');
INSERT INTO `syslogs` VALUES ('8565', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:48:21');
INSERT INTO `syslogs` VALUES ('8566', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:52:09');
INSERT INTO `syslogs` VALUES ('8567', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:53:04');
INSERT INTO `syslogs` VALUES ('8568', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:53:22');
INSERT INTO `syslogs` VALUES ('8569', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:53:52');
INSERT INTO `syslogs` VALUES ('8570', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:54:01');
INSERT INTO `syslogs` VALUES ('8571', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:54:22');
INSERT INTO `syslogs` VALUES ('8572', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:55:14');
INSERT INTO `syslogs` VALUES ('8573', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:55:20');
INSERT INTO `syslogs` VALUES ('8574', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 13:56:56');
INSERT INTO `syslogs` VALUES ('8575', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:03:15');
INSERT INTO `syslogs` VALUES ('8576', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:10:25');
INSERT INTO `syslogs` VALUES ('8577', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-14 14:15:05');
INSERT INTO `syslogs` VALUES ('8578', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:15:09');
INSERT INTO `syslogs` VALUES ('8579', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:20:34');
INSERT INTO `syslogs` VALUES ('8580', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-14 14:21:00');
INSERT INTO `syslogs` VALUES ('8581', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:21:05');
INSERT INTO `syslogs` VALUES ('8582', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:28:01');
INSERT INTO `syslogs` VALUES ('8583', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:28:27');
INSERT INTO `syslogs` VALUES ('8584', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:30:27');
INSERT INTO `syslogs` VALUES ('8585', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:43:19');
INSERT INTO `syslogs` VALUES ('8586', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:43:51');
INSERT INTO `syslogs` VALUES ('8587', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:44:11');
INSERT INTO `syslogs` VALUES ('8588', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:44:40');
INSERT INTO `syslogs` VALUES ('8589', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:45:07');
INSERT INTO `syslogs` VALUES ('8590', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:45:48');
INSERT INTO `syslogs` VALUES ('8591', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:46:09');
INSERT INTO `syslogs` VALUES ('8592', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:46:26');
INSERT INTO `syslogs` VALUES ('8593', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:46:47');
INSERT INTO `syslogs` VALUES ('8594', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:46:59');
INSERT INTO `syslogs` VALUES ('8595', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:47:17');
INSERT INTO `syslogs` VALUES ('8596', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 14:47:32');
INSERT INTO `syslogs` VALUES ('8597', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:02:05');
INSERT INTO `syslogs` VALUES ('8598', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:07:00');
INSERT INTO `syslogs` VALUES ('8599', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:07:22');
INSERT INTO `syslogs` VALUES ('8600', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:07:34');
INSERT INTO `syslogs` VALUES ('8601', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:07:46');
INSERT INTO `syslogs` VALUES ('8602', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:09:50');
INSERT INTO `syslogs` VALUES ('8603', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:18:54');
INSERT INTO `syslogs` VALUES ('8604', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:47:46');
INSERT INTO `syslogs` VALUES ('8605', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:49:04');
INSERT INTO `syslogs` VALUES ('8606', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:50:16');
INSERT INTO `syslogs` VALUES ('8607', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:51:49');
INSERT INTO `syslogs` VALUES ('8608', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:52:11');
INSERT INTO `syslogs` VALUES ('8609', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:53:36');
INSERT INTO `syslogs` VALUES ('8610', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:55:08');
INSERT INTO `syslogs` VALUES ('8611', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:55:58');
INSERT INTO `syslogs` VALUES ('8612', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:56:29');
INSERT INTO `syslogs` VALUES ('8613', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 15:57:35');
INSERT INTO `syslogs` VALUES ('8614', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-14 16:01:49');
INSERT INTO `syslogs` VALUES ('8615', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:01:54');
INSERT INTO `syslogs` VALUES ('8616', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:02:16');
INSERT INTO `syslogs` VALUES ('8617', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:11:50');
INSERT INTO `syslogs` VALUES ('8618', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:12:30');
INSERT INTO `syslogs` VALUES ('8619', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:13:23');
INSERT INTO `syslogs` VALUES ('8620', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:13:57');
INSERT INTO `syslogs` VALUES ('8621', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:14:20');
INSERT INTO `syslogs` VALUES ('8622', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:15:34');
INSERT INTO `syslogs` VALUES ('8623', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:15:54');
INSERT INTO `syslogs` VALUES ('8624', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:16:34');
INSERT INTO `syslogs` VALUES ('8625', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:16:46');
INSERT INTO `syslogs` VALUES ('8626', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:17:08');
INSERT INTO `syslogs` VALUES ('8627', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:17:27');
INSERT INTO `syslogs` VALUES ('8628', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:17:52');
INSERT INTO `syslogs` VALUES ('8629', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:18:36');
INSERT INTO `syslogs` VALUES ('8630', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:19:02');
INSERT INTO `syslogs` VALUES ('8631', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:19:27');
INSERT INTO `syslogs` VALUES ('8632', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:19:58');
INSERT INTO `syslogs` VALUES ('8633', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:20:23');
INSERT INTO `syslogs` VALUES ('8634', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:20:43');
INSERT INTO `syslogs` VALUES ('8635', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:20:50');
INSERT INTO `syslogs` VALUES ('8636', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:21:51');
INSERT INTO `syslogs` VALUES ('8637', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:22:08');
INSERT INTO `syslogs` VALUES ('8638', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:24:09');
INSERT INTO `syslogs` VALUES ('8639', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:25:27');
INSERT INTO `syslogs` VALUES ('8640', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:25:44');
INSERT INTO `syslogs` VALUES ('8641', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:25:59');
INSERT INTO `syslogs` VALUES ('8642', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:26:06');
INSERT INTO `syslogs` VALUES ('8643', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:26:10');
INSERT INTO `syslogs` VALUES ('8644', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:28:25');
INSERT INTO `syslogs` VALUES ('8645', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:28:31');
INSERT INTO `syslogs` VALUES ('8646', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:28:44');
INSERT INTO `syslogs` VALUES ('8647', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:29:23');
INSERT INTO `syslogs` VALUES ('8648', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:29:41');
INSERT INTO `syslogs` VALUES ('8649', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:34:47');
INSERT INTO `syslogs` VALUES ('8650', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:34:56');
INSERT INTO `syslogs` VALUES ('8651', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:38:11');
INSERT INTO `syslogs` VALUES ('8652', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:38:28');
INSERT INTO `syslogs` VALUES ('8653', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:45:32');
INSERT INTO `syslogs` VALUES ('8654', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:48:05');
INSERT INTO `syslogs` VALUES ('8655', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:48:47');
INSERT INTO `syslogs` VALUES ('8656', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:49:13');
INSERT INTO `syslogs` VALUES ('8657', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:50:25');
INSERT INTO `syslogs` VALUES ('8658', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:51:52');
INSERT INTO `syslogs` VALUES ('8659', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:52:07');
INSERT INTO `syslogs` VALUES ('8660', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:53:58');
INSERT INTO `syslogs` VALUES ('8661', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:54:55');
INSERT INTO `syslogs` VALUES ('8662', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:55:29');
INSERT INTO `syslogs` VALUES ('8663', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 16:55:40');
INSERT INTO `syslogs` VALUES ('8664', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:06:26');
INSERT INTO `syslogs` VALUES ('8665', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:07:07');
INSERT INTO `syslogs` VALUES ('8666', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:07:21');
INSERT INTO `syslogs` VALUES ('8667', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:07:41');
INSERT INTO `syslogs` VALUES ('8668', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:08:04');
INSERT INTO `syslogs` VALUES ('8669', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:09:13');
INSERT INTO `syslogs` VALUES ('8670', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:10:18');
INSERT INTO `syslogs` VALUES ('8671', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:10:46');
INSERT INTO `syslogs` VALUES ('8672', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:11:24');
INSERT INTO `syslogs` VALUES ('8673', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:12:48');
INSERT INTO `syslogs` VALUES ('8674', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:14:50');
INSERT INTO `syslogs` VALUES ('8675', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:15:07');
INSERT INTO `syslogs` VALUES ('8676', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:33:52');
INSERT INTO `syslogs` VALUES ('8677', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:34:09');
INSERT INTO `syslogs` VALUES ('8678', 'login', 'admin', '0:0:0:0:0:0:0:1', 'fail', 'user:adminlogin to system', '2014-10-14 17:34:32');
INSERT INTO `syslogs` VALUES ('8679', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:34:37');
INSERT INTO `syslogs` VALUES ('8680', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:48:15');
INSERT INTO `syslogs` VALUES ('8681', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:48:44');
INSERT INTO `syslogs` VALUES ('8682', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:49:11');
INSERT INTO `syslogs` VALUES ('8683', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:49:49');
INSERT INTO `syslogs` VALUES ('8684', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:52:16');
INSERT INTO `syslogs` VALUES ('8685', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:52:38');
INSERT INTO `syslogs` VALUES ('8686', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:53:32');
INSERT INTO `syslogs` VALUES ('8687', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 17:54:24');
INSERT INTO `syslogs` VALUES ('8688', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-10-14 18:00:53');
INSERT INTO `syslogs` VALUES ('8689', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-10-14 18:01:44');
INSERT INTO `syslogs` VALUES ('8690', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-14 18:02:12');
INSERT INTO `syslogs` VALUES ('8691', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 9:34:02');
INSERT INTO `syslogs` VALUES ('8692', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 9:45:15');
INSERT INTO `syslogs` VALUES ('8693', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 9:48:00');
INSERT INTO `syslogs` VALUES ('8694', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 9:48:43');
INSERT INTO `syslogs` VALUES ('8695', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 9:49:12');
INSERT INTO `syslogs` VALUES ('8696', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 9:51:17');
INSERT INTO `syslogs` VALUES ('8697', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 9:51:43');
INSERT INTO `syslogs` VALUES ('8698', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 9:52:23');
INSERT INTO `syslogs` VALUES ('8699', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 9:54:17');
INSERT INTO `syslogs` VALUES ('8700', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 9:56:21');
INSERT INTO `syslogs` VALUES ('8701', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 9:57:11');
INSERT INTO `syslogs` VALUES ('8702', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:07:45');
INSERT INTO `syslogs` VALUES ('8703', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:08:58');
INSERT INTO `syslogs` VALUES ('8704', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:09:14');
INSERT INTO `syslogs` VALUES ('8705', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:09:36');
INSERT INTO `syslogs` VALUES ('8706', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:12:29');
INSERT INTO `syslogs` VALUES ('8707', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:12:42');
INSERT INTO `syslogs` VALUES ('8708', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:19:24');
INSERT INTO `syslogs` VALUES ('8709', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:20:38');
INSERT INTO `syslogs` VALUES ('8710', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:21:13');
INSERT INTO `syslogs` VALUES ('8711', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:24:09');
INSERT INTO `syslogs` VALUES ('8712', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-10-15 10:35:47');
INSERT INTO `syslogs` VALUES ('8713', 'login', 'admin', '127.0.0.1', 'success', 'login to system', '2014-10-15 10:36:07');
INSERT INTO `syslogs` VALUES ('8714', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:39:28');
INSERT INTO `syslogs` VALUES ('8715', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:41:54');
INSERT INTO `syslogs` VALUES ('8716', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:43:15');
INSERT INTO `syslogs` VALUES ('8717', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:43:29');
INSERT INTO `syslogs` VALUES ('8718', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 10:46:27');
INSERT INTO `syslogs` VALUES ('8719', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 11:02:34');
INSERT INTO `syslogs` VALUES ('8720', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 11:42:23');
INSERT INTO `syslogs` VALUES ('8721', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 12:14:40');
INSERT INTO `syslogs` VALUES ('8722', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 12:59:27');
INSERT INTO `syslogs` VALUES ('8723', 'login', null, '0:0:0:0:0:0:0:1', 'fail', 'unknow user:nulllogin to system', '2014-10-15 13:00:41');
INSERT INTO `syslogs` VALUES ('8724', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 13:00:48');
INSERT INTO `syslogs` VALUES ('8725', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 13:03:42');
INSERT INTO `syslogs` VALUES ('8726', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 13:04:03');
INSERT INTO `syslogs` VALUES ('8727', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 13:07:37');
INSERT INTO `syslogs` VALUES ('8728', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 13:18:07');
INSERT INTO `syslogs` VALUES ('8729', 'login', 'user', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 13:29:17');
INSERT INTO `syslogs` VALUES ('8730', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 13:29:35');
INSERT INTO `syslogs` VALUES ('8731', 'login', 'admin', '0:0:0:0:0:0:0:1', 'success', 'login to system', '2014-10-15 14:01:08');

-- ----------------------------
-- Table structure for `systemnotice`
-- ----------------------------
DROP TABLE IF EXISTS `systemnotice`;
CREATE TABLE `systemnotice` (
  `id` int(11) NOT NULL auto_increment,
  `noticetype` varchar(20) NOT NULL COMMENT '通告类型，不同项目，可能因此而不同\0\0ost [sendib\0n\0\0',
  `noticetitle` varchar(100) NOT NULL COMMENT '通告标题',
  `openurl` varchar(150) default NULL COMMENT '打开的url\0\0a',
  `noticestatus` varchar(20) default 'hotnew' COMMENT '通告状态，对于已处理，或者知悉的通告，需要将状态改为oldnew,否则 为hotnew\0notice''\r\n\0le=''systemnotice''\0',
  `roleid` varchar(20) NOT NULL COMMENT '角色ID,可以存在多个角色，帮使用逗号分隔\0ystemnoti\0e\0\r\0\0\0\0',
  `noticecontent` varchar(200) default NULL COMMENT '通告内容\0\0R\0',
  `start_time` varchar(20) default NULL COMMENT '消息提醒的入库时间\0ormatio\0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通告提醒';

-- ----------------------------
-- Records of systemnotice
-- ----------------------------

-- ----------------------------
-- Table structure for `system_power`
-- ----------------------------
DROP TABLE IF EXISTS `system_power`;
CREATE TABLE `system_power` (
  `id` int(11) NOT NULL auto_increment,
  `moudleid` int(11) NOT NULL COMMENT '注意是主键，不是functionmoudle中的moudleid\0t\0all[有权蟎\0',
  `powerstate` varchar(20) NOT NULL default '' COMMENT 'none,part,all，因为有权限才会在这个数据库里，所以其实就只用part,all，即可\0\r\0\0\0m\0p\0w\0r\0\r\0\0\0e\0''\0w\0r',
  `roleid` int(11) NOT NULL COMMENT '角色ID，注意目前只支持到角色的权限，这样方便处理\0udle\0d\0t\0a\0l\0有\0限\0)\0但\0襖\0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=DYNAMIC COMMENT='系统权限表，精确到某一按钮ID，状态为none[';

-- ----------------------------
-- Records of system_power
-- ----------------------------
INSERT INTO `system_power` VALUES ('26', '1', 'part', '2');
INSERT INTO `system_power` VALUES ('27', '21', 'all', '2');
INSERT INTO `system_power` VALUES ('28', '52', 'all', '2');
INSERT INTO `system_power` VALUES ('29', '65', 'all', '2');
INSERT INTO `system_power` VALUES ('30', '157', 'all', '2');
INSERT INTO `system_power` VALUES ('31', '200', 'all', '2');
INSERT INTO `system_power` VALUES ('32', '202', 'all', '2');
INSERT INTO `system_power` VALUES ('33', '203', 'all', '2');
INSERT INTO `system_power` VALUES ('34', '204', 'all', '2');
INSERT INTO `system_power` VALUES ('35', '200', 'part', '4');
INSERT INTO `system_power` VALUES ('36', '202', 'all', '4');

-- ----------------------------
-- Table structure for `sys_actionlog_conf`
-- ----------------------------
DROP TABLE IF EXISTS `sys_actionlog_conf`;
CREATE TABLE `sys_actionlog_conf` (
  `actionName` varchar(30) NOT NULL COMMENT '对action字段的中文描述\0\0nf\0d\0t',
  `methodId` varchar(30) NOT NULL default 'method' COMMENT '通过struts中的action调用对应方法名，如果没有具体调用方法的默认method',
  `methodName` varchar(30) default NULL COMMENT '对method字段的中文描述\0onf\0\0\0t',
  `actionDesc` varchar(50) default NULL COMMENT '操作说明',
  `actionId` varchar(30) default NULL COMMENT 'struts中配置的actionName',
  `flag` int(11) default '1' COMMENT '是否启用：1启用 0禁用\0_conf\0\0i',
  PRIMARY KEY  (`actionName`,`methodId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_actionlog_conf
-- ----------------------------
INSERT INTO `sys_actionlog_conf` VALUES ('系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'sysConfigParaController.do', '1');
INSERT INTO `sys_actionlog_conf` VALUES ('系统用户管理', 'queryUser', '查询用户', '查询系统用户', 'queryUser', '1');

-- ----------------------------
-- Table structure for `sys_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_action_log`;
CREATE TABLE `sys_action_log` (
  `id` int(11) NOT NULL auto_increment,
  `actionId` varchar(30) default NULL,
  `actionName` varchar(20) default NULL COMMENT '调用Action说明',
  `methodId` varchar(30) default 'method' COMMENT '调用的method名称',
  `methodName` varchar(30) default NULL COMMENT '调用的method说明\0er\0\0',
  `actionDesc` varchar(60) default NULL COMMENT '操作说明',
  `logUser` varchar(20) default NULL COMMENT '登陆用户名',
  `clientIp` varchar(20) default NULL COMMENT '操作客户端IP\0\0st\0',
  `logResult` varchar(50) NOT NULL COMMENT '操作结果',
  `logStarttime` varchar(20) default NULL COMMENT '操作时间',
  `logEndtime` varchar(20) default NULL COMMENT '操作结束时间',
  `reqParameters` varchar(200) default NULL COMMENT '请求参数',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_action_log
-- ----------------------------
INSERT INTO `sys_action_log` VALUES ('30', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140518234106', '20140518234106', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400427666449 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('31', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520134234', '20140520134234', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400564554753 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('32', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'test', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520141350', '20140520141350', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400566430528 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('33', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520143832', '20140520143832', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400567912387 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('34', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520143839', '20140520143839', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400567919640 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('35', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520143909', '20140520143909', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400567949593 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('36', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520152541', '20140520152541', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400570741646 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('37', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520152823', '20140520152823', 'start:0 | limit:25 | paraName: | _dc:1400570903707 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('38', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520152833', '20140520152833', 'start:0 | limit:25 | paraName: | _dc:1400570913038 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('39', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520152839', '20140520152839', 'start:0 | limit:25 | paraName: | _dc:1400570919139 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('40', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520162824', '20140520162824', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400574504643 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('41', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520162947', '20140520162947', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400574587463 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('42', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520163949', '20140520163949', 'start:0 | limit:25 | paraName: | _dc:1400575189574 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('43', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520163950', '20140520163950', 'start:0 | limit:25 | paraName: | _dc:1400575190971 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('44', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520163951', '20140520163951', 'start:0 | limit:25 | paraName: | _dc:1400575191741 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('45', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520164018', '20140520164018', 'start:0 | limit:25 | paraName: | _dc:1400575218259 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('46', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520170539', '20140520170539', 'start:0 | limit:25 | paraName: | _dc:1400576739803 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('47', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520170812', '20140520170812', 'start:0 | limit:25 | paraName: | _dc:1400576891998 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('48', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520170832', '20140520170832', 'start:0 | limit:25 | paraName: | _dc:1400576912580 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('49', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520170842', '20140520170842', 'start:0 | limit:25 | paraName: | _dc:1400576922323 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('50', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520170855', '20140520170855', 'start:0 | limit:25 | paraName: | _dc:1400576935909 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('51', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520170904', '20140520170905', 'start:0 | limit:25 | paraName: | _dc:1400576944992 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('52', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140520215035', '20140520215035', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400593835839 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('53', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140521105759', '20140521105759', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400641079010 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('54', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522144146', '20140522144146', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400740906208 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('55', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151223', '20140522151223', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742743772 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('56', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151230', '20140522151230', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742750909 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('57', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151235', '20140522151235', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742755403 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('58', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151239', '20140522151239', 'limit:25 | paraDesc:a | sysConfigParaQuery: | _dc:1400742759721 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('59', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151245', '20140522151245', 'limit:25 | paraDesc:b | sysConfigParaQuery: | _dc:1400742765828 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('60', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151251', '20140522151251', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742771787 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('61', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151255', '20140522151255', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742775665 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('62', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151256', '20140522151256', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742776572 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('63', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151257', '20140522151257', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742777070 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('64', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'FAIL', '20140522151444', '20140522151444', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742884548 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('65', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'FAIL', '20140522151517', '20140522151517', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742917764 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('66', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151601', '20140522151601', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742961043 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('67', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151605', '20140522151605', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742965622 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('68', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151608', '20140522151608', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742968011 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('69', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151611', '20140522151611', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742971900 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('70', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151619', '20140522151619', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742979596 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('71', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151623', '20140522151623', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742983293 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('72', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151626', '20140522151626', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742986568 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('73', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151635', '20140522151635', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400742995434 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('74', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151640', '20140522151640', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743000033 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('75', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522151640', '20140522151640', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743000654 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('76', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522152010', '20140522152010', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743210266 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('77', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522152011', '20140522152011', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743211384 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('78', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522152015', '20140522152015', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743215582 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('79', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522152016', '20140522152016', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743216167 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('80', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522152017', '20140522152017', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743217501 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('81', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522152055', '20140522152055', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743255362 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('82', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522152059', '20140522152059', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743259139 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('83', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522152059', '20140522152059', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743259779 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('84', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522152326', '20140522152326', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743406642 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('85', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522152914', '20140522152914', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743754580 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('86', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522153027', '20140522153028', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743827964 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('87', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522153127', '20140522153127', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743887456 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('88', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522153131', '20140522153131', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743891809 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('89', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522153228', '20140522153228', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743948046 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('90', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522153242', '20140522153242', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400743962405 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('91', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522154009', '20140522154009', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400744409619 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('92', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522154010', '20140522154010', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400744410528 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('93', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522154014', '20140522154014', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400744414880 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('94', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522154157', '20140522154157', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400744517843 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('95', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140522154159', '20140522154159', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400744519280 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('96', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140523111207', '20140523111207', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400814727276 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('97', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140523111220', '20140523111220', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400814740480 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('98', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140523111240', '20140523111240', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400814760823 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('99', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140523111246', '20140523111246', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1400814766379 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('100', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140716170147', '20140716170147', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1405501307399 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('101', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140717121457', '20140717121457', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1405570497629 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('102', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140717121509', '20140717121509', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1405570509586 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('103', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140717121523', '20140717121523', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1405570523303 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('104', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140717122050', '20140717122050', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1405570850746 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('105', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140717122212', '20140717122213', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1405570932895 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('106', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140717122351', '20140717122352', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1405571031841 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('107', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140718093227', '20140718093227', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1405647147632 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('108', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140718093235', '20140718093235', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1405647155372 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('109', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140721142944', '20140721142945', 'limit:25 | sysConfigParaQuery: | start:0 | page:1 | paraDesc: | _dc:1405924184775 | paraName: | ');
INSERT INTO `sys_action_log` VALUES ('110', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140721142957', '20140721142957', 'limit:25 | sysConfigParaQuery: | start:0 | page:1 | paraDesc: | _dc:1405924197774 | paraName: | ');
INSERT INTO `sys_action_log` VALUES ('111', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140721143006', '20140721143006', 'limit:25 | sysConfigParaQuery: | page:1 | paraDesc:ggg | start:0 | _dc:1405924206459 | paraName: | ');
INSERT INTO `sys_action_log` VALUES ('112', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140721143012', '20140721143012', 'limit:25 | sysConfigParaQuery: | page:1 | paraDesc:ggg | start:0 | _dc:1405924212704 | paraName: | ');
INSERT INTO `sys_action_log` VALUES ('113', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140721143020', '20140721143020', 'limit:25 | sysConfigParaQuery: | page:1 | paraDesc:ggg | start:0 | _dc:1405924220522 | paraName:kkk | ');
INSERT INTO `sys_action_log` VALUES ('114', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140721143030', '20140721143030', 'limit:25 | sysConfigParaQuery: | page:1 | paraDesc: | start:0 | _dc:1405924230619 | paraName: | ');
INSERT INTO `sys_action_log` VALUES ('115', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140721143039', '20140721143039', 'limit:25 | sysConfigParaQuery: | page:1 | paraDesc: | start:0 | _dc:1405924239297 | paraName: | ');
INSERT INTO `sys_action_log` VALUES ('116', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140822185021', '20140822185021', 'start:0 | limit:25 | paraName: | _dc:1408704621079 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('117', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140825160519', '20140825160519', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1408953919582 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('118', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140825160754', '20140825160754', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1408954074549 | page:1 | paraName: | start:0 | ');
INSERT INTO `sys_action_log` VALUES ('119', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140825160822', '20140825160822', 'start:0 | limit:25 | paraName: | _dc:1408954102528 | page:1 | sysConfigParaQuery: | paraDesc: | ');
INSERT INTO `sys_action_log` VALUES ('120', 'sysConfigParaController.do', '系统参数管理', 'sysConfigParaQuery', '查询系统参数', '查询系统参数', 'admin', '0:0:0:0:0:0:0:1', 'SUCCESS', '20140826175959', '20140826180000', 'limit:25 | paraDesc: | sysConfigParaQuery: | _dc:1409047199797 | page:1 | paraName: | start:0 | ');

-- ----------------------------
-- Table structure for `sys_bean_map`
-- ----------------------------
DROP TABLE IF EXISTS `sys_bean_map`;
CREATE TABLE `sys_bean_map` (
  `id` int(11) NOT NULL auto_increment,
  `bean_name` varchar(200) NOT NULL default ' ',
  `beam_bsname` varchar(100) default NULL COMMENT '对应的业务名称',
  `remark` varchar(20) default NULL,
  `islog` varchar(20) default 'on' COMMENT '是否加入监控\0\0_map',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `bean_name` (`bean_name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=58 COMMENT='系统所有的bean';

-- ----------------------------
-- Records of sys_bean_map
-- ----------------------------
INSERT INTO `sys_bean_map` VALUES ('1', 'com.sendi.system.entity.User', '系统用户', '', 'on');
INSERT INTO `sys_bean_map` VALUES ('2', 'com.sendi.system.entity.Department', '部门信息', '', 'on');
INSERT INTO `sys_bean_map` VALUES ('3', 'com.sendi.system.entity.Functionmoudle', '功能模块', '', 'on');
INSERT INTO `sys_bean_map` VALUES ('4', 'com.sendi.system.entity.UserRole', '角色信息', '', 'on');
INSERT INTO `sys_bean_map` VALUES ('5', 'com.sendi.system.entity.UserRoleRelation', '用户与角色关系', '', 'on');
INSERT INTO `sys_bean_map` VALUES ('6', 'com.sendi.system.entity.Zhiweiinfo', '职位信息', '', 'on');
INSERT INTO `sys_bean_map` VALUES ('7', 'com.sendi.system.entity.SystemPower', '系统权限', '111', 'on');
INSERT INTO `sys_bean_map` VALUES ('8', 'com.sendi.system.entity.Systemnotice', '系统公告', '', 'on');
INSERT INTO `sys_bean_map` VALUES ('9', 'com.sendi.system.entity.UserDptRelation', '用户与部门关系', '', 'on');
INSERT INTO `sys_bean_map` VALUES ('11', 'com.sendi.system.entity.Syslogs', '系统日志', '', 'off');
INSERT INTO `sys_bean_map` VALUES ('12', 'com.sendi.system.entity.SysBeanMap', '系统所有实体', '', 'off');
INSERT INTO `sys_bean_map` VALUES ('13', 'com.sendi.system.entity.Dctdata', '字典数据', '', 'off');
INSERT INTO `sys_bean_map` VALUES ('32', 'com.sendi.system.entity.SysPushConfig', 'push 配置信息', '', 'off');
INSERT INTO `sys_bean_map` VALUES ('33', 'com.sendi.system.entity.SysSocketInterface', '外部socket接口信息配置', '', 'off');
INSERT INTO `sys_bean_map` VALUES ('35', 'com.sendi.system.entity.SysHostTree', '设备树', '', 'off');
INSERT INTO `sys_bean_map` VALUES ('36', 'com.sendi.system.entity.SysHostPower', '设备权限', '', 'off');
INSERT INTO `sys_bean_map` VALUES ('37', 'com.sendi.system.entity.SysConfigPara', '系统参数配置', '', 'off');
INSERT INTO `sys_bean_map` VALUES ('38', 'com.sendi.system.entity.SysProloadConf', '系统预加载配置', '', 'off');
INSERT INTO `sys_bean_map` VALUES ('39', 'com.sendi.system.entity.SysJobInterface', '定时任务接口', '', 'off');
INSERT INTO `sys_bean_map` VALUES ('40', 'com.sendi.system.entity.SysJobInterfaceLog', '定时任务日志', '', 'off');

-- ----------------------------
-- Table structure for `sys_config_para`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config_para`;
CREATE TABLE `sys_config_para` (
  `id` int(11) NOT NULL auto_increment,
  `para_name` varchar(200) NOT NULL default ' ' COMMENT '参数名称',
  `para_value` varchar(200) NOT NULL COMMENT '参数值',
  `para_desc` varchar(200) default ' ' COMMENT '参数解析',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='系统配置参数,每一个应用系统可能都不一样';

-- ----------------------------
-- Records of sys_config_para
-- ----------------------------
INSERT INTO `sys_config_para` VALUES ('1', 'sendi_system_title', '智能网管系统', '系统标题');
INSERT INTO `sys_config_para` VALUES ('2', 'sendi_system_socketport', '9911', '客户端与服务器端socket通信端口');
INSERT INTO `sys_config_para` VALUES ('3', 'sendi_system_overviewname', 'overview', '总览名称');
INSERT INTO `sys_config_para` VALUES ('4', 'sendi_system_overviewurl', '/page/overview/overView.jsp', '总览路径');
INSERT INTO `sys_config_para` VALUES ('5', 'sendi_system_isusesocket', 'yes', '服务器端socket服务开关');
INSERT INTO `sys_config_para` VALUES ('6', 'sendi_system_conectlost_notice_module', 'overview', 'socket中断事件通知模块ID');
INSERT INTO `sys_config_para` VALUES ('7', 'sendi_system_scheduler_host', '192.168.2.12', '定时任务执行机器地址');
INSERT INTO `sys_config_para` VALUES ('8', 'sendi_system-test', 'testevacuation', '测试参数');

-- ----------------------------
-- Table structure for `sys_host_power`
-- ----------------------------
DROP TABLE IF EXISTS `sys_host_power`;
CREATE TABLE `sys_host_power` (
  `id` int(11) NOT NULL auto_increment,
  `powerstate` varchar(20) NOT NULL default ' ' COMMENT 'none,part,all，因为有权限才会在这个数据库里，所以其实就只用part,all，即可\0\0\0\0\0m\0p\0w\0r\0 \0\0\0e\0''\0w\0r\0\0',
  `hostree_id` int(11) NOT NULL COMMENT '设备树ID\0R\0',
  `roleid` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='被管网元权限分配';

-- ----------------------------
-- Records of sys_host_power
-- ----------------------------
INSERT INTO `sys_host_power` VALUES ('14', 'all', '1', '1');
INSERT INTO `sys_host_power` VALUES ('15', 'all', '5', '1');
INSERT INTO `sys_host_power` VALUES ('16', 'all', '3', '1');
INSERT INTO `sys_host_power` VALUES ('17', 'all', '2', '1');
INSERT INTO `sys_host_power` VALUES ('18', 'all', '4', '1');
INSERT INTO `sys_host_power` VALUES ('68', 'all', '1', '5');
INSERT INTO `sys_host_power` VALUES ('69', 'all', '2', '5');

-- ----------------------------
-- Table structure for `sys_host_tree`
-- ----------------------------
DROP TABLE IF EXISTS `sys_host_tree`;
CREATE TABLE `sys_host_tree` (
  `id` int(11) NOT NULL auto_increment,
  `parentid` int(11) default '-1',
  `node_name` varchar(200) default NULL,
  `hostname` varchar(200) default ' ' COMMENT '设备名称\0\0R\0',
  `host_id` int(11) default NULL,
  `ishost` varchar(2) default 'n' COMMENT '是否为叶子，如果是y,则是具体的网元\0t visible c\0l\0m',
  `hosttype` varchar(20) default ' ' COMMENT '设备类型,为了防止设备可能从多个表时来，所做的区分\0\0st_t\0e\0''\0\n\0e\0''\0\n\0\0\0e\0\0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统管理的的网元树，由于不同的系统，被管';

-- ----------------------------
-- Records of sys_host_tree
-- ----------------------------
INSERT INTO `sys_host_tree` VALUES ('1', '-1', '天河区', null, null, 'n', null);
INSERT INTO `sys_host_tree` VALUES ('2', '-1', '越秀区', null, null, 'n', null);
INSERT INTO `sys_host_tree` VALUES ('3', '1', '天河站', '天河站', '2', 'y', '基站');
INSERT INTO `sys_host_tree` VALUES ('4', '2', '南沙站', '南沙站', '7', 'y', '基站');
INSERT INTO `sys_host_tree` VALUES ('5', '1', '南沙站', '南沙站', '7', 'y', '基站');

-- ----------------------------
-- Table structure for `sys_job_interface`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_interface`;
CREATE TABLE `sys_job_interface` (
  `id` int(11) NOT NULL auto_increment,
  `interfaceid` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `interfacecalss` varchar(200) NOT NULL COMMENT '接口功能类，该类必须实现接口org.quartz.Job 中的方法execute\0ketI 中的方法\0\0过于频繁时\0',
  `jobtype` varchar(20) default 's' COMMENT '任务类型，简单任务为s,复杂任务为c,复杂任务采用CronExpression\0 t.event_manipulati\0',
  `cronexpression` varchar(20) default NULL,
  `jobstart_time` varchar(20) default NULL COMMENT 'yyyyMMDDHHmmss',
  `job_repeatInterval` int(11) default NULL,
  `job_repeatcount` int(11) default NULL,
  `isactive` varchar(20) default 'on' COMMENT '任务是否开启,on,off\0ace_\0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_job_interface
-- ----------------------------
INSERT INTO `sys_job_interface` VALUES ('2', 'TestQuartzJob', 'TestQuartzJob', 'com.sendi.system.quaztz.TestQuartzJob', 'c', '0/5  * * * * ?', '', '0', '0', 'off');

-- ----------------------------
-- Table structure for `sys_job_interface_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_interface_log`;
CREATE TABLE `sys_job_interface_log` (
  `id` int(11) NOT NULL auto_increment,
  `jobdesc` varchar(20) default NULL,
  `jobstart_time` varchar(20) default NULL,
  `jobend_time` varchar(20) default NULL,
  `job_name` varchar(200) default NULL,
  `job_groupname` varchar(40) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94194 DEFAULT CHARSET=utf8 COMMENT='定时任务接口类的执行历史';

-- ----------------------------
-- Records of sys_job_interface_log
-- ----------------------------
INSERT INTO `sys_job_interface_log` VALUES ('94076', 'TestQuartzJob', '20140518212730', '20140518212733', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94077', 'TestQuartzJob', '20140518212735', '20140518212738', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94078', 'TestQuartzJob', '20140518212740', '20140518212743', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94079', 'TestQuartzJob', '20140518212745', '20140518212748', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94080', 'TestQuartzJob', '20140518212750', '20140518212753', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94081', 'TestQuartzJob', '20140518212755', '20140518212758', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94082', 'TestQuartzJob', '20140518212800', '20140518212803', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94083', 'TestQuartzJob', '20140518213035', '20140518213038', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94084', 'TestQuartzJob', '20140518213040', '20140518213043', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94085', 'TestQuartzJob', '20140518213045', '20140518213048', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94086', 'TestQuartzJob', '20140518213050', '20140518213053', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94087', 'TestQuartzJob', '20140518214105', '20140518214108', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94088', 'TestQuartzJob', '20140518214110', '20140518214113', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94089', 'TestQuartzJob', '20140518214115', '20140518214118', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94090', 'TestQuartzJob', '20140518214120', '20140518214123', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94091', 'TestQuartzJob', '20140518214125', '20140518214128', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94092', 'TestQuartzJob', '20140518214130', '20140518214133', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94093', 'TestQuartzJob', '20140518214135', '20140518214138', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94094', 'TestQuartzJob', '20140518214140', '20140518214143', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94095', 'TestQuartzJob', '20140518214145', '20140518214148', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94096', 'TestQuartzJob', '20140518214150', '20140518214153', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94097', 'TestQuartzJob', '20140518214155', '20140518214158', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94098', 'TestQuartzJob', '20140518214200', '20140518214203', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94099', 'TestQuartzJob', '20140518214205', '20140518214208', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94100', 'TestQuartzJob', '20140518214210', '20140518214213', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94101', 'TestQuartzJob', '20140518214215', '20140518214218', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94102', 'TestQuartzJob', '20140518215340', '20140518215343', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94103', 'TestQuartzJob', '20140518215345', '20140518215348', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94104', 'TestQuartzJob', '20140518215350', '20140518215353', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94105', 'TestQuartzJob', '20140518215355', '20140518215358', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94106', 'TestQuartzJob', '20140518215400', '20140518215403', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94107', 'TestQuartzJob', '20140518215405', '20140518215408', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94108', 'TestQuartzJob', '20140518215410', '20140518215413', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94109', 'TestQuartzJob', '20140518215415', '20140518215418', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94110', 'TestQuartzJob', '20140518215420', '20140518215423', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94111', 'TestQuartzJob', '20140518215425', '20140518215428', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94112', 'TestQuartzJob', '20140518215430', '20140518215433', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94113', 'TestQuartzJob', '20140518215435', '20140518215438', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94114', 'TestQuartzJob', '20140518215440', '20140518215443', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94115', 'TestQuartzJob', '20140518215445', '20140518215448', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94116', 'TestQuartzJob', '20140518215450', '20140518215453', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94117', 'TestQuartzJob', '20140518215515', '20140518215518', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94118', 'TestQuartzJob', '20140518215520', '20140518215523', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94119', 'TestQuartzJob', '20140518215525', '20140518215528', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94120', 'TestQuartzJob', '20140518215530', '20140518215533', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94121', 'TestQuartzJob', '20140518215535', '20140518215538', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94122', 'TestQuartzJob', '20140518220420', '20140518220423', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94123', 'TestQuartzJob', '20140518220425', '20140518220428', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94124', 'TestQuartzJob', '20140518220430', '20140518220433', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94125', 'TestQuartzJob', '20140518220435', '20140518220438', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94126', 'TestQuartzJob', '20140518220440', '20140518220443', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94127', 'TestQuartzJob', '20140518220445', '20140518220448', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94128', 'TestQuartzJob', '20140518220450', '20140518220453', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94129', 'TestQuartzJob', '20140518220455', '20140518220458', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94130', 'TestQuartzJob', '20140518220500', '20140518220503', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94131', 'TestQuartzJob', '20140518220505', '20140518220508', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94132', 'TestQuartzJob', '20140518220510', '20140518220513', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94133', 'TestQuartzJob', '20140518220515', '20140518220518', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94134', 'TestQuartzJob', '20140518220520', '20140518220523', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94135', 'TestQuartzJob', '20140518220755', '20140518220758', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94136', 'TestQuartzJob', '20140518220800', '20140518220803', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94137', 'TestQuartzJob', '20140518220805', '20140518220808', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94138', 'TestQuartzJob', '20140518220810', '20140518220813', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94139', 'TestQuartzJob', '20140518220815', '20140518220818', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94140', 'TestQuartzJob', '20140518220820', '20140518220823', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94141', 'TestQuartzJob', '20140518220825', '20140518220828', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94142', 'TestQuartzJob', '20140518220830', '20140518220833', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94143', 'TestQuartzJob', '20140518220835', '20140518220838', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94144', 'TestQuartzJob', '20140518220840', '20140518220843', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94145', 'TestQuartzJob', '20140518220845', '20140518220848', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94146', 'TestQuartzJob', '20140518220850', '20140518220853', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94147', 'TestQuartzJob', '20140518220855', '20140518220858', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94148', 'TestQuartzJob', '20140518220900', '20140518220903', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94149', 'TestQuartzJob', '20140518220905', '20140518220908', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94150', 'TestQuartzJob', '20140518220910', '20140518220913', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94151', 'TestQuartzJob', '20140518220915', '20140518220918', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94152', 'TestQuartzJob', '20140518220920', '20140518220923', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94153', 'TestQuartzJob', '20140518220925', '20140518220928', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94154', 'TestQuartzJob', '20140518220930', '20140518220933', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94155', 'TestQuartzJob', '20140518220935', '20140518220938', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94156', 'TestQuartzJob', '20140518220940', '20140518220943', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94157', 'TestQuartzJob', '20140518220945', '20140518220948', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94158', 'TestQuartzJob', '20140518220950', '20140518220953', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94159', 'TestQuartzJob', '20140518220955', '20140518220958', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94160', 'TestQuartzJob', '20140518221000', '20140518221003', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94161', 'TestQuartzJob', '20140518221005', '20140518221008', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94162', 'TestQuartzJob', '20140518221010', '20140518221013', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94163', 'TestQuartzJob', '20140518221015', '20140518221018', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94164', 'TestQuartzJob', '20140518221020', '20140518221023', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94165', 'TestQuartzJob', '20140518221025', '20140518221028', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94166', 'TestQuartzJob', '20140518221030', '20140518221033', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94167', 'TestQuartzJob', '20140518221035', '20140518221038', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94168', 'TestQuartzJob', '20140518221040', '20140518221043', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94169', 'TestQuartzJob', '20140518221045', '20140518221048', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94170', 'TestQuartzJob', '20140518221050', '20140518221053', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94171', 'TestQuartzJob', '20140518221055', '20140518221058', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94172', 'TestQuartzJob', '20140518221100', '20140518221103', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94173', 'TestQuartzJob', '20140518221105', '20140518221108', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94174', 'TestQuartzJob', '20140518221110', '20140518221113', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94175', 'TestQuartzJob', '20140518221115', '20140518221118', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94176', 'TestQuartzJob', '20140518221120', '20140518221123', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94177', 'TestQuartzJob', '20140520114100', '20140520114103', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94178', 'TestQuartzJob', '20140520114105', '20140520114108', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94179', 'TestQuartzJob', '20140520114110', '20140520114113', 'TestQuartzJob', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94180', 'test1', '20140520114150', '20140520114150', 'test1', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94181', 'test1', '20140520114155', '20140520114155', 'test1', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94182', 'test1', '20140520114200', '20140520114200', 'test1', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94183', 'test1', '20140520114205', '20140520114205', 'test1', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94184', 'test1', '20140520114210', '20140520114210', 'test1', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94185', 'test1', '20140520114215', '20140520114215', 'test1', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94186', 'test1', '20140520114220', '20140520114220', 'test1', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94187', 'test2', '20140520114220', '20140520114220', 'test2', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94188', 'test1', '20140520114225', '20140520114225', 'test1', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94189', 'test2', '20140520114225', '20140520114225', 'test2', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94190', 'test1', '20140520114230', '20140520114230', 'test1', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94191', 'test2', '20140520114230', '20140520114230', 'test2', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94192', 'test1', '20140520114235', '20140520114235', 'test1', 'complicate');
INSERT INTO `sys_job_interface_log` VALUES ('94193', 'test2', '20140520114235', '20140520114235', 'test2', 'complicate');

-- ----------------------------
-- Table structure for `sys_operation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation`;
CREATE TABLE `sys_operation` (
  `id` int(11) NOT NULL auto_increment,
  `operationcode` varchar(50) NOT NULL default '',
  `operationname` varchar(50) NOT NULL default '',
  `functionid` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_operation
-- ----------------------------
INSERT INTO `sys_operation` VALUES ('27', 'add', '新增', '168');
INSERT INTO `sys_operation` VALUES ('28', 'query', '查询', '168');
INSERT INTO `sys_operation` VALUES ('29', 'add', '增加', '179');
INSERT INTO `sys_operation` VALUES ('30', 'update', '修改', '179');
INSERT INTO `sys_operation` VALUES ('31', 'delete', '删除', '179');

-- ----------------------------
-- Table structure for `sys_proload_conf`
-- ----------------------------
DROP TABLE IF EXISTS `sys_proload_conf`;
CREATE TABLE `sys_proload_conf` (
  `id` int(11) NOT NULL auto_increment,
  `interfaceid` varchar(200) NOT NULL COMMENT '接口id',
  `description` varchar(200) default ' ' COMMENT '功能描述',
  `interfacecalss` varchar(200) NOT NULL COMMENT '接口类\0e\0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='系统全局预加载配置';

-- ----------------------------
-- Records of sys_proload_conf
-- ----------------------------
INSERT INTO `sys_proload_conf` VALUES ('1', 'sysJobInterface', '定时任务启动类', 'com.sendi.system.quaztz.CronTriggerRunner');
INSERT INTO `sys_proload_conf` VALUES ('7', 'PreLoadActionLogConf', '加载Action操作日志配置', 'com.sendi.system.preload.PreLoadActionLogConf');

-- ----------------------------
-- Table structure for `sys_push_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_push_config`;
CREATE TABLE `sys_push_config` (
  `id` int(11) NOT NULL auto_increment,
  `callbackfun` varchar(100) NOT NULL COMMENT '回调函数，信息push到客户端后回调用的客户端的那一个函数\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `callbackmoudleid` varchar(100) NOT NULL default ' ' COMMENT '回调客户端哪一个模块ID，因为防止客户端接收信息的模块没有打开,同时也是根据该模块ID\r\n来查询权限 ，如果设置为all或者self，则表示为全部登录用户可以接收该信息\0ral_ci NOT NULL DEFAULT '' '' UNIQUE COMMENT ''push id该ID，是业务主键''\0\0\0\0\0\0\0',
  `description` varchar(200) NOT NULL default ' ' COMMENT 'push功能的描述',
  `pushid` varchar(200) NOT NULL default ' ' COMMENT 'push id该ID，是业务主键',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pushid` (`pushid`),
  UNIQUE KEY `pushid_2` (`pushid`),
  UNIQUE KEY `pushid_3` (`pushid`),
  UNIQUE KEY `UK_lftpp4n9pmq0vfstdriio84xy` (`pushid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='push 功能的设置，没有使用dwr push功能，而是';

-- ----------------------------
-- Records of sys_push_config
-- ----------------------------
INSERT INTO `sys_push_config` VALUES ('2', 'forcelogout', 'all', '踢除在线用户', 'forcelogout');
INSERT INTO `sys_push_config` VALUES ('3', 'updataOnlineUser', 'sys_online_user', '更新在线用户', 'update_online_user');

-- ----------------------------
-- Table structure for `sys_role_operation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_operation`;
CREATE TABLE `sys_role_operation` (
  `id` int(11) NOT NULL auto_increment,
  `operationcode` varchar(100) NOT NULL default '',
  `functionid` varchar(255) NOT NULL default '',
  `roleid` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_operation
-- ----------------------------
INSERT INTO `sys_role_operation` VALUES ('2', 'add,query', '168', '1');
INSERT INTO `sys_role_operation` VALUES ('3', 'add,query', '168', '2');
INSERT INTO `sys_role_operation` VALUES ('5', 'add,update', '179', '1');
INSERT INTO `sys_role_operation` VALUES ('7', 'add,update', '179', '2');

-- ----------------------------
-- Table structure for `sys_socket_interface`
-- ----------------------------
DROP TABLE IF EXISTS `sys_socket_interface`;
CREATE TABLE `sys_socket_interface` (
  `id` int(11) NOT NULL auto_increment,
  `interfaceid` varchar(100) NOT NULL default '' COMMENT '接口ID，英文的业务描述\0皛\0?????\0',
  `description` varchar(100) NOT NULL default ' ' COMMENT '接口功能描述\0\0ion',
  `interfacecalss` varchar(100) NOT NULL default ' ' COMMENT '接口功能类，该类必须实现接口com.sendi.system.socket.SocketI 中的方法\0oAction\0送消息过于频繁时\0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0 ROW_FORMAT=DYNAMIC COMMENT='socket接口配置，主要是让perl在需要向java应用';

-- ----------------------------
-- Records of sys_socket_interface
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL auto_increment,
  `userId` varchar(20) NOT NULL,
  `userName` varchar(20) default NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(20) default NULL,
  `pwdvalicity` int(11) default NULL COMMENT '瀵嗙爜鏈夋晥鏈燂紝鍗曚綅鏄ぉ\0r f\0e\0d\0d',
  `createdate` varchar(20) default NULL COMMENT '鍒涘缓鏃ユ湡,鏃舵湡鏍煎紡涓簓yyy-MM-dd HH:mm\0use\0\0\0\0\0',
  `pwddate` varchar(20) default NULL COMMENT '瀵嗙爜淇敼鏃ユ湡锛岄娆″垱寤哄垯涓哄垱寤虹殑鏃ユ湡锛屽綋鍒版湡鍚庯紝杩涜淇敼鏃讹紝鍒欓渶瑕佸啀璁板綍淇敼鐨勬棩鏈焅0\0''\0\n\0j\0c\0_\0a\0l\0=\0u\0e\0''\0\n\0u\0e\0''\0\n\0=\0u\0e\0\0',
  `istip` varchar(20) default 'on' COMMENT '鏄惁鎻愮ず瀵嗙爜杩囨湡锛宱n,off\0??\0\0\0\0',
  `isactive` varchar(20) default 'on',
  `maxlogincount` int(11) default '10' COMMENT '鏈€澶у厑璁哥櫥褰曟鏁癨0InnerMe',
  `is_share` varchar(10) default 'n',
  `max_connect` int(11) default '0',
  `ip` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 DELAY_KEY_WRITE=1;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('9', 'admin', 'admin', '1', '1', '30', '2013-04-01 15:03', '2013-04-14 10:51', 'off', 'on', '1000000000', 'n', '100', '');
INSERT INTO `sys_user` VALUES ('10', 'center', 'center', '1', '1', '3000', '2013-06-20 10:43', '2014-05-20 14:13', 'on', 'on', '1000000', 'n', '10', '');
INSERT INTO `sys_user` VALUES ('11', 'user', 'user', '1', '1', '999', '2014-07-22 16:52', '2014-07-22 16:52', 'off', 'on', '1000000', 'n', '10', '');
INSERT INTO `sys_user` VALUES ('12', 'user2', 'user2', '1', '1', '999', '2014-07-22 16:53', '2014-07-22 16:53', 'off', 'on', '1000000', 'n', '10', '');

-- ----------------------------
-- Table structure for `user_dpt_relation`
-- ----------------------------
DROP TABLE IF EXISTS `user_dpt_relation`;
CREATE TABLE `user_dpt_relation` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL,
  `dptid` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户与部门组织关系';

-- ----------------------------
-- Records of user_dpt_relation
-- ----------------------------
INSERT INTO `user_dpt_relation` VALUES ('1', '2', '1');
INSERT INTO `user_dpt_relation` VALUES ('2', '3', '1');
INSERT INTO `user_dpt_relation` VALUES ('3', '4', '2');
INSERT INTO `user_dpt_relation` VALUES ('4', '5', '3');

-- ----------------------------
-- Table structure for `user_group`
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` int(8) NOT NULL auto_increment,
  `group_id` varchar(30) NOT NULL default '',
  `group_name` varchar(50) NOT NULL default '',
  `level` varchar(10) NOT NULL default '',
  `member` varchar(200) NOT NULL default '',
  `region_id` varchar(50) NOT NULL default '',
  `createdate` varchar(20) NOT NULL default '',
  `remark` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES ('1', '1234123df', '1234123df', 'asdfasdf', '杨杰', 'dfasdfasdf', '2010-05-12 14:52', 'adfas');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL auto_increment,
  `rolename` varchar(100) default NULL COMMENT '角色名称\0\0R\0',
  `roledesc` varchar(200) default NULL COMMENT '角色描述\0\0R\0',
  `loginip` varchar(2000) default NULL COMMENT '允许登录IP范围，系统管理员可以在所以IP范围内登录\0ole\0\r\0\0\0e\0\0\0\0\0e\0_\0o\0e',
  `area` varchar(50) default NULL COMMENT '地区\0s',
  `isvalidataip` varchar(10) default NULL COMMENT '是否开始IP登录范围监控on,off\0I\0范\0\0\0\0\0\0',
  `parentid` int(11) default '0',
  `username` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户角色表，角色暂不存在继承关系';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '超级管理员', '超级管理员', '', '', 'off', '0', null);
INSERT INTO `user_role` VALUES ('2', '中心管理员', '中心管理员', '', '上海', 'off', '1', null);
INSERT INTO `user_role` VALUES ('4', '普通用户', '普通用户', '', '上海NOC', 'off', '1', null);

-- ----------------------------
-- Table structure for `user_role_relation`
-- ----------------------------
DROP TABLE IF EXISTS `user_role_relation`;
CREATE TABLE `user_role_relation` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户与角色的关联表，注意不做真正的外键关';

-- ----------------------------
-- Records of user_role_relation
-- ----------------------------
INSERT INTO `user_role_relation` VALUES ('8', '10', '2');
INSERT INTO `user_role_relation` VALUES ('12', '9', '1');
INSERT INTO `user_role_relation` VALUES ('13', '11', '4');
INSERT INTO `user_role_relation` VALUES ('14', '12', '4');

-- ----------------------------
-- Table structure for `user_zone`
-- ----------------------------
DROP TABLE IF EXISTS `user_zone`;
CREATE TABLE `user_zone` (
  `id` int(11) NOT NULL auto_increment,
  `zonecode` varchar(6) NOT NULL default '' COMMENT '区域代码',
  `zonename` varchar(50) NOT NULL default '' COMMENT '区域名称',
  `parentcode` varchar(6) NOT NULL default '' COMMENT '父区域代码',
  `level` varchar(200) NOT NULL default '' COMMENT '区域层次',
  PRIMARY KEY  (`id`),
  KEY `zonecode` (`zonecode`),
  KEY `parentcode` (`parentcode`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of user_zone
-- ----------------------------
INSERT INTO `user_zone` VALUES ('1', '110000', '北京市', '-1', '1');
INSERT INTO `user_zone` VALUES ('2', '110001', '广东省', '-1', '1');
INSERT INTO `user_zone` VALUES ('3', '110002', '广州市', '2', '2');
INSERT INTO `user_zone` VALUES ('4', '110003', '深圳市', '2', '2');
INSERT INTO `user_zone` VALUES ('5', 'zs', '中山', '1', '2');

-- ----------------------------
-- Table structure for `user_zone_power`
-- ----------------------------
DROP TABLE IF EXISTS `user_zone_power`;
CREATE TABLE `user_zone_power` (
  `id` int(11) NOT NULL auto_increment,
  `zoneid` int(11) NOT NULL COMMENT '注意是主键，对应user_zone表的id',
  `powerstate` varchar(20) NOT NULL default '' COMMENT 'none,part,all，因为有权限才会在这个数据库里，所以其实就只用part,all',
  `roleid` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY  (`id`),
  KEY `zoneid` (`zoneid`),
  KEY `roleid` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户区域权限表';

-- ----------------------------
-- Records of user_zone_power
-- ----------------------------
INSERT INTO `user_zone_power` VALUES ('5', '1', 'all', '1');
INSERT INTO `user_zone_power` VALUES ('6', '5', 'all', '1');
INSERT INTO `user_zone_power` VALUES ('7', '2', 'all', '1');
INSERT INTO `user_zone_power` VALUES ('8', '3', 'all', '1');
INSERT INTO `user_zone_power` VALUES ('9', '4', 'all', '1');
INSERT INTO `user_zone_power` VALUES ('12', '2', 'all', '4');
INSERT INTO `user_zone_power` VALUES ('13', '3', 'all', '4');
INSERT INTO `user_zone_power` VALUES ('14', '4', 'all', '4');
INSERT INTO `user_zone_power` VALUES ('15', '2', 'part', '2');
INSERT INTO `user_zone_power` VALUES ('16', '3', 'all', '2');
