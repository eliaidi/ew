/*
SQLyog v10.2 
MySQL - 5.5.15 : Database - ew
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ew` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ew`;

/*Table structure for table `t_category_info` */

DROP TABLE IF EXISTS `t_category_info`;

CREATE TABLE `t_category_info` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_category_info` */

insert  into `t_category_info`(`id`,`name`) values ('4df9e89c55e441dfbb355ac494791db7','企业网站'),('61d451a0b49d44b3b633ef3504c57484','管理系统'),('61feb0bcf4a94288955feb90dd02083c','IOS'),('77f75bb27c7a476aabfd702e55c34754','桌面应用'),('d335a8ef9e5445ce92068fd7eac21bb1','电商'),('d335a8ef9e5445ce92068fd7eac21bba','安卓');

/*Table structure for table `t_contact_info` */

DROP TABLE IF EXISTS `t_contact_info`;

CREATE TABLE `t_contact_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COMMENT '联系描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_contact_info` */

insert  into `t_contact_info`(`id`,`description`) values (1,'<p>Fugiat dapibus, tellus ac cursus commodo, mauesris condime ntum nibh, ut fermentum mas justo sitters.</p>\r\n<p><i class=\"icon-map-marker\"></i> 3 Athens street</p>\r\n<p><i class=\"icon-phone\"></i> (+30) 265-9987</p>\r\n<p><i class=\"icon-print\"></i> (+30) 9854-7855</p>\r\n<p><i class=\"icon-envelope\"></i> hello@restarttheme.com</p>');

/*Table structure for table `t_employee_info` */

DROP TABLE IF EXISTS `t_employee_info`;

CREATE TABLE `t_employee_info` (
  `id` varchar(64) NOT NULL COMMENT 'uuid',
  `name` varchar(128) DEFAULT NULL COMMENT '名称',
  `job_description` text COMMENT '职业描述',
  `description` text COMMENT '个人描述',
  `start_img_path` varchar(256) DEFAULT NULL COMMENT '点击前头像路径',
  `end_img_path` varchar(256) DEFAULT NULL COMMENT '点击后头像路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工信息表';

/*Data for the table `t_employee_info` */

insert  into `t_employee_info`(`id`,`name`,`job_description`,`description`,`start_img_path`,`end_img_path`) values ('1','刘沙','设计师/产品研发','拥有3年产品研究经验和4年的设计经验，已经为无数的客户提供了精良甚至完美的创意和作品。','images/aboutus/1a.jpg','images/aboutus/1b.jpg'),('2','廖陈特','Web网站开发/创始人\r\n','拥有5年Java方面的软件研发经验，对于系统的设计和研发都有自己独特的见解，追求简单、质朴、纯洁的设计风格。','images/aboutus/2a.jpg','images/aboutus/2b.jpg'),('3','谢华良','.NET高级工程师/架构师','拥有10余年的软件研发、平台架构经验。对技术前沿与发展方向的敏锐洞察力，对卓越代码和优秀结构的强烈追求。','images/aboutus/3a.jpg','images/aboutus/3b.jpg'),('4','苏菊','安卓工程师/IOS工程师','拥有3年安卓和2年IOS开发经验，对大型互联网应用产品的设计、研发、推广、运营、优化等过程有深刻理解。','images/aboutus/4a.jpg','images/aboutus/4b.jpg');

/*Table structure for table `t_menu_info` */

DROP TABLE IF EXISTS `t_menu_info`;

CREATE TABLE `t_menu_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `t_menu_info` */

insert  into `t_menu_info`(`id`,`name`,`path`,`orderNum`) values (1,'资讯管理','/manage/goNews/do',1),(2,'员工信息管理','/manage/goEmployee.do',2),(3,'产品管理','/manage/goProduct.do',3),(4,'服务管理','/manage/goServices.do',4),(5,'国际化管理','/manage/goI18N.do',5),(6,'用户管理','/manage/goUser.do',9),(7,'角色管理','/manage/goRole.do',8),(8,'菜单管理','/manage/goMenu.do',7),(9,'客户消息','/manage/goMessage.do',6);

/*Table structure for table `t_menu_role_rec` */

DROP TABLE IF EXISTS `t_menu_role_rec`;

CREATE TABLE `t_menu_role_rec` (
  `menu_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_menu_role_rec` */

insert  into `t_menu_role_rec`(`menu_id`,`role_id`) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2),(4,1),(4,2),(5,1),(5,2),(6,1),(7,1),(8,1),(9,1);

/*Table structure for table `t_message_info` */

DROP TABLE IF EXISTS `t_message_info`;

CREATE TABLE `t_message_info` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `subject` varchar(128) DEFAULT NULL,
  `message` varchar(256) DEFAULT NULL,
  `is_flag` tinyint(1) DEFAULT '1' COMMENT '是否已读0是，1否',
  `create_time` varchar(64) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_message_info` */

insert  into `t_message_info`(`id`,`name`,`email`,`subject`,`message`,`is_flag`,`create_time`,`ip`) values ('e4d3044a98bb4bbd917414fcbf425aaa','licoate','qrqwr','qwr','qwr',1,'2014-08-11','0:0:0:0:0:0:0:1');

/*Table structure for table `t_news_info` */

DROP TABLE IF EXISTS `t_news_info`;

CREATE TABLE `t_news_info` (
  `id` varchar(64) NOT NULL,
  `title` varchar(256) DEFAULT NULL COMMENT '标题',
  `type_id` int(11) DEFAULT NULL,
  `content` text COMMENT '内容',
  `source` varchar(64) DEFAULT NULL COMMENT '来源',
  `create_by` varchar(64) DEFAULT NULL COMMENT '责编',
  `create_time` varchar(64) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_news_info` */

/*Table structure for table `t_news_type_info` */

DROP TABLE IF EXISTS `t_news_type_info`;

CREATE TABLE `t_news_type_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_news_type_info` */

/*Table structure for table `t_product_img_rec` */

DROP TABLE IF EXISTS `t_product_img_rec`;

CREATE TABLE `t_product_img_rec` (
  `id` varchar(64) NOT NULL COMMENT 'uuid',
  `product_id` varchar(64) DEFAULT NULL COMMENT '近期产品ID',
  `img_path` varchar(256) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品图片表';

/*Data for the table `t_product_img_rec` */

insert  into `t_product_img_rec`(`id`,`product_id`,`img_path`) values ('crm01','5','images/portfolio/item/crm_1.jpg'),('crm02','5','images/portfolio/item/crm_2.jpg'),('crm03','5','images/portfolio/item/crm_3.jpg'),('crm04','5','images/portfolio/item/crm_4.jpg'),('crm05','5','images/portfolio/item/crm_5.jpg'),('mp1','4','images/portfolio/item/mp_1.jpg'),('mp2','4','images/portfolio/item/mp_2.jpg'),('mp3','4','images/portfolio/item/mp_3.jpg'),('mp4','4','images/portfolio/item/mp_4.jpg'),('pms001','3','images/portfolio/item/pms_1.jpg'),('pms002','3','images/portfolio/item/pms_2.jpg'),('pms003','3','images/portfolio/item/pms_3.jpg'),('pms004','3','images/portfolio/item/pms_4.jpg'),('tm1','1','images/portfolio/item/tm_1.jpg'),('tm2','1','images/portfolio/item/tm_2.jpg'),('tm3','1','images/portfolio/item/tm_3.jpg'),('tm4','1','images/portfolio/item/tm_4.jpg'),('xx001','2','images/portfolio/item/xx_1.jpg'),('xx002','2','images/portfolio/item/xx_2.jpg'),('xx003','2','images/portfolio/item/xx_3.jpg'),('xx004','2','images/portfolio/item/xx_4.jpg');

/*Table structure for table `t_product_info` */

DROP TABLE IF EXISTS `t_product_info`;

CREATE TABLE `t_product_info` (
  `id` varchar(64) NOT NULL COMMENT 'uuid',
  `title` varchar(128) DEFAULT NULL COMMENT '主标题',
  `sub_title` varchar(128) DEFAULT NULL COMMENT '子标题',
  `synopsis` text COMMENT '简介',
  `description` text COMMENT '描述1',
  `description1` text COMMENT '描述2（备用）',
  `img_path` varchar(256) DEFAULT NULL COMMENT '封面图片路径',
  `is_flag` tinyint(1) DEFAULT '0' COMMENT '是否展示,0是1否',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `category_id` varchar(64) DEFAULT NULL,
  `price` varchar(256) DEFAULT NULL,
  `price_model` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='近期作品表';

/*Data for the table `t_product_info` */

insert  into `t_product_info`(`id`,`title`,`sub_title`,`synopsis`,`description`,`description1`,`img_path`,`is_flag`,`order_num`,`category_id`,`price`,`price_model`) values ('1','在线教学管理系统','管理系统','本系统是齐鲁工业大学定制开发的在线教学管理系统，主要方便教师对学生的教学管理。','<p><strong>开发语言:</strong> Java</p>\r\n<p><strong>数据库:</strong> Mysql</p>\r\n<p><strong>操作系统:</strong> Windows、Linux</p>\r\n<p><strong>支持浏览器:</strong> IE7以上、搜狗、Chrome等</p>\r\n',NULL,'images/portfolio/C1.jpg',0,2,'61d451a0b49d44b3b633ef3504c57484',NULL,NULL),('2','XXX公司网站','企业网站','这是一个企业官方网站，帮助企业提升企业知名度。','<p><strong>开发语言:</strong> Java</p>\r\n<p><strong>数据库:</strong> Mysql</p>\r\n<p><strong>操作系统:</strong> Windows、Linux</p>\r\n<p><strong>支持浏览器:</strong> IE7以上、搜狗、Chrome等</p>\r\n',NULL,'images/portfolio/C2.jpg',0,3,'4df9e89c55e441dfbb355ac494791db7',NULL,''),('3','家电商城网站','在线商城','本网站是一个B2C模式的在线家电商城，系统具备完整的网上购物流程。','<p><strong>开发语言:</strong> Java</p>\r\n<p><strong>数据库:</strong> Mysql</p>\r\n<p><strong>操作系统:</strong> Windows、Linux</p>\r\n<p><strong>支持浏览器:</strong> IE7以上、搜狗、Chrome等</p>\r\n',NULL,'images/portfolio/C3.jpg',0,1,'d335a8ef9e5445ce92068fd7eac21bb1',NULL,NULL),('4','门牌管理系统','桌面应用','这是一个政府定制的门牌管理系统，对所有门牌相关信息进行收纳管理。','<p><strong>开发语言:</strong> Java</p>\r\n<p><strong>数据库:</strong> Mysql</p>\r\n<p><strong>操作系统:</strong> Windows、Linux</p>\r\n<p><strong>支持浏览器:</strong> IE7以上、搜狗、Chrome等</p>\r\n',NULL,'images/portfolio/C4.jpg',0,4,'77f75bb27c7a476aabfd702e55c34754',NULL,NULL),('5','某4S店CRM管理系统','管理系统','这是某个汽车4S店的客户关系管理系统，用于对客户的资料进行收集维护，通过程序分析潜在客户，加强客户关系的管理。\r\n','<p><strong>开发语言:</strong> Java</p>\r\n<p><strong>数据库:</strong> Mysql</p>\r\n<p><strong>操作系统:</strong> Windows、Linux</p>\r\n<p><strong>支持浏览器:</strong> IE7以上、搜狗、Chrome等</p>\r\n',NULL,'images/portfolio/C5.jpg',1,5,'61d451a0b49d44b3b633ef3504c57484',NULL,NULL);

/*Table structure for table `t_role_info` */

DROP TABLE IF EXISTS `t_role_info`;

CREATE TABLE `t_role_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_role_info` */

insert  into `t_role_info`(`id`,`name`) values (1,'管理员'),(2,'编辑员');

/*Table structure for table `t_services_info` */

DROP TABLE IF EXISTS `t_services_info`;

CREATE TABLE `t_services_info` (
  `id` varchar(64) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `sub_title` varchar(128) DEFAULT NULL,
  `price` varchar(256) DEFAULT NULL,
  `price_model` varchar(64) DEFAULT NULL,
  `description` text,
  `is_flag` varchar(64) DEFAULT '1' COMMENT '标记是否重点0是1否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_services_info` */

insert  into `t_services_info`(`id`,`title`,`sub_title`,`price`,`price_model`,`description`,`is_flag`) values ('1','个人系统','不要觉得太贵，理想是无价的。','800','pc','<p> <strong>1</strong> 炫耀必备 </p>\r\n<p> <strong>2</strong> 追女神必备 </p>\r\n<p> <strong>3</strong> 迎娶白富美必备 </p>\r\n\r\n','1'),('2','企业网站','不要在乎金钱，企业形象不是有钱就能买到的。','1500','pc','<p> <strong>1</strong> 有利于提升企业品牌形象  </p>\r\n<p> <strong>2</strong> 使企业具有网络沟通能力 </p>\r\n<p> <strong>3</strong> 可以全面地展示公司及产品 </p>\r\n','0'),('3','安卓/IOS','没有付出，就没有回报。','1000','pc','<p> <strong>1</strong> 用户对移动设备的依赖在不断增强   </p>\r\n<p> <strong>2</strong> 移动市场潜力巨大 </p>\r\n<p> <strong>3</strong> 移动应用前景广阔 </p>\r\n','1');

/*Table structure for table `t_user_info` */

DROP TABLE IF EXISTS `t_user_info`;

CREATE TABLE `t_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(256) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `is_flag` tinyint(1) DEFAULT NULL COMMENT '是否启用0-是1-否',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=867997 DEFAULT CHARSET=utf8;

/*Data for the table `t_user_info` */

insert  into `t_user_info`(`id`,`username`,`password`,`name`,`is_flag`,`role_id`) values (867995,'admin','e10adc3949ba59abbe56e057f20f883e','管理员',0,1),(867996,'liaote','e10adc3949ba59abbe56e057f20f883e','廖陈特',0,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
