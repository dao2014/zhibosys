/*
Navicat MySQL Data Transfer

Source Server         : 115.29.113.54
Source Server Version : 50709
Source Host           : 115.29.113.54:3306
Source Database       : direct_seeding

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2015-12-04 23:12:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_direct
-- ----------------------------
DROP TABLE IF EXISTS `user_direct`;
CREATE TABLE `user_direct` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `wecht_open_id` varchar(64) NOT NULL COMMENT '直播人员微信ID',
  `direct_des` varchar(400) DEFAULT NULL COMMENT '直播简介',
  `direct_praise` int(10) DEFAULT NULL COMMENT '点赞数',
  `direct_type_id` varchar(32) DEFAULT NULL COMMENT '课程类型Id',
  `direct_password` varchar(50) DEFAULT NULL COMMENT '密码',
  `direct_start_time` datetime DEFAULT NULL COMMENT '预约开始直播时间',
  `direct_end_time` datetime DEFAULT NULL COMMENT '预约结束直播时间',
  `direct_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `direct_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `direct_number` int(11) DEFAULT '0' COMMENT '观看人数',
  `direct_status` int(1) DEFAULT '0' COMMENT '是否在直播0直播待审查 1默认等待直播,2正在直播 3 直播结束 4.没发布 5 已经发布',
  `direct_examine` int(1) DEFAULT '0' COMMENT '0 默认待审查 1. 审查 通过',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户 新增的课程表';
