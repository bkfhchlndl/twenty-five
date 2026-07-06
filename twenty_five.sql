/*
 Navicat Premium Dump SQL

 Source Server         : my
 Source Server Type    : MySQL
 Source Server Version : 80026 (8.0.26)
 Source Host           : localhost:3306
 Source Schema         : twenty_five

 Target Server Type    : MySQL
 Target Server Version : 80026 (8.0.26)
 File Encoding         : 65001

 Date: 06/07/2026 12:22:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '卡片标题',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '跳转路由/外部链接地址',
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标路径',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `card_type` int NULL DEFAULT 1 COMMENT '卡片是否公共，0公共，1私有',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '逻辑删除，0未删除，1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '导航卡片表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES (1, 0, '洛克王国', '/', NULL, 0, 0, '2026-07-04 09:50:24', '2026-07-05 16:28:18', 0);
INSERT INTO `card` VALUES (2, 0, '三国杀', '/card/sgs', NULL, 0, 0, '2026-07-04 09:50:45', '2026-07-05 16:28:18', 0);
INSERT INTO `card` VALUES (3, 0, '逆战', '/', NULL, 0, 0, '2026-07-04 09:50:55', '2026-07-05 16:28:18', 0);
INSERT INTO `card` VALUES (4, 1, '11', '/', '/upload/card/1783239800305_af4673c6.png', 0, 1, '2026-07-05 16:23:21', '2026-07-05 16:23:51', 1);

-- ----------------------------
-- Table structure for lkwg_character
-- ----------------------------
DROP TABLE IF EXISTS `lkwg_character`;
CREATE TABLE `lkwg_character`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `character_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '宠物性格',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `character_name`(`character_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '洛克王国性格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lkwg_character
-- ----------------------------
INSERT INTO `lkwg_character` VALUES (1, '固执');
INSERT INTO `lkwg_character` VALUES (2, '勇敢');
INSERT INTO `lkwg_character` VALUES (3, '逞强');
INSERT INTO `lkwg_character` VALUES (4, '大胆');
INSERT INTO `lkwg_character` VALUES (5, '调皮');
INSERT INTO `lkwg_character` VALUES (6, '聪明');
INSERT INTO `lkwg_character` VALUES (7, '冷静');
INSERT INTO `lkwg_character` VALUES (8, '理性');
INSERT INTO `lkwg_character` VALUES (9, '专注');
INSERT INTO `lkwg_character` VALUES (10, '偏执');
INSERT INTO `lkwg_character` VALUES (11, '胆小');
INSERT INTO `lkwg_character` VALUES (12, '开朗');
INSERT INTO `lkwg_character` VALUES (13, '热情');
INSERT INTO `lkwg_character` VALUES (14, '急躁');
INSERT INTO `lkwg_character` VALUES (15, '莽撞');
INSERT INTO `lkwg_character` VALUES (16, '沉默');
INSERT INTO `lkwg_character` VALUES (17, '平和');
INSERT INTO `lkwg_character` VALUES (18, '踏实');
INSERT INTO `lkwg_character` VALUES (19, '忧郁');
INSERT INTO `lkwg_character` VALUES (20, '粗心');
INSERT INTO `lkwg_character` VALUES (21, '稳重');
INSERT INTO `lkwg_character` VALUES (22, '天真');
INSERT INTO `lkwg_character` VALUES (23, '悠闲');
INSERT INTO `lkwg_character` VALUES (24, '坦率');
INSERT INTO `lkwg_character` VALUES (25, '懒散');
INSERT INTO `lkwg_character` VALUES (26, '警惕');
INSERT INTO `lkwg_character` VALUES (27, '害羞');
INSERT INTO `lkwg_character` VALUES (28, '慎重');
INSERT INTO `lkwg_character` VALUES (29, '焦虑');
INSERT INTO `lkwg_character` VALUES (30, '温顺');

-- ----------------------------
-- Table structure for lkwg_department
-- ----------------------------
DROP TABLE IF EXISTS `lkwg_department`;
CREATE TABLE `lkwg_department`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `department_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '系别属性',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '洛克王国系别表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lkwg_department
-- ----------------------------
INSERT INTO `lkwg_department` VALUES (1, '普');
INSERT INTO `lkwg_department` VALUES (2, '草');
INSERT INTO `lkwg_department` VALUES (3, '火');
INSERT INTO `lkwg_department` VALUES (4, '水');
INSERT INTO `lkwg_department` VALUES (5, '光');
INSERT INTO `lkwg_department` VALUES (6, '地');
INSERT INTO `lkwg_department` VALUES (7, '冰');
INSERT INTO `lkwg_department` VALUES (8, '龙');
INSERT INTO `lkwg_department` VALUES (9, '电');
INSERT INTO `lkwg_department` VALUES (10, '毒');
INSERT INTO `lkwg_department` VALUES (11, '虫');
INSERT INTO `lkwg_department` VALUES (12, '武');
INSERT INTO `lkwg_department` VALUES (13, '翼');
INSERT INTO `lkwg_department` VALUES (14, '萌');
INSERT INTO `lkwg_department` VALUES (15, '幽');
INSERT INTO `lkwg_department` VALUES (16, '恶');
INSERT INTO `lkwg_department` VALUES (17, '机械');
INSERT INTO `lkwg_department` VALUES (18, '幻');
INSERT INTO `lkwg_department` VALUES (19, '首领');
INSERT INTO `lkwg_department` VALUES (20, '奇异');
INSERT INTO `lkwg_department` VALUES (21, '污染');

-- ----------------------------
-- Table structure for lkwg_pet
-- ----------------------------
DROP TABLE IF EXISTS `lkwg_pet`;
CREATE TABLE `lkwg_pet`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '宠物图像',
  `serial_number` int NOT NULL COMMENT '宠物序号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '宠物姓名',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '男' COMMENT '宠物性别',
  `department_id` int NULL DEFAULT NULL COMMENT '宠物系别',
  `deputy_department_id` int NULL DEFAULT NULL COMMENT '宠物副系别',
  `bloodline` int NULL DEFAULT NULL COMMENT '宠物血脉',
  `talent_id` int NULL DEFAULT NULL COMMENT '宠物天分',
  `feature` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '宠物特性',
  `character_id` int NULL DEFAULT NULL COMMENT '宠物性格',
  `specialty` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '宠物特长',
  `remark` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` date NULL DEFAULT NULL COMMENT '宠物获得时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '洛克王国宠物信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lkwg_pet
-- ----------------------------

-- ----------------------------
-- Table structure for lkwg_talent
-- ----------------------------
DROP TABLE IF EXISTS `lkwg_talent`;
CREATE TABLE `lkwg_talent`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `talent_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '宠物天分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '洛克王国天分表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lkwg_talent
-- ----------------------------
INSERT INTO `lkwg_talent` VALUES (1, '了不起的天分');
INSERT INTO `lkwg_talent` VALUES (2, '相当好的天分');
INSERT INTO `lkwg_talent` VALUES (3, '还不错的天分');
INSERT INTO `lkwg_talent` VALUES (4, '一般般的天分');

-- ----------------------------
-- Table structure for quotation
-- ----------------------------
DROP TABLE IF EXISTS `quotation`;
CREATE TABLE `quotation`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `statement_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `is_top` int NULL DEFAULT NULL COMMENT '是否置顶 0未置顶 1置顶',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '逻辑删除，0未删除，1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '语录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of quotation
-- ----------------------------
INSERT INTO `quotation` VALUES (1, 1, '如果你还', 0, 1, '2026-07-03 16:52:29', '2026-07-03 17:12:56', 1);
INSERT INTO `quotation` VALUES (2, 1, '熬得', 0, 0, '2026-07-03 16:52:36', '2026-07-03 17:12:40', 1);
INSERT INTO `quotation` VALUES (3, 1, '111', 2, 0, '2026-07-03 16:55:18', '2026-07-03 17:12:58', 1);
INSERT INTO `quotation` VALUES (4, 1, '111111111111111', 1, 0, '2026-07-03 16:55:27', '2026-07-03 17:12:54', 1);
INSERT INTO `quotation` VALUES (5, 1, '人生的容错真的是大的超乎你的想象', 0, 0, '2026-07-03 17:14:09', '2026-07-03 18:19:24', 1);
INSERT INTO `quotation` VALUES (6, 1, '11', 0, 0, '2026-07-03 17:28:42', '2026-07-03 18:19:22', 1);
INSERT INTO `quotation` VALUES (7, 1, '111', 0, 0, '2026-07-03 17:28:46', '2026-07-03 18:19:28', 1);
INSERT INTO `quotation` VALUES (8, 1, '行至水穷处，坐看云起时。', 5, 0, '2026-07-03 18:19:41', '2026-07-04 11:53:20', 0);
INSERT INTO `quotation` VALUES (9, 1, '倘若你真的笃定自己有点本事，你就应该凭着这口气去成就你自己。', 2, 1, '2026-07-03 18:25:00', '2026-07-04 11:57:50', 0);
INSERT INTO `quotation` VALUES (10, 1, '年少未觉行路远，步步深陷幻梦中。一失再失藏胸臆，几度惊醒又沉沦。长成先尝世事深，连连艰难易辙时。若危若安不会意，何年何月破茧飞？', 0, 1, '2026-07-04 11:52:48', '2026-07-04 16:40:12', 0);
INSERT INTO `quotation` VALUES (11, 1, '长成先尝世事深，连连艰难易辙时。若危若安不会意，何年何月破茧飞？', 1, 1, '2026-07-04 11:57:17', '2026-07-04 16:40:23', 1);

-- ----------------------------
-- Table structure for sgs_bag
-- ----------------------------
DROP TABLE IF EXISTS `sgs_bag`;
CREATE TABLE `sgs_bag`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '逻辑删除，0未删除，1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '三国杀包名表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sgs_bag
-- ----------------------------
INSERT INTO `sgs_bag` VALUES (3, '兵势 · 奇', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (4, '兵势 · 正', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (5, '兵势 · 势', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (6, '兵势 · 节', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (7, '谋攻 · 知', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (8, '谋攻 · 识', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (9, '谋攻 · 同', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (10, '谋攻 · 虞', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (11, '谋攻 · 能', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (12, '始计 · 智', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (13, '始计 · 信', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (14, '始计 · 仁', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (15, '始计 · 勇', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (16, '始计 · 严', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (17, '界限突破 · 标', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (18, '界限突破 · 风', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (19, '界限突破 · 火', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (20, '界限突破 · 林', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (21, '界限突破 · 山', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (22, '一将成名 · 1', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (23, '一将成名 · 2', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (24, '一将成名 · 3', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (25, '一将成名 · 4', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (26, '一将成名 · 5', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (27, '界 · 一将成名 · 1', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (28, '界 · 一将成名 · 2', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (29, '界 · 一将成名 · 3', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (30, '界 · 一将成名 · 4', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (31, '界 · 一将成名 · 5', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (32, '乱世英杰 · 6', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (33, '乱世英杰 · 7', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (34, 'SP', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (35, '龙血玄黄', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (36, '神将', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (37, '稀有专属 · 坤', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (38, '稀有专属 · 星', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (39, '稀有专属 · 老友季', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (40, '神话再临 · 标', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (41, '神话再临 · 风', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (42, '神将再临 · 火', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (43, '神话再临 · 林', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (44, '神话再临 · 山', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (45, '神话再临 · 阴', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (46, '神话再临 · 雷', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (47, '国战', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);
INSERT INTO `sgs_bag` VALUES (48, '1 v 1', '2026-07-05 17:49:09', '2026-07-05 17:50:25', 0);

-- ----------------------------
-- Table structure for sgs_camp
-- ----------------------------
DROP TABLE IF EXISTS `sgs_camp`;
CREATE TABLE `sgs_camp`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '阵营名',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '逻辑删除，0未删除，1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '三国杀阵营表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sgs_camp
-- ----------------------------
INSERT INTO `sgs_camp` VALUES (1, '魏', '2026-07-05 17:51:39', '2026-07-05 17:53:09', 0);
INSERT INTO `sgs_camp` VALUES (2, '蜀', '2026-07-05 17:51:39', '2026-07-05 17:53:09', 0);
INSERT INTO `sgs_camp` VALUES (3, '吴', '2026-07-05 17:51:39', '2026-07-05 17:53:09', 0);
INSERT INTO `sgs_camp` VALUES (4, '群', '2026-07-05 17:51:39', '2026-07-05 17:53:09', 0);
INSERT INTO `sgs_camp` VALUES (5, '神', '2026-07-05 17:51:39', '2026-07-05 17:53:09', 0);
INSERT INTO `sgs_camp` VALUES (6, '魏 / 吴', '2026-07-05 17:51:39', '2026-07-05 17:53:09', 0);
INSERT INTO `sgs_camp` VALUES (7, '蜀 / 吴', '2026-07-05 17:51:39', '2026-07-05 17:53:09', 0);
INSERT INTO `sgs_camp` VALUES (8, '魏 / 蜀', '2026-07-05 17:51:39', '2026-07-05 17:53:09', 0);

-- ----------------------------
-- Table structure for sgs_information
-- ----------------------------
DROP TABLE IF EXISTS `sgs_information`;
CREATE TABLE `sgs_information`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `official_rank` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '大元帅' COMMENT '用户官阶',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '佚名' COMMENT '昵称',
  `vip_level` int NULL DEFAULT 46 COMMENT 'vip等级',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像路径',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '逻辑删除，0未删除，1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '三国杀个人信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sgs_information
-- ----------------------------
INSERT INTO `sgs_information` VALUES (5, 1, '大元帅', '1', 46, '', '2026-07-05 17:42:51', '2026-07-05 17:42:51', 0);

-- ----------------------------
-- Table structure for sgs_military_general
-- ----------------------------
DROP TABLE IF EXISTS `sgs_military_general`;
CREATE TABLE `sgs_military_general`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片路径',
  `gender` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `camp_id` int NULL DEFAULT NULL COMMENT '阵营',
  `hp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '血量',
  `type_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '武将类型',
  `get_time` date NULL DEFAULT NULL COMMENT '获得时间',
  `star_rating` int NULL DEFAULT NULL COMMENT '星级',
  `ftl_rating` int NULL DEFAULT NULL COMMENT '斗地主评分',
  `mc_rating` int NULL DEFAULT NULL COMMENT '军争评分',
  `bag_id` int NULL DEFAULT NULL COMMENT '包',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '逻辑删除，0未删除，1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 458 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '三国武将信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sgs_military_general
-- ----------------------------
INSERT INTO `sgs_military_general` VALUES (4, 1, '势 · 于吉', NULL, '男', 4, '3', '1', '2025-07-30', 4, 7, 7, 3, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (5, 1, '势 · 夏侯尚', NULL, '男', 1, '4', '2', '2025-12-09', 3, 5, 4, 3, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (6, 1, '势 · 陈到', NULL, '男', 2, '4', '2', '2025-10-31', 3, 5, 3, 4, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (7, 1, '势 · 田丰', NULL, '男', 4, '3', '2', '2025-11-17', 3, 5, 4, 4, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (8, 1, '势 · 国渊', NULL, '男', 1, '3', '1', '2025-10-09', 4, 7, 7, 4, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (9, 1, '势 · 魏延', NULL, '男', 2, '4', '1', '2025-07-30', 4, 8, 7, 5, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (10, 1, '势 · 陈祗', NULL, '男', 2, '3', '2', '2025-12-09', 3, 1, 1, 5, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (11, 1, '势 · 辛宪英', NULL, '女', 1, '3', '1', '2025-12-31', 4, 7, 7, 6, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (12, 1, '势 · 陆郁生', NULL, '女', 3, '3', '1', '2025-10-09', 4, 6, 7, 6, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (13, 1, '谋 · 周瑜', NULL, '男', 3, '3', '2', '2025-02-27', 3, 6, 5, 7, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (14, 1, '谋 · 诸葛亮', NULL, '男', 2, '3', '1', '2024-11-01', 3, 9, 10, 7, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (15, 1, '谋 · 徐晃', NULL, '男', 1, '4', '2', '2022-12-10', 3, 6, 4, 8, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (16, 1, '谋 · 法正', NULL, '男', 2, '3', '2', '2026-01-01', 3, 2, 4, 8, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (17, 1, '谋 · 庞统', NULL, '男', 2, '3', '2', '2025-02-27', 3, 1, 5, 8, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (18, 1, '谋 · 刘赪', NULL, '女', 4, '3', '2', '2022-08-18', 3, 6, 5, 9, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (19, 1, '谋 · 张飞', NULL, '男', 2, '4', '2', '2023-05-19', 3, 6, 8, 9, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (20, 1, '谋 · 赵云', NULL, '男', 2, '4', '1', '2024-04-04', 3, 6, 5, 9, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (21, 1, '谋 · 夏侯氏', NULL, '女', 2, '3', '1', '2026-04-03', 3, 5, 5, 9, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (22, 1, '谋 · 小乔', NULL, '女', 3, '3', '2', '2024-10-05', 3, 5, 6, 9, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (23, 1, '谋 · 夏侯渊', NULL, '男', 1, '4', '2', '2025-08-27', 3, 5, 6, 9, '2026-07-05 22:40:17', '2026-07-05 22:40:44', 0);
INSERT INTO `sgs_military_general` VALUES (24, 1, '谋 · 吕蒙', NULL, '男', 3, '4', '2', '2022-09-28', 3, 5, 6, 10, '2026-07-05 22:40:17', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (25, 1, '谋 · 于禁', NULL, '男', 1, '4', '2', '2025-01-16', 1, 5, 5, 10, '2026-07-05 22:40:17', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (26, 1, '谋 · 卢植', NULL, '男', 4, '3', '2', '2024-02-22', 3, 7, 7, 10, '2026-07-05 22:40:17', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (27, 1, '谋 · 高顺', NULL, '男', 4, '4', '2', '2024-09-09', 1, 6, 6, 10, '2026-07-05 22:40:17', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (28, 1, '谋 · 华雄', NULL, '男', 4, '3 / 4 - 1', '2', '2022-11-06', 1, 5, 5, 11, '2026-07-05 22:40:17', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (29, 1, '谋 · 袁绍', NULL, '男', 4, '4', '2', '2023-07-19', 1, 2, 5, 11, '2026-07-05 22:40:17', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (30, 1, '谋 · 关羽', NULL, '男', 2, '4', '1', '2025-07-30', 3, 6, 6, 11, '2026-07-05 22:40:17', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (31, 1, '王粲', NULL, '男', 1, '3', '1', '2022-11-11', 3, 6, 7, 12, '2026-07-05 22:40:17', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (32, 1, '陈震', NULL, '男', 2, '3', '2', '2021-06-26', 1, 6, 6, 12, '2026-07-05 22:40:17', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (33, 1, '荀谌', NULL, '男', 4, '3', '2', '2021-06-26', 1, 3, 4, 12, '2026-07-05 22:40:17', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (34, 1, '费祎', NULL, '男', 2, '3', '2', '2021-07-10', 3, 6, 7, 12, '2026-07-05 22:40:17', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (35, 1, '骆统', NULL, '男', 3, '4', '1', '2021-07-11', 3, 6, 6, 12, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (36, 1, '孙邵', NULL, '男', 3, '3', '2', '2021-09-18', 1, 3, 5, 12, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (37, 1, '卞夫人', NULL, '男', 1, '3', '2', '2020-12-15', 1, 6, 8, 12, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (38, 1, '周处', NULL, '男', 3, '4', '1', '2024-04-25', 3, 7, 7, 13, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (39, 1, '吴景', NULL, '男', 3, '4', '1', '2023-09-03', 3, 6, 7, 13, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (40, 1, '王甫赵累', NULL, '男', 2, '4', '2', '2024-02-24', 1, 3, 5, 13, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (41, 1, '羊祜', NULL, '男', 4, '4', '2', '2024-11-01', 1, 6, 6, 13, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (42, 1, '糜夫人', NULL, '女', 2, '3', '2', '2021-06-26', 1, 5, 5, 13, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (43, 1, '王凌', NULL, '男', 1, '4', '1', '2024-12-28', 3, 6, 6, 13, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (44, 1, '孔融', NULL, '男', 4, '3', '2', '2018-07-19', 3, 5, 6, 13, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (45, 1, '许靖', NULL, '男', 2, '3', '2', '2021-10-01', 1, 1, 1, 14, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (46, 1, '向宠', NULL, '男', 2, '4', '2', '2022-01-01', 1, 2, 3, 14, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (47, 1, '华歆', NULL, '男', 1, '3', '2', '2022-07-12', 1, 1, 3, 14, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (48, 1, '张仲景', NULL, '男', 4, '3', '1', '2022-02-03', 3, 5, 7, 14, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (49, 1, '张温', NULL, '男', 3, '3', '2', '2023-01-23', 1, 5, 7, 14, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (50, 1, '蔡贞姬', NULL, '女', 1, '3', '2', '2025-02-27', 1, 6, 6, 14, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (51, 1, '孙翊', NULL, '男', 3, '4', '2', '2022-01-22', 1, 5, 4, 15, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (52, 1, '高览', NULL, '男', 4, '4', '2', '2022-02-03', 1, 6, 6, 15, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (53, 1, '宗预', NULL, '男', 2, '3', '2', '2025-04-21', 3, 1, 1, 15, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (54, 1, '花鬘', NULL, '女', 2, '4', '1', '2023-03-24', 3, 1, 7, 15, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (55, 1, '陈武董袭', NULL, '男', 3, '4', '2', '2018-07-07', 1, 3, 4, 15, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (56, 1, '袁涣', NULL, '男', 1, '3', '2', '2024-09-22', 1, 6, 6, 15, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (57, 1, '蒋琬', NULL, '男', 2, '3', '2', '2022-03-20', 1, 8, 8, 16, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (58, 1, '蒋钦', NULL, '男', 3, '4', '2', '2021-06-26', 1, 6, 6, 16, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (59, 1, '崔琰', NULL, '男', 1, '3', '2', '2025-12-07', 3, 1, 1, 16, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (60, 1, '吕范', NULL, '男', 3, '3', '2', '2020-05-02', 1, 5, 4, 16, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (61, 1, '刘巴', NULL, '男', 2, '3', '2', '2023-03-10', 1, 3, 5, 16, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (62, 1, '界 · 刘备', NULL, '男', 2, '4', '2', '2018-05-22', 3, 5, 6, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (63, 1, '界 · 关羽', NULL, '男', 2, '4', '2', '2018-05-07', 3, 6, 5, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (64, 1, '界 · 张飞', NULL, '男', 2, '4', '2', '2018-04-26', 1, 3, 2, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (65, 1, '界 · 赵云', NULL, '男', 2, '4', '2', '2018-05-09', 1, 1, 2, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (66, 1, '界 · 马超', NULL, '男', 2, '4', '2', '2018-05-31', 3, 3, 3, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (67, 1, '界 · 甘宁', NULL, '男', 3, '4', '2', '2018-06-05', 1, 5, 6, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (68, 1, '界 · 吕蒙', NULL, '男', 3, '4', '2', '2018-05-13', 3, 1, 5, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (69, 1, '界 · 黄盖', NULL, '男', 3, '4', '2', '2019-02-01', 3, 6, 6, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (70, 1, '界 · 周瑜', NULL, '男', 3, '3', '2', '2018-05-27', 1, 4, 4, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (71, 1, '界 · 大乔', NULL, '女', 3, '3', '2', '2018-06-11', 1, 5, 6, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (72, 1, '界 · 陆逊', NULL, '男', 3, '3', '2', '2019-02-22', 1, 2, 3, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (73, 1, '界 · 曹操', NULL, '男', 1, '4', '2', '2018-10-17', 1, 1, 3, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (74, 1, '界 · 司马懿', NULL, '男', 1, '3', '2', '2019-01-31', 3, 1, 5, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (75, 1, '界 · 夏侯惇', NULL, '男', 1, '4', '2', '2018-05-18', 3, 1, 5, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (76, 1, '界 · 张辽', NULL, '男', 1, '4', '2', '2018-07-16', 3, 2, 3, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (77, 1, '界 · 许褚', NULL, '男', 1, '4', '2', '2018-08-26', 1, 1, 2, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (78, 1, '界 · 郭嘉', NULL, '男', 1, '3', '2', '2019-11-04', 1, 2, 6, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (79, 1, '界 · 华佗', NULL, '男', 4, '3', '2', '2018-11-12', 3, 6, 6, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (80, 1, '界 · 吕布', NULL, '男', 4, '5', '2', '2019-05-25', 3, 6, 6, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (81, 1, '界 · 华雄', NULL, '男', 4, '6', '2', '2018-07-24', 1, 1, 2, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (82, 1, '界 · 袁术', NULL, '男', 4, '4', '2', '2018-06-25', 1, 1, 1, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (83, 1, '界 · 诸葛亮', NULL, '男', 2, '3', '2', '2019-01-22', 1, 1, 1, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (84, 1, '界 · 孙权', NULL, '男', 3, '4', '2', '2019-03-11', 5, 7, 6, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (85, 1, '界 · 貂蝉', NULL, '女', 4, '3', '2', '2019-11-04', 1, 1, 2, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (86, 1, '界 · 黄月英', NULL, '女', 2, '3', '2', '2019-11-04', 1, 2, 5, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (87, 1, '界 · 甄姬', NULL, '女', 1, '3', '2', '2019-10-19', 1, 2, 5, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (88, 1, '界 · 孙尚香', NULL, '女', 3, '3', '2', '2019-06-24', 3, 6, 6, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (89, 1, '界 · 伊籍', NULL, '男', 2, '3', '2', '2019-10-20', 1, 5, 6, 17, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (90, 1, '界 · 黄忠', NULL, '男', 2, '4', '1', '2023-06-17', 3, 5, 5, 18, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (91, 1, '界 · 魏延', NULL, '男', 2, '4', '2', '2018-09-15', 3, 3, 5, 18, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (92, 1, '界 · 夏侯渊', NULL, '男', 1, '4', '2', '2021-10-01', 1, 2, 4, 18, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (93, 1, '界 · 曹仁', NULL, '男', 1, '4', '2', '2018-12-10', 3, 3, 6, 18, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (94, 1, '界 · 小乔', NULL, '女', 3, '3', '2', '2018-08-20', 3, 2, 5, 18, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (95, 1, '界 · 周泰', NULL, '男', 3, '4', '2', '2019-10-21', 3, 1, 5, 18, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (96, 1, '界 · 张角', NULL, '男', 4, '3', '2', '2017-11-27', 1, 1, 4, 18, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (97, 1, '界 · 于吉', NULL, '男', 4, '3', '2', '2020-05-13', 1, 3, 4, 18, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (98, 1, '界 · 卧龙诸葛', NULL, '男', 2, '3', '2', '2021-10-01', 1, 1, 2, 19, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (99, 1, '界 · 典韦', NULL, '男', 1, '4', '2', '2021-10-01', 1, 2, 2, 19, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (100, 1, '界 · 荀彧', NULL, '男', 1, '3', '2', '2020-06-01', 3, 6, 6, 19, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (101, 1, '界 · 庞德', NULL, '男', 4, '4', '2', '2019-08-02', 1, 5, 3, 19, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (102, 1, '界 · 庞统', NULL, '男', 2, '3', '2', '2021-02-26', 1, 1, 3, 19, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (103, 1, '界 · 颜良文丑', NULL, '男', 4, '4', '2', '2020-07-09', 1, 2, 4, 19, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (104, 1, '界 · 袁绍', NULL, '男', 4, '4', '2', '2019-11-09', 1, 1, 2, 19, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (105, 1, '界 · 徐晃', NULL, '男', 1, '4', '2', '2019-11-17', 1, 4, 5, 20, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (106, 1, '界 · 孟获', NULL, '男', 2, '4', '2', '2019-12-23', 1, 4, 4, 20, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (107, 1, '界 · 祝融', NULL, '女', 2, '4', '2', '2020-07-09', 1, 4, 5, 20, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (108, 1, '界 · 曹丕', NULL, '男', 1, '3', '2', '2021-10-01', 3, 4, 6, 20, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (109, 1, '界 · 孙坚', NULL, '男', 3, '4', '2', '2021-10-01', 3, 1, 1, 20, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (110, 1, '界 · 董卓', NULL, '男', 4, '8', '2', '2020-01-17', 1, 1, 3, 20, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (111, 1, '界 · 邓艾', NULL, '男', 1, '4', '2', '2020-03-07', 1, 1, 2, 21, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (112, 1, '界 · 左慈', NULL, '男', 4, '3', '1', '2021-06-26', 4, 6, 7, 21, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (113, 1, '界 · 姜维', NULL, '男', 2, '4', '2', '2020-01-25', 1, 1, 1, 21, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (114, 1, '界 · 孙策', NULL, '男', 3, '4', '2', '2020-04-01', 1, 1, 3, 21, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (115, 1, '界 · 蔡文姬', NULL, '女', 4, '3', '2', '2020-03-07', 1, 6, 6, 21, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (116, 1, '界 · 张昭张纮', NULL, '男', 3, '3', '2', '2020-03-20', 1, 1, 5, 21, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (117, 1, '界 · 刘禅', NULL, '男', 2, '3', '2', '2020-08-01', 1, 5, 6, 21, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (118, 1, '曹植', NULL, '男', 1, '3', '3', '2019-10-06', 3, 1, 1, 22, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (119, 1, '高顺', NULL, '男', 4, '4', '3', '2018-07-21', 3, 1, 1, 22, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (120, 1, '陈宫', NULL, '男', 4, '3', '3', '2018-11-12', 3, 1, 1, 22, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (121, 1, '法正', NULL, '男', 2, '3', '3', '2019-10-06', 3, 1, 1, 22, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (122, 1, '凌统', NULL, '男', 3, '4', '3', '2018-11-12', 3, 1, 1, 22, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (123, 1, '马谡', NULL, '男', 2, '3', '3', '2018-05-04', 3, 1, 1, 22, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (124, 1, '吴国太', NULL, '女', 3, '3', '3', '2018-05-02', 3, 1, 1, 22, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (125, 1, '徐盛', NULL, '男', 3, '4', '3', '2018-10-31', 3, 1, 1, 22, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (126, 1, '徐庶', NULL, '男', 2, '3', '3', '2019-10-06', 3, 1, 1, 22, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (127, 1, '于禁', NULL, '男', 1, '4', '3', '2018-01-01', 3, 1, 1, 22, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (128, 1, '张春华', NULL, '女', 1, '3', '2', '2018-05-18', 4, 1, 1, 22, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (129, 1, '曹彰', NULL, '男', 1, '4', '3', '2019-03-28', 3, 1, 1, 23, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (130, 1, '王异', NULL, '女', 1, '3', '3', '2018-05-28', 3, 2, 2, 23, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (131, 1, '荀攸', NULL, '男', 1, '3', '3', '2018-06-13', 3, 2, 3, 23, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (132, 1, '关兴张苞', NULL, '男', 2, '4', '2', '2018-09-30', 4, 2, 4, 23, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (133, 1, '廖化', NULL, '男', 2, '4', '2', '2018-05-27', 1, 1, 1, 23, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (134, 1, '马岱', NULL, '男', 2, '4', '3', '2019-03-18', 1, 1, 2, 23, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (135, 1, '步练师', NULL, '女', 3, '3', '3', '2018-07-06', 3, 1, 2, 23, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (136, 1, '程普', NULL, '男', 3, '4', '2', '2019-01-01', 3, 1, 1, 23, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (137, 1, '韩当', NULL, '男', 3, '4', '2', '2019-01-10', 3, 1, 2, 23, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (138, 1, '刘表', NULL, '男', 4, '3', '3', '2018-05-15', 1, 1, 1, 23, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (139, 1, '钟会', NULL, '男', 1, '4', '2', '2019-01-10', 3, 1, 1, 23, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (140, 1, '公孙瓒', NULL, '男', 4, '4', '2', '2018-06-05', 3, 1, 1, 23, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (141, 1, '曹冲', NULL, '男', 1, '3', '2', '2018-06-05', 1, 1, 2, 24, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (142, 1, '郭淮', NULL, '男', 1, '4', '2', '2018-05-14', 1, 1, 1, 24, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (143, 1, '满宠', NULL, '男', 1, '3', '2', '2019-01-25', 3, 1, 5, 24, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (144, 1, '关平', NULL, '男', 2, '4', '2', '2018-11-12', 1, 1, 6, 24, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (145, 1, '简雍', NULL, '男', 2, '3', '2', '2019-06-09', 3, 1, 1, 24, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (146, 1, '刘封', NULL, '男', 2, '4', '2', '2018-05-02', 3, 1, 4, 24, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (147, 1, '潘璋马忠', NULL, '男', 3, '4', '2', '2018-07-24', 3, 1, 1, 24, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (148, 1, '虞翻', NULL, '男', 3, '3', '2', '2018-05-12', 1, 1, 1, 24, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (149, 1, '朱然', NULL, '男', 3, '4', '2', '2018-10-17', 1, 1, 3, 24, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (150, 1, '伏皇后', NULL, '女', 4, '3', '2', '2018-05-14', 3, 1, 3, 24, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (151, 1, '李儒', NULL, '男', 4, '3', '2', '2018-05-17', 4, 1, 5, 24, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (152, 1, '曹真', NULL, '男', 1, '4', '2', '2018-07-24', 1, 1, 2, 25, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (153, 1, '韩浩史涣', NULL, '男', 1, '4', '2', '2018-07-01', 1, 1, 3, 25, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (154, 1, '陈群', NULL, '男', 1, '3', '2', '2019-03-06', 1, 1, 2, 25, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (155, 1, '吴懿', NULL, '男', 2, '4', '2', '2018-09-30', 1, 1, 1, 25, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (156, 1, '周仓', NULL, '男', 2, '4', '2', '2018-11-12', 1, 1, 1, 25, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (157, 1, '张松', NULL, '男', 2, '4', '2', '2018-06-14', 3, 4, 6, 25, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (158, 1, '孙鲁班', NULL, '女', 3, '3', '2', '2018-06-05', 1, 1, 1, 25, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (159, 1, '朱桓', NULL, '男', 3, '4', '2', '2018-06-30', 3, 4, 5, 25, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (160, 1, '顾雍', NULL, '男', 3, '3', '2', '2018-11-12', 1, 1, 2, 25, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (161, 1, '沮授', NULL, '男', 4, '3', '1', '2019-12-23', 3, 3, 3, 25, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (162, 1, '蔡夫人', NULL, '女', 4, '3', '2', '2018-11-26', 4, 1, 2, 25, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (163, 1, '曹叡', NULL, '男', 1, '3', '2', '2019-04-11', 3, 4, 6, 26, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (164, 1, '曹休', NULL, '男', 1, '4', '2', '2018-10-17', 1, 1, 1, 26, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (165, 1, '钟繇', NULL, '男', 1, '3', '2', '2018-11-12', 3, 3, 4, 26, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (166, 1, '刘谌', NULL, '男', 2, '4', '2', '2019-02-01', 1, 2, 3, 26, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (167, 1, '夏侯氏', NULL, '女', 2, '3', '2', '2019-12-23', 1, 1, 3, 26, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (168, 1, '张嶷', NULL, '男', 2, '4', '2', '2019-12-23', 1, 1, 1, 26, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (169, 1, '孙休', NULL, '男', 3, '3', '2', '2019-12-23', 1, 1, 1, 26, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (170, 1, '朱治', NULL, '男', 3, '4', '2', '2019-02-01', 1, 1, 2, 26, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (171, 1, '全琮', NULL, '男', 3, '4', '2', '2018-08-21', 1, 1, 1, 26, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (172, 1, '公孙渊', NULL, '男', 4, '4', '2', '2019-01-19', 1, 2, 4, 26, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (173, 1, '郭图逄纪', NULL, '男', 4, '3', '2', '2019-12-23', 3, 1, 3, 26, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (174, 1, '界 · 徐盛', NULL, '男', 3, '4', '1', '2021-07-24', 3, 8, 7, 27, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (175, 1, '界 · 吴国太', NULL, '女', 3, '3', '2', '2020-05-01', 1, 2, 6, 27, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (176, 1, '界 · 高顺', NULL, '男', 4, '4', '2', '2021-10-01', 1, 1, 1, 27, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (177, 1, '界 · 于禁', NULL, '男', 1, '4', '1', '2021-02-26', 3, 6, 6, 27, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (178, 1, '界 · 法正', NULL, '男', 3, '3', '2', '2018-07-24', 3, 3, 6, 27, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (179, 1, '界 · 曹植', NULL, '男', 1, '3', '2', '2020-11-10', 3, 1, 5, 27, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (180, 1, '界 · 凌统', NULL, '男', 3, '4', '2', '2020-11-09', 1, 1, 4, 27, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (181, 1, '界 · 王异', NULL, '女', 1, '3', '2', '2018-05-31', 3, 1, 2, 28, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (182, 1, '界 · 关兴张苞', NULL, '男', 2, '4', '2', '2018-05-02', 1, 1, 5, 28, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (183, 1, '界 · 马岱', NULL, '男', 2, '4', '2', '2018-11-17', 1, 1, 3, 28, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (184, 1, '界 · 公孙瓒', NULL, '男', 4, '4', '2', '2019-02-22', 1, 1, 1, 28, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (185, 1, '界 · 钟会', NULL, '男', 1, '4', '1', '2021-06-26', 3, 6, 7, 28, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (186, 1, '界 · 刘表', NULL, '男', 4, '3', '2', '2021-02-26', 1, 1, 2, 28, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (187, 1, '界 · 韩当', NULL, '男', 3, '4', '2', '2021-04-01', 1, 1, 3, 28, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (188, 1, '界 · 程普', NULL, '男', 3, '4', '2', '2021-02-26', 1, 1, 3, 28, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (189, 1, '界 · 步练师', NULL, '女', 3, '3', '1', '2021-02-26', 3, 6, 6, 28, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (190, 1, '界 · 廖化', NULL, '男', 2, '4', '2', '2021-06-26', 3, 6, 6, 28, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (191, 1, '界 · 曹彰', NULL, '男', 1, '4', '2', '2021-07-24', 1, 1, 2, 28, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (192, 1, '界 · 朱然', NULL, '男', 3, '4', '1', '2021-03-18', 3, 1, 7, 29, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (193, 1, '界 · 简雍', NULL, '男', 2, '3', '2', '2025-08-29', 3, 1, 1, 29, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (194, 1, '界 · 虞翻', NULL, '男', 3, '3', '2', '2024-12-06', 1, 1, 3, 29, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (195, 1, '界 · 满宠', NULL, '男', 1, '3', '2', '2021-10-23', 3, 6, 7, 29, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (196, 1, '界 · 伏皇后', NULL, '女', 4, '3', '2', '2021-09-18', 1, 4, 5, 29, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (197, 1, '界 · 郭淮', NULL, '男', 1, '4', '2', '2022-03-20', 1, 1, 2, 29, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (198, 1, '界 · 潘璋马忠', NULL, '男', 3, '4', '2', '2025-06-20', 3, 1, 1, 29, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (199, 1, '界 · 陈群', NULL, '男', 1, '3', '2', '2021-08-14', 1, 1, 5, 30, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (200, 1, '界 · 顾雍', NULL, '男', 3, '3', '2', '2025-10-20', 3, 1, 1, 30, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (201, 1, '界 · 孙鲁班', NULL, '女', 3, '3', '2', '2021-12-21', 1, 1, 3, 30, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (202, 1, '界 · 沮授', NULL, '男', 4, '2 - 3 / 3', '1', '2023-09-17', 4, 8, 8, 30, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (203, 1, '界 · 孙休', NULL, '男', 3, '3', '2', '2022-07-12', 1, 1, 1, 31, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (204, 1, '界 · 朱治', NULL, '男', 3, '4', '2', '2023-09-17', 1, 5, 6, 31, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (205, 1, '界 · 张嶷', NULL, '男', 2, '4', '2', '2024-11-27', 1, 1, 5, 31, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (206, 1, '郭皇后', NULL, '女', 1, '3', '2', '2019-12-21', 1, 1, 1, 32, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (207, 1, '李严', NULL, '男', 2, '3', '2', '2018-10-24', 1, 1, 2, 32, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (208, 1, '孙登', NULL, '男', 3, '4', '2', '2019-02-22', 1, 1, 1, 32, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (209, 1, '刘虞', NULL, '男', 4, '2', '2', '2020-07-31', 1, 1, 1, 32, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (210, 1, '岑昏', NULL, '男', 3, '3', '2', '2019-12-23', 1, 1, 5, 32, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (211, 1, '孙资刘放', NULL, '男', 1, '3', '2', '2018-05-02', 1, 1, 2, 32, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (212, 1, '黄皓', NULL, '男', 2, '3', '2', '2018-08-20', 3, 1, 3, 32, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (213, 1, '张让', NULL, '男', 4, '3', '1', '2021-02-26', 3, 6, 7, 32, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (214, 1, '吴苋', NULL, '女', 2, '3', '2', '2018-06-21', 4, 2, 5, 33, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (215, 1, '徐氏', NULL, '女', 3, '3', '2', '2018-10-17', 4, 1, 6, 33, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (216, 1, '秦宓', NULL, '男', 2, '3', '2', '2018-10-17', 3, 5, 6, 33, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (217, 1, '薛综', NULL, '男', 3, '3', '2', '2018-10-17', 1, 1, 5, 33, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (218, 1, '曹节', NULL, '女', 4, '3', '2', '2018-10-17', 1, 1, 4, 33, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (219, 1, '嵇康', NULL, '男', 1, '3', '1', '2020-05-30', 3, 4, 7, 33, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (220, 1, '蔡邕', NULL, '男', 4, '3', '2', '2018-10-19', 1, 1, 1, 33, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (221, 1, '辛宪英', NULL, '女', 1, '3', '2', '2019-04-05', 1, 1, 1, 33, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (222, 1, '诸葛诞', NULL, '男', 1, '4', '2', '2018-08-26', 1, 1, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (223, 1, '马良', NULL, '男', 2, '3', '2', '2018-08-01', 3, 6, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (224, 1, '潘凤', NULL, '男', 4, '4', '3', '2018-09-23', 1, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (225, 1, '丁奉', NULL, '男', 3, '4', '3', '2019-03-20', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (226, 1, '诸葛瑾', NULL, '男', 3, '3', '2', '2019-01-23', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (227, 1, '曹昂', NULL, '男', 1, '4', '2', '2018-08-04', 3, 7, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (228, 1, '夏侯霸', NULL, '男', 2, '4', '2', '2019-01-10', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (229, 1, 'SP关羽', NULL, '男', 1, '4', '2', '2018-06-25', 1, 1, 3, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (230, 1, 'SP孙尚香', NULL, '女', 2, '3', '2', '2018-05-05', 3, 1, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (231, 1, '伏完', NULL, '男', 4, '4', '2', '2019-01-23', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (232, 1, 'SP姜维', NULL, '男', 1, '4', '2', '2018-07-24', 1, 2, 3, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (233, 1, '何太后', NULL, '女', 4, '3', '3', '2020-02-14', 1, 1, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (234, 1, '文聘', NULL, '男', 1, '4', '2', '2018-06-15', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (235, 1, '孙鲁育', NULL, '女', 3, '3', '2', '2019-06-11', 1, 5, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (236, 1, '祖茂', NULL, '男', 3, '4', '3', '2018-08-31', 1, 1, 3, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (237, 1, 'SP贾诩', NULL, '男', 1, '3', '3', '2018-05-02', 1, 1, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (238, 1, '乐进', NULL, '男', 1, '4', '2', '2018-05-17', 3, 1, 4, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (239, 1, '张宝', NULL, '男', 4, '3', '2', '2018-06-06', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (240, 1, '诸葛恪', NULL, '男', 3, '3', '2', '2018-10-21', 3, 3, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (241, 1, 'SP马超', NULL, '男', 4, '4', '3', '2017-12-13', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (242, 1, '司马朗', NULL, '男', 1, '3', '2', '2018-08-07', 1, 1, 3, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (243, 1, '大乔小乔', NULL, '女', 3, '3', '2', '2019-11-09', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (244, 1, '关银屏', NULL, '女', 2, '3 - 4', '2', '2019-10-19', 1, 7, 7, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (245, 1, '曹洪', NULL, '男', 1, '4', '3', '2020-01-13', 1, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (246, 1, 'SP蔡文姬', NULL, '女', 1, '3', '2', '2019-02-06', 4, 4, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (247, 1, 'SP曹仁', NULL, '男', 1, '4', '2', '2019-05-06', 3, 5, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (248, 1, 'SP貂蝉', NULL, '女', 4, '3', '2', '2018-10-24', 3, 6, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (249, 1, 'SP赵云', NULL, '男', 4, '3', '2', '2018-04-28', 3, 6, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (250, 1, 'SP庞德', NULL, '男', 1, '4', '3', '2020-01-22', 1, 3, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (251, 1, '刘协', NULL, '男', 4, '3', '2', '2018-07-21', 3, 4, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (252, 1, '贺齐', NULL, '男', 3, '4', '1', '2021-08-14', 3, 1, 3, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (253, 1, '糜竺', NULL, '男', 2, '3', '2', '2019-06-09', 1, 2, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (254, 1, '李通', NULL, '男', 1, '4', '2', '2018-07-21', 1, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (255, 1, 'SP黄月英', NULL, '女', 4, '3', '2', '2019-12-03', 1, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (256, 1, '严白虎', NULL, '男', 4, '4', '2', '2018-12-02', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (257, 1, '蹋顿', NULL, '男', 4, '4', '2', '2019-04-08', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (258, 1, '张鲁', NULL, '男', 4, '3', '2', '2018-07-07', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (259, 1, '李典', NULL, '男', 1, '3', '2', '2018-05-18', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (260, 1, 'SP徐庶', NULL, '男', 2, '4', '2', '2020-03-07', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (261, 1, '程昱', NULL, '男', 1, '3', '1', '2019-03-28', 3, 4, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (262, 1, '刘琦', NULL, '男', 4, '3', '2', '2019-09-04', 1, 5, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (263, 1, '马云騄', NULL, '女', 2, '4', '1', '2020-09-19', 3, 1, 3, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (264, 1, 'SP · 庞统', NULL, '男', 3, '3', '2', '2020-01-25', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (265, 1, '吕虔', NULL, '男', 1, '4', '2', '2019-12-21', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (266, 1, '潘濬', NULL, '男', 3, '3', '2', '2019-07-14', 1, 4, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (267, 1, '孙乾', NULL, '男', 2, '3', '2', '2018-07-10', 1, 1, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (268, 1, '马忠', NULL, '男', 2, '4', '2', '2020-08-03', 1, 1, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (269, 1, '董白', NULL, '女', 4, '3', '2', '2019-11-15', 1, 5, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (270, 1, '步骘', NULL, '男', 3, '3', '2', '2020-11-15', 1, 2, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (271, 1, '张星彩', NULL, '女', 2, '3', '1', '2021-10-01', 3, 1, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (272, 1, '董承', NULL, '男', 4, '4', '2', '2025-05-26', 3, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (273, 1, '卫温诸葛直', NULL, '男', 3, '4', '2', '2021-10-01', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (274, 1, '周鲂', NULL, '男', 3, '3', '2', '2020-07-21', 1, 5, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (275, 1, '樊稠', NULL, '男', 4, '4', '2', '2021-02-23', 1, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (276, 1, '董允', NULL, '男', 2, '3', '1', '2024-03-02', 3, 4, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (277, 1, '戏志才', NULL, '男', 1, '3', '1', '2020-03-07', 4, 9, 9, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (278, 1, '麹义', NULL, '男', 4, '4', '1', '2021-02-26', 3, 6, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:45', 0);
INSERT INTO `sgs_military_general` VALUES (279, 1, '赵襄', NULL, '女', 2, '4', '1', '2025-03-03', 3, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (280, 1, 'SP · 太史慈', NULL, '男', 4, '4', '2', '2021-10-01', 1, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (281, 1, '杨修', NULL, '男', 1, '3', '1', '2021-08-17', 3, 1, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (282, 1, '陶谦', NULL, '男', 4, '3', '1', '2020-03-17', 3, 1, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (283, 1, '杨仪', NULL, '男', 2, '3', '2', '2021-11-12', 3, 6, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (284, 1, '刘繇', NULL, '男', 4, '4', '2', '2021-10-01', 1, 1, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (285, 1, '吕岱', NULL, '男', 3, '4', '2', '2021-06-11', 1, 3, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (286, 1, '杜畿', NULL, '男', 1, '3', '2', '2020-03-13', 1, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (287, 1, '李傕', NULL, '男', 4, '4 / 6', '2', '2019-11-10', 3, 4, 4, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (288, 1, '关索', NULL, '男', 2, '4', '1', '2023-04-11', 3, 1, 7, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (289, 1, '孙皓', NULL, '男', 3, '5', '1', '2023-01-28', 3, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (290, 1, '陈琳', NULL, '男', 1, '3', '1', '2019-12-21', 3, 3, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (291, 1, '司马徽', NULL, '男', 4, '3', '1', '2019-12-21', 3, 1, 8, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (292, 1, '吕凯', NULL, '男', 2, '3', '2', '2020-04-30', 1, 4, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (293, 1, '卑弥呼', NULL, '女', 4, '3', '1', '2020-10-29', 3, 2, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (294, 1, '张济', NULL, '男', 4, '4', '2', '2021-10-01', 1, 3, 4, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (295, 1, '张梁', NULL, '男', 4, '4', '2', '2025-08-02', 3, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (296, 1, '鲁芝', NULL, '男', 1, '3', '2', '2019-12-21', 3, 6, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (297, 1, '王允', NULL, '男', 4, '3', '1', '2022-01-29', 3, 2, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (298, 1, '阚泽', NULL, '男', 3, '3', '2', '2019-06-29', 1, 1, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (299, 1, '苏飞', NULL, '男', 4, '4', '1', '2021-02-26', 3, 4, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (300, 1, '张恭', NULL, '男', 1, '3', '2', '2021-06-26', 3, 5, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (301, 1, '许贡', NULL, '男', 3, '3', '2', '2021-10-01', 1, 1, 4, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (302, 1, '沙摩柯', NULL, '男', 2, '4', '1', '2020-10-17', 3, 6, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (303, 1, '曹婴', NULL, '女', 1, '4', '1', '2025-01-20', 3, 6, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (304, 1, '严畯', NULL, '男', 3, '3', '2', '2021-06-26', 3, 5, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (305, 1, '郭汜', NULL, '男', 4, '4', '2', '2021-07-17', 1, 4, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (306, 1, '丁原', NULL, '男', 4, '4', '2', '2021-10-01', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (307, 1, '傅肜', NULL, '男', 2, '4', '2', '2025-09-25', 3, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (308, 1, '邓芝', NULL, '男', 2, '3', '2', '2021-10-01', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (309, 1, '张翼', NULL, '男', 2, '4', '2', '2021-09-18', 1, 2, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (310, 1, '张琪瑛', NULL, '女', 4, '3', '1', '2026-01-24', 3, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (311, 1, '胡车儿', NULL, '男', 4, '4', '2', '2022-01-23', 1, 1, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (312, 1, '公孙康', NULL, '男', 4, '4', '1', '2021-12-21', 3, 5, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (313, 1, '周群', NULL, '男', 2, '3', '1', '2023-11-25', 3, 2, 4, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (314, 1, '兀突骨', NULL, '男', 4, '15', '1', '2019-12-23', 3, 1, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (315, 1, '马元义', NULL, '男', 4, '4', '2', '2022-06-25', 3, 4, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (316, 1, '谯周', NULL, '男', 2, '3', '1', '2022-10-23', 3, 5, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (317, 1, '阮惠', NULL, '女', 1, '3', '2', '2023-11-14', 3, 5, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (318, 1, '王濬', NULL, '男', 4, '4', '2', '2023-10-18', 3, 3, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (319, 1, '赵统赵广', NULL, '男', 2, '4', '2', '2020-05-01', 1, 2, 3, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (320, 1, '刘晔', NULL, '男', 1, '3', '1', '2019-12-21', 3, 2, 3, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (321, 1, '朱灵', NULL, '男', 1, '4', '2', '2018-05-07', 1, 2, 2, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (322, 1, '李丰', NULL, '男', 2, '3', '2', '2019-03-16', 1, 4, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (323, 1, '诸葛果', NULL, '女', 2, '3', '1', '2019-03-28', 3, 4, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (324, 1, '胡金定', NULL, '女', 2, '2 / 6', '2', '2024-12-16', 1, 5, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (325, 1, '王元姬', NULL, '男', 1, '3', '1', '2024-07-13', 3, 6, 7, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (326, 1, 'SP · 司马昭', NULL, '男', 1, '3', '1', '2022-06-13', 3, 4, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (327, 1, '裴秀', NULL, '男', 4, '3', '1', '2023-05-26', 4, 3, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (328, 1, '彭羕', NULL, '男', 2, '3', '2', '2024-07-08', 1, 2, 7, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (329, 1, '濮阳兴', NULL, '男', 3, '4', '2', '2024-09-07', 1, 2, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (330, 1, '韩遂', NULL, '男', 4, '4 - 1', '2', '2021-02-05', 1, 2, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (331, 1, '吴班', NULL, '男', 2, '4', '2', '2025-12-05', 3, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (332, 1, '胡班', NULL, '男', 1, '4', '2', '2024-03-21', 3, 4, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (333, 1, '霍峻', NULL, '男', 2, '4', '2', '2024-05-26', 3, 4, 6, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (334, 1, '甘夫人', NULL, '女', 2, '3', '2', '2025-01-27', 1, 5, 5, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (335, 1, '清河公主', NULL, '女', 1, '3', '1', '2025-06-16', 4, 2, 3, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (336, 1, '张布', NULL, '男', 3, '4', '2', '2025-07-26', 3, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (337, 1, '乐就', NULL, '男', 4, '4', '2', '2026-02-25', 3, 1, 3, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (338, 1, 'SP · 于禁', NULL, '男', 4, '4', '2', '2026-05-28', 3, 1, 1, 34, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (339, 1, '贾充', NULL, '男', 4, '3', '2', '2026-03-15', 3, 1, 1, 35, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (340, 1, '司马昭', NULL, '男', 1, '3', '1', '2025-02-27', 3, 7, 7, 35, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (341, 1, '神 · 吕蒙', NULL, '男', 5, '3', '2', '2019-02-08', 1, 4, 5, 36, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (342, 1, '神 · 周瑜', NULL, '男', 5, '4', '2', '2019-09-13', 1, 3, 6, 36, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (343, 1, '神 · 诸葛亮', NULL, '男', 5, '3', '2', '2019-12-01', 1, 4, 7, 36, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (344, 1, '神 · 吕布', NULL, '男', 5, '5', '1', '2025-02-28', 1, 2, 6, 36, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (345, 1, '神 · 赵云', NULL, '男', 5, '2', '1', '2024-02-24', 3, 6, 6, 36, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (346, 1, '神 · 陆逊', NULL, '男', 5, '4', '1', '2025-07-12', 3, 4, 3, 36, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (347, 1, '神 · 刘备', NULL, '男', 5, '6', '1', '2025-07-26', 3, 1, 1, 36, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (348, 1, '神 · 甘宁', NULL, '男', 5, '3 - 6', '1', '2021-12-21', 4, 8, 8, 36, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (349, 1, '神 · 张辽', NULL, '男', 5, '4', '1', '2021-09-18', 3, 3, 5, 36, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (350, 1, '神 · 鲁肃', NULL, '男', 5, '3', '1', '2025-12-16', 4, 7, 7, 36, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (351, 1, '孙茹', NULL, '女', 3, '3', '2', '2018-07-24', 1, 3, 3, 37, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (352, 1, '凌操', NULL, '男', 3, '4', '2', '2018-05-27', 3, 2, 2, 37, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (353, 1, '留赞', NULL, '男', 3, '4', '1', '2019-12-21', 3, 7, 7, 37, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (354, 1, '祢衡', NULL, '男', 4, '3', '1', '2021-02-26', 4, 8, 7, 37, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (355, 1, '曹纯', NULL, '男', 1, '4', '1', '2019-11-04', 3, 6, 7, 37, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (356, 1, '马钧', NULL, '男', 1, '3', '1', '2021-07-24', 4, 8, 8, 37, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (357, 1, '司马师', NULL, '男', 1, '4', '1', '2021-03-22', 3, 6, 7, 37, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (358, 1, '南华老仙', NULL, '男', 4, '3', '1', '2022-12-07', 4, 8, 9, 37, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (359, 1, '星 · 张辽', NULL, '男', 4, '4', '2', '2021-10-01', 1, 2, 2, 38, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (360, 1, '星 · 张郃', NULL, '男', 4, '4', '2', '2021-07-11', 1, 2, 2, 38, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (361, 1, '星 · 徐晃', NULL, '男', 4, '4', '2', '2021-01-03', 3, 6, 6, 38, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (362, 1, '星 · 甘宁', NULL, '男', 4, '4', '1', '2021-07-24', 3, 5, 6, 38, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (363, 1, '星 · 周不疑', NULL, '男', 1, '3', '1', '2024-01-29', 3, 6, 7, 38, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (364, 1, '星 · 董卓', NULL, '男', 4, '3 / 4', '1', '2025-04-21', 3, 5, 6, 38, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (365, 1, '友 · 庞统', NULL, '男', 4, '3', '2', '2025-03-10', 3, 1, 2, 39, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (366, 1, '友 · 徐庶', NULL, '男', 4, '3', '2', '2025-12-06', 3, 5, 6, 39, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (367, 1, '刘备', NULL, '男', 2, '4', '3', '2017-11-21', 3, 1, 1, 40, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (368, 1, '关羽', NULL, '男', 2, '4', '3', '2017-11-21', 3, 1, 1, 40, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (369, 1, '黄盖', NULL, '男', 3, '4', '3', '2017-11-22', 3, 1, 1, 40, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (370, 1, '甘宁', NULL, '男', 3, '4', '3', '2017-11-21', 3, 1, 1, 40, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (371, 1, '马超', NULL, '男', 2, '4', '3', '2017-11-21', 3, 1, 1, 40, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (372, 1, '张飞', NULL, '男', 2, '4', '3', '2017-11-21', 3, 1, 1, 40, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (373, 1, '赵云', NULL, '男', 2, '4', '3', '2017-11-21', 3, 1, 1, 40, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (374, 1, '曹操', NULL, '男', 1, '4', '3', '2017-11-21', 3, 1, 1, 40, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (375, 1, '孙权', NULL, '男', 3, '4', '3', '2017-11-21', 3, 1, 1, 40, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (376, 1, '孙尚香', NULL, '女', 3, '3', '3', '2017-11-21', 3, 1, 1, 40, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (377, 1, '许褚', NULL, '男', 1, '4', '3', '2017-11-22', 3, 1, 1, 40, '2026-07-05 22:40:18', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (378, 1, '华佗', NULL, '男', 4, '3', '3', '2017-11-22', 3, 1, 5, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (379, 1, '陆逊', NULL, '男', 3, '3', '3', '2017-11-23', 3, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (380, 1, '貂蝉', NULL, '女', 4, '3', '3', '2017-11-22', 4, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (381, 1, '司马懿', NULL, '男', 4, '3', '3', '2017-11-23', 3, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (382, 1, '大乔', NULL, '女', 3, '3', '3', '2017-11-22', 3, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (383, 1, '夏侯惇', NULL, '男', 1, '4', '3', '2017-11-22', 3, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (384, 1, '黄月英', NULL, '女', 3, '3', '3', '2017-11-21', 3, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (385, 1, '甄姬', NULL, '女', 1, '3', '3', '2017-11-22', 3, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (386, 1, '张辽', NULL, '男', 1, '4', '3', '2017-11-22', 3, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (387, 1, '郭嘉', NULL, '男', 1, '3', '3', '2017-11-23', 3, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (388, 1, '吕布', NULL, '男', 4, '4', '3', '2017-11-22', 3, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (389, 1, '诸葛亮', NULL, '男', 2, '3', '3', '2017-11-22', 3, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (390, 1, '吕蒙', NULL, '男', 3, '4', '3', '2017-11-23', 3, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (391, 1, '周瑜', NULL, '男', 3, '3', '3', '2017-11-22', 3, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (392, 1, '华雄', NULL, '男', 4, '6', '2', '2017-11-25', 3, 1, 1, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (393, 1, '袁术', NULL, '男', 4, '4', '2', '2017-11-27', 3, 1, 2, 40, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (394, 1, '黄忠', NULL, '男', 2, '4', '3', '2017-11-21', 3, 1, 1, 41, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (395, 1, '小乔', NULL, '女', 3, '3', '3', '2017-11-22', 3, 1, 2, 41, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (396, 1, '张角', NULL, '男', 4, '3', '3', '2017-11-24', 3, 1, 1, 41, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (397, 1, '魏延', NULL, '男', 2, '4', '3', '2017-11-22', 3, 1, 1, 41, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (398, 1, '曹仁', NULL, '男', 1, '4', '3', '2017-11-22', 3, 1, 1, 41, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (399, 1, '夏侯渊', NULL, '男', 1, '4', '3', '2017-11-22', 3, 1, 1, 41, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (400, 1, '周泰', NULL, '男', 3, '4', '3', '2017-11-23', 1, 1, 1, 41, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (401, 1, '于吉', NULL, '男', 4, '3', '3', '2017-11-24', 1, 1, 1, 41, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (402, 1, '典韦', NULL, '男', 1, '4', '3', '2018-01-10', 3, 1, 1, 42, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (403, 1, '荀彧', NULL, '男', 1, '3', '3', '2018-05-02', 3, 1, 2, 42, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (404, 1, '庞统', NULL, '男', 2, '3', '3', '2017-11-28', 3, 1, 1, 42, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (405, 1, '卧龙诸葛', NULL, '男', 2, '3', '3', '2018-05-17', 3, 1, 1, 42, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (406, 1, '太史慈', NULL, '男', 3, '4', '3', '2018-05-17', 3, 1, 1, 42, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (407, 1, '庞德', NULL, '男', 4, '3', '3', '2019-08-02', 3, 1, 1, 42, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (408, 1, '颜良文丑', NULL, '男', 4, '4', '3', '2017-11-24', 3, 1, 1, 42, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (409, 1, '袁绍', NULL, '男', 4, '4', '3', '2017-12-12', 4, 1, 7, 42, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (410, 1, '徐晃', NULL, '男', 1, '4', '3', '2018-01-01', 3, 1, 1, 43, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (411, 1, '曹丕', NULL, '男', 1, '3', '3', '2018-05-15', 4, 5, 7, 43, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (412, 1, '孙坚', NULL, '男', 3, '4', '3', '2017-11-26', 3, 1, 1, 43, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (413, 1, '董卓', NULL, '男', 4, '8', '3', '2018-01-01', 3, 1, 1, 43, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (414, 1, '祝融', NULL, '女', 2, '4', '3', '2018-06-19', 1, 1, 1, 43, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (415, 1, '孟获', NULL, '男', 2, '4', '3', '2017-11-25', 1, 1, 1, 43, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (416, 1, '贾诩', NULL, '男', 4, '3', '3', '2018-01-01', 1, 1, 2, 43, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (417, 1, '鲁肃', NULL, '男', 3, '3', '2', '2018-06-05', 3, 3, 5, 43, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (418, 1, '张郃', NULL, '男', 1, '4', '3', '2018-08-21', 1, 1, 1, 44, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (419, 1, '邓艾', NULL, '男', 1, '4', '3', '2018-05-21', 3, 1, 1, 44, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (420, 1, '姜维', NULL, '男', 2, '4', '3', '2018-07-15', 4, 1, 1, 44, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (421, 1, '刘禅', NULL, '男', 2, '3', '3', '2017-11-26', 3, 1, 4, 44, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (422, 1, '孙策', NULL, '男', 3, '4', '3', '2017-11-22', 4, 1, 1, 44, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (423, 1, '张昭张纮', NULL, '男', 3, '3', '3', '2018-05-25', 3, 1, 1, 44, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (424, 1, '左慈', NULL, '男', 4, '3', '1', '2019-02-10', 3, 1, 2, 44, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (425, 1, '蔡文姬', NULL, '女', 4, '3', '2', '2018-10-24', 3, 2, 6, 44, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (426, 1, '严颜', NULL, '男', 2, '4', '2', '2021-02-26', 1, 1, 4, 45, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (427, 1, '王平', NULL, '男', 2, '4', '1', '2020-05-05', 3, 1, 3, 45, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (428, 1, '陆绩', NULL, '男', 3, '3', '2', '2019-09-22', 3, 1, 5, 45, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (429, 1, '孙亮', NULL, '男', 3, '3', '2', '2021-07-01', 1, 1, 3, 45, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (430, 1, '蒯越蒯良', NULL, '男', 1, '3', '2', '2019-10-19', 3, 3, 5, 45, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (431, 1, '许攸', NULL, '男', 4, '3', '1', '2019-10-12', 4, 7, 6, 45, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (432, 1, '卢植', NULL, '男', 4, '3', '2', '2021-07-01', 1, 1, 1, 45, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (433, 1, '王基', NULL, '男', 1, '3', '2', '2019-05-06', 3, 1, 4, 45, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (434, 1, '陈到', NULL, '男', 2, '4', '2', '2020-06-26', 1, 1, 1, 46, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (435, 1, '郝昭', NULL, '男', 1, '4', '1', '2022-04-02', 3, 5, 6, 46, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (436, 1, '仲帝袁术', NULL, '男', 4, '4', '2', '2020-07-15', 1, 1, 1, 46, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (437, 1, '陆抗', NULL, '男', 3, '4', '2', '2021-06-20', 1, 1, 1, 46, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (438, 1, '毌丘俭', NULL, '男', 1, '4', '2', '2021-08-14', 1, 1, 2, 46, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (439, 1, '周妃', NULL, '女', 3, '3', '2', '2020-09-19', 1, 1, 5, 46, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (440, 1, '诸葛瞻', NULL, '男', 2, '3', '1', '2022-12-17', 3, 4, 4, 46, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (441, 1, '张绣', NULL, '男', 4, '4', '2', '2021-04-24', 4, 6, 6, 46, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (442, 1, '纪灵', NULL, '男', 4, '4', '3', '2018-11-12', 3, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (443, 1, '田丰', NULL, '男', 4, '3', '3', '2019-05-27', 1, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (444, 1, '马滕', NULL, '男', 4, '4', '3', '2020-03-12', 1, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (445, 1, '邹氏', NULL, '女', 4, '3', '3', '2022-02-16', 1, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (446, 1, '唐咨', NULL, '男', 6, '4', '2', '2021-10-01', 1, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (447, 1, '糜芳傅士仁', NULL, '男', 7, '4', '2', '2021-07-24', 1, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (448, 1, '张任', NULL, '男', 4, '4', '2', '2021-04-14', 1, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (449, 1, '李傕郭汜', NULL, '男', 4, '4', '2', '2019-12-23', 1, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (450, 1, '董承', NULL, '男', 4, '4', '2', '2025-08-18', 3, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (451, 1, '孟达', NULL, '男', 8, '4', '2', '2021-07-24', 1, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (452, 1, '蒋琬费祎', NULL, '男', 2, '3', '2', '2021-05-10', 1, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (453, 1, '董昭', NULL, '男', 1, '3', '2', '2021-10-01', 1, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (454, 1, '臧霸', NULL, '男', 1, '3', '2', '2019-04-14', 1, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (455, 1, '甘夫人', NULL, '女', 2, '3', '3', '2018-06-17', 3, 0, 0, 47, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (456, 1, '牛金', NULL, '男', 1, '4', '2', '2019-12-22', 1, 0, 0, 48, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);
INSERT INTO `sgs_military_general` VALUES (457, 1, '何进', NULL, '男', 4, '4', '2', '2019-12-22', 1, 0, 0, 48, '2026-07-05 22:40:19', '2026-07-05 22:40:46', 0);

-- ----------------------------
-- Table structure for sgs_quality
-- ----------------------------
DROP TABLE IF EXISTS `sgs_quality`;
CREATE TABLE `sgs_quality`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型名',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '逻辑删除，0未删除，1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '三国杀品质表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sgs_quality
-- ----------------------------
INSERT INTO `sgs_quality` VALUES (1, '史诗', NULL, NULL, NULL);
INSERT INTO `sgs_quality` VALUES (2, '精品', NULL, NULL, NULL);
INSERT INTO `sgs_quality` VALUES (3, '普通', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像路径',
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '默认' COMMENT '昵称',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个性签名',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '男' COMMENT '性别',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `parent_id` int NULL DEFAULT NULL COMMENT '上下级',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '逻辑删除，0未删除，1已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_email`(`email` ASC) USING BTREE,
  CONSTRAINT `user_chk_1` CHECK (`gender` in (_utf8mb4'男',_utf8mb4'女'))
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '18837727538@163.com', '$2a$10$bdgxSx3UoHPacXpKldnSEeThoC2mrXxI48uY.HWTEtCzQEMMZKLue', NULL, '默认', NULL, '男', NULL, 1, '2026-06-30 18:46:13', '2026-07-01 17:48:40', 0);
INSERT INTO `user` VALUES (2, '2668529536@qq.com', '$2a$10$bdgxSx3UoHPacXpKldnSEeThoC2mrXxI48uY.HWTEtCzQEMMZKLue', NULL, '默认', NULL, '男', NULL, NULL, '2026-07-03 17:34:41', '2026-07-05 15:42:44', 0);

SET FOREIGN_KEY_CHECKS = 1;
