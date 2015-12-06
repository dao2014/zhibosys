/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : direct_seeding

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2015-12-06 23:20:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for direct_answer
-- ----------------------------
DROP TABLE IF EXISTS `direct_answer`;
CREATE TABLE `direct_answer` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `wecht_open_id` varchar(128) DEFAULT NULL,
  `direct_id` varchar(32) DEFAULT NULL,
  `answer_status` int(1) DEFAULT '0' COMMENT '0为已经取消接听,1已接听',
  `answer_create_time` datetime DEFAULT NULL,
  `answer_update_time` datetime DEFAULT NULL,
  `nick_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每一节课的 收听人员';

-- ----------------------------
-- Records of direct_answer
-- ----------------------------
INSERT INTO `direct_answer` VALUES ('05933c61963a456f93848ddb9219bea9', null, null, '9c5afd6bed6d4efcaf9c94562579a75d', '1', '2015-12-01 10:14:40', null, null);
INSERT INTO `direct_answer` VALUES ('128e8e7705184c83be7344503e69b8c5', null, 'oNXXPs04P7SffLa93Ut67156NKMs', '9c5afd6bed6d4efcaf9c94562579a75d', '1', '2015-12-01 23:11:01', null, '苏宝宝');
INSERT INTO `direct_answer` VALUES ('506f3f16a5ee428d8f0c7101bb5a10a1', null, null, '9c5afd6bed6d4efcaf9c94562579a75d', '1', '2015-12-01 10:09:35', null, null);
INSERT INTO `direct_answer` VALUES ('6d1f81d7df4e471fa7f38dd0776647f7', null, 'oNXXPs4GAVuuKuI1UE7kODcEGGkc', '9c5afd6bed6d4efcaf9c94562579a75d', '1', '2015-12-01 23:03:45', null, 'books');
INSERT INTO `direct_answer` VALUES ('7a745fdc91f44ae0a0861e228dd0879b', null, 'oNXXPs1XlIS6k-Ky4MJkOkOnF7BE', '9c5afd6bed6d4efcaf9c94562579a75d', '1', '2015-12-01 10:14:32', null, null);
INSERT INTO `direct_answer` VALUES ('a6a5b127c8c34e6087ec07a51868d1dd', null, 'oNXXPs8FJTP1ckvk4k3e8Geak_S4', '9c5afd6bed6d4efcaf9c94562579a75d', '0', '2015-12-01 10:09:26', '2015-12-01 10:14:04', null);

-- ----------------------------
-- Table structure for direct_content
-- ----------------------------
DROP TABLE IF EXISTS `direct_content`;
CREATE TABLE `direct_content` (
  `id` varchar(32) NOT NULL,
  `direct_id` varchar(32) DEFAULT NULL,
  `content_type` varchar(1) NOT NULL COMMENT '内容类型1.文本,2语音,3,图片,4,视频',
  `content_msg` varchar(400) DEFAULT NULL COMMENT '如果是文本,就是内容,否则其他都是url',
  `content_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `content_index` int(32) DEFAULT NULL COMMENT '序号.排序所用,可以备用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每一个课程的内容信息表（不包含直播）';

-- ----------------------------
-- Records of direct_content
-- ----------------------------

-- ----------------------------
-- Table structure for direct_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `direct_evaluate`;
CREATE TABLE `direct_evaluate` (
  `id` varchar(32) NOT NULL,
  `direct_id` varchar(32) DEFAULT NULL,
  `user_open_id` varchar(128) DEFAULT NULL,
  `evaluate_value` varchar(400) DEFAULT NULL COMMENT '评价内容',
  `create_time` datetime DEFAULT NULL COMMENT '评价时间',
  `evaluate_status` int(1) DEFAULT '1' COMMENT '默认值1 是否有效 0 无效,1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每一节课的 评论表';

-- ----------------------------
-- Records of direct_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for direct_seeding
-- ----------------------------
DROP TABLE IF EXISTS `direct_seeding`;
CREATE TABLE `direct_seeding` (
  `id` varchar(32) NOT NULL,
  `wechat_oepn_id` varchar(128) NOT NULL,
  `msg_type` varchar(10) NOT NULL COMMENT 'text,image,语音为voice,视频为video,小视频为shortvideo ',
  `content` varchar(400) NOT NULL COMMENT '可能是文本，可能是url',
  `create_date` datetime NOT NULL,
  `direct_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='直播列表信息';

-- ----------------------------
-- Records of direct_seeding
-- ----------------------------

-- ----------------------------
-- Table structure for direct_type
-- ----------------------------
DROP TABLE IF EXISTS `direct_type`;
CREATE TABLE `direct_type` (
  `id` varchar(32) NOT NULL,
  `type_name` varchar(30) DEFAULT NULL COMMENT '直播类型',
  `type_des` varchar(200) DEFAULT NULL COMMENT '类型描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户讲课类型表';

-- ----------------------------
-- Records of direct_type
-- ----------------------------
INSERT INTO `direct_type` VALUES ('1', '讲课测试', '只是测试而已');

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

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('5', null, null, '啊道', 'oNXXPs8FJTP1ckvk4k3e8Geak_S4', 'oeQMvwZnXz8VRSI85unAK5NSsfhQ', '0', null, null, '1', '1', '2015-11-16 01:04:44', null, null, 'http://wx.qlogo.cn/mmopen/ibTV0E62nBPRSh889HWzB1qHYCbZibvPpToCKcVjZicibjjQTITp74ZcNTcA7vunkAQ6yINukwoicaf0QLk36n3kaHowFQKHhrpIv/0', '湛江', '广东', '中国', '', '0000-00-00 00:00:00', null, '0');
INSERT INTO `user` VALUES ('59e79c2423ef4389aea54a0a294a3bfb', null, null, '符安招', 'oNXXPs1XlIS6k-Ky4MJkOkOnF7BE', 'oeQMvwVU4rcyqLMiZOhqzvbu40jM', '0', null, null, '1', '1', '2015-12-01 10:14:28', null, null, 'http://wx.qlogo.cn/mmopen/iaEIgBDtqiaynCAlenIrrjIh3cTZuTibrVj3Sricu9NILKEziaTAo4ic00qFfNlvZ6TRaibjTlG7uKZOMibjHWZLmRoZvm3CaRb09abp/0', '湛江', '广东', '中国', '', '0000-00-00 00:00:00', null, '0');
INSERT INTO `user` VALUES ('6', null, null, 'books', 'oNXXPs4GAVuuKuI1UE7kODcEGGkc', 'oeQMvwSzhWqVoCjvVq7sihrWVWQw', '0', null, null, '2', '1', '2015-11-21 18:19:18', null, null, 'http://wx.qlogo.cn/mmopen/ibTV0E62nBPQx1dkicTdFYiaeNF2hibPXULbDYhYr8YfJCRE2aHeQHGoJqnFk4LXMicSg1qlyMXSPjKCW70YGpRtWPRIHIPDQbDsk/0', '广州', '广东', '中国', '', '0000-00-00 00:00:00', null, '0');
INSERT INTO `user` VALUES ('7', null, null, 'dao~', 'oNXXPs5j9Eid_BPnoj3MnOnZ5HiE', 'oeQMvwdFYMgkjNFsCH1Mj6z87nfQ', '0', null, null, '0', '1', '2015-11-24 16:52:04', null, null, '', '', '', '', '', '0000-00-00 00:00:00', null, '0');
INSERT INTO `user` VALUES ('e10dc5e2da3f418b9b8134e9c75a21d8', null, null, '苏宝宝', 'oNXXPs04P7SffLa93Ut67156NKMs', 'oeQMvwaq09ic70FSD3erAZzsJ3mc', '0', null, null, '2', '1', '2015-11-25 22:44:37', null, null, 'http://wx.qlogo.cn/mmopen/39LCSAXGRIFiaM1EReVUUfeD3JX6yj7cnJT9F7wNIdxXZKgzajk1xibCCDYtWNOjyQ3ianGhgvibT0teaDJa1Z7fPQQAkcnFYFQg/0', '广州', '广东', '中国', '', '0000-00-00 00:00:00', null, '0');

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

-- ----------------------------
-- Records of user_direct
-- ----------------------------
INSERT INTO `user_direct` VALUES ('9c5afd6bed6d4efcaf9c94562579a75d', null, 'oNXXPs8FJTP1ckvk4k3e8Geak_S4', '测试课程', null, '1', '123456', '2015-12-01 07:50:00', '2015-12-02 23:55:00', '2015-12-01 07:46:47', '2015-12-01 23:11:11', '5', '1', '1', null, null, null, '0');
