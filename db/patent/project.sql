/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : patent

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2016-08-12 16:22:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(40) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `relative` varchar(4000) DEFAULT NULL,
  `memo` varchar(4000) DEFAULT NULL,
  `files` varchar(4000) DEFAULT NULL,
  `detailurl` varchar(255) DEFAULT NULL,
  `detailcontent` text,
  `ord` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('3b42b03f-295c-4790-8e01-d3d4778a6210', '22', '', '', '', '', '', null, '0', '1');
INSERT INTO `project` VALUES ('7e4f2cbf-f82f-45c1-9582-547f620a58f0', '222', '', '111', '111', '7e4f2cbf-f82f-45c1-9582-547f620a58f0_0.jpg,7e4f2cbf-f82f-45c1-9582-547f620a58f0_1.jpg,7e4f2cbf-f82f-45c1-9582-547f620a58f0_2.jpg,7e4f2cbf-f82f-45c1-9582-547f620a58f0_3.jpg', '7e4f2cbf-f82f-45c1-9582-547f620a58f0.jsp', null, '0', '0');
INSERT INTO `project` VALUES ('c6651135-e4bd-41c5-98b0-1a5af04fe613', 'LED', '', '', '', 'c6651135-e4bd-41c5-98b0-1a5af04fe613_0.jpg,c6651135-e4bd-41c5-98b0-1a5af04fe613_1.jpg', 'c6651135-e4bd-41c5-98b0-1a5af04fe613.jsp', null, '0', '0');
INSERT INTO `project` VALUES ('fed51889-d879-467f-80f6-4926d2f5a28b', '1', '2', '3', '7', 'fed51889-d879-467f-80f6-4926d2f5a28b_0.jpg,fed51889-d879-467f-80f6-4926d2f5a28b_1.jpg', 'fed51889-d879-467f-80f6-4926d2f5a28b.jsp', null, '0', '1');
