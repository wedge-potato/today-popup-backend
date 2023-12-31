CREATE TABLE IF NOT EXISTS `popup` (
	`id`	BIGINT	NOT NULL,
	`title`	VARCHAR(255)	NOT NULL	COMMENT '제목',
	`thumbnail`	TEXT	NOT NULL	COMMENT '썸네일 URL',
	`start_date`	DATE	NULL	COMMENT '팝업 시작일',
	`end_date`	DATE	NULL	COMMENT '팝업 종료일',
	`category_id`	INT	NOT NULL	COMMENT '카테고리 ID',
	`region_id`	INT	NOT NULL	COMMENT '지역 ID',
	`info_id`	BIGINT	NOT NULL	COMMENT '팝업 상세 정보 ID',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `category` (
	`id`	INT	NOT NULL,
	`name`	VARCHAR(50)	NOT NULL	COMMENT '팝업, 전시회...',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `region` (
	`id`	INT	NOT NULL,
	`city`	VARCHAR(50)	NOT NULL	COMMENT '시',
	`district`	VARCHAR(50)	NOT NULL	COMMENT '구',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `image` (
	`id`	BIGINT	NOT NULL,
	`url`	TEXT	NOT NULL	COMMENT '이미지 URL',
	`popup_id`	BIGINT	NOT NULL	COMMENT '팝업 ID',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `popup_info` (
	`id`	BIGINT	NOT NULL,
	`url_link`	TEXT	NULL	COMMENT '공식 URL 링크 (홈페이지, 인스타 등)',
	`introduction`	TEXT	NULL	COMMENT '소개',
	`address`	TEXT	NULL	COMMENT '주소',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
