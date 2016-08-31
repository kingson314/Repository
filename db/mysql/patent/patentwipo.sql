/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : patent

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2016-08-30 11:21:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for patentwipo
-- ----------------------------
DROP TABLE IF EXISTS `patentwipo`;
CREATE TABLE `patentwipo` (
  `ID` varchar(255) NOT NULL COMMENT 'guid',
  `APPLICATIONNUMBER` varchar(255) DEFAULT NULL COMMENT '申请号',
  `APPLICATIONDATE` varchar(255) DEFAULT NULL COMMENT '申请日',
  `PUBLICATIONNUMBER` varchar(255) DEFAULT NULL COMMENT '公布号',
  `PUBLICATIONDATE` varchar(255) DEFAULT NULL COMMENT '公布日',
  `GRANTNUMBER` varchar(255) DEFAULT NULL COMMENT '授权号',
  `GRANTDATE` varchar(255) DEFAULT NULL COMMENT '授权日',
  `PUBLICATIONKIND` varchar(255) DEFAULT NULL COMMENT '公布种类',
  `PCTREFERENCE` varchar(255) DEFAULT NULL COMMENT 'PCT参考号',
  `IPC` varchar(255) DEFAULT NULL COMMENT 'ipc',
  `APPLICANTS` varchar(255) DEFAULT NULL COMMENT '申请人',
  `INVENTORS` varchar(255) DEFAULT NULL COMMENT '发明人',
  `PRIORITYDATA` varchar(255) DEFAULT NULL COMMENT '优先权数据',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `MEMO` varchar(255) DEFAULT NULL COMMENT '摘要',
  `SRCNATIONALBIBLIODATA` varchar(255) DEFAULT NULL COMMENT '国家著录事项',
  `SRCDESCRIPTION` varchar(255) DEFAULT NULL COMMENT '说明书',
  `SRCCLAIMS` varchar(255) DEFAULT NULL COMMENT '权利要求书',
  `SRCDRAWINGS` varchar(255) DEFAULT NULL COMMENT 'Drawings',
  `SRCDOCUMENTS` varchar(255) DEFAULT NULL COMMENT '文件',
  `CREATEDATE` datetime DEFAULT NULL COMMENT '创建日期',
  `MODIFYDATE` datetime DEFAULT NULL COMMENT '修改日期',
  `CREATEUSERID` varchar(255) DEFAULT NULL COMMENT '创建人Id[sys_user.id]',
  `MODIFYUSERID` varchar(255) DEFAULT NULL COMMENT '修改人Id[sys_user.id]',
  `STATE` int(11) DEFAULT NULL COMMENT '状态（0为正常，-1为不可用）',
  `ORD` int(19) DEFAULT NULL COMMENT '排序',
  `VERSION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PATENTWIPO';
