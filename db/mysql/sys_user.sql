/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : patent

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2016-08-30 11:29:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `ID` varchar(255) NOT NULL COMMENT '用户ID',
  `NAME` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `MODIFYDATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改日期',
  `CREATEUSERID` varchar(255) DEFAULT NULL COMMENT '创建人Id[sys_user.id]',
  `MODIFYUSERID` varchar(255) DEFAULT NULL COMMENT '修改人Id[sys_user.id]',
  `VERSION` varchar(255) DEFAULT '1.0.0' COMMENT '版本号',
  `STATE` int(11) DEFAULT '0' COMMENT '状态（0为正常，-1为不可用）',
  `ORD` int(19) DEFAULT '0' COMMENT '排序',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `PASSWORD` varchar(255) NOT NULL COMMENT '用户密码',
  `USERALIAS` varchar(255) DEFAULT NULL COMMENT '登录别名',
  `POSTID` varchar(255) DEFAULT NULL COMMENT '职位',
  `SEX` int(11) NOT NULL COMMENT '性别(0表示男，1表示女)',
  `BIRTHDAY` varchar(255) DEFAULT NULL COMMENT '出生日期',
  `MOBILEPHONE` varchar(255) DEFAULT NULL COMMENT '移动电话',
  `OFFICEPHONE` varchar(255) DEFAULT NULL COMMENT '办公电话',
  `EMAIL` varchar(255) DEFAULT NULL COMMENT '邮箱地址',
  `EDUCATION` varchar(255) DEFAULT NULL COMMENT '学历',
  `PHOTOURL` varchar(255) DEFAULT NULL COMMENT '个人照片url',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SYS_USER';
