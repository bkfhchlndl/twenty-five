/*
 Navicat Premium Dump SQL

 Source Server         : 我的数据库
 Source Server Type    : MySQL
 Source Server Version : 80044 (8.0.44)
 Source Host           : 127.0.0.1:3306
 Source Schema         : twenty_five

 Target Server Type    : MySQL
 Target Server Version : 80044 (8.0.44)
 File Encoding         : 65001

 Date: 02/07/2026 18:10:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `statement_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `is_top` int NULL DEFAULT NULL COMMENT '是否置顶，0未置顶，1置顶',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint NULL DEFAULT 0 COMMENT '逻辑删除，0未删除，1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '语录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quotation
-- ----------------------------

-- ----------------------------
-- Table structure for sgs_bag
-- ----------------------------
DROP TABLE IF EXISTS `sgs_bag`;
CREATE TABLE `sgs_bag`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '三国杀包名表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sgs_bag
-- ----------------------------
INSERT INTO `sgs_bag` VALUES (3, '兵势 · 奇');
INSERT INTO `sgs_bag` VALUES (4, '兵势 · 正');
INSERT INTO `sgs_bag` VALUES (5, '兵势 · 势');
INSERT INTO `sgs_bag` VALUES (6, '兵势 · 节');
INSERT INTO `sgs_bag` VALUES (7, '谋攻 · 知');
INSERT INTO `sgs_bag` VALUES (8, '谋攻 · 识');
INSERT INTO `sgs_bag` VALUES (9, '谋攻 · 同');
INSERT INTO `sgs_bag` VALUES (10, '谋攻 · 虞');
INSERT INTO `sgs_bag` VALUES (11, '谋攻 · 能');
INSERT INTO `sgs_bag` VALUES (12, '始计 · 智');
INSERT INTO `sgs_bag` VALUES (13, '始计 · 信');
INSERT INTO `sgs_bag` VALUES (14, '始计 · 仁');
INSERT INTO `sgs_bag` VALUES (15, '始计 · 勇');
INSERT INTO `sgs_bag` VALUES (16, '始计 · 严');
INSERT INTO `sgs_bag` VALUES (17, '界限突破 · 标');
INSERT INTO `sgs_bag` VALUES (18, '界限突破 · 风');
INSERT INTO `sgs_bag` VALUES (19, '界限突破 · 火');
INSERT INTO `sgs_bag` VALUES (20, '界限突破 · 林');
INSERT INTO `sgs_bag` VALUES (21, '界限突破 · 山');
INSERT INTO `sgs_bag` VALUES (22, '一将成名 · 1');
INSERT INTO `sgs_bag` VALUES (23, '一将成名 · 2');
INSERT INTO `sgs_bag` VALUES (24, '一将成名 · 3');
INSERT INTO `sgs_bag` VALUES (25, '一将成名 · 4');
INSERT INTO `sgs_bag` VALUES (26, '一将成名 · 5');
INSERT INTO `sgs_bag` VALUES (27, '界 · 一将成名 · 1');
INSERT INTO `sgs_bag` VALUES (28, '界 · 一将成名 · 2');
INSERT INTO `sgs_bag` VALUES (29, '界 · 一将成名 · 3');
INSERT INTO `sgs_bag` VALUES (30, '界 · 一将成名 · 4');
INSERT INTO `sgs_bag` VALUES (31, '界 · 一将成名 · 5');
INSERT INTO `sgs_bag` VALUES (32, '乱世英杰 · 6');
INSERT INTO `sgs_bag` VALUES (33, '乱世英杰 · 7');
INSERT INTO `sgs_bag` VALUES (34, 'SP');
INSERT INTO `sgs_bag` VALUES (35, '龙血玄黄');
INSERT INTO `sgs_bag` VALUES (36, '神将');
INSERT INTO `sgs_bag` VALUES (37, '稀有专属 · 坤');
INSERT INTO `sgs_bag` VALUES (38, '稀有专属 · 星');
INSERT INTO `sgs_bag` VALUES (39, '稀有专属 · 老友季');
INSERT INTO `sgs_bag` VALUES (40, '神话再临 · 标');
INSERT INTO `sgs_bag` VALUES (41, '神话再临 · 风');
INSERT INTO `sgs_bag` VALUES (42, '神将再临 · 火');
INSERT INTO `sgs_bag` VALUES (43, '神话再临 · 林');
INSERT INTO `sgs_bag` VALUES (44, '神话再临 · 山');
INSERT INTO `sgs_bag` VALUES (45, '神话再临 · 阴');
INSERT INTO `sgs_bag` VALUES (46, '神话再临 · 雷');
INSERT INTO `sgs_bag` VALUES (47, '国战');
INSERT INTO `sgs_bag` VALUES (48, '1 v 1');

-- ----------------------------
-- Table structure for sgs_camp
-- ----------------------------
DROP TABLE IF EXISTS `sgs_camp`;
CREATE TABLE `sgs_camp`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '阵营名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '三国杀阵营表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sgs_camp
-- ----------------------------
INSERT INTO `sgs_camp` VALUES (1, '魏');
INSERT INTO `sgs_camp` VALUES (2, '蜀');
INSERT INTO `sgs_camp` VALUES (3, '吴');
INSERT INTO `sgs_camp` VALUES (4, '群');
INSERT INTO `sgs_camp` VALUES (5, '神');
INSERT INTO `sgs_camp` VALUES (6, '魏 / 吴');
INSERT INTO `sgs_camp` VALUES (7, '蜀 / 吴');
INSERT INTO `sgs_camp` VALUES (8, '魏 / 蜀');

-- ----------------------------
-- Table structure for sgs_military_general
-- ----------------------------
DROP TABLE IF EXISTS `sgs_military_general`;
CREATE TABLE `sgs_military_general`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `picture` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片路径',
  `gender` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `camp_id` int NULL DEFAULT NULL COMMENT '阵营',
  `hp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '血量',
  `type_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '武将类型',
  `get_time` date NULL DEFAULT NULL COMMENT '获得时间',
  `star_rating` int NULL DEFAULT NULL COMMENT '星级',
  `ftl_rating` int NULL DEFAULT NULL COMMENT '斗地主评分',
  `mc_rating` int NULL DEFAULT NULL COMMENT '军争评分',
  `bag_id` int NULL DEFAULT NULL COMMENT '包',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 458 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '三国武将信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sgs_military_general
-- ----------------------------
INSERT INTO `sgs_military_general` VALUES (4, '势 · 于吉', NULL, '男', 4, '3', '1', '2025-07-30', 4, 7, 7, 3);
INSERT INTO `sgs_military_general` VALUES (5, '势 · 夏侯尚', NULL, '男', 1, '4', '2', '2025-12-09', 3, 5, 4, 3);
INSERT INTO `sgs_military_general` VALUES (6, '势 · 陈到', NULL, '男', 2, '4', '2', '2025-10-31', 3, 5, 3, 4);
INSERT INTO `sgs_military_general` VALUES (7, '势 · 田丰', NULL, '男', 4, '3', '2', '2025-11-17', 3, 5, 4, 4);
INSERT INTO `sgs_military_general` VALUES (8, '势 · 国渊', NULL, '男', 1, '3', '1', '2025-10-09', 4, 7, 7, 4);
INSERT INTO `sgs_military_general` VALUES (9, '势 · 魏延', NULL, '男', 2, '4', '1', '2025-07-30', 4, 8, 7, 5);
INSERT INTO `sgs_military_general` VALUES (10, '势 · 陈祗', NULL, '男', 2, '3', '2', '2025-12-09', 3, 1, 1, 5);
INSERT INTO `sgs_military_general` VALUES (11, '势 · 辛宪英', NULL, '女', 1, '3', '1', '2025-12-31', 4, 7, 7, 6);
INSERT INTO `sgs_military_general` VALUES (12, '势 · 陆郁生', NULL, '女', 3, '3', '1', '2025-10-09', 4, 6, 7, 6);
INSERT INTO `sgs_military_general` VALUES (13, '谋 · 周瑜', NULL, '男', 3, '3', '2', '2025-02-27', 3, 6, 5, 7);
INSERT INTO `sgs_military_general` VALUES (14, '谋 · 诸葛亮', NULL, '男', 2, '3', '1', '2024-11-01', 3, 9, 10, 7);
INSERT INTO `sgs_military_general` VALUES (15, '谋 · 徐晃', NULL, '男', 1, '4', '2', '2022-12-10', 3, 6, 4, 8);
INSERT INTO `sgs_military_general` VALUES (16, '谋 · 法正', NULL, '男', 2, '3', '2', '2026-01-01', 3, 2, 4, 8);
INSERT INTO `sgs_military_general` VALUES (17, '谋 · 庞统', NULL, '男', 2, '3', '2', '2025-02-27', 3, 1, 5, 8);
INSERT INTO `sgs_military_general` VALUES (18, '谋 · 刘赪', NULL, '女', 4, '3', '2', '2022-08-18', 3, 6, 5, 9);
INSERT INTO `sgs_military_general` VALUES (19, '谋 · 张飞', NULL, '男', 2, '4', '2', '2023-05-19', 3, 6, 8, 9);
INSERT INTO `sgs_military_general` VALUES (20, '谋 · 赵云', NULL, '男', 2, '4', '1', '2024-04-04', 3, 6, 5, 9);
INSERT INTO `sgs_military_general` VALUES (21, '谋 · 夏侯氏', NULL, '女', 2, '3', '1', '2026-04-03', 3, 5, 5, 9);
INSERT INTO `sgs_military_general` VALUES (22, '谋 · 小乔', NULL, '女', 3, '3', '2', '2024-10-05', 3, 5, 6, 9);
INSERT INTO `sgs_military_general` VALUES (23, '谋 · 夏侯渊', NULL, '男', 1, '4', '2', '2025-08-27', 3, 5, 6, 9);
INSERT INTO `sgs_military_general` VALUES (24, '谋 · 吕蒙', NULL, '男', 3, '4', '2', '2022-09-28', 3, 5, 6, 10);
INSERT INTO `sgs_military_general` VALUES (25, '谋 · 于禁', NULL, '男', 1, '4', '2', '2025-01-16', 1, 5, 5, 10);
INSERT INTO `sgs_military_general` VALUES (26, '谋 · 卢植', NULL, '男', 4, '3', '2', '2024-02-22', 3, 7, 7, 10);
INSERT INTO `sgs_military_general` VALUES (27, '谋 · 高顺', NULL, '男', 4, '4', '2', '2024-09-09', 1, 6, 6, 10);
INSERT INTO `sgs_military_general` VALUES (28, '谋 · 华雄', NULL, '男', 4, '3 / 4 - 1', '2', '2022-11-06', 1, 5, 5, 11);
INSERT INTO `sgs_military_general` VALUES (29, '谋 · 袁绍', NULL, '男', 4, '4', '2', '2023-07-19', 1, 2, 5, 11);
INSERT INTO `sgs_military_general` VALUES (30, '谋 · 关羽', NULL, '男', 2, '4', '1', '2025-07-30', 3, 6, 6, 11);
INSERT INTO `sgs_military_general` VALUES (31, '王粲', NULL, '男', 1, '3', '1', '2022-11-11', 3, 6, 7, 12);
INSERT INTO `sgs_military_general` VALUES (32, '陈震', NULL, '男', 2, '3', '2', '2021-06-26', 1, 6, 6, 12);
INSERT INTO `sgs_military_general` VALUES (33, '荀谌', NULL, '男', 4, '3', '2', '2021-06-26', 1, 3, 4, 12);
INSERT INTO `sgs_military_general` VALUES (34, '费祎', NULL, '男', 2, '3', '2', '2021-07-10', 3, 6, 7, 12);
INSERT INTO `sgs_military_general` VALUES (35, '骆统', NULL, '男', 3, '4', '1', '2021-07-11', 3, 6, 6, 12);
INSERT INTO `sgs_military_general` VALUES (36, '孙邵', NULL, '男', 3, '3', '2', '2021-09-18', 1, 3, 5, 12);
INSERT INTO `sgs_military_general` VALUES (37, '卞夫人', NULL, '男', 1, '3', '2', '2020-12-15', 1, 6, 8, 12);
INSERT INTO `sgs_military_general` VALUES (38, '周处', NULL, '男', 3, '4', '1', '2024-04-25', 3, 7, 7, 13);
INSERT INTO `sgs_military_general` VALUES (39, '吴景', NULL, '男', 3, '4', '1', '2023-09-03', 3, 6, 7, 13);
INSERT INTO `sgs_military_general` VALUES (40, '王甫赵累', NULL, '男', 2, '4', '2', '2024-02-24', 1, 3, 5, 13);
INSERT INTO `sgs_military_general` VALUES (41, '羊祜', NULL, '男', 4, '4', '2', '2024-11-01', 1, 6, 6, 13);
INSERT INTO `sgs_military_general` VALUES (42, '糜夫人', NULL, '女', 2, '3', '2', '2021-06-26', 1, 5, 5, 13);
INSERT INTO `sgs_military_general` VALUES (43, '王凌', NULL, '男', 1, '4', '1', '2024-12-28', 3, 6, 6, 13);
INSERT INTO `sgs_military_general` VALUES (44, '孔融', NULL, '男', 4, '3', '2', '2018-07-19', 3, 5, 6, 13);
INSERT INTO `sgs_military_general` VALUES (45, '许靖', NULL, '男', 2, '3', '2', '2021-10-01', 1, 1, 1, 14);
INSERT INTO `sgs_military_general` VALUES (46, '向宠', NULL, '男', 2, '4', '2', '2022-01-01', 1, 2, 3, 14);
INSERT INTO `sgs_military_general` VALUES (47, '华歆', NULL, '男', 1, '3', '2', '2022-07-12', 1, 1, 3, 14);
INSERT INTO `sgs_military_general` VALUES (48, '张仲景', NULL, '男', 4, '3', '1', '2022-02-03', 3, 5, 7, 14);
INSERT INTO `sgs_military_general` VALUES (49, '张温', NULL, '男', 3, '3', '2', '2023-01-23', 1, 5, 7, 14);
INSERT INTO `sgs_military_general` VALUES (50, '蔡贞姬', NULL, '女', 1, '3', '2', '2025-02-27', 1, 6, 6, 14);
INSERT INTO `sgs_military_general` VALUES (51, '孙翊', NULL, '男', 3, '4', '2', '2022-01-22', 1, 5, 4, 15);
INSERT INTO `sgs_military_general` VALUES (52, '高览', NULL, '男', 4, '4', '2', '2022-02-03', 1, 6, 6, 15);
INSERT INTO `sgs_military_general` VALUES (53, '宗预', NULL, '男', 2, '3', '2', '2025-04-21', 3, 1, 1, 15);
INSERT INTO `sgs_military_general` VALUES (54, '花鬘', NULL, '女', 2, '4', '1', '2023-03-24', 3, 1, 7, 15);
INSERT INTO `sgs_military_general` VALUES (55, '陈武董袭', NULL, '男', 3, '4', '2', '2018-07-07', 1, 3, 4, 15);
INSERT INTO `sgs_military_general` VALUES (56, '袁涣', NULL, '男', 1, '3', '2', '2024-09-22', 1, 6, 6, 15);
INSERT INTO `sgs_military_general` VALUES (57, '蒋琬', NULL, '男', 2, '3', '2', '2022-03-20', 1, 8, 8, 16);
INSERT INTO `sgs_military_general` VALUES (58, '蒋钦', NULL, '男', 3, '4', '2', '2021-06-26', 1, 6, 6, 16);
INSERT INTO `sgs_military_general` VALUES (59, '崔琰', NULL, '男', 1, '3', '2', '2025-12-07', 3, 1, 1, 16);
INSERT INTO `sgs_military_general` VALUES (60, '吕范', NULL, '男', 3, '3', '2', '2020-05-02', 1, 5, 4, 16);
INSERT INTO `sgs_military_general` VALUES (61, '刘巴', NULL, '男', 2, '3', '2', '2023-03-10', 1, 3, 5, 16);
INSERT INTO `sgs_military_general` VALUES (62, '界 · 刘备', NULL, '男', 2, '4', '2', '2018-05-22', 3, 5, 6, 17);
INSERT INTO `sgs_military_general` VALUES (63, '界 · 关羽', NULL, '男', 2, '4', '2', '2018-05-07', 3, 6, 5, 17);
INSERT INTO `sgs_military_general` VALUES (64, '界 · 张飞', NULL, '男', 2, '4', '2', '2018-04-26', 1, 3, 2, 17);
INSERT INTO `sgs_military_general` VALUES (65, '界 · 赵云', NULL, '男', 2, '4', '2', '2018-05-09', 1, 1, 2, 17);
INSERT INTO `sgs_military_general` VALUES (66, '界 · 马超', NULL, '男', 2, '4', '2', '2018-05-31', 3, 3, 3, 17);
INSERT INTO `sgs_military_general` VALUES (67, '界 · 甘宁', NULL, '男', 3, '4', '2', '2018-06-05', 1, 5, 6, 17);
INSERT INTO `sgs_military_general` VALUES (68, '界 · 吕蒙', NULL, '男', 3, '4', '2', '2018-05-13', 3, 1, 5, 17);
INSERT INTO `sgs_military_general` VALUES (69, '界 · 黄盖', NULL, '男', 3, '4', '2', '2019-02-01', 3, 6, 6, 17);
INSERT INTO `sgs_military_general` VALUES (70, '界 · 周瑜', NULL, '男', 3, '3', '2', '2018-05-27', 1, 4, 4, 17);
INSERT INTO `sgs_military_general` VALUES (71, '界 · 大乔', NULL, '女', 3, '3', '2', '2018-06-11', 1, 5, 6, 17);
INSERT INTO `sgs_military_general` VALUES (72, '界 · 陆逊', NULL, '男', 3, '3', '2', '2019-02-22', 1, 2, 3, 17);
INSERT INTO `sgs_military_general` VALUES (73, '界 · 曹操', NULL, '男', 1, '4', '2', '2018-10-17', 1, 1, 3, 17);
INSERT INTO `sgs_military_general` VALUES (74, '界 · 司马懿', NULL, '男', 1, '3', '2', '2019-01-31', 3, 1, 5, 17);
INSERT INTO `sgs_military_general` VALUES (75, '界 · 夏侯惇', NULL, '男', 1, '4', '2', '2018-05-18', 3, 1, 5, 17);
INSERT INTO `sgs_military_general` VALUES (76, '界 · 张辽', NULL, '男', 1, '4', '2', '2018-07-16', 3, 2, 3, 17);
INSERT INTO `sgs_military_general` VALUES (77, '界 · 许褚', NULL, '男', 1, '4', '2', '2018-08-26', 1, 1, 2, 17);
INSERT INTO `sgs_military_general` VALUES (78, '界 · 郭嘉', NULL, '男', 1, '3', '2', '2019-11-04', 1, 2, 6, 17);
INSERT INTO `sgs_military_general` VALUES (79, '界 · 华佗', NULL, '男', 4, '3', '2', '2018-11-12', 3, 6, 6, 17);
INSERT INTO `sgs_military_general` VALUES (80, '界 · 吕布', NULL, '男', 4, '5', '2', '2019-05-25', 3, 6, 6, 17);
INSERT INTO `sgs_military_general` VALUES (81, '界 · 华雄', NULL, '男', 4, '6', '2', '2018-07-24', 1, 1, 2, 17);
INSERT INTO `sgs_military_general` VALUES (82, '界 · 袁术', NULL, '男', 4, '4', '2', '2018-06-25', 1, 1, 1, 17);
INSERT INTO `sgs_military_general` VALUES (83, '界 · 诸葛亮', NULL, '男', 2, '3', '2', '2019-01-22', 1, 1, 1, 17);
INSERT INTO `sgs_military_general` VALUES (84, '界 · 孙权', NULL, '男', 3, '4', '2', '2019-03-11', 5, 7, 6, 17);
INSERT INTO `sgs_military_general` VALUES (85, '界 · 貂蝉', NULL, '女', 4, '3', '2', '2019-11-04', 1, 1, 2, 17);
INSERT INTO `sgs_military_general` VALUES (86, '界 · 黄月英', NULL, '女', 2, '3', '2', '2019-11-04', 1, 2, 5, 17);
INSERT INTO `sgs_military_general` VALUES (87, '界 · 甄姬', NULL, '女', 1, '3', '2', '2019-10-19', 1, 2, 5, 17);
INSERT INTO `sgs_military_general` VALUES (88, '界 · 孙尚香', NULL, '女', 3, '3', '2', '2019-06-24', 3, 6, 6, 17);
INSERT INTO `sgs_military_general` VALUES (89, '界 · 伊籍', NULL, '男', 2, '3', '2', '2019-10-20', 1, 5, 6, 17);
INSERT INTO `sgs_military_general` VALUES (90, '界 · 黄忠', NULL, '男', 2, '4', '1', '2023-06-17', 3, 5, 5, 18);
INSERT INTO `sgs_military_general` VALUES (91, '界 · 魏延', NULL, '男', 2, '4', '2', '2018-09-15', 3, 3, 5, 18);
INSERT INTO `sgs_military_general` VALUES (92, '界 · 夏侯渊', NULL, '男', 1, '4', '2', '2021-10-01', 1, 2, 4, 18);
INSERT INTO `sgs_military_general` VALUES (93, '界 · 曹仁', NULL, '男', 1, '4', '2', '2018-12-10', 3, 3, 6, 18);
INSERT INTO `sgs_military_general` VALUES (94, '界 · 小乔', NULL, '女', 3, '3', '2', '2018-08-20', 3, 2, 5, 18);
INSERT INTO `sgs_military_general` VALUES (95, '界 · 周泰', NULL, '男', 3, '4', '2', '2019-10-21', 3, 1, 5, 18);
INSERT INTO `sgs_military_general` VALUES (96, '界 · 张角', NULL, '男', 4, '3', '2', '2017-11-27', 1, 1, 4, 18);
INSERT INTO `sgs_military_general` VALUES (97, '界 · 于吉', NULL, '男', 4, '3', '2', '2020-05-13', 1, 3, 4, 18);
INSERT INTO `sgs_military_general` VALUES (98, '界 · 卧龙诸葛', NULL, '男', 2, '3', '2', '2021-10-01', 1, 1, 2, 19);
INSERT INTO `sgs_military_general` VALUES (99, '界 · 典韦', NULL, '男', 1, '4', '2', '2021-10-01', 1, 2, 2, 19);
INSERT INTO `sgs_military_general` VALUES (100, '界 · 荀彧', NULL, '男', 1, '3', '2', '2020-06-01', 3, 6, 6, 19);
INSERT INTO `sgs_military_general` VALUES (101, '界 · 庞德', NULL, '男', 4, '4', '2', '2019-08-02', 1, 5, 3, 19);
INSERT INTO `sgs_military_general` VALUES (102, '界 · 庞统', NULL, '男', 2, '3', '2', '2021-02-26', 1, 1, 3, 19);
INSERT INTO `sgs_military_general` VALUES (103, '界 · 颜良文丑', NULL, '男', 4, '4', '2', '2020-07-09', 1, 2, 4, 19);
INSERT INTO `sgs_military_general` VALUES (104, '界 · 袁绍', NULL, '男', 4, '4', '2', '2019-11-09', 1, 1, 2, 19);
INSERT INTO `sgs_military_general` VALUES (105, '界 · 徐晃', NULL, '男', 1, '4', '2', '2019-11-17', 1, 4, 5, 20);
INSERT INTO `sgs_military_general` VALUES (106, '界 · 孟获', NULL, '男', 2, '4', '2', '2019-12-23', 1, 4, 4, 20);
INSERT INTO `sgs_military_general` VALUES (107, '界 · 祝融', NULL, '女', 2, '4', '2', '2020-07-09', 1, 4, 5, 20);
INSERT INTO `sgs_military_general` VALUES (108, '界 · 曹丕', NULL, '男', 1, '3', '2', '2021-10-01', 3, 4, 6, 20);
INSERT INTO `sgs_military_general` VALUES (109, '界 · 孙坚', NULL, '男', 3, '4', '2', '2021-10-01', 3, 1, 1, 20);
INSERT INTO `sgs_military_general` VALUES (110, '界 · 董卓', NULL, '男', 4, '8', '2', '2020-01-17', 1, 1, 3, 20);
INSERT INTO `sgs_military_general` VALUES (111, '界 · 邓艾', NULL, '男', 1, '4', '2', '2020-03-07', 1, 1, 2, 21);
INSERT INTO `sgs_military_general` VALUES (112, '界 · 左慈', NULL, '男', 4, '3', '1', '2021-06-26', 4, 6, 7, 21);
INSERT INTO `sgs_military_general` VALUES (113, '界 · 姜维', NULL, '男', 2, '4', '2', '2020-01-25', 1, 1, 1, 21);
INSERT INTO `sgs_military_general` VALUES (114, '界 · 孙策', NULL, '男', 3, '4', '2', '2020-04-01', 1, 1, 3, 21);
INSERT INTO `sgs_military_general` VALUES (115, '界 · 蔡文姬', NULL, '女', 4, '3', '2', '2020-03-07', 1, 6, 6, 21);
INSERT INTO `sgs_military_general` VALUES (116, '界 · 张昭张纮', NULL, '男', 3, '3', '2', '2020-03-20', 1, 1, 5, 21);
INSERT INTO `sgs_military_general` VALUES (117, '界 · 刘禅', NULL, '男', 2, '3', '2', '2020-08-01', 1, 5, 6, 21);
INSERT INTO `sgs_military_general` VALUES (118, '曹植', NULL, '男', 1, '3', '3', '2019-10-06', 3, 1, 1, 22);
INSERT INTO `sgs_military_general` VALUES (119, '高顺', NULL, '男', 4, '4', '3', '2018-07-21', 3, 1, 1, 22);
INSERT INTO `sgs_military_general` VALUES (120, '陈宫', NULL, '男', 4, '3', '3', '2018-11-12', 3, 1, 1, 22);
INSERT INTO `sgs_military_general` VALUES (121, '法正', NULL, '男', 2, '3', '3', '2019-10-06', 3, 1, 1, 22);
INSERT INTO `sgs_military_general` VALUES (122, '凌统', NULL, '男', 3, '4', '3', '2018-11-12', 3, 1, 1, 22);
INSERT INTO `sgs_military_general` VALUES (123, '马谡', NULL, '男', 2, '3', '3', '2018-05-04', 3, 1, 1, 22);
INSERT INTO `sgs_military_general` VALUES (124, '吴国太', NULL, '女', 3, '3', '3', '2018-05-02', 3, 1, 1, 22);
INSERT INTO `sgs_military_general` VALUES (125, '徐盛', NULL, '男', 3, '4', '3', '2018-10-31', 3, 1, 1, 22);
INSERT INTO `sgs_military_general` VALUES (126, '徐庶', NULL, '男', 2, '3', '3', '2019-10-06', 3, 1, 1, 22);
INSERT INTO `sgs_military_general` VALUES (127, '于禁', NULL, '男', 1, '4', '3', '2018-01-01', 3, 1, 1, 22);
INSERT INTO `sgs_military_general` VALUES (128, '张春华', NULL, '女', 1, '3', '2', '2018-05-18', 4, 1, 1, 22);
INSERT INTO `sgs_military_general` VALUES (129, '曹彰', NULL, '男', 1, '4', '3', '2019-03-28', 3, 1, 1, 23);
INSERT INTO `sgs_military_general` VALUES (130, '王异', NULL, '女', 1, '3', '3', '2018-05-28', 3, 2, 2, 23);
INSERT INTO `sgs_military_general` VALUES (131, '荀攸', NULL, '男', 1, '3', '3', '2018-06-13', 3, 2, 3, 23);
INSERT INTO `sgs_military_general` VALUES (132, '关兴张苞', NULL, '男', 2, '4', '2', '2018-09-30', 4, 2, 4, 23);
INSERT INTO `sgs_military_general` VALUES (133, '廖化', NULL, '男', 2, '4', '2', '2018-05-27', 1, 1, 1, 23);
INSERT INTO `sgs_military_general` VALUES (134, '马岱', NULL, '男', 2, '4', '3', '2019-03-18', 1, 1, 2, 23);
INSERT INTO `sgs_military_general` VALUES (135, '步练师', NULL, '女', 3, '3', '3', '2018-07-06', 3, 1, 2, 23);
INSERT INTO `sgs_military_general` VALUES (136, '程普', NULL, '男', 3, '4', '2', '2019-01-01', 3, 1, 1, 23);
INSERT INTO `sgs_military_general` VALUES (137, '韩当', NULL, '男', 3, '4', '2', '2019-01-10', 3, 1, 2, 23);
INSERT INTO `sgs_military_general` VALUES (138, '刘表', NULL, '男', 4, '3', '3', '2018-05-15', 1, 1, 1, 23);
INSERT INTO `sgs_military_general` VALUES (139, '钟会', NULL, '男', 1, '4', '2', '2019-01-10', 3, 1, 1, 23);
INSERT INTO `sgs_military_general` VALUES (140, '公孙瓒', NULL, '男', 4, '4', '2', '2018-06-05', 3, 1, 1, 23);
INSERT INTO `sgs_military_general` VALUES (141, '曹冲', NULL, '男', 1, '3', '2', '2018-06-05', 1, 1, 2, 24);
INSERT INTO `sgs_military_general` VALUES (142, '郭淮', NULL, '男', 1, '4', '2', '2018-05-14', 1, 1, 1, 24);
INSERT INTO `sgs_military_general` VALUES (143, '满宠', NULL, '男', 1, '3', '2', '2019-01-25', 3, 1, 5, 24);
INSERT INTO `sgs_military_general` VALUES (144, '关平', NULL, '男', 2, '4', '2', '2018-11-12', 1, 1, 6, 24);
INSERT INTO `sgs_military_general` VALUES (145, '简雍', NULL, '男', 2, '3', '2', '2019-06-09', 3, 1, 1, 24);
INSERT INTO `sgs_military_general` VALUES (146, '刘封', NULL, '男', 2, '4', '2', '2018-05-02', 3, 1, 4, 24);
INSERT INTO `sgs_military_general` VALUES (147, '潘璋马忠', NULL, '男', 3, '4', '2', '2018-07-24', 3, 1, 1, 24);
INSERT INTO `sgs_military_general` VALUES (148, '虞翻', NULL, '男', 3, '3', '2', '2018-05-12', 1, 1, 1, 24);
INSERT INTO `sgs_military_general` VALUES (149, '朱然', NULL, '男', 3, '4', '2', '2018-10-17', 1, 1, 3, 24);
INSERT INTO `sgs_military_general` VALUES (150, '伏皇后', NULL, '女', 4, '3', '2', '2018-05-14', 3, 1, 3, 24);
INSERT INTO `sgs_military_general` VALUES (151, '李儒', NULL, '男', 4, '3', '2', '2018-05-17', 4, 1, 5, 24);
INSERT INTO `sgs_military_general` VALUES (152, '曹真', NULL, '男', 1, '4', '2', '2018-07-24', 1, 1, 2, 25);
INSERT INTO `sgs_military_general` VALUES (153, '韩浩史涣', NULL, '男', 1, '4', '2', '2018-07-01', 1, 1, 3, 25);
INSERT INTO `sgs_military_general` VALUES (154, '陈群', NULL, '男', 1, '3', '2', '2019-03-06', 1, 1, 2, 25);
INSERT INTO `sgs_military_general` VALUES (155, '吴懿', NULL, '男', 2, '4', '2', '2018-09-30', 1, 1, 1, 25);
INSERT INTO `sgs_military_general` VALUES (156, '周仓', NULL, '男', 2, '4', '2', '2018-11-12', 1, 1, 1, 25);
INSERT INTO `sgs_military_general` VALUES (157, '张松', NULL, '男', 2, '4', '2', '2018-06-14', 3, 4, 6, 25);
INSERT INTO `sgs_military_general` VALUES (158, '孙鲁班', NULL, '女', 3, '3', '2', '2018-06-05', 1, 1, 1, 25);
INSERT INTO `sgs_military_general` VALUES (159, '朱桓', NULL, '男', 3, '4', '2', '2018-06-30', 3, 4, 5, 25);
INSERT INTO `sgs_military_general` VALUES (160, '顾雍', NULL, '男', 3, '3', '2', '2018-11-12', 1, 1, 2, 25);
INSERT INTO `sgs_military_general` VALUES (161, '沮授', NULL, '男', 4, '3', '1', '2019-12-23', 3, 3, 3, 25);
INSERT INTO `sgs_military_general` VALUES (162, '蔡夫人', NULL, '女', 4, '3', '2', '2018-11-26', 4, 1, 2, 25);
INSERT INTO `sgs_military_general` VALUES (163, '曹叡', NULL, '男', 1, '3', '2', '2019-04-11', 3, 4, 6, 26);
INSERT INTO `sgs_military_general` VALUES (164, '曹休', NULL, '男', 1, '4', '2', '2018-10-17', 1, 1, 1, 26);
INSERT INTO `sgs_military_general` VALUES (165, '钟繇', NULL, '男', 1, '3', '2', '2018-11-12', 3, 3, 4, 26);
INSERT INTO `sgs_military_general` VALUES (166, '刘谌', NULL, '男', 2, '4', '2', '2019-02-01', 1, 2, 3, 26);
INSERT INTO `sgs_military_general` VALUES (167, '夏侯氏', NULL, '女', 2, '3', '2', '2019-12-23', 1, 1, 3, 26);
INSERT INTO `sgs_military_general` VALUES (168, '张嶷', NULL, '男', 2, '4', '2', '2019-12-23', 1, 1, 1, 26);
INSERT INTO `sgs_military_general` VALUES (169, '孙休', NULL, '男', 3, '3', '2', '2019-12-23', 1, 1, 1, 26);
INSERT INTO `sgs_military_general` VALUES (170, '朱治', NULL, '男', 3, '4', '2', '2019-02-01', 1, 1, 2, 26);
INSERT INTO `sgs_military_general` VALUES (171, '全琮', NULL, '男', 3, '4', '2', '2018-08-21', 1, 1, 1, 26);
INSERT INTO `sgs_military_general` VALUES (172, '公孙渊', NULL, '男', 4, '4', '2', '2019-01-19', 1, 2, 4, 26);
INSERT INTO `sgs_military_general` VALUES (173, '郭图逄纪', NULL, '男', 4, '3', '2', '2019-12-23', 3, 1, 3, 26);
INSERT INTO `sgs_military_general` VALUES (174, '界 · 徐盛', NULL, '男', 3, '4', '1', '2021-07-24', 3, 8, 7, 27);
INSERT INTO `sgs_military_general` VALUES (175, '界 · 吴国太', NULL, '女', 3, '3', '2', '2020-05-01', 1, 2, 6, 27);
INSERT INTO `sgs_military_general` VALUES (176, '界 · 高顺', NULL, '男', 4, '4', '2', '2021-10-01', 1, 1, 1, 27);
INSERT INTO `sgs_military_general` VALUES (177, '界 · 于禁', NULL, '男', 1, '4', '1', '2021-02-26', 3, 6, 6, 27);
INSERT INTO `sgs_military_general` VALUES (178, '界 · 法正', NULL, '男', 3, '3', '2', '2018-07-24', 3, 3, 6, 27);
INSERT INTO `sgs_military_general` VALUES (179, '界 · 曹植', NULL, '男', 1, '3', '2', '2020-11-10', 3, 1, 5, 27);
INSERT INTO `sgs_military_general` VALUES (180, '界 · 凌统', NULL, '男', 3, '4', '2', '2020-11-09', 1, 1, 4, 27);
INSERT INTO `sgs_military_general` VALUES (181, '界 · 王异', NULL, '女', 1, '3', '2', '2018-05-31', 3, 1, 2, 28);
INSERT INTO `sgs_military_general` VALUES (182, '界 · 关兴张苞', NULL, '男', 2, '4', '2', '2018-05-02', 1, 1, 5, 28);
INSERT INTO `sgs_military_general` VALUES (183, '界 · 马岱', NULL, '男', 2, '4', '2', '2018-11-17', 1, 1, 3, 28);
INSERT INTO `sgs_military_general` VALUES (184, '界 · 公孙瓒', NULL, '男', 4, '4', '2', '2019-02-22', 1, 1, 1, 28);
INSERT INTO `sgs_military_general` VALUES (185, '界 · 钟会', NULL, '男', 1, '4', '1', '2021-06-26', 3, 6, 7, 28);
INSERT INTO `sgs_military_general` VALUES (186, '界 · 刘表', NULL, '男', 4, '3', '2', '2021-02-26', 1, 1, 2, 28);
INSERT INTO `sgs_military_general` VALUES (187, '界 · 韩当', NULL, '男', 3, '4', '2', '2021-04-01', 1, 1, 3, 28);
INSERT INTO `sgs_military_general` VALUES (188, '界 · 程普', NULL, '男', 3, '4', '2', '2021-02-26', 1, 1, 3, 28);
INSERT INTO `sgs_military_general` VALUES (189, '界 · 步练师', NULL, '女', 3, '3', '1', '2021-02-26', 3, 6, 6, 28);
INSERT INTO `sgs_military_general` VALUES (190, '界 · 廖化', NULL, '男', 2, '4', '2', '2021-06-26', 3, 6, 6, 28);
INSERT INTO `sgs_military_general` VALUES (191, '界 · 曹彰', NULL, '男', 1, '4', '2', '2021-07-24', 1, 1, 2, 28);
INSERT INTO `sgs_military_general` VALUES (192, '界 · 朱然', NULL, '男', 3, '4', '1', '2021-03-18', 3, 1, 7, 29);
INSERT INTO `sgs_military_general` VALUES (193, '界 · 简雍', NULL, '男', 2, '3', '2', '2025-08-29', 3, 1, 1, 29);
INSERT INTO `sgs_military_general` VALUES (194, '界 · 虞翻', NULL, '男', 3, '3', '2', '2024-12-06', 1, 1, 3, 29);
INSERT INTO `sgs_military_general` VALUES (195, '界 · 满宠', NULL, '男', 1, '3', '2', '2021-10-23', 3, 6, 7, 29);
INSERT INTO `sgs_military_general` VALUES (196, '界 · 伏皇后', NULL, '女', 4, '3', '2', '2021-09-18', 1, 4, 5, 29);
INSERT INTO `sgs_military_general` VALUES (197, '界 · 郭淮', NULL, '男', 1, '4', '2', '2022-03-20', 1, 1, 2, 29);
INSERT INTO `sgs_military_general` VALUES (198, '界 · 潘璋马忠', NULL, '男', 3, '4', '2', '2025-06-20', 3, 1, 1, 29);
INSERT INTO `sgs_military_general` VALUES (199, '界 · 陈群', NULL, '男', 1, '3', '2', '2021-08-14', 1, 1, 5, 30);
INSERT INTO `sgs_military_general` VALUES (200, '界 · 顾雍', NULL, '男', 3, '3', '2', '2025-10-20', 3, 1, 1, 30);
INSERT INTO `sgs_military_general` VALUES (201, '界 · 孙鲁班', NULL, '女', 3, '3', '2', '2021-12-21', 1, 1, 3, 30);
INSERT INTO `sgs_military_general` VALUES (202, '界 · 沮授', NULL, '男', 4, '2 - 3 / 3', '1', '2023-09-17', 4, 8, 8, 30);
INSERT INTO `sgs_military_general` VALUES (203, '界 · 孙休', NULL, '男', 3, '3', '2', '2022-07-12', 1, 1, 1, 31);
INSERT INTO `sgs_military_general` VALUES (204, '界 · 朱治', NULL, '男', 3, '4', '2', '2023-09-17', 1, 5, 6, 31);
INSERT INTO `sgs_military_general` VALUES (205, '界 · 张嶷', NULL, '男', 2, '4', '2', '2024-11-27', 1, 1, 5, 31);
INSERT INTO `sgs_military_general` VALUES (206, '郭皇后', NULL, '女', 1, '3', '2', '2019-12-21', 1, 1, 1, 32);
INSERT INTO `sgs_military_general` VALUES (207, '李严', NULL, '男', 2, '3', '2', '2018-10-24', 1, 1, 2, 32);
INSERT INTO `sgs_military_general` VALUES (208, '孙登', NULL, '男', 3, '4', '2', '2019-02-22', 1, 1, 1, 32);
INSERT INTO `sgs_military_general` VALUES (209, '刘虞', NULL, '男', 4, '2', '2', '2020-07-31', 1, 1, 1, 32);
INSERT INTO `sgs_military_general` VALUES (210, '岑昏', NULL, '男', 3, '3', '2', '2019-12-23', 1, 1, 5, 32);
INSERT INTO `sgs_military_general` VALUES (211, '孙资刘放', NULL, '男', 1, '3', '2', '2018-05-02', 1, 1, 2, 32);
INSERT INTO `sgs_military_general` VALUES (212, '黄皓', NULL, '男', 2, '3', '2', '2018-08-20', 3, 1, 3, 32);
INSERT INTO `sgs_military_general` VALUES (213, '张让', NULL, '男', 4, '3', '1', '2021-02-26', 3, 6, 7, 32);
INSERT INTO `sgs_military_general` VALUES (214, '吴苋', NULL, '女', 2, '3', '2', '2018-06-21', 4, 2, 5, 33);
INSERT INTO `sgs_military_general` VALUES (215, '徐氏', NULL, '女', 3, '3', '2', '2018-10-17', 4, 1, 6, 33);
INSERT INTO `sgs_military_general` VALUES (216, '秦宓', NULL, '男', 2, '3', '2', '2018-10-17', 3, 5, 6, 33);
INSERT INTO `sgs_military_general` VALUES (217, '薛综', NULL, '男', 3, '3', '2', '2018-10-17', 1, 1, 5, 33);
INSERT INTO `sgs_military_general` VALUES (218, '曹节', NULL, '女', 4, '3', '2', '2018-10-17', 1, 1, 4, 33);
INSERT INTO `sgs_military_general` VALUES (219, '嵇康', NULL, '男', 1, '3', '1', '2020-05-30', 3, 4, 7, 33);
INSERT INTO `sgs_military_general` VALUES (220, '蔡邕', NULL, '男', 4, '3', '2', '2018-10-19', 1, 1, 1, 33);
INSERT INTO `sgs_military_general` VALUES (221, '辛宪英', NULL, '女', 1, '3', '2', '2019-04-05', 1, 1, 1, 33);
INSERT INTO `sgs_military_general` VALUES (222, '诸葛诞', NULL, '男', 1, '4', '2', '2018-08-26', 1, 1, 5, 34);
INSERT INTO `sgs_military_general` VALUES (223, '马良', NULL, '男', 2, '3', '2', '2018-08-01', 3, 6, 6, 34);
INSERT INTO `sgs_military_general` VALUES (224, '潘凤', NULL, '男', 4, '4', '3', '2018-09-23', 1, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (225, '丁奉', NULL, '男', 3, '4', '3', '2019-03-20', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (226, '诸葛瑾', NULL, '男', 3, '3', '2', '2019-01-23', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (227, '曹昂', NULL, '男', 1, '4', '2', '2018-08-04', 3, 7, 6, 34);
INSERT INTO `sgs_military_general` VALUES (228, '夏侯霸', NULL, '男', 2, '4', '2', '2019-01-10', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (229, 'SP关羽', NULL, '男', 1, '4', '2', '2018-06-25', 1, 1, 3, 34);
INSERT INTO `sgs_military_general` VALUES (230, 'SP孙尚香', NULL, '女', 2, '3', '2', '2018-05-05', 3, 1, 5, 34);
INSERT INTO `sgs_military_general` VALUES (231, '伏完', NULL, '男', 4, '4', '2', '2019-01-23', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (232, 'SP姜维', NULL, '男', 1, '4', '2', '2018-07-24', 1, 2, 3, 34);
INSERT INTO `sgs_military_general` VALUES (233, '何太后', NULL, '女', 4, '3', '3', '2020-02-14', 1, 1, 5, 34);
INSERT INTO `sgs_military_general` VALUES (234, '文聘', NULL, '男', 1, '4', '2', '2018-06-15', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (235, '孙鲁育', NULL, '女', 3, '3', '2', '2019-06-11', 1, 5, 6, 34);
INSERT INTO `sgs_military_general` VALUES (236, '祖茂', NULL, '男', 3, '4', '3', '2018-08-31', 1, 1, 3, 34);
INSERT INTO `sgs_military_general` VALUES (237, 'SP贾诩', NULL, '男', 1, '3', '3', '2018-05-02', 1, 1, 5, 34);
INSERT INTO `sgs_military_general` VALUES (238, '乐进', NULL, '男', 1, '4', '2', '2018-05-17', 3, 1, 4, 34);
INSERT INTO `sgs_military_general` VALUES (239, '张宝', NULL, '男', 4, '3', '2', '2018-06-06', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (240, '诸葛恪', NULL, '男', 3, '3', '2', '2018-10-21', 3, 3, 5, 34);
INSERT INTO `sgs_military_general` VALUES (241, 'SP马超', NULL, '男', 4, '4', '3', '2017-12-13', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (242, '司马朗', NULL, '男', 1, '3', '2', '2018-08-07', 1, 1, 3, 34);
INSERT INTO `sgs_military_general` VALUES (243, '大乔小乔', NULL, '女', 3, '3', '2', '2019-11-09', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (244, '关银屏', NULL, '女', 2, '3 - 4', '2', '2019-10-19', 1, 7, 7, 34);
INSERT INTO `sgs_military_general` VALUES (245, '曹洪', NULL, '男', 1, '4', '3', '2020-01-13', 1, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (246, 'SP蔡文姬', NULL, '女', 1, '3', '2', '2019-02-06', 4, 4, 5, 34);
INSERT INTO `sgs_military_general` VALUES (247, 'SP曹仁', NULL, '男', 1, '4', '2', '2019-05-06', 3, 5, 5, 34);
INSERT INTO `sgs_military_general` VALUES (248, 'SP貂蝉', NULL, '女', 4, '3', '2', '2018-10-24', 3, 6, 5, 34);
INSERT INTO `sgs_military_general` VALUES (249, 'SP赵云', NULL, '男', 4, '3', '2', '2018-04-28', 3, 6, 2, 34);
INSERT INTO `sgs_military_general` VALUES (250, 'SP庞德', NULL, '男', 1, '4', '3', '2020-01-22', 1, 3, 2, 34);
INSERT INTO `sgs_military_general` VALUES (251, '刘协', NULL, '男', 4, '3', '2', '2018-07-21', 3, 4, 6, 34);
INSERT INTO `sgs_military_general` VALUES (252, '贺齐', NULL, '男', 3, '4', '1', '2021-08-14', 3, 1, 3, 34);
INSERT INTO `sgs_military_general` VALUES (253, '糜竺', NULL, '男', 2, '3', '2', '2019-06-09', 1, 2, 5, 34);
INSERT INTO `sgs_military_general` VALUES (254, '李通', NULL, '男', 1, '4', '2', '2018-07-21', 1, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (255, 'SP黄月英', NULL, '女', 4, '3', '2', '2019-12-03', 1, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (256, '严白虎', NULL, '男', 4, '4', '2', '2018-12-02', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (257, '蹋顿', NULL, '男', 4, '4', '2', '2019-04-08', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (258, '张鲁', NULL, '男', 4, '3', '2', '2018-07-07', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (259, '李典', NULL, '男', 1, '3', '2', '2018-05-18', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (260, 'SP徐庶', NULL, '男', 2, '4', '2', '2020-03-07', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (261, '程昱', NULL, '男', 1, '3', '1', '2019-03-28', 3, 4, 5, 34);
INSERT INTO `sgs_military_general` VALUES (262, '刘琦', NULL, '男', 4, '3', '2', '2019-09-04', 1, 5, 5, 34);
INSERT INTO `sgs_military_general` VALUES (263, '马云騄', NULL, '女', 2, '4', '1', '2020-09-19', 3, 1, 3, 34);
INSERT INTO `sgs_military_general` VALUES (264, 'SP · 庞统', NULL, '男', 3, '3', '2', '2020-01-25', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (265, '吕虔', NULL, '男', 1, '4', '2', '2019-12-21', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (266, '潘濬', NULL, '男', 3, '3', '2', '2019-07-14', 1, 4, 6, 34);
INSERT INTO `sgs_military_general` VALUES (267, '孙乾', NULL, '男', 2, '3', '2', '2018-07-10', 1, 1, 5, 34);
INSERT INTO `sgs_military_general` VALUES (268, '马忠', NULL, '男', 2, '4', '2', '2020-08-03', 1, 1, 5, 34);
INSERT INTO `sgs_military_general` VALUES (269, '董白', NULL, '女', 4, '3', '2', '2019-11-15', 1, 5, 6, 34);
INSERT INTO `sgs_military_general` VALUES (270, '步骘', NULL, '男', 3, '3', '2', '2020-11-15', 1, 2, 5, 34);
INSERT INTO `sgs_military_general` VALUES (271, '张星彩', NULL, '女', 2, '3', '1', '2021-10-01', 3, 1, 6, 34);
INSERT INTO `sgs_military_general` VALUES (272, '董承', NULL, '男', 4, '4', '2', '2025-05-26', 3, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (273, '卫温诸葛直', NULL, '男', 3, '4', '2', '2021-10-01', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (274, '周鲂', NULL, '男', 3, '3', '2', '2020-07-21', 1, 5, 5, 34);
INSERT INTO `sgs_military_general` VALUES (275, '樊稠', NULL, '男', 4, '4', '2', '2021-02-23', 1, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (276, '董允', NULL, '男', 2, '3', '1', '2024-03-02', 3, 4, 6, 34);
INSERT INTO `sgs_military_general` VALUES (277, '戏志才', NULL, '男', 1, '3', '1', '2020-03-07', 4, 9, 9, 34);
INSERT INTO `sgs_military_general` VALUES (278, '麹义', NULL, '男', 4, '4', '1', '2021-02-26', 3, 6, 5, 34);
INSERT INTO `sgs_military_general` VALUES (279, '赵襄', NULL, '女', 2, '4', '1', '2025-03-03', 3, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (280, 'SP · 太史慈', NULL, '男', 4, '4', '2', '2021-10-01', 1, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (281, '杨修', NULL, '男', 1, '3', '1', '2021-08-17', 3, 1, 5, 34);
INSERT INTO `sgs_military_general` VALUES (282, '陶谦', NULL, '男', 4, '3', '1', '2020-03-17', 3, 1, 6, 34);
INSERT INTO `sgs_military_general` VALUES (283, '杨仪', NULL, '男', 2, '3', '2', '2021-11-12', 3, 6, 6, 34);
INSERT INTO `sgs_military_general` VALUES (284, '刘繇', NULL, '男', 4, '4', '2', '2021-10-01', 1, 1, 6, 34);
INSERT INTO `sgs_military_general` VALUES (285, '吕岱', NULL, '男', 3, '4', '2', '2021-06-11', 1, 3, 5, 34);
INSERT INTO `sgs_military_general` VALUES (286, '杜畿', NULL, '男', 1, '3', '2', '2020-03-13', 1, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (287, '李傕', NULL, '男', 4, '4 / 6', '2', '2019-11-10', 3, 4, 4, 34);
INSERT INTO `sgs_military_general` VALUES (288, '关索', NULL, '男', 2, '4', '1', '2023-04-11', 3, 1, 7, 34);
INSERT INTO `sgs_military_general` VALUES (289, '孙皓', NULL, '男', 3, '5', '1', '2023-01-28', 3, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (290, '陈琳', NULL, '男', 1, '3', '1', '2019-12-21', 3, 3, 5, 34);
INSERT INTO `sgs_military_general` VALUES (291, '司马徽', NULL, '男', 4, '3', '1', '2019-12-21', 3, 1, 8, 34);
INSERT INTO `sgs_military_general` VALUES (292, '吕凯', NULL, '男', 2, '3', '2', '2020-04-30', 1, 4, 6, 34);
INSERT INTO `sgs_military_general` VALUES (293, '卑弥呼', NULL, '女', 4, '3', '1', '2020-10-29', 3, 2, 5, 34);
INSERT INTO `sgs_military_general` VALUES (294, '张济', NULL, '男', 4, '4', '2', '2021-10-01', 1, 3, 4, 34);
INSERT INTO `sgs_military_general` VALUES (295, '张梁', NULL, '男', 4, '4', '2', '2025-08-02', 3, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (296, '鲁芝', NULL, '男', 1, '3', '2', '2019-12-21', 3, 6, 6, 34);
INSERT INTO `sgs_military_general` VALUES (297, '王允', NULL, '男', 4, '3', '1', '2022-01-29', 3, 2, 6, 34);
INSERT INTO `sgs_military_general` VALUES (298, '阚泽', NULL, '男', 3, '3', '2', '2019-06-29', 1, 1, 6, 34);
INSERT INTO `sgs_military_general` VALUES (299, '苏飞', NULL, '男', 4, '4', '1', '2021-02-26', 3, 4, 6, 34);
INSERT INTO `sgs_military_general` VALUES (300, '张恭', NULL, '男', 1, '3', '2', '2021-06-26', 3, 5, 6, 34);
INSERT INTO `sgs_military_general` VALUES (301, '许贡', NULL, '男', 3, '3', '2', '2021-10-01', 1, 1, 4, 34);
INSERT INTO `sgs_military_general` VALUES (302, '沙摩柯', NULL, '男', 2, '4', '1', '2020-10-17', 3, 6, 5, 34);
INSERT INTO `sgs_military_general` VALUES (303, '曹婴', NULL, '女', 1, '4', '1', '2025-01-20', 3, 6, 6, 34);
INSERT INTO `sgs_military_general` VALUES (304, '严畯', NULL, '男', 3, '3', '2', '2021-06-26', 3, 5, 6, 34);
INSERT INTO `sgs_military_general` VALUES (305, '郭汜', NULL, '男', 4, '4', '2', '2021-07-17', 1, 4, 5, 34);
INSERT INTO `sgs_military_general` VALUES (306, '丁原', NULL, '男', 4, '4', '2', '2021-10-01', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (307, '傅肜', NULL, '男', 2, '4', '2', '2025-09-25', 3, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (308, '邓芝', NULL, '男', 2, '3', '2', '2021-10-01', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (309, '张翼', NULL, '男', 2, '4', '2', '2021-09-18', 1, 2, 2, 34);
INSERT INTO `sgs_military_general` VALUES (310, '张琪瑛', NULL, '女', 4, '3', '1', '2026-01-24', 3, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (311, '胡车儿', NULL, '男', 4, '4', '2', '2022-01-23', 1, 1, 2, 34);
INSERT INTO `sgs_military_general` VALUES (312, '公孙康', NULL, '男', 4, '4', '1', '2021-12-21', 3, 5, 6, 34);
INSERT INTO `sgs_military_general` VALUES (313, '周群', NULL, '男', 2, '3', '1', '2023-11-25', 3, 2, 4, 34);
INSERT INTO `sgs_military_general` VALUES (314, '兀突骨', NULL, '男', 4, '15', '1', '2019-12-23', 3, 1, 5, 34);
INSERT INTO `sgs_military_general` VALUES (315, '马元义', NULL, '男', 4, '4', '2', '2022-06-25', 3, 4, 5, 34);
INSERT INTO `sgs_military_general` VALUES (316, '谯周', NULL, '男', 2, '3', '1', '2022-10-23', 3, 5, 5, 34);
INSERT INTO `sgs_military_general` VALUES (317, '阮惠', NULL, '女', 1, '3', '2', '2023-11-14', 3, 5, 5, 34);
INSERT INTO `sgs_military_general` VALUES (318, '王濬', NULL, '男', 4, '4', '2', '2023-10-18', 3, 3, 5, 34);
INSERT INTO `sgs_military_general` VALUES (319, '赵统赵广', NULL, '男', 2, '4', '2', '2020-05-01', 1, 2, 3, 34);
INSERT INTO `sgs_military_general` VALUES (320, '刘晔', NULL, '男', 1, '3', '1', '2019-12-21', 3, 2, 3, 34);
INSERT INTO `sgs_military_general` VALUES (321, '朱灵', NULL, '男', 1, '4', '2', '2018-05-07', 1, 2, 2, 34);
INSERT INTO `sgs_military_general` VALUES (322, '李丰', NULL, '男', 2, '3', '2', '2019-03-16', 1, 4, 5, 34);
INSERT INTO `sgs_military_general` VALUES (323, '诸葛果', NULL, '女', 2, '3', '1', '2019-03-28', 3, 4, 5, 34);
INSERT INTO `sgs_military_general` VALUES (324, '胡金定', NULL, '女', 2, '2 / 6', '2', '2024-12-16', 1, 5, 6, 34);
INSERT INTO `sgs_military_general` VALUES (325, '王元姬', NULL, '男', 1, '3', '1', '2024-07-13', 3, 6, 7, 34);
INSERT INTO `sgs_military_general` VALUES (326, 'SP · 司马昭', NULL, '男', 1, '3', '1', '2022-06-13', 3, 4, 6, 34);
INSERT INTO `sgs_military_general` VALUES (327, '裴秀', NULL, '男', 4, '3', '1', '2023-05-26', 4, 3, 6, 34);
INSERT INTO `sgs_military_general` VALUES (328, '彭羕', NULL, '男', 2, '3', '2', '2024-07-08', 1, 2, 7, 34);
INSERT INTO `sgs_military_general` VALUES (329, '濮阳兴', NULL, '男', 3, '4', '2', '2024-09-07', 1, 2, 6, 34);
INSERT INTO `sgs_military_general` VALUES (330, '韩遂', NULL, '男', 4, '4 - 1', '2', '2021-02-05', 1, 2, 5, 34);
INSERT INTO `sgs_military_general` VALUES (331, '吴班', NULL, '男', 2, '4', '2', '2025-12-05', 3, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (332, '胡班', NULL, '男', 1, '4', '2', '2024-03-21', 3, 4, 6, 34);
INSERT INTO `sgs_military_general` VALUES (333, '霍峻', NULL, '男', 2, '4', '2', '2024-05-26', 3, 4, 6, 34);
INSERT INTO `sgs_military_general` VALUES (334, '甘夫人', NULL, '女', 2, '3', '2', '2025-01-27', 1, 5, 5, 34);
INSERT INTO `sgs_military_general` VALUES (335, '清河公主', NULL, '女', 1, '3', '1', '2025-06-16', 4, 2, 3, 34);
INSERT INTO `sgs_military_general` VALUES (336, '张布', NULL, '男', 3, '4', '2', '2025-07-26', 3, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (337, '乐就', NULL, '男', 4, '4', '2', '2026-02-25', 3, 1, 3, 34);
INSERT INTO `sgs_military_general` VALUES (338, 'SP · 于禁', NULL, '男', 4, '4', '2', '2026-05-28', 3, 1, 1, 34);
INSERT INTO `sgs_military_general` VALUES (339, '贾充', NULL, '男', 4, '3', '2', '2026-03-15', 3, 1, 1, 35);
INSERT INTO `sgs_military_general` VALUES (340, '司马昭', NULL, '男', 1, '3', '1', '2025-02-27', 3, 7, 7, 35);
INSERT INTO `sgs_military_general` VALUES (341, '神 · 吕蒙', NULL, '男', 5, '3', '2', '2019-02-08', 1, 4, 5, 36);
INSERT INTO `sgs_military_general` VALUES (342, '神 · 周瑜', NULL, '男', 5, '4', '2', '2019-09-13', 1, 3, 6, 36);
INSERT INTO `sgs_military_general` VALUES (343, '神 · 诸葛亮', NULL, '男', 5, '3', '2', '2019-12-01', 1, 4, 7, 36);
INSERT INTO `sgs_military_general` VALUES (344, '神 · 吕布', NULL, '男', 5, '5', '1', '2025-02-28', 1, 2, 6, 36);
INSERT INTO `sgs_military_general` VALUES (345, '神 · 赵云', NULL, '男', 5, '2', '1', '2024-02-24', 3, 6, 6, 36);
INSERT INTO `sgs_military_general` VALUES (346, '神 · 陆逊', NULL, '男', 5, '4', '1', '2025-07-12', 3, 4, 3, 36);
INSERT INTO `sgs_military_general` VALUES (347, '神 · 刘备', NULL, '男', 5, '6', '1', '2025-07-26', 3, 1, 1, 36);
INSERT INTO `sgs_military_general` VALUES (348, '神 · 甘宁', NULL, '男', 5, '3 - 6', '1', '2021-12-21', 4, 8, 8, 36);
INSERT INTO `sgs_military_general` VALUES (349, '神 · 张辽', NULL, '男', 5, '4', '1', '2021-09-18', 3, 3, 5, 36);
INSERT INTO `sgs_military_general` VALUES (350, '神 · 鲁肃', NULL, '男', 5, '3', '1', '2025-12-16', 4, 7, 7, 36);
INSERT INTO `sgs_military_general` VALUES (351, '孙茹', NULL, '女', 3, '3', '2', '2018-07-24', 1, 3, 3, 37);
INSERT INTO `sgs_military_general` VALUES (352, '凌操', NULL, '男', 3, '4', '2', '2018-05-27', 3, 2, 2, 37);
INSERT INTO `sgs_military_general` VALUES (353, '留赞', NULL, '男', 3, '4', '1', '2019-12-21', 3, 7, 7, 37);
INSERT INTO `sgs_military_general` VALUES (354, '祢衡', NULL, '男', 4, '3', '1', '2021-02-26', 4, 8, 7, 37);
INSERT INTO `sgs_military_general` VALUES (355, '曹纯', NULL, '男', 1, '4', '1', '2019-11-04', 3, 6, 7, 37);
INSERT INTO `sgs_military_general` VALUES (356, '马钧', NULL, '男', 1, '3', '1', '2021-07-24', 4, 8, 8, 37);
INSERT INTO `sgs_military_general` VALUES (357, '司马师', NULL, '男', 1, '4', '1', '2021-03-22', 3, 6, 7, 37);
INSERT INTO `sgs_military_general` VALUES (358, '南华老仙', NULL, '男', 4, '3', '1', '2022-12-07', 4, 8, 9, 37);
INSERT INTO `sgs_military_general` VALUES (359, '星 · 张辽', NULL, '男', 4, '4', '2', '2021-10-01', 1, 2, 2, 38);
INSERT INTO `sgs_military_general` VALUES (360, '星 · 张郃', NULL, '男', 4, '4', '2', '2021-07-11', 1, 2, 2, 38);
INSERT INTO `sgs_military_general` VALUES (361, '星 · 徐晃', NULL, '男', 4, '4', '2', '2021-01-03', 3, 6, 6, 38);
INSERT INTO `sgs_military_general` VALUES (362, '星 · 甘宁', NULL, '男', 4, '4', '1', '2021-07-24', 3, 5, 6, 38);
INSERT INTO `sgs_military_general` VALUES (363, '星 · 周不疑', NULL, '男', 1, '3', '1', '2024-01-29', 3, 6, 7, 38);
INSERT INTO `sgs_military_general` VALUES (364, '星 · 董卓', NULL, '男', 4, '3 / 4', '1', '2025-04-21', 3, 5, 6, 38);
INSERT INTO `sgs_military_general` VALUES (365, '友 · 庞统', NULL, '男', 4, '3', '2', '2025-03-10', 3, 1, 2, 39);
INSERT INTO `sgs_military_general` VALUES (366, '友 · 徐庶', NULL, '男', 4, '3', '2', '2025-12-06', 3, 5, 6, 39);
INSERT INTO `sgs_military_general` VALUES (367, '刘备', NULL, '男', 2, '4', '3', '2017-11-21', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (368, '关羽', NULL, '男', 2, '4', '3', '2017-11-21', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (369, '黄盖', NULL, '男', 3, '4', '3', '2017-11-22', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (370, '甘宁', NULL, '男', 3, '4', '3', '2017-11-21', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (371, '马超', NULL, '男', 2, '4', '3', '2017-11-21', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (372, '张飞', NULL, '男', 2, '4', '3', '2017-11-21', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (373, '赵云', NULL, '男', 2, '4', '3', '2017-11-21', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (374, '曹操', NULL, '男', 1, '4', '3', '2017-11-21', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (375, '孙权', NULL, '男', 3, '4', '3', '2017-11-21', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (376, '孙尚香', NULL, '女', 3, '3', '3', '2017-11-21', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (377, '许褚', NULL, '男', 1, '4', '3', '2017-11-22', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (378, '华佗', NULL, '男', 4, '3', '3', '2017-11-22', 3, 1, 5, 40);
INSERT INTO `sgs_military_general` VALUES (379, '陆逊', NULL, '男', 3, '3', '3', '2017-11-23', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (380, '貂蝉', NULL, '女', 4, '3', '3', '2017-11-22', 4, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (381, '司马懿', NULL, '男', 4, '3', '3', '2017-11-23', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (382, '大乔', NULL, '女', 3, '3', '3', '2017-11-22', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (383, '夏侯惇', NULL, '男', 1, '4', '3', '2017-11-22', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (384, '黄月英', NULL, '女', 3, '3', '3', '2017-11-21', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (385, '甄姬', NULL, '女', 1, '3', '3', '2017-11-22', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (386, '张辽', NULL, '男', 1, '4', '3', '2017-11-22', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (387, '郭嘉', NULL, '男', 1, '3', '3', '2017-11-23', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (388, '吕布', NULL, '男', 4, '4', '3', '2017-11-22', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (389, '诸葛亮', NULL, '男', 2, '3', '3', '2017-11-22', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (390, '吕蒙', NULL, '男', 3, '4', '3', '2017-11-23', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (391, '周瑜', NULL, '男', 3, '3', '3', '2017-11-22', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (392, '华雄', NULL, '男', 4, '6', '2', '2017-11-25', 3, 1, 1, 40);
INSERT INTO `sgs_military_general` VALUES (393, '袁术', NULL, '男', 4, '4', '2', '2017-11-27', 3, 1, 2, 40);
INSERT INTO `sgs_military_general` VALUES (394, '黄忠', NULL, '男', 2, '4', '3', '2017-11-21', 3, 1, 1, 41);
INSERT INTO `sgs_military_general` VALUES (395, '小乔', NULL, '女', 3, '3', '3', '2017-11-22', 3, 1, 2, 41);
INSERT INTO `sgs_military_general` VALUES (396, '张角', NULL, '男', 4, '3', '3', '2017-11-24', 3, 1, 1, 41);
INSERT INTO `sgs_military_general` VALUES (397, '魏延', NULL, '男', 2, '4', '3', '2017-11-22', 3, 1, 1, 41);
INSERT INTO `sgs_military_general` VALUES (398, '曹仁', NULL, '男', 1, '4', '3', '2017-11-22', 3, 1, 1, 41);
INSERT INTO `sgs_military_general` VALUES (399, '夏侯渊', NULL, '男', 1, '4', '3', '2017-11-22', 3, 1, 1, 41);
INSERT INTO `sgs_military_general` VALUES (400, '周泰', NULL, '男', 3, '4', '3', '2017-11-23', 1, 1, 1, 41);
INSERT INTO `sgs_military_general` VALUES (401, '于吉', NULL, '男', 4, '3', '3', '2017-11-24', 1, 1, 1, 41);
INSERT INTO `sgs_military_general` VALUES (402, '典韦', NULL, '男', 1, '4', '3', '2018-01-10', 3, 1, 1, 42);
INSERT INTO `sgs_military_general` VALUES (403, '荀彧', NULL, '男', 1, '3', '3', '2018-05-02', 3, 1, 2, 42);
INSERT INTO `sgs_military_general` VALUES (404, '庞统', NULL, '男', 2, '3', '3', '2017-11-28', 3, 1, 1, 42);
INSERT INTO `sgs_military_general` VALUES (405, '卧龙诸葛', NULL, '男', 2, '3', '3', '2018-05-17', 3, 1, 1, 42);
INSERT INTO `sgs_military_general` VALUES (406, '太史慈', NULL, '男', 3, '4', '3', '2018-05-17', 3, 1, 1, 42);
INSERT INTO `sgs_military_general` VALUES (407, '庞德', NULL, '男', 4, '3', '3', '2019-08-02', 3, 1, 1, 42);
INSERT INTO `sgs_military_general` VALUES (408, '颜良文丑', NULL, '男', 4, '4', '3', '2017-11-24', 3, 1, 1, 42);
INSERT INTO `sgs_military_general` VALUES (409, '袁绍', NULL, '男', 4, '4', '3', '2017-12-12', 4, 1, 7, 42);
INSERT INTO `sgs_military_general` VALUES (410, '徐晃', NULL, '男', 1, '4', '3', '2018-01-01', 3, 1, 1, 43);
INSERT INTO `sgs_military_general` VALUES (411, '曹丕', NULL, '男', 1, '3', '3', '2018-05-15', 4, 5, 7, 43);
INSERT INTO `sgs_military_general` VALUES (412, '孙坚', NULL, '男', 3, '4', '3', '2017-11-26', 3, 1, 1, 43);
INSERT INTO `sgs_military_general` VALUES (413, '董卓', NULL, '男', 4, '8', '3', '2018-01-01', 3, 1, 1, 43);
INSERT INTO `sgs_military_general` VALUES (414, '祝融', NULL, '女', 2, '4', '3', '2018-06-19', 1, 1, 1, 43);
INSERT INTO `sgs_military_general` VALUES (415, '孟获', NULL, '男', 2, '4', '3', '2017-11-25', 1, 1, 1, 43);
INSERT INTO `sgs_military_general` VALUES (416, '贾诩', NULL, '男', 4, '3', '3', '2018-01-01', 1, 1, 2, 43);
INSERT INTO `sgs_military_general` VALUES (417, '鲁肃', NULL, '男', 3, '3', '2', '2018-06-05', 3, 3, 5, 43);
INSERT INTO `sgs_military_general` VALUES (418, '张郃', NULL, '男', 1, '4', '3', '2018-08-21', 1, 1, 1, 44);
INSERT INTO `sgs_military_general` VALUES (419, '邓艾', NULL, '男', 1, '4', '3', '2018-05-21', 3, 1, 1, 44);
INSERT INTO `sgs_military_general` VALUES (420, '姜维', NULL, '男', 2, '4', '3', '2018-07-15', 4, 1, 1, 44);
INSERT INTO `sgs_military_general` VALUES (421, '刘禅', NULL, '男', 2, '3', '3', '2017-11-26', 3, 1, 4, 44);
INSERT INTO `sgs_military_general` VALUES (422, '孙策', NULL, '男', 3, '4', '3', '2017-11-22', 4, 1, 1, 44);
INSERT INTO `sgs_military_general` VALUES (423, '张昭张纮', NULL, '男', 3, '3', '3', '2018-05-25', 3, 1, 1, 44);
INSERT INTO `sgs_military_general` VALUES (424, '左慈', NULL, '男', 4, '3', '1', '2019-02-10', 3, 1, 2, 44);
INSERT INTO `sgs_military_general` VALUES (425, '蔡文姬', NULL, '女', 4, '3', '2', '2018-10-24', 3, 2, 6, 44);
INSERT INTO `sgs_military_general` VALUES (426, '严颜', NULL, '男', 2, '4', '2', '2021-02-26', 1, 1, 4, 45);
INSERT INTO `sgs_military_general` VALUES (427, '王平', NULL, '男', 2, '4', '1', '2020-05-05', 3, 1, 3, 45);
INSERT INTO `sgs_military_general` VALUES (428, '陆绩', NULL, '男', 3, '3', '2', '2019-09-22', 3, 1, 5, 45);
INSERT INTO `sgs_military_general` VALUES (429, '孙亮', NULL, '男', 3, '3', '2', '2021-07-01', 1, 1, 3, 45);
INSERT INTO `sgs_military_general` VALUES (430, '蒯越蒯良', NULL, '男', 1, '3', '2', '2019-10-19', 3, 3, 5, 45);
INSERT INTO `sgs_military_general` VALUES (431, '许攸', NULL, '男', 4, '3', '1', '2019-10-12', 4, 7, 6, 45);
INSERT INTO `sgs_military_general` VALUES (432, '卢植', NULL, '男', 4, '3', '2', '2021-07-01', 1, 1, 1, 45);
INSERT INTO `sgs_military_general` VALUES (433, '王基', NULL, '男', 1, '3', '2', '2019-05-06', 3, 1, 4, 45);
INSERT INTO `sgs_military_general` VALUES (434, '陈到', NULL, '男', 2, '4', '2', '2020-06-26', 1, 1, 1, 46);
INSERT INTO `sgs_military_general` VALUES (435, '郝昭', NULL, '男', 1, '4', '1', '2022-04-02', 3, 5, 6, 46);
INSERT INTO `sgs_military_general` VALUES (436, '仲帝袁术', NULL, '男', 4, '4', '2', '2020-07-15', 1, 1, 1, 46);
INSERT INTO `sgs_military_general` VALUES (437, '陆抗', NULL, '男', 3, '4', '2', '2021-06-20', 1, 1, 1, 46);
INSERT INTO `sgs_military_general` VALUES (438, '毌丘俭', NULL, '男', 1, '4', '2', '2021-08-14', 1, 1, 2, 46);
INSERT INTO `sgs_military_general` VALUES (439, '周妃', NULL, '女', 3, '3', '2', '2020-09-19', 1, 1, 5, 46);
INSERT INTO `sgs_military_general` VALUES (440, '诸葛瞻', NULL, '男', 2, '3', '1', '2022-12-17', 3, 4, 4, 46);
INSERT INTO `sgs_military_general` VALUES (441, '张绣', NULL, '男', 4, '4', '2', '2021-04-24', 4, 6, 6, 46);
INSERT INTO `sgs_military_general` VALUES (442, '纪灵', NULL, '男', 4, '4', '3', '2018-11-12', 3, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (443, '田丰', NULL, '男', 4, '3', '3', '2019-05-27', 1, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (444, '马滕', NULL, '男', 4, '4', '3', '2020-03-12', 1, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (445, '邹氏', NULL, '女', 4, '3', '3', '2022-02-16', 1, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (446, '唐咨', NULL, '男', 6, '4', '2', '2021-10-01', 1, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (447, '糜芳傅士仁', NULL, '男', 7, '4', '2', '2021-07-24', 1, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (448, '张任', NULL, '男', 4, '4', '2', '2021-04-14', 1, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (449, '李傕郭汜', NULL, '男', 4, '4', '2', '2019-12-23', 1, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (450, '董承', NULL, '男', 4, '4', '2', '2025-08-18', 3, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (451, '孟达', NULL, '男', 8, '4', '2', '2021-07-24', 1, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (452, '蒋琬费祎', NULL, '男', 2, '3', '2', '2021-05-10', 1, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (453, '董昭', NULL, '男', 1, '3', '2', '2021-10-01', 1, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (454, '臧霸', NULL, '男', 1, '3', '2', '2019-04-14', 1, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (455, '甘夫人', NULL, '女', 2, '3', '3', '2018-06-17', 3, 0, 0, 47);
INSERT INTO `sgs_military_general` VALUES (456, '牛金', NULL, '男', 1, '4', '2', '2019-12-22', 1, 0, 0, 48);
INSERT INTO `sgs_military_general` VALUES (457, '何进', NULL, '男', 4, '4', '2', '2019-12-22', 1, 0, 0, 48);

-- ----------------------------
-- Table structure for sgs_quality
-- ----------------------------
DROP TABLE IF EXISTS `sgs_quality`;
CREATE TABLE `sgs_quality`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '三国杀品质表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sgs_quality
-- ----------------------------
INSERT INTO `sgs_quality` VALUES (1, '史诗');
INSERT INTO `sgs_quality` VALUES (2, '精品');
INSERT INTO `sgs_quality` VALUES (3, '普通');

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
  CONSTRAINT `user_chk_1` CHECK (`gender` in (_utf8mb4'男',_utf8mb4'女'))
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '18837727538@163.com', '$2a$10$bdgxSx3UoHPacXpKldnSEeThoC2mrXxI48uY.HWTEtCzQEMMZKLue', NULL, '默认', NULL, '男', NULL, 1, '2026-06-30 18:46:13', '2026-07-01 17:48:40', 0);

SET FOREIGN_KEY_CHECKS = 1;
