CREATE TABLE IF NOT EXISTS `popup` (
	`id`	BIGINT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`title`	VARCHAR(255)	NOT NULL	COMMENT '제목',
	`thumbnail`	TEXT	NOT NULL	COMMENT '썸네일 URL',
	`start_date`	DATE	NULL	COMMENT '팝업 시작일',
	`end_date`	DATE	NULL	COMMENT '팝업 종료일',
	`category_id`	INT	NOT NULL	COMMENT '카테고리 ID',
	`sido_id`	INT	NOT NULL	COMMENT '시/도 ID',
	`sigungu_id`	INT	NOT NULL	COMMENT '시/군/구 ID',
	`info_id`	BIGINT	NOT NULL	COMMENT '팝업 상세 정보 ID',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `category` (
	`id`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name`	VARCHAR(50)	NOT NULL	COMMENT '팝업, 전시회...',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `sido` (
	`id`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name`	VARCHAR(50)	NOT NULL	COMMENT '시/도',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `sigungu` (
	`id`	INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name`	VARCHAR(50)	NOT NULL	COMMENT '시/군/구',
	`sido_id`	VARCHAR(50)	NOT NULL	COMMENT '시/도 ID',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `image` (
	`id`	BIGINT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`url`	TEXT	NOT NULL	COMMENT '이미지 URL',
	`popup_id`	BIGINT	NOT NULL	COMMENT '팝업 ID',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `popup_info` (
	`id`	BIGINT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`url_link`	TEXT	NULL	COMMENT '공식 URL 링크 (홈페이지, 인스타 등)',
	`introduction`	TEXT	NULL	COMMENT '소개',
	`address`	TEXT	NULL	COMMENT '주소',
	`lat`	TEXT	NULL	COMMENT '위도',
	`lng`	TEXT	NULL	COMMENT '경도',
	`start_time` TIME NULL COMMENT '시작 시간',
	`end_time` TIME NULL COMMENT '종료 시간',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
