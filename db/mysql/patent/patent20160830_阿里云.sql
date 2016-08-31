/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : patent

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2016-08-30 12:19:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `common`
-- ----------------------------
DROP TABLE IF EXISTS `common`;
CREATE TABLE `common` (
  `id` varchar(40) NOT NULL,
  `domain` varchar(255) default NULL,
  `num` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `ord` int(11) default NULL,
  `state` int(11) default NULL,
  `rectype` int(11) default NULL,
  `pdate` varchar(40) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common
-- ----------------------------
INSERT INTO `common` VALUES ('0786ad2e-316e-4427-890b-a06ed06cf9f6', '保健按摩', '201510151204X', '一种能够对全身任意部位进行按摩的按摩衣', '授权未办登', '发明', '0', '0', '1', '2016.10.13');
INSERT INTO `common` VALUES ('08dd511a-8ce0-4e0d-93b5-dc6a7907b375', '中药提取物', '200810050054.3', '卷柏降血脂有效部位及其提取方法和应用以及穗花衫双黄酮的提取方法', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('0f5fae0a-78e6-4e31-95da-1ddee82f4ad4', '1', '2', '3', '4', '5', '0', '1', '0', null);
INSERT INTO `common` VALUES ('11', '高科技', '高科技', '我的', '专利权维持', '111', '0', '1', '0', null);
INSERT INTO `common` VALUES ('148cc0fb-4a29-4f27-9210-abceaa21e073', '有机化学', '201010531975.9', '5-(2-溴-丙酰基)-2-苯硫基苯乙酸酯的制备方法', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('16c50e7f-9957-49b0-bc49-1823e0da7523', '22222', '1111', '', '', '', '0', '1', '1', '2015-01-01');
INSERT INTO `common` VALUES ('16f8f7d5-f535-4949-9886-ccb7aa40f693', '仿生设备/图像增强', '201410196649.5', '一种基于仿生双眼的大视场图像拼接系统和方法', '审中', '发明', '0', '0', '1', '');
INSERT INTO `common` VALUES ('1c965d5c-d897-40e8-aa75-9e28ab6b053e', '图像增强', '201410107314.1', '一种前扫声纳图像序列拼接方法', '审中', '发明', '0', '0', '1', '');
INSERT INTO `common` VALUES ('250abfe1-5d5c-43f4-85e8-20994081d386', '1', '2', '3', '4', '5', '6', '1', '0', null);
INSERT INTO `common` VALUES ('2a8c7095-6471-476c-b57f-e411fe7246af', '飞行器', '201310563804.8', '超小型无人旋翼飞行器野外定点零盲区自主软着陆方法', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('2b09242a-7c00-4cea-be81-97e0fbfba232', '医疗器械/仿生设备/', '200910196530.7', '仿生机械眼球', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('2b64a4d1-bda9-450d-a424-cdc63f73a6d0', '食品、食料及其制备方法', '201410154354.1', '一种方便面调料酱包', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('33b7e7e1-788d-4ca0-a592-0543f560ca73', '222', '', '1111', '', '', '0', '1', '0', '111');
INSERT INTO `common` VALUES ('3539172d-6b5c-4152-8367-017c907d956a', '太阳能设备', '201310225114.1', '连杆式双轴太阳能跟踪机构', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('35b1ee60-ff3e-4689-bcd9-d54152e683b4', '小家电', '2013100850529', '带吹风的吸尘器', '授权未办登', '发明', '1', '0', '1', '2016.10.17');
INSERT INTO `common` VALUES ('3b31ec77-776f-4bb2-b5c3-0761d82a1fa3', '日用保健', '2014102889301 ', '柏木药枕', '下证/有权', '发明', '1', '0', '0', '');
INSERT INTO `common` VALUES ('3d1efc6f-2187-4312-9669-db705b0a0550', '机器人/飞行器', '200910052033.X', '基于双飞行机器人对有源目标的定位方法与系统', '下证/有权', '发明', '0', '1', '0', '');
INSERT INTO `common` VALUES ('4fc288af-ffc2-46d3-b120-6da4710be596', '椅子', '201310400731.0', '一种背包椅', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('589c563b-3af9-4997-b859-3191b487bad5', '调节系统/机械', '201410173465.7', '一种基于非线性控制理论的无人艇轨迹跟踪控制装置及方法', '审中', '发明', '0', '0', '1', '');
INSERT INTO `common` VALUES ('5ab18e68-3dc7-4b3f-a0dc-6fc48e204198', '啤酒酿造', '201210502108.1', '一种家用全自动自酿啤酒机', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('6739dbc6-7440-448d-8973-8decdad41551', '保健按摩', '2015101506922', '一种按摩套件', '授权未办登', '发明', '0', '0', '1', '2016.9.21');
INSERT INTO `common` VALUES ('6750f6e5-ee56-44ca-bdcd-b5be35332e2e', '有机化学', '201010531975.9', '5-(2-溴-丙酰基)-2-苯硫基苯乙酸酯的制备方法', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('69f22f6a-a618-4e7d-a1e0-e6cb8924a2bc', '飞行机/非电变量调节', '201210424981.3', '基于双飞行机器人对有源目标的协调搜寻方法与系统', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('6f536fd7-d09b-4af5-ac31-456819fba900', '数据识别', '201310400824.3', '机载平台快速行人检测系统和方法', '审中', '发明专利', '0', '1', '0', '');
INSERT INTO `common` VALUES ('7eb11e2e-e9f6-4194-8d3c-8bfb4aec7d77', '机器人', '201310444222.8', '自主供电式全方位运动球形机器人', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('8d460067-e948-4f1e-94a9-1f30f3db13d3', '机器人', '201310170467.6', '核电站救援机器人位姿矫正平台', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('a5f8c44d-8360-4432-92b9-329225cb91fd', '中药提取物', '201110322947.0', '帽蕊木有效部位及其提取方法和在制备保肝护肝药物方面的应用 ', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('a854e62a-deac-45fa-b63d-af89062598b7', '食品、食料及其制备方法', '201410154393.1', '一种方便面用调味粉包', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('ae7a25aa-c52c-4d74-904c-bcce08b69797', '中药提取物', '200910064058.1', '卷柏提取物及其提取方法和应用', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('aef4b900-fd47-4bbd-9324-6abd06772dbe', '有机化学', '201510241373.2', '一种2-溴-9-芴酮的合成方法', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('b166bdba-7892-4d8e-a90c-6c2b27aa8baa', '图像通信', '201110312090.4', '机载云台运动目标自主跟踪系统的图像稳定方法', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('b9ce812a-193e-48e1-912f-2e5f4da02319', '日用保健', '2014102889265', '一种仿决明子婴幼儿枕', '下证/有权', '发明', '1', '0', '0', '');
INSERT INTO `common` VALUES ('c9de0bfe-11dd-40c2-9d5a-c88d9875e7f4', '有机化学', '201210490817.2', '2, 2’-(2, 2’-联吡啶-4, 4’-二次甲基)二丙二腈及其取代物的合成方法', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('d206a9f1-f405-40e1-8043-cf95bc28833d', '仿生设备/机械', '201410173507.7', '基于柔索驱动并联机构的三自由度仿生眼睛平台', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('d33f2335-66cd-4f0e-b8ee-cd7092b611da', '有机化学', '201210165790.X', '4, 4’-二羟甲基-2, 2’-联吡啶的合成方法', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('f14e7f0c-02d6-4fe6-b27b-72775f7bf67c', '实验仪器', '201310343583.3', '一种分光光度计的比色皿架', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('f775270e-e269-4650-83a0-46446a5b6dd0', '机器人/仿生设备', '201210411759.X', '一种基于仿生机理的机器人头眼协调运动控制方法', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('fda5df40-ac4d-429d-9ac0-bf84bf64fcc5', '太阳能设备', '201310225771.6', '框架式双轴太阳能跟踪系统', '下证/有权', '发明', '0', '0', '0', '');
INSERT INTO `common` VALUES ('ffe82ed3-132d-423b-a4d1-f0a95e083422', '数据识别/机械', '201310400824.3', '机载平台快速行人检测系统和方法', '审中', '发明', '0', '0', '1', '');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` varchar(40) NOT NULL,
  `name` varchar(255) default NULL,
  `level` varchar(255) default NULL,
  `relative` varchar(4000) default NULL,
  `memo` varchar(4000) default NULL,
  `files` varchar(4000) default NULL,
  `detailurl` varchar(255) default NULL,
  `detailcontent` text,
  `ord` int(11) default NULL,
  `state` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('3b42b03f-295c-4790-8e01-d3d4778a6210', '22', '', '', '', '', '', null, '0', '1');
INSERT INTO `project` VALUES ('62d69c1f-c835-43cb-8cd5-f7555b6c370a', '角线型母线式电工线槽', '小规模生产', '201420538234.7', '具有明装线槽易于布线、便于维护更换的优势；母线式线路简单明了，便于电气施工及后期故障的检查、维护；各路导线按需配置，不必统一使用1.5或2.5平方的线；维持墙面整洁、美观的同时，具有石膏角线的装饰效果；盖板可随意更换，以适应不同的居室风格；不必地面布线，减少地面砂浆厚度\n', null, '', '<p><img src=\"/Repository/ueditor/image/20160815/1471261112765070643.jpg\" title=\"1471261112765070643.jpg\" alt=\"\"/><img src=\"/Repository/ueditor/image/20160815/1471261138468015273.jpg\" title=\"1471261138468015273.jpg\" alt=\"\"/><img src=\"/Repository/ueditor/image/20160815/1471261156765078543.jpg\" title=\"1471261156765078543.jpg\" alt=\"\"/></p>', '0', '0');
INSERT INTO `project` VALUES ('7e4f2cbf-f82f-45c1-9582-547f620a58f0', '横琴国际知识产权交易中心简介', '', '', '横琴国际知识产权交易中心简介', '7e4f2cbf-f82f-45c1-9582-547f620a58f0_0.jpg,7e4f2cbf-f82f-45c1-9582-547f620a58f0_1.jpg,7e4f2cbf-f82f-45c1-9582-547f620a58f0_2.jpg,7e4f2cbf-f82f-45c1-9582-547f620a58f0_3.jpg', '7e4f2cbf-f82f-45c1-9582-547f620a58f0.jsp', '<p style=\";text-align:center;line-height:150%\"><span style=\";font-family:黑体;line-height:150%;font-size:29px\">横琴国际知识产权交易中心简介</span></p><p style=\"line-height: 150%;\"><strong style=\"line-height: 150%;\"><span style=\"font-family: 仿宋_GB2312;line-height: 150%;font-size: 21px;background: rgb(255, 255, 255)\">&nbsp;</span></strong></p><p style=\"text-align:center\"><img src=\"/Repository/ueditor/image/20160814/1471151027513099981.png\" title=\"1471151027513099981.png\" alt=\"\"/></p><p style=\"text-align:center\"><br/></p><p style=\"text-indent:43px;line-height:37px\"><span style=\";font-family:仿宋_GB2312;font-size:21px\">横琴国际知识产权交易中心有限公司（简称“横琴知交中心”）于2014年12月经广东省人民政府批准成立，由珠海金融投资控股集团有限公司、横琴金融投资有限公司、横琴发展有限责任公司强强联合投资组建而成，注册资本1亿元人民币。横琴知交中心承担国家知识产权运营横琴金融与国际特色试点平台（简称“国家横琴平台”）的建设运行任务，是国家“1+2+20+N”的知识产权运营体系的重要组成部分。</span></p><p style=\"text-indent:43px;line-height:37px\"><span style=\";font-family:仿宋_GB2312;font-size:21px\">国家横琴平台七弦琴知识产权资产与服务交易网以“人，资，网，政，产、知、研”为战略方针，以“加速知识产权资产和服务的交易与配置、为中国实体经济插上知识产权的翅膀”为第一个战略发展期的使命，充分发挥人才优势，调动资本的力量，运用互联网思维和工具，借助政策资源，全面打通产业界、知识产权界、研发界，积极</span><span style=\";font-family:仿宋_GB2312;font-size:21px\">建设中国脑力劳动者互联网家园，</span><span style=\";font-family:仿宋_GB2312;font-size:21px\">着力打造一个集聚创新人才、创新资源、创新要素的生态系统，提供以知识产权金融创新、知识产权跨境交易为特色的全方位、一站式、高品质的知识产权资产交易和服务交易服务。</span><span style=\";font-family:仿宋_GB2312;font-size:21px\">国家横琴平台的发展愿景是成为具有国际影响力、国内一流的生态型知识产权交易平台，致力于建设成为全球知识产权资产集散地、知识产权金融创新策源地、知识产权服务资源整合者、企业知识产权高级管家、知识产权人才摇篮与高端智库。</span></p><p style=\"text-indent:43px;line-height:40px\"><span style=\";font-family:仿宋_GB2312;font-size:21px\">国家横琴平台七弦琴知识产权交易网的8个主要产品：知识产权资产交易（专利、商标、版权）；知识产权服务交易（代理、诉讼、分析、咨询、培训）；知识产权创业项目交易（以知识产权为核心的创业项目）；知识产权运营服务（受托、收购、专利池、标准化）；创业辅导及投融资服务；研发服务；设计服务；特种有形商品交易。10大会员体系：个人（1-7星级、1-7弦级）；企业（1-7星级），高校（1-7星级），院所（1-7星级）；产业协会（1-7弦级），服务机构（1-7弦级），运营机构（1-7弦级），投资机构（1-7弦级），研发机构（1-7弦级），设计机构（1-7弦级）。</span></p><p style=\"text-indent:43px;line-height:40px\"><span style=\";font-family:仿宋_GB2312;font-size:21px\">国家横琴平台旗下拥有“七弦琴”知识产权资产与服务交易网、“七弦琴”知识产权高端服务、“七弦琴”专利投资、“七弦琴”专利、商标、外观设计、版权交易、“七弦琴·智财通宝”知识产权融资及股权众筹、“七弦琴”核心专利产品或专利技术认证、“七弦琴”知识产权经济、行政管理与金融创新研究、“七弦琴”与全球高品质知识产权服务机构的联营服务等产品体系。</span></p><p style=\"text-indent:43px\"><span style=\";font-family:仿宋_GB2312;font-size:21px\">横琴知交中心下设平台部，交易部，金融创新部，国际运营部，业务发展与会员部，研究培训部，流程管理与客户服务部，合规法务部，审计监察部，财务管理部，董事会办公室，综合管理部等12个部门。已经初步搭建了一个专业化、国际化、年轻化、多元化的团队，逐步形成了自己的企业文化。公司内部治理的5个原则：战略、开明、协作、执行力、学习。员工考核的4个标准：配合度、出活、省心、启发。文化建设的7个要素：人品、章法、执行力、心态、能力、使命、品味。能力建设的7个维度：思想力、表达力、执行力、沟通力、学习力、交际力、信念力。（2016年4月）</span></p><p><br/></p>', '0', '1');
INSERT INTO `project` VALUES ('c6651135-e4bd-41c5-98b0-1a5af04fe613', 'LED', '', '', '', 'c6651135-e4bd-41c5-98b0-1a5af04fe613_0.jpg,c6651135-e4bd-41c5-98b0-1a5af04fe613_1.jpg', 'c6651135-e4bd-41c5-98b0-1a5af04fe613.jsp', null, '0', '1');
INSERT INTO `project` VALUES ('fed51889-d879-467f-80f6-4926d2f5a28b', '1', '2', '3', '7', 'fed51889-d879-467f-80f6-4926d2f5a28b_0.jpg,fed51889-d879-467f-80f6-4926d2f5a28b_1.jpg', 'fed51889-d879-467f-80f6-4926d2f5a28b.jsp', null, '0', '1');
