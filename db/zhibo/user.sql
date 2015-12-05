/*
Navicat MySQL Data Transfer

Source Server         : 115.29.113.54
Source Server Version : 50709
Source Host           : 115.29.113.54:3306
Source Database       : direct_seeding

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2015-12-04 23:12:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `user_name` varchar(40) DEFAULT NULL,
  `user_password` varchar(64) DEFAULT NULL,
  `wacht_name` varchar(100) DEFAULT NULL,
  `wacht_open_id` varchar(128) DEFAULT NULL,
  `wacht_unit_id` varchar(128) DEFAULT NULL,
  `user_praise` int(10) DEFAULT '0' COMMENT '点赞数',
  `user_title` varchar(2) DEFAULT NULL COMMENT '职称',
  `user_pone` int(11) DEFAULT NULL COMMENT '电话号码',
  `user_sex` int(1) DEFAULT '0' COMMENT '0。没填 1.男，2女',
  `user_status` int(2) DEFAULT NULL COMMENT '0，无效。1有效',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `nick_name` varchar(40) DEFAULT NULL COMMENT '用户昵称',
  `user_head_image` varchar(500) DEFAULT NULL COMMENT '用户头像',
  `wachat_city` varchar(50) DEFAULT NULL COMMENT '城市',
  `wachat_province` varchar(50) DEFAULT NULL COMMENT '省份',
  `wachat_country` varchar(50) DEFAULT NULL COMMENT '国家',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
