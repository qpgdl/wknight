/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.0.51b-community-nt : Database - wknight
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`wknight` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wknight`;

/*Table structure for table `wn_address` */

DROP TABLE IF EXISTS `wn_address`;

CREATE TABLE `wn_address` (
  `address_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL default '0',
  `zone_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_address` */

/*Table structure for table `wn_affiliate` */

DROP TABLE IF EXISTS `wn_affiliate`;

CREATE TABLE `wn_affiliate` (
  `affiliate_id` int(11) NOT NULL auto_increment,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL default '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_affiliate` */

/*Table structure for table `wn_affiliate_transaction` */

DROP TABLE IF EXISTS `wn_affiliate_transaction`;

CREATE TABLE `wn_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL auto_increment,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_affiliate_transaction` */

/*Table structure for table `wn_attribute` */

DROP TABLE IF EXISTS `wn_attribute`;

CREATE TABLE `wn_attribute` (
  `attribute_id` int(11) NOT NULL auto_increment,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`attribute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `wn_attribute` */

insert  into `wn_attribute`(`attribute_id`,`attribute_group_id`,`sort_order`) values (1,6,1),(2,6,5),(3,6,3),(4,3,1),(5,3,2),(6,3,3),(7,3,4),(8,3,5),(9,3,6),(10,3,7),(11,3,8);

/*Table structure for table `wn_attribute_description` */

DROP TABLE IF EXISTS `wn_attribute_description`;

CREATE TABLE `wn_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_attribute_description` */

insert  into `wn_attribute_description`(`attribute_id`,`language_id`,`name`) values (1,1,'Description'),(2,1,'No. of Cores'),(4,1,'test 1'),(5,1,'test 2'),(6,1,'test 3'),(7,1,'test 4'),(8,1,'test 5'),(9,1,'test 6'),(10,1,'test 7'),(11,1,'test 8'),(3,1,'Clockspeed'),(1,2,'Description'),(2,2,'No. of Cores'),(4,2,'test 1'),(5,2,'test 2'),(6,2,'test 3'),(7,2,'test 4'),(8,2,'test 5'),(9,2,'test 6'),(10,2,'test 7'),(11,2,'test 8'),(3,2,'Clockspeed');

/*Table structure for table `wn_attribute_group` */

DROP TABLE IF EXISTS `wn_attribute_group`;

CREATE TABLE `wn_attribute_group` (
  `attribute_group_id` int(11) NOT NULL auto_increment,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`attribute_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `wn_attribute_group` */

insert  into `wn_attribute_group`(`attribute_group_id`,`sort_order`) values (3,2),(4,1),(5,3),(6,4);

/*Table structure for table `wn_attribute_group_description` */

DROP TABLE IF EXISTS `wn_attribute_group_description`;

CREATE TABLE `wn_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_attribute_group_description` */

insert  into `wn_attribute_group_description`(`attribute_group_id`,`language_id`,`name`) values (3,1,'Memory'),(4,1,'Technical'),(5,1,'Motherboard'),(6,1,'Processor'),(3,2,'Memory'),(4,2,'Technical'),(5,2,'Motherboard'),(6,2,'Processor');

/*Table structure for table `wn_banner` */

DROP TABLE IF EXISTS `wn_banner`;

CREATE TABLE `wn_banner` (
  `banner_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY  (`banner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `wn_banner` */

insert  into `wn_banner`(`banner_id`,`name`,`status`) values (6,'HP Products',1),(7,'Samsung Tab',1),(8,'Manufacturers',1);

/*Table structure for table `wn_banner_image` */

DROP TABLE IF EXISTS `wn_banner_image`;

CREATE TABLE `wn_banner_image` (
  `banner_image_id` int(11) NOT NULL auto_increment,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY  (`banner_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

/*Data for the table `wn_banner_image` */

insert  into `wn_banner_image`(`banner_image_id`,`banner_id`,`link`,`image`) values (54,7,'index.php?route=product/product&amp;path=57&amp;product_id=49','data/demo/samsung_banner.jpg'),(77,6,'index.php?route=product/manufacturer/info&amp;manufacturer_id=7','data/demo/hp_banner.jpg'),(75,8,'index.php?route=product/manufacturer/info&amp;manufacturer_id=5','data/demo/htc_logo.jpg'),(73,8,'index.php?route=product/manufacturer/info&amp;manufacturer_id=8','data/demo/apple_logo.jpg'),(74,8,'index.php?route=product/manufacturer/info&amp;manufacturer_id=9','data/demo/canon_logo.jpg'),(71,8,'index.php?route=product/manufacturer/info&amp;manufacturer_id=10','data/demo/sony_logo.jpg'),(72,8,'index.php?route=product/manufacturer/info&amp;manufacturer_id=6','data/demo/palm_logo.jpg'),(76,8,'index.php?route=product/manufacturer/info&amp;manufacturer_id=7','data/demo/hp_logo.jpg');

/*Table structure for table `wn_banner_image_description` */

DROP TABLE IF EXISTS `wn_banner_image_description`;

CREATE TABLE `wn_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY  (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_banner_image_description` */

insert  into `wn_banner_image_description`(`banner_image_id`,`language_id`,`banner_id`,`title`) values (54,1,7,'Samsung Tab 10.1'),(77,1,6,'HP Banner'),(75,1,8,'HTC'),(74,1,8,'Canon'),(73,1,8,'Apple'),(72,1,8,'Palm'),(71,1,8,'Sony'),(76,1,8,'Hewlett-Packard'),(54,2,7,'Samsung Tab 10.1'),(77,2,6,'HP Banner'),(75,2,8,'HTC'),(74,2,8,'Canon'),(73,2,8,'Apple'),(72,2,8,'Palm'),(71,2,8,'Sony'),(76,2,8,'Hewlett-Packard');

/*Table structure for table `wn_category` */

DROP TABLE IF EXISTS `wn_category`;

CREATE TABLE `wn_category` (
  `category_id` int(11) NOT NULL auto_increment,
  `image` varchar(255) default NULL,
  `parent_id` int(11) NOT NULL default '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL default '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

/*Data for the table `wn_category` */

insert  into `wn_category`(`category_id`,`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) values (68,'',64,0,1,0,1,'2013-05-26 17:09:17','2013-05-26 17:09:17'),(67,'',65,0,1,0,1,'2013-05-26 17:07:52','2013-05-26 17:07:52'),(64,'',0,0,1,0,1,'2013-05-26 16:58:57','2013-05-26 17:02:05'),(65,'',64,0,1,0,1,'2013-05-26 16:59:19','2013-05-26 16:59:19');

/*Table structure for table `wn_category_description` */

DROP TABLE IF EXISTS `wn_category_description`;

CREATE TABLE `wn_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY  (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_category_description` */

insert  into `wn_category_description`(`category_id`,`language_id`,`name`,`description`,`meta_description`,`meta_keyword`) values (64,1,'product','&lt;p&gt;product.&lt;/p&gt;\r\n','product.','product.'),(65,1,'Muscle Development','','',''),(67,1,'Muscle Pump','&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: normal; background-color: rgb(255, 255, 203);&quot;&gt;Muscle Pump&lt;/span&gt;&lt;/p&gt;\r\n','',''),(68,1,'Energy','&lt;p&gt;Energy&lt;/p&gt;\r\n','',''),(64,2,'product','&lt;p&gt;product.&lt;/p&gt;\r\n','product.','product.'),(65,2,'Muscle Development','','',''),(67,2,'Muscle Pump','&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: normal; background-color: rgb(255, 255, 203);&quot;&gt;Muscle Pump&lt;/span&gt;&lt;/p&gt;\r\n','',''),(68,2,'Energy','&lt;p&gt;Energy&lt;/p&gt;\r\n','','');

/*Table structure for table `wn_category_filter` */

DROP TABLE IF EXISTS `wn_category_filter`;

CREATE TABLE `wn_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY  (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_category_filter` */

/*Table structure for table `wn_category_path` */

DROP TABLE IF EXISTS `wn_category_path`;

CREATE TABLE `wn_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY  (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_category_path` */

insert  into `wn_category_path`(`category_id`,`path_id`,`level`) values (68,64,0),(68,68,1),(65,64,0),(65,65,1),(67,64,0),(64,64,0),(67,67,2),(67,65,1);

/*Table structure for table `wn_category_to_layout` */

DROP TABLE IF EXISTS `wn_category_to_layout`;

CREATE TABLE `wn_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY  (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_category_to_layout` */

/*Table structure for table `wn_category_to_store` */

DROP TABLE IF EXISTS `wn_category_to_store`;

CREATE TABLE `wn_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_category_to_store` */

insert  into `wn_category_to_store`(`category_id`,`store_id`) values (64,0),(65,0),(67,0),(68,0);

/*Table structure for table `wn_country` */

DROP TABLE IF EXISTS `wn_country`;

CREATE TABLE `wn_country` (
  `country_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `wn_country` */

insert  into `wn_country`(`country_id`,`name`,`iso_code_2`,`iso_code_3`,`address_format`,`postcode_required`,`status`) values (44,'中国 ','CN','CHN','',1,1);

/*Table structure for table `wn_coupon` */

DROP TABLE IF EXISTS `wn_coupon`;

CREATE TABLE `wn_coupon` (
  `coupon_id` int(11) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `wn_coupon` */

insert  into `wn_coupon`(`coupon_id`,`name`,`code`,`type`,`discount`,`logged`,`shipping`,`total`,`date_start`,`date_end`,`uses_total`,`uses_customer`,`status`,`date_added`) values (4,'-10% Discount','2222','P','10.0000',0,0,'0.0000','2011-01-01','2012-01-01',10,'10',1,'2009-01-27 13:55:03'),(5,'Free Shipping','3333','P','0.0000',0,1,'100.0000','2009-03-01','2009-08-31',10,'10',1,'2009-03-14 21:13:53'),(6,'-10.00 Discount','1111','F','10.0000',0,0,'10.0000','1970-11-01','2020-11-01',100000,'10000',1,'2009-03-14 21:15:18');

/*Table structure for table `wn_coupon_category` */

DROP TABLE IF EXISTS `wn_coupon_category`;

CREATE TABLE `wn_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY  (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_coupon_category` */

/*Table structure for table `wn_coupon_history` */

DROP TABLE IF EXISTS `wn_coupon_history`;

CREATE TABLE `wn_coupon_history` (
  `coupon_history_id` int(11) NOT NULL auto_increment,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_coupon_history` */

/*Table structure for table `wn_coupon_product` */

DROP TABLE IF EXISTS `wn_coupon_product`;

CREATE TABLE `wn_coupon_product` (
  `coupon_product_id` int(11) NOT NULL auto_increment,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY  (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_coupon_product` */

/*Table structure for table `wn_currency` */

DROP TABLE IF EXISTS `wn_currency`;

CREATE TABLE `wn_currency` (
  `currency_id` int(11) NOT NULL auto_increment,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`currency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wn_currency` */

insert  into `wn_currency`(`currency_id`,`title`,`code`,`symbol_left`,`symbol_right`,`decimal_place`,`value`,`status`,`date_modified`) values (1,'人民币','CNY','￥','','2',1.00000000,1,'2013-05-26 14:30:41');

/*Table structure for table `wn_custom_field` */

DROP TABLE IF EXISTS `wn_custom_field`;

CREATE TABLE `wn_custom_field` (
  `custom_field_id` int(11) NOT NULL auto_increment,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_custom_field` */

/*Table structure for table `wn_custom_field_description` */

DROP TABLE IF EXISTS `wn_custom_field_description`;

CREATE TABLE `wn_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY  (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_custom_field_description` */

/*Table structure for table `wn_custom_field_to_customer_group` */

DROP TABLE IF EXISTS `wn_custom_field_to_customer_group`;

CREATE TABLE `wn_custom_field_to_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY  (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_custom_field_to_customer_group` */

/*Table structure for table `wn_custom_field_value` */

DROP TABLE IF EXISTS `wn_custom_field_value`;

CREATE TABLE `wn_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL auto_increment,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_custom_field_value` */

/*Table structure for table `wn_custom_field_value_description` */

DROP TABLE IF EXISTS `wn_custom_field_value_description`;

CREATE TABLE `wn_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY  (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_custom_field_value_description` */

/*Table structure for table `wn_customer` */

DROP TABLE IF EXISTS `wn_customer`;

CREATE TABLE `wn_customer` (
  `customer_id` int(11) NOT NULL auto_increment,
  `store_id` int(11) NOT NULL default '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL default '0',
  `address_id` int(11) NOT NULL default '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL default '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_customer` */

/*Table structure for table `wn_customer_ban_ip` */

DROP TABLE IF EXISTS `wn_customer_ban_ip`;

CREATE TABLE `wn_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL auto_increment,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY  (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_customer_ban_ip` */

/*Table structure for table `wn_customer_field` */

DROP TABLE IF EXISTS `wn_customer_field`;

CREATE TABLE `wn_customer_field` (
  `customer_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`customer_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_customer_field` */

/*Table structure for table `wn_customer_group` */

DROP TABLE IF EXISTS `wn_customer_group`;

CREATE TABLE `wn_customer_group` (
  `customer_group_id` int(11) NOT NULL auto_increment,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`customer_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wn_customer_group` */

insert  into `wn_customer_group`(`customer_group_id`,`approval`,`company_id_display`,`company_id_required`,`tax_id_display`,`tax_id_required`,`sort_order`) values (1,0,1,0,0,1,1);

/*Table structure for table `wn_customer_group_description` */

DROP TABLE IF EXISTS `wn_customer_group_description`;

CREATE TABLE `wn_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_customer_group_description` */

insert  into `wn_customer_group_description`(`customer_group_id`,`language_id`,`name`,`description`) values (1,1,'Default','test'),(1,2,'Default','test');

/*Table structure for table `wn_customer_history` */

DROP TABLE IF EXISTS `wn_customer_history`;

CREATE TABLE `wn_customer_history` (
  `customer_history_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_customer_history` */

/*Table structure for table `wn_customer_ip` */

DROP TABLE IF EXISTS `wn_customer_ip`;

CREATE TABLE `wn_customer_ip` (
  `customer_ip_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_customer_ip` */

/*Table structure for table `wn_customer_online` */

DROP TABLE IF EXISTS `wn_customer_online`;

CREATE TABLE `wn_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_customer_online` */

/*Table structure for table `wn_customer_reward` */

DROP TABLE IF EXISTS `wn_customer_reward`;

CREATE TABLE `wn_customer_reward` (
  `customer_reward_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL default '0',
  `order_id` int(11) NOT NULL default '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_customer_reward` */

/*Table structure for table `wn_customer_transaction` */

DROP TABLE IF EXISTS `wn_customer_transaction`;

CREATE TABLE `wn_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_customer_transaction` */

/*Table structure for table `wn_download` */

DROP TABLE IF EXISTS `wn_download`;

CREATE TABLE `wn_download` (
  `download_id` int(11) NOT NULL auto_increment,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(11) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_download` */

/*Table structure for table `wn_download_description` */

DROP TABLE IF EXISTS `wn_download_description`;

CREATE TABLE `wn_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_download_description` */

/*Table structure for table `wn_extension` */

DROP TABLE IF EXISTS `wn_extension`;

CREATE TABLE `wn_extension` (
  `extension_id` int(11) NOT NULL auto_increment,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY  (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=428 DEFAULT CHARSET=utf8;

/*Data for the table `wn_extension` */

insert  into `wn_extension`(`extension_id`,`type`,`code`) values (23,'payment','cod'),(22,'total','shipping'),(57,'total','sub_total'),(58,'total','tax'),(59,'total','total'),(410,'module','banner'),(426,'module','carousel'),(390,'total','credit'),(387,'shipping','flat'),(349,'total','handling'),(350,'total','low_order_fee'),(389,'total','coupon'),(413,'module','category'),(411,'module','affiliate'),(408,'module','account'),(393,'total','reward'),(398,'total','voucher'),(407,'payment','free_checkout'),(427,'module','featured'),(419,'module','slideshow');

/*Table structure for table `wn_filter` */

DROP TABLE IF EXISTS `wn_filter`;

CREATE TABLE `wn_filter` (
  `filter_id` int(11) NOT NULL auto_increment,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_filter` */

/*Table structure for table `wn_filter_description` */

DROP TABLE IF EXISTS `wn_filter_description`;

CREATE TABLE `wn_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_filter_description` */

/*Table structure for table `wn_filter_group` */

DROP TABLE IF EXISTS `wn_filter_group`;

CREATE TABLE `wn_filter_group` (
  `filter_group_id` int(11) NOT NULL auto_increment,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_filter_group` */

/*Table structure for table `wn_filter_group_description` */

DROP TABLE IF EXISTS `wn_filter_group_description`;

CREATE TABLE `wn_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_filter_group_description` */

/*Table structure for table `wn_geo_zone` */

DROP TABLE IF EXISTS `wn_geo_zone`;

CREATE TABLE `wn_geo_zone` (
  `geo_zone_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `wn_geo_zone` */

insert  into `wn_geo_zone`(`geo_zone_id`,`name`,`description`,`date_modified`,`date_added`) values (3,'上海浦东','上海浦东','2012-09-01 21:10:57','2009-01-06 23:26:25'),(4,'四川成都','四川成都','2012-09-01 21:10:07','2009-06-23 01:14:53');

/*Table structure for table `wn_information` */

DROP TABLE IF EXISTS `wn_information`;

CREATE TABLE `wn_information` (
  `information_id` int(11) NOT NULL auto_increment,
  `bottom` int(1) NOT NULL default '0',
  `sort_order` int(3) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`information_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `wn_information` */

insert  into `wn_information`(`information_id`,`bottom`,`sort_order`,`status`) values (3,1,3,1),(4,1,1,1),(5,1,4,1),(6,1,2,1);

/*Table structure for table `wn_information_description` */

DROP TABLE IF EXISTS `wn_information_description`;

CREATE TABLE `wn_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_information_description` */

insert  into `wn_information_description`(`information_id`,`language_id`,`title`,`description`) values (4,2,'About White Knight','&lt;p&gt;&lt;img src=&quot;http://127.0.0.1/wknight/image/data/vt_tour_img_07.jpg&quot; style=&quot;margin: 0px 20px 20px 0px; border: 2px solid rgb(240, 240, 240); float: left; width: 277px; height: 300px;&quot; /&gt; White Knight......no compromise for exceptional quality&lt;br /&gt;\r\n&lt;br /&gt;\r\nWhy White Knight?&lt;br /&gt;\r\n&lt;br /&gt;\r\nAll White Knight products are made in the United States by manufacturers abiding by the Good Manufacturing Practices (GMP). We routinely send samples to third-party laboratories to test for purity and potency.&lt;br /&gt;\r\nThe formulas of White Knight products are based on solid studies. We do not venture into anything too new. We refuse to use ingredients suspicious of causing harm. These include aspartame, saccharin, artificial colors, artificial preservatives, carrageenan, and genetically modified foods. All herbal products and fish oil products conform to German Commission E standards and WHO standards respectively.&lt;br /&gt;\r\n&lt;br /&gt;\r\nLast but not least, White Knight will not intentionally exaggerate or misinform in any of its promotional materials, labels or advertisements.&lt;/p&gt;\r\n'),(5,1,'政策&amp;条款','&lt;p&gt;\r\n	政策 &amp;amp; 条款&lt;/p&gt;\r\n'),(3,1,'隐私权声明','&lt;p&gt;\r\n	隐私权声明&lt;/p&gt;\r\n'),(6,1,'投递 信息','&lt;p&gt;\r\n	投递 信息&lt;/p&gt;\r\n'),(5,2,'政策&amp;条款','&lt;p&gt;\r\n	政策 &amp;amp; 条款&lt;/p&gt;\r\n'),(3,2,'隐私权声明','&lt;p&gt;\r\n	隐私权声明&lt;/p&gt;\r\n'),(6,2,'投递 信息','&lt;p&gt;\r\n	投递 信息&lt;/p&gt;\r\n'),(4,1,'关于我们','&lt;p&gt;关于我们&lt;/p&gt;\r\n');

/*Table structure for table `wn_information_to_layout` */

DROP TABLE IF EXISTS `wn_information_to_layout`;

CREATE TABLE `wn_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY  (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_information_to_layout` */

/*Table structure for table `wn_information_to_store` */

DROP TABLE IF EXISTS `wn_information_to_store`;

CREATE TABLE `wn_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_information_to_store` */

insert  into `wn_information_to_store`(`information_id`,`store_id`) values (3,0),(4,0),(5,0),(6,0);

/*Table structure for table `wn_language` */

DROP TABLE IF EXISTS `wn_language`;

CREATE TABLE `wn_language` (
  `language_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL default '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY  (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `wn_language` */

insert  into `wn_language`(`language_id`,`name`,`code`,`locale`,`image`,`directory`,`filename`,`sort_order`,`status`) values (1,'简体中文','zh-CN','zh_CN.utf-8,zh-cn,china','cn.png','zh-CN','zh-CN',1,1),(2,'english','en','en_US.UTF-8,en_US,en-gb,english','gb.png','english','english',1,1);

/*Table structure for table `wn_layout` */

DROP TABLE IF EXISTS `wn_layout`;

CREATE TABLE `wn_layout` (
  `layout_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`layout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `wn_layout` */

insert  into `wn_layout`(`layout_id`,`name`) values (1,'首页'),(2,'产品'),(3,'目录'),(4,'默认'),(5,'厂商'),(6,'帐户'),(7,'结账'),(8,'联系'),(9,'导航'),(10,'分销商'),(11,'信息');

/*Table structure for table `wn_layout_route` */

DROP TABLE IF EXISTS `wn_layout_route`;

CREATE TABLE `wn_layout_route` (
  `layout_route_id` int(11) NOT NULL auto_increment,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY  (`layout_route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `wn_layout_route` */

insert  into `wn_layout_route`(`layout_route_id`,`layout_id`,`store_id`,`route`) values (30,6,0,'account'),(17,10,0,'affiliate/'),(29,3,0,'product/category'),(26,1,0,'common/home'),(20,2,0,'product/product'),(24,11,0,'information/information'),(22,5,0,'product/manufacturer'),(23,7,0,'checkout/'),(31,8,0,'information/contact'),(32,9,0,'information/sitemap');

/*Table structure for table `wn_length_class` */

DROP TABLE IF EXISTS `wn_length_class`;

CREATE TABLE `wn_length_class` (
  `length_class_id` int(11) NOT NULL auto_increment,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY  (`length_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wn_length_class` */

insert  into `wn_length_class`(`length_class_id`,`value`) values (1,'1.00000000'),(2,'10.00000000'),(3,'0.39370000');

/*Table structure for table `wn_length_class_description` */

DROP TABLE IF EXISTS `wn_length_class_description`;

CREATE TABLE `wn_length_class_description` (
  `length_class_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY  (`length_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wn_length_class_description` */

insert  into `wn_length_class_description`(`length_class_id`,`language_id`,`title`,`unit`) values (1,1,'公分','cm'),(2,1,'公尺','mm'),(3,1,'英尺','in'),(1,2,'公分','cm'),(2,2,'公尺','mm'),(3,2,'英尺','in');

/*Table structure for table `wn_manufacturer` */

DROP TABLE IF EXISTS `wn_manufacturer`;

CREATE TABLE `wn_manufacturer` (
  `manufacturer_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) default NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wn_manufacturer` */

insert  into `wn_manufacturer`(`manufacturer_id`,`name`,`image`,`sort_order`) values (5,'HTC','data/demo/htc_logo.jpg',0),(6,'Palm','data/demo/palm_logo.jpg',0),(7,'Hewlett-Packard','data/demo/hp_logo.jpg',0),(8,'Apple','data/demo/apple_logo.jpg',0),(9,'Canon','data/demo/canon_logo.jpg',0),(10,'Sony','data/demo/sony_logo.jpg',0);

/*Table structure for table `wn_manufacturer_to_store` */

DROP TABLE IF EXISTS `wn_manufacturer_to_store`;

CREATE TABLE `wn_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY  (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_manufacturer_to_store` */

insert  into `wn_manufacturer_to_store`(`manufacturer_id`,`store_id`) values (5,0),(6,0),(7,0),(8,0),(9,0),(10,0);

/*Table structure for table `wn_option` */

DROP TABLE IF EXISTS `wn_option`;

CREATE TABLE `wn_option` (
  `option_id` int(11) NOT NULL auto_increment,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `wn_option` */

insert  into `wn_option`(`option_id`,`type`,`sort_order`) values (1,'radio',2),(2,'checkbox',3),(4,'text',4),(5,'select',1),(6,'textarea',5),(7,'file',6),(8,'date',7),(9,'time',8),(10,'datetime',9),(11,'select',1),(12,'date',1);

/*Table structure for table `wn_option_description` */

DROP TABLE IF EXISTS `wn_option_description`;

CREATE TABLE `wn_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY  (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_option_description` */

insert  into `wn_option_description`(`option_id`,`language_id`,`name`) values (1,1,'单选框'),(2,1,'复选框'),(4,1,'文本'),(6,1,'多行文本'),(8,1,'日期'),(7,1,'文档'),(5,1,'选择'),(9,1,'时间'),(10,1,'日期 &amp; 时间'),(12,1,'交货日期'),(11,1,'尺寸'),(1,2,'单选框'),(2,2,'复选框'),(4,2,'文本'),(6,2,'多行文本'),(8,2,'日期'),(7,2,'文档'),(5,2,'选择'),(9,2,'时间'),(10,2,'日期 &amp; 时间'),(12,2,'交货日期'),(11,2,'尺寸');

/*Table structure for table `wn_option_value` */

DROP TABLE IF EXISTS `wn_option_value`;

CREATE TABLE `wn_option_value` (
  `option_value_id` int(11) NOT NULL auto_increment,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Data for the table `wn_option_value` */

insert  into `wn_option_value`(`option_value_id`,`option_id`,`image`,`sort_order`) values (43,1,'',3),(32,1,'',1),(45,2,'',4),(44,2,'',3),(42,5,'',4),(41,5,'',3),(39,5,'',1),(40,5,'',2),(31,1,'',2),(23,2,'',1),(24,2,'',2),(46,11,'',1),(47,11,'',2),(48,11,'',3);

/*Table structure for table `wn_option_value_description` */

DROP TABLE IF EXISTS `wn_option_value_description`;

CREATE TABLE `wn_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY  (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_option_value_description` */

insert  into `wn_option_value_description`(`option_value_id`,`language_id`,`option_id`,`name`) values (43,1,1,'大号'),(32,1,1,'小号'),(45,1,2,'复选 4'),(44,1,2,'复选 3'),(31,1,1,'中号'),(42,1,5,'黄色'),(41,1,5,'绿色'),(39,1,5,'红色'),(40,1,5,'蓝色'),(23,1,2,'复选 1'),(24,1,2,'复选 2'),(48,1,11,'大号'),(47,1,11,'中号'),(46,1,11,'小号'),(43,2,1,'大号'),(32,2,1,'小号'),(45,2,2,'复选 4'),(44,2,2,'复选 3'),(31,2,1,'中号'),(42,2,5,'黄色'),(41,2,5,'绿色'),(39,2,5,'红色'),(40,2,5,'蓝色'),(23,2,2,'复选 1'),(24,2,2,'复选 2'),(48,2,11,'大号'),(47,2,11,'中号'),(46,2,11,'小号');

/*Table structure for table `wn_order` */

DROP TABLE IF EXISTS `wn_order`;

CREATE TABLE `wn_order` (
  `order_id` int(11) NOT NULL auto_increment,
  `invoice_no` int(11) NOT NULL default '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL default '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL default '0',
  `customer_group_id` int(11) NOT NULL default '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL default '0.0000',
  `order_status_id` int(11) NOT NULL default '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL default '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_order` */

/*Table structure for table `wn_order_download` */

DROP TABLE IF EXISTS `wn_order_download`;

CREATE TABLE `wn_order_download` (
  `order_download_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(3) NOT NULL default '0',
  PRIMARY KEY  (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_order_download` */

/*Table structure for table `wn_order_field` */

DROP TABLE IF EXISTS `wn_order_field`;

CREATE TABLE `wn_order_field` (
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`order_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_order_field` */

/*Table structure for table `wn_order_fraud` */

DROP TABLE IF EXISTS `wn_order_fraud`;

CREATE TABLE `wn_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_order_fraud` */

/*Table structure for table `wn_order_history` */

DROP TABLE IF EXISTS `wn_order_history`;

CREATE TABLE `wn_order_history` (
  `order_history_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL default '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_order_history` */

/*Table structure for table `wn_order_option` */

DROP TABLE IF EXISTS `wn_order_option`;

CREATE TABLE `wn_order_option` (
  `order_option_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY  (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_order_option` */

/*Table structure for table `wn_order_product` */

DROP TABLE IF EXISTS `wn_order_product`;

CREATE TABLE `wn_order_product` (
  `order_product_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL default '0.0000',
  `total` decimal(15,4) NOT NULL default '0.0000',
  `tax` decimal(15,4) NOT NULL default '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY  (`order_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_order_product` */

/*Table structure for table `wn_order_status` */

DROP TABLE IF EXISTS `wn_order_status`;

CREATE TABLE `wn_order_status` (
  `order_status_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY  (`order_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `wn_order_status` */

insert  into `wn_order_status`(`order_status_id`,`language_id`,`name`) values (1,1,'待处理'),(2,1,'处理中'),(3,1,'已配送'),(7,1,'已取消'),(5,1,'已完成'),(8,1,'已拒绝'),(9,1,'取消恢复'),(10,1,'失败'),(11,1,'已退款'),(12,1,'已冲销'),(13,1,'已扣款'),(16,1,'无效'),(15,1,'已处理'),(14,1,'过期'),(1,2,'待处理'),(2,2,'处理中'),(3,2,'已配送'),(7,2,'已取消'),(5,2,'已完成'),(8,2,'已拒绝'),(9,2,'取消恢复'),(10,2,'失败'),(11,2,'已退款'),(12,2,'已冲销'),(13,2,'已扣款'),(16,2,'无效'),(15,2,'已处理'),(14,2,'过期');

/*Table structure for table `wn_order_total` */

DROP TABLE IF EXISTS `wn_order_total`;

CREATE TABLE `wn_order_total` (
  `order_total_id` int(10) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL default '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY  (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_order_total` */

/*Table structure for table `wn_order_voucher` */

DROP TABLE IF EXISTS `wn_order_voucher`;

CREATE TABLE `wn_order_voucher` (
  `order_voucher_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY  (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_order_voucher` */

/*Table structure for table `wn_product` */

DROP TABLE IF EXISTS `wn_product`;

CREATE TABLE `wn_product` (
  `product_id` int(11) NOT NULL auto_increment,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL default '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) default NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL default '1',
  `price` decimal(15,4) NOT NULL default '0.0000',
  `points` int(8) NOT NULL default '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL default '0.00000000',
  `weight_class_id` int(11) NOT NULL default '0',
  `length` decimal(15,8) NOT NULL default '0.00000000',
  `width` decimal(15,8) NOT NULL default '0.00000000',
  `height` decimal(15,8) NOT NULL default '0.00000000',
  `length_class_id` int(11) NOT NULL default '0',
  `subtract` tinyint(1) NOT NULL default '1',
  `minimum` int(11) NOT NULL default '1',
  `sort_order` int(11) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL default '0',
  PRIMARY KEY  (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Data for the table `wn_product` */

/*Table structure for table `wn_product_attribute` */

DROP TABLE IF EXISTS `wn_product_attribute`;

CREATE TABLE `wn_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY  (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_attribute` */

/*Table structure for table `wn_product_description` */

DROP TABLE IF EXISTS `wn_product_description`;

CREATE TABLE `wn_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY  (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_description` */

/*Table structure for table `wn_product_discount` */

DROP TABLE IF EXISTS `wn_product_discount`;

CREATE TABLE `wn_product_discount` (
  `product_discount_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL default '0',
  `priority` int(5) NOT NULL default '1',
  `price` decimal(15,4) NOT NULL default '0.0000',
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_discount` */

/*Table structure for table `wn_product_filter` */

DROP TABLE IF EXISTS `wn_product_filter`;

CREATE TABLE `wn_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_filter` */

/*Table structure for table `wn_product_image` */

DROP TABLE IF EXISTS `wn_product_image`;

CREATE TABLE `wn_product_image` (
  `product_image_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) default NULL,
  `sort_order` int(3) NOT NULL default '0',
  PRIMARY KEY  (`product_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2352 DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_image` */

/*Table structure for table `wn_product_option` */

DROP TABLE IF EXISTS `wn_product_option`;

CREATE TABLE `wn_product_option` (
  `product_option_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY  (`product_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_option` */

/*Table structure for table `wn_product_option_value` */

DROP TABLE IF EXISTS `wn_product_option_value`;

CREATE TABLE `wn_product_option_value` (
  `product_option_value_id` int(11) NOT NULL auto_increment,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY  (`product_option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_option_value` */

/*Table structure for table `wn_product_related` */

DROP TABLE IF EXISTS `wn_product_related`;

CREATE TABLE `wn_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_related` */

/*Table structure for table `wn_product_reward` */

DROP TABLE IF EXISTS `wn_product_reward`;

CREATE TABLE `wn_product_reward` (
  `product_reward_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL default '0',
  `customer_group_id` int(11) NOT NULL default '0',
  `points` int(8) NOT NULL default '0',
  PRIMARY KEY  (`product_reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=546 DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_reward` */

/*Table structure for table `wn_product_special` */

DROP TABLE IF EXISTS `wn_product_special`;

CREATE TABLE `wn_product_special` (
  `product_special_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL default '1',
  `price` decimal(15,4) NOT NULL default '0.0000',
  `date_start` date NOT NULL default '0000-00-00',
  `date_end` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=440 DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_special` */

/*Table structure for table `wn_product_to_category` */

DROP TABLE IF EXISTS `wn_product_to_category`;

CREATE TABLE `wn_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_to_category` */

/*Table structure for table `wn_product_to_download` */

DROP TABLE IF EXISTS `wn_product_to_download`;

CREATE TABLE `wn_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_to_download` */

/*Table structure for table `wn_product_to_layout` */

DROP TABLE IF EXISTS `wn_product_to_layout`;

CREATE TABLE `wn_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY  (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_to_layout` */

/*Table structure for table `wn_product_to_store` */

DROP TABLE IF EXISTS `wn_product_to_store`;

CREATE TABLE `wn_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_product_to_store` */

/*Table structure for table `wn_return` */

DROP TABLE IF EXISTS `wn_return`;

CREATE TABLE `wn_return` (
  `return_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY  (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_return` */

/*Table structure for table `wn_return_action` */

DROP TABLE IF EXISTS `wn_return_action`;

CREATE TABLE `wn_return_action` (
  `return_action_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY  (`return_action_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wn_return_action` */

insert  into `wn_return_action`(`return_action_id`,`language_id`,`name`) values (1,1,'退款'),(2,1,'信用问题'),(3,1,'补偿'),(1,2,'退款'),(2,2,'信用问题'),(3,2,'补偿');

/*Table structure for table `wn_return_history` */

DROP TABLE IF EXISTS `wn_return_history`;

CREATE TABLE `wn_return_history` (
  `return_history_id` int(11) NOT NULL auto_increment,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_return_history` */

/*Table structure for table `wn_return_reason` */

DROP TABLE IF EXISTS `wn_return_reason`;

CREATE TABLE `wn_return_reason` (
  `return_reason_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY  (`return_reason_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `wn_return_reason` */

insert  into `wn_return_reason`(`return_reason_id`,`language_id`,`name`) values (1,1,'商品未送达'),(2,1,'收到错误的商品'),(3,1,'订单错误'),(4,1,'故障，请提供详细资料'),(5,1,'其他，请提供详细资料'),(1,2,'商品未送达'),(2,2,'收到错误的商品'),(3,2,'订单错误'),(4,2,'故障，请提供详细资料'),(5,2,'其他，请提供详细资料');

/*Table structure for table `wn_return_status` */

DROP TABLE IF EXISTS `wn_return_status`;

CREATE TABLE `wn_return_status` (
  `return_status_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY  (`return_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `wn_return_status` */

insert  into `wn_return_status`(`return_status_id`,`language_id`,`name`) values (1,1,'待处理'),(3,1,'已完成'),(2,1,'等待商品'),(1,2,'待处理'),(3,2,'已完成'),(2,2,'等待商品');

/*Table structure for table `wn_review` */

DROP TABLE IF EXISTS `wn_review`;

CREATE TABLE `wn_review` (
  `review_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL default '0',
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_review` */

/*Table structure for table `wn_setting` */

DROP TABLE IF EXISTS `wn_setting`;

CREATE TABLE `wn_setting` (
  `setting_id` int(11) NOT NULL auto_increment,
  `store_id` int(11) NOT NULL default '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY  (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=443 DEFAULT CHARSET=utf8;

/*Data for the table `wn_setting` */

insert  into `wn_setting`(`setting_id`,`store_id`,`group`,`key`,`value`,`serialized`) values (1,0,'shipping','shipping_sort_order','3',0),(2,0,'sub_total','sub_total_sort_order','1',0),(3,0,'sub_total','sub_total_status','1',0),(4,0,'tax','tax_status','1',0),(5,0,'total','total_sort_order','9',0),(6,0,'total','total_status','1',0),(7,0,'tax','tax_sort_order','5',0),(8,0,'free_checkout','free_checkout_sort_order','1',0),(9,0,'cod','cod_sort_order','5',0),(10,0,'cod','cod_total','0.01',0),(11,0,'cod','cod_order_status_id','1',0),(12,0,'cod','cod_geo_zone_id','0',0),(13,0,'cod','cod_status','1',0),(14,0,'shipping','shipping_status','1',0),(15,0,'shipping','shipping_estimator','1',0),(27,0,'coupon','coupon_sort_order','4',0),(28,0,'coupon','coupon_status','1',0),(34,0,'flat','flat_sort_order','1',0),(35,0,'flat','flat_status','1',0),(36,0,'flat','flat_geo_zone_id','0',0),(37,0,'flat','flat_tax_class_id','9',0),(38,0,'carousel','carousel_module','a:1:{i:0;a:10:{s:9:\"banner_id\";s:1:\"8\";s:5:\"limit\";s:1:\"5\";s:6:\"scroll\";s:1:\"3\";s:5:\"width\";s:2:\"80\";s:6:\"height\";s:2:\"80\";s:11:\"resize_type\";s:7:\"default\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:2:\"-1\";}}',1),(39,0,'featured','featured_product','43,40,42,49,46,47,28',0),(40,0,'featured','featured_module','a:1:{i:0;a:8:{s:5:\"limit\";s:1:\"6\";s:11:\"image_width\";s:2:\"80\";s:12:\"image_height\";s:2:\"80\";s:11:\"resize_type\";s:7:\"default\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"2\";}}',1),(41,0,'flat','flat_cost','5.00',0),(42,0,'credit','credit_sort_order','7',0),(43,0,'credit','credit_status','1',0),(53,0,'reward','reward_sort_order','2',0),(54,0,'reward','reward_status','1',0),(56,0,'affiliate','affiliate_module','a:1:{i:0;a:4:{s:9:\"layout_id\";s:2:\"10\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}',1),(57,0,'category','category_module','a:2:{i:0;a:5:{s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:5:\"count\";s:1:\"0\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}i:1;a:5:{s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:11:\"column_left\";s:5:\"count\";s:1:\"0\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}',1),(60,0,'account','account_module','a:1:{i:0;a:4:{s:9:\"layout_id\";s:1:\"6\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}',1),(431,0,'config','config_robots','abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg',0),(442,0,'config','config_google_analytics','',0),(435,0,'config','config_maintenance','0',0),(436,0,'config','config_password','1',0),(437,0,'config','config_encryption','8af12886117f550ca8d6ed04be9df568',0),(438,0,'config','config_compression','0',0),(439,0,'config','config_error_display','1',0),(440,0,'config','config_error_log','1',0),(441,0,'config','config_error_filename','error.txt',0),(94,0,'voucher','voucher_sort_order','8',0),(95,0,'voucher','voucher_status','1',0),(103,0,'free_checkout','free_checkout_status','1',0),(104,0,'free_checkout','free_checkout_order_status_id','1',0),(108,0,'slideshow','slideshow_module','a:1:{i:0;a:8:{s:9:\"banner_id\";s:1:\"7\";s:5:\"width\";s:3:\"980\";s:6:\"height\";s:3:\"280\";s:11:\"resize_type\";s:7:\"default\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}',1),(109,0,'banner','banner_module','a:1:{i:0;a:8:{s:9:\"banner_id\";s:1:\"6\";s:5:\"width\";s:3:\"182\";s:6:\"height\";s:3:\"182\";s:11:\"resize_type\";s:7:\"default\";s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"3\";}}',1),(432,0,'config','config_seo_url','0',0),(433,0,'config','config_file_extension_allowed','txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods',0),(434,0,'config','config_file_mime_allowed','text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet',0),(430,0,'config','config_shared','0',0),(429,0,'config','config_secure','0',0),(428,0,'config','config_fraud_status_id','9',0),(427,0,'config','config_fraud_score','',0),(426,0,'config','config_fraud_key','',0),(425,0,'config','config_fraud_detection','0',0),(424,0,'config','config_alert_emails','',0),(423,0,'config','config_account_mail','0',0),(422,0,'config','config_alert_mail','0',0),(421,0,'config','config_smtp_timeout','5',0),(420,0,'config','config_smtp_port','25',0),(419,0,'config','config_smtp_password','',0),(418,0,'config','config_smtp_username','',0),(417,0,'config','config_smtp_host','',0),(416,0,'config','config_mail_parameter','',0),(415,0,'config','config_mail_protocol','mail',0),(414,0,'config','config_ftp_status','0',0),(413,0,'config','config_ftp_root','',0),(412,0,'config','config_ftp_password','',0),(411,0,'config','config_ftp_username','',0),(410,0,'config','config_ftp_port','21',0),(409,0,'config','config_ftp_host','127.0.0.1',0),(408,0,'config','config_image_cart_height','47',0),(407,0,'config','config_image_cart_width','47',0),(406,0,'config','config_image_wishlist_height','47',0),(405,0,'config','config_image_wishlist_width','47',0),(404,0,'config','config_image_compare_height','90',0),(403,0,'config','config_image_compare_width','90',0),(402,0,'config','config_image_related_height','80',0),(401,0,'config','config_image_related_width','80',0),(400,0,'config','config_image_additional_height','74',0),(399,0,'config','config_image_additional_width','74',0),(398,0,'config','config_image_product_height','80',0),(397,0,'config','config_image_product_width','80',0),(396,0,'config','config_image_popup_height','500',0),(395,0,'config','config_image_popup_width','500',0),(394,0,'config','config_image_thumb_height','228',0),(393,0,'config','config_image_thumb_width','228',0),(392,0,'config','config_image_category_height','80',0),(391,0,'config','config_image_category_width','80',0),(390,0,'config','config_icon','data/cart.png',0),(389,0,'config','config_logo','data/logo.png',0),(388,0,'config','config_return_status_id','2',0),(387,0,'config','config_return_id','0',0),(386,0,'config','config_commission','5',0),(385,0,'config','config_affiliate_id','4',0),(384,0,'config','config_stock_status_id','5',0),(383,0,'config','config_stock_checkout','0',0),(382,0,'config','config_stock_warning','0',0),(381,0,'config','config_stock_display','0',0),(380,0,'config','config_complete_status_id','5',0),(379,0,'config','config_order_status_id','1',0),(378,0,'config','config_invoice_prefix','INV-2013-00',0),(377,0,'config','config_order_edit','100',0),(376,0,'config','config_checkout_id','5',0),(375,0,'config','config_guest_checkout','1',0),(374,0,'config','config_cart_weight','1',0),(373,0,'config','config_account_id','3',0),(372,0,'config','config_customer_price','0',0),(371,0,'config','config_customer_group_display','a:1:{i:0;s:1:\"1\";}',1),(370,0,'config','config_customer_group_id','1',0),(369,0,'config','config_customer_online','0',0),(368,0,'config','config_tax_customer','shipping',0),(367,0,'config','config_tax_default','shipping',0),(366,0,'config','config_vat','0',0),(365,0,'config','config_tax','1',0),(364,0,'config','config_voucher_max','1000',0),(360,0,'config','config_product_count','1',0),(361,0,'config','config_review_status','1',0),(362,0,'config','config_download','1',0),(363,0,'config','config_voucher_min','1',0),(359,0,'config','config_admin_limit','20',0),(358,0,'config','config_catalog_limit','15',0),(357,0,'config','config_weight_class_id','1',0),(356,0,'config','config_length_class_id','1',0),(355,0,'config','config_currency_auto','1',0),(354,0,'config','config_currency','CNY',0),(353,0,'config','config_admin_language','zh-CN',0),(352,0,'config','config_language','zh-CN',0),(351,0,'config','config_zone_id','',0),(350,0,'config','config_country_id','44',0),(349,0,'config','config_layout_id','4',0),(348,0,'config','config_template','default',0),(347,0,'config','config_meta_description','My Store',0),(346,0,'config','config_title','Your Store',0),(345,0,'config','config_fax','',0),(344,0,'config','config_telephone','123456789',0),(343,0,'config','config_email','qq@aa.cc',0),(342,0,'config','config_address','Address 1',0),(341,0,'config','config_owner','Your Name',0),(340,0,'config','config_name','Your Store',0);

/*Table structure for table `wn_stock_status` */

DROP TABLE IF EXISTS `wn_stock_status`;

CREATE TABLE `wn_stock_status` (
  `stock_status_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY  (`stock_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `wn_stock_status` */

insert  into `wn_stock_status`(`stock_status_id`,`language_id`,`name`) values (7,1,'有货'),(5,1,'缺货'),(6,1,'等待2 - 3天'),(8,1,'预购'),(7,2,'有货'),(5,2,'缺货'),(6,2,'等待2 - 3天'),(8,2,'预购');

/*Table structure for table `wn_store` */

DROP TABLE IF EXISTS `wn_store`;

CREATE TABLE `wn_store` (
  `store_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY  (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_store` */

/*Table structure for table `wn_tax_class` */

DROP TABLE IF EXISTS `wn_tax_class`;

CREATE TABLE `wn_tax_class` (
  `tax_class_id` int(11) NOT NULL auto_increment,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wn_tax_class` */

insert  into `wn_tax_class`(`tax_class_id`,`title`,`description`,`date_added`,`date_modified`) values (9,'交税商品','征税的商品','2009-01-06 23:21:53','2012-06-11 01:12:36'),(10,'可下载的商品','可下载','2011-09-21 22:19:39','2012-06-11 01:10:52');

/*Table structure for table `wn_tax_rate` */

DROP TABLE IF EXISTS `wn_tax_rate`;

CREATE TABLE `wn_tax_rate` (
  `tax_rate_id` int(11) NOT NULL auto_increment,
  `geo_zone_id` int(11) NOT NULL default '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL default '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`tax_rate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

/*Data for the table `wn_tax_rate` */

insert  into `wn_tax_rate`(`tax_rate_id`,`geo_zone_id`,`name`,`rate`,`type`,`date_added`,`date_modified`) values (86,3,'增值税 (17.5%)','17.5000','P','2011-03-09 21:17:10','2012-06-11 01:06:45'),(87,3,'普通税 (-2.00)','2.0000','F','2011-09-21 21:49:23','2011-09-23 00:40:19');

/*Table structure for table `wn_tax_rate_to_customer_group` */

DROP TABLE IF EXISTS `wn_tax_rate_to_customer_group`;

CREATE TABLE `wn_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY  (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_tax_rate_to_customer_group` */

insert  into `wn_tax_rate_to_customer_group`(`tax_rate_id`,`customer_group_id`) values (86,1),(87,1);

/*Table structure for table `wn_tax_rule` */

DROP TABLE IF EXISTS `wn_tax_rule`;

CREATE TABLE `wn_tax_rule` (
  `tax_rule_id` int(11) NOT NULL auto_increment,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL default '1',
  PRIMARY KEY  (`tax_rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

/*Data for the table `wn_tax_rule` */

insert  into `wn_tax_rule`(`tax_rule_id`,`tax_class_id`,`tax_rate_id`,`based`,`priority`) values (121,10,86,'付款',1),(120,10,87,'商店',0),(128,9,86,'配送',1),(127,9,87,'配送',2);

/*Table structure for table `wn_url_alias` */

DROP TABLE IF EXISTS `wn_url_alias`;

CREATE TABLE `wn_url_alias` (
  `url_alias_id` int(11) NOT NULL auto_increment,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY  (`url_alias_id`)
) ENGINE=MyISAM AUTO_INCREMENT=776 DEFAULT CHARSET=utf8;

/*Data for the table `wn_url_alias` */

insert  into `wn_url_alias`(`url_alias_id`,`query`,`keyword`) values (730,'manufacturer_id=8','apple'),(775,'information_id=4','about_us');

/*Table structure for table `wn_user` */

DROP TABLE IF EXISTS `wn_user`;

CREATE TABLE `wn_user` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `wn_user` */

insert  into `wn_user`(`user_id`,`user_group_id`,`username`,`password`,`salt`,`firstname`,`lastname`,`email`,`code`,`ip`,`status`,`date_added`) values (1,1,'admin','db4f54b40b3d0b5186d9a23519295acc05939c97','cc83439ef','','','qq@aa.cc','','127.0.0.1',1,'2013-05-26 16:48:53');

/*Table structure for table `wn_user_group` */

DROP TABLE IF EXISTS `wn_user_group`;

CREATE TABLE `wn_user_group` (
  `user_group_id` int(11) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY  (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `wn_user_group` */

insert  into `wn_user_group`(`user_group_id`,`name`,`permission`) values (1,'Top Administrator','a:2:{s:6:\"access\";a:122:{i:0;s:17:\"catalog/attribute\";i:1;s:23:\"catalog/attribute_group\";i:2;s:16:\"catalog/category\";i:3;s:16:\"catalog/download\";i:4;s:14:\"catalog/filter\";i:5;s:19:\"catalog/information\";i:6;s:20:\"catalog/manufacturer\";i:7;s:14:\"catalog/option\";i:8;s:15:\"catalog/product\";i:9;s:14:\"catalog/review\";i:10;s:18:\"common/filemanager\";i:11;s:13:\"design/banner\";i:12;s:13:\"design/layout\";i:13;s:14:\"extension/feed\";i:14;s:17:\"extension/manager\";i:15;s:16:\"extension/module\";i:16;s:17:\"extension/payment\";i:17;s:18:\"extension/shipping\";i:18;s:15:\"extension/total\";i:19;s:16:\"feed/google_base\";i:20;s:19:\"feed/google_sitemap\";i:21;s:20:\"localisation/country\";i:22;s:21:\"localisation/currency\";i:23;s:21:\"localisation/geo_zone\";i:24;s:21:\"localisation/language\";i:25;s:25:\"localisation/length_class\";i:26;s:25:\"localisation/order_status\";i:27;s:26:\"localisation/return_action\";i:28;s:26:\"localisation/return_reason\";i:29;s:26:\"localisation/return_status\";i:30;s:25:\"localisation/stock_status\";i:31;s:22:\"localisation/tax_class\";i:32;s:21:\"localisation/tax_rate\";i:33;s:25:\"localisation/weight_class\";i:34;s:17:\"localisation/zone\";i:35;s:14:\"module/account\";i:36;s:16:\"module/affiliate\";i:37;s:13:\"module/banner\";i:38;s:17:\"module/bestseller\";i:39;s:15:\"module/carousel\";i:40;s:15:\"module/category\";i:41;s:15:\"module/featured\";i:42;s:13:\"module/filter\";i:43;s:18:\"module/google_talk\";i:44;s:18:\"module/information\";i:45;s:13:\"module/latest\";i:46;s:16:\"module/slideshow\";i:47;s:14:\"module/special\";i:48;s:12:\"module/store\";i:49;s:14:\"module/welcome\";i:50;s:24:\"payment/authorizenet_aim\";i:51;s:21:\"payment/bank_transfer\";i:52;s:14:\"payment/cheque\";i:53;s:11:\"payment/cod\";i:54;s:21:\"payment/free_checkout\";i:55;s:14:\"payment/liqpay\";i:56;s:20:\"payment/moneybookers\";i:57;s:14:\"payment/nochex\";i:58;s:15:\"payment/paymate\";i:59;s:16:\"payment/paypoint\";i:60;s:13:\"payment/payza\";i:61;s:26:\"payment/perpetual_payments\";i:62;s:14:\"payment/pp_pro\";i:63;s:17:\"payment/pp_pro_uk\";i:64;s:19:\"payment/pp_standard\";i:65;s:15:\"payment/sagepay\";i:66;s:22:\"payment/sagepay_direct\";i:67;s:18:\"payment/sagepay_us\";i:68;s:19:\"payment/twocheckout\";i:69;s:28:\"payment/web_payment_software\";i:70;s:16:\"payment/worldpay\";i:71;s:27:\"report/affiliate_commission\";i:72;s:22:\"report/customer_credit\";i:73;s:22:\"report/customer_online\";i:74;s:21:\"report/customer_order\";i:75;s:22:\"report/customer_reward\";i:76;s:24:\"report/product_purchased\";i:77;s:21:\"report/product_viewed\";i:78;s:18:\"report/sale_coupon\";i:79;s:17:\"report/sale_order\";i:80;s:18:\"report/sale_return\";i:81;s:20:\"report/sale_shipping\";i:82;s:15:\"report/sale_tax\";i:83;s:14:\"sale/affiliate\";i:84;s:12:\"sale/contact\";i:85;s:11:\"sale/coupon\";i:86;s:13:\"sale/customer\";i:87;s:20:\"sale/customer_ban_ip\";i:88;s:19:\"sale/customer_group\";i:89;s:10:\"sale/order\";i:90;s:11:\"sale/return\";i:91;s:12:\"sale/voucher\";i:92;s:18:\"sale/voucher_theme\";i:93;s:15:\"setting/setting\";i:94;s:13:\"setting/store\";i:95;s:16:\"shipping/auspost\";i:96;s:17:\"shipping/citylink\";i:97;s:14:\"shipping/fedex\";i:98;s:13:\"shipping/flat\";i:99;s:13:\"shipping/free\";i:100;s:13:\"shipping/item\";i:101;s:23:\"shipping/parcelforce_48\";i:102;s:15:\"shipping/pickup\";i:103;s:19:\"shipping/royal_mail\";i:104;s:12:\"shipping/ups\";i:105;s:13:\"shipping/usps\";i:106;s:15:\"shipping/weight\";i:107;s:11:\"tool/backup\";i:108;s:14:\"tool/error_log\";i:109;s:12:\"total/coupon\";i:110;s:12:\"total/credit\";i:111;s:14:\"total/handling\";i:112;s:16:\"total/klarna_fee\";i:113;s:19:\"total/low_order_fee\";i:114;s:12:\"total/reward\";i:115;s:14:\"total/shipping\";i:116;s:15:\"total/sub_total\";i:117;s:9:\"total/tax\";i:118;s:11:\"total/total\";i:119;s:13:\"total/voucher\";i:120;s:9:\"user/user\";i:121;s:20:\"user/user_permission\";}s:6:\"modify\";a:122:{i:0;s:17:\"catalog/attribute\";i:1;s:23:\"catalog/attribute_group\";i:2;s:16:\"catalog/category\";i:3;s:16:\"catalog/download\";i:4;s:14:\"catalog/filter\";i:5;s:19:\"catalog/information\";i:6;s:20:\"catalog/manufacturer\";i:7;s:14:\"catalog/option\";i:8;s:15:\"catalog/product\";i:9;s:14:\"catalog/review\";i:10;s:18:\"common/filemanager\";i:11;s:13:\"design/banner\";i:12;s:13:\"design/layout\";i:13;s:14:\"extension/feed\";i:14;s:17:\"extension/manager\";i:15;s:16:\"extension/module\";i:16;s:17:\"extension/payment\";i:17;s:18:\"extension/shipping\";i:18;s:15:\"extension/total\";i:19;s:16:\"feed/google_base\";i:20;s:19:\"feed/google_sitemap\";i:21;s:20:\"localisation/country\";i:22;s:21:\"localisation/currency\";i:23;s:21:\"localisation/geo_zone\";i:24;s:21:\"localisation/language\";i:25;s:25:\"localisation/length_class\";i:26;s:25:\"localisation/order_status\";i:27;s:26:\"localisation/return_action\";i:28;s:26:\"localisation/return_reason\";i:29;s:26:\"localisation/return_status\";i:30;s:25:\"localisation/stock_status\";i:31;s:22:\"localisation/tax_class\";i:32;s:21:\"localisation/tax_rate\";i:33;s:25:\"localisation/weight_class\";i:34;s:17:\"localisation/zone\";i:35;s:14:\"module/account\";i:36;s:16:\"module/affiliate\";i:37;s:13:\"module/banner\";i:38;s:17:\"module/bestseller\";i:39;s:15:\"module/carousel\";i:40;s:15:\"module/category\";i:41;s:15:\"module/featured\";i:42;s:13:\"module/filter\";i:43;s:18:\"module/google_talk\";i:44;s:18:\"module/information\";i:45;s:13:\"module/latest\";i:46;s:16:\"module/slideshow\";i:47;s:14:\"module/special\";i:48;s:12:\"module/store\";i:49;s:14:\"module/welcome\";i:50;s:24:\"payment/authorizenet_aim\";i:51;s:21:\"payment/bank_transfer\";i:52;s:14:\"payment/cheque\";i:53;s:11:\"payment/cod\";i:54;s:21:\"payment/free_checkout\";i:55;s:14:\"payment/liqpay\";i:56;s:20:\"payment/moneybookers\";i:57;s:14:\"payment/nochex\";i:58;s:15:\"payment/paymate\";i:59;s:16:\"payment/paypoint\";i:60;s:13:\"payment/payza\";i:61;s:26:\"payment/perpetual_payments\";i:62;s:14:\"payment/pp_pro\";i:63;s:17:\"payment/pp_pro_uk\";i:64;s:19:\"payment/pp_standard\";i:65;s:15:\"payment/sagepay\";i:66;s:22:\"payment/sagepay_direct\";i:67;s:18:\"payment/sagepay_us\";i:68;s:19:\"payment/twocheckout\";i:69;s:28:\"payment/web_payment_software\";i:70;s:16:\"payment/worldpay\";i:71;s:27:\"report/affiliate_commission\";i:72;s:22:\"report/customer_credit\";i:73;s:22:\"report/customer_online\";i:74;s:21:\"report/customer_order\";i:75;s:22:\"report/customer_reward\";i:76;s:24:\"report/product_purchased\";i:77;s:21:\"report/product_viewed\";i:78;s:18:\"report/sale_coupon\";i:79;s:17:\"report/sale_order\";i:80;s:18:\"report/sale_return\";i:81;s:20:\"report/sale_shipping\";i:82;s:15:\"report/sale_tax\";i:83;s:14:\"sale/affiliate\";i:84;s:12:\"sale/contact\";i:85;s:11:\"sale/coupon\";i:86;s:13:\"sale/customer\";i:87;s:20:\"sale/customer_ban_ip\";i:88;s:19:\"sale/customer_group\";i:89;s:10:\"sale/order\";i:90;s:11:\"sale/return\";i:91;s:12:\"sale/voucher\";i:92;s:18:\"sale/voucher_theme\";i:93;s:15:\"setting/setting\";i:94;s:13:\"setting/store\";i:95;s:16:\"shipping/auspost\";i:96;s:17:\"shipping/citylink\";i:97;s:14:\"shipping/fedex\";i:98;s:13:\"shipping/flat\";i:99;s:13:\"shipping/free\";i:100;s:13:\"shipping/item\";i:101;s:23:\"shipping/parcelforce_48\";i:102;s:15:\"shipping/pickup\";i:103;s:19:\"shipping/royal_mail\";i:104;s:12:\"shipping/ups\";i:105;s:13:\"shipping/usps\";i:106;s:15:\"shipping/weight\";i:107;s:11:\"tool/backup\";i:108;s:14:\"tool/error_log\";i:109;s:12:\"total/coupon\";i:110;s:12:\"total/credit\";i:111;s:14:\"total/handling\";i:112;s:16:\"total/klarna_fee\";i:113;s:19:\"total/low_order_fee\";i:114;s:12:\"total/reward\";i:115;s:14:\"total/shipping\";i:116;s:15:\"total/sub_total\";i:117;s:9:\"total/tax\";i:118;s:11:\"total/total\";i:119;s:13:\"total/voucher\";i:120;s:9:\"user/user\";i:121;s:20:\"user/user_permission\";}}'),(10,'Demonstration','');

/*Table structure for table `wn_voucher` */

DROP TABLE IF EXISTS `wn_voucher`;

CREATE TABLE `wn_voucher` (
  `voucher_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_voucher` */

/*Table structure for table `wn_voucher_history` */

DROP TABLE IF EXISTS `wn_voucher_history`;

CREATE TABLE `wn_voucher_history` (
  `voucher_history_id` int(11) NOT NULL auto_increment,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_voucher_history` */

/*Table structure for table `wn_voucher_theme` */

DROP TABLE IF EXISTS `wn_voucher_theme`;

CREATE TABLE `wn_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL auto_increment,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY  (`voucher_theme_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `wn_voucher_theme` */

insert  into `wn_voucher_theme`(`voucher_theme_id`,`image`) values (8,'data/demo/canon_eos_5d_2.jpg'),(7,'data/demo/gift-voucher-birthday.jpg'),(6,'data/demo/apple_logo.jpg');

/*Table structure for table `wn_voucher_theme_description` */

DROP TABLE IF EXISTS `wn_voucher_theme_description`;

CREATE TABLE `wn_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY  (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `wn_voucher_theme_description` */

insert  into `wn_voucher_theme_description`(`voucher_theme_id`,`language_id`,`name`) values (6,1,'圣诞'),(7,1,'生日'),(8,1,'普通'),(6,2,'圣诞'),(7,2,'生日'),(8,2,'普通');

/*Table structure for table `wn_weight_class` */

DROP TABLE IF EXISTS `wn_weight_class`;

CREATE TABLE `wn_weight_class` (
  `weight_class_id` int(11) NOT NULL auto_increment,
  `value` decimal(15,8) NOT NULL default '0.00000000',
  PRIMARY KEY  (`weight_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `wn_weight_class` */

insert  into `wn_weight_class`(`weight_class_id`,`value`) values (1,'1.00000000'),(2,'1000.00000000'),(5,'2.20460000'),(6,'35.27400000');

/*Table structure for table `wn_weight_class_description` */

DROP TABLE IF EXISTS `wn_weight_class_description`;

CREATE TABLE `wn_weight_class_description` (
  `weight_class_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY  (`weight_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `wn_weight_class_description` */

insert  into `wn_weight_class_description`(`weight_class_id`,`language_id`,`title`,`unit`) values (1,1,'公斤','kg'),(2,1,'公克','g'),(5,1,'磅','lb'),(6,1,'盎司','oz'),(1,2,'公斤','kg'),(2,2,'公克','g'),(5,2,'磅','lb'),(6,2,'盎司','oz');

/*Table structure for table `wn_zone` */

DROP TABLE IF EXISTS `wn_zone`;

CREATE TABLE `wn_zone` (
  `zone_id` int(11) NOT NULL auto_increment,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=715 DEFAULT CHARSET=utf8;

/*Data for the table `wn_zone` */

insert  into `wn_zone`(`zone_id`,`country_id`,`name`,`code`,`status`) values (684,44,'安徽','AN',1),(685,44,'北京','BE',1),(686,44,'重庆','CH',1),(687,44,'福建','FU',1),(688,44,'甘肃','GA',1),(689,44,'广东','GU',1),(690,44,'广西','GX',1),(691,44,'贵州','GZ',1),(692,44,'海南','HA',1),(693,44,'河北','HB',1),(694,44,'黑龙江','HL',1),(695,44,'河南','HE',1),(696,44,'香港','HK',1),(697,44,'湖北','HU',1),(698,44,'湖南','HN',1),(699,44,'内蒙','IM',1),(700,44,'江苏','JI',1),(701,44,'江西','JX',1),(702,44,'吉林','JL',1),(703,44,'辽宁','LI',1),(704,44,'澳门','MA',1),(705,44,'宁夏','NI',1),(706,44,'山西','SH',1),(707,44,'山东','SA',1),(708,44,'上海','SG',1),(709,44,'陕西','SX',1),(710,44,'四川','SI',1),(711,44,'天津','TI',1),(712,44,'新疆','XI',1),(713,44,'云南','YU',1),(714,44,'浙江','ZH',1);

/*Table structure for table `wn_zone_to_geo_zone` */

DROP TABLE IF EXISTS `wn_zone_to_geo_zone`;

CREATE TABLE `wn_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL auto_increment,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL default '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL default '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`zone_to_geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

/*Data for the table `wn_zone_to_geo_zone` */

insert  into `wn_zone_to_geo_zone`(`zone_to_geo_zone_id`,`country_id`,`zone_id`,`geo_zone_id`,`date_added`,`date_modified`) values (57,222,0,3,'2010-02-26 22:33:24','0000-00-00 00:00:00'),(65,222,0,4,'2010-12-15 15:18:13','0000-00-00 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
