CREATE DATABASE IF NOT EXISTS todaypopup;

CREATE TABLE IF NOT EXISTS `popup` (
	`id`	BIGINT	NOT NULL,
	`title`	VARCHAR(255)	NOT NULL	COMMENT '제목',
	`thumbnail`	TEXT	NOT NULL	COMMENT '썸네일 URL',
	`start_date`	DATETIME	NULL	COMMENT '팝업 시작일',
	`end_date`	DATETIME	NULL	COMMENT '팝업 종료일',
	`category_id`	INT	NOT NULL	COMMENT '카테고리 ID',
	`city_id`	INT	NOT NULL	COMMENT '지역 ID',
	`info`	BIGINT	NOT NULL	COMMENT '팝업 상세 정보 ID',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `category` (
	`id`	INT	NOT NULL,
	`category`	VARCHAR(50)	NOT NULL	COMMENT '팝업, 전시회...',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `city` (
	`id`	INT	NOT NULL,
	`city`	VARCHAR(50)	NOT NULL	COMMENT '시',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `district` (
	`id`	INT	NOT NULL,
	`district`	VARCHAR(50)	NOT NULL	COMMENT '구',
	`city_id`	INT	NOT NULL	COMMENT '시 ID',
	`create_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `image` (
	`id`	BIGINT	NOT NULL,
	`image`	TEXT	NOT NULL	COMMENT '이미지 URL',
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




INSERT INTO category (id, category) VALUES (1, '팝업'), (2, '전시회'), (3, '공연'), (4, '페스티벌');
INSERT INTO city (id, city) VALUES (1, '서울'), (2, '경기'), (3, '인천'), (4, '강원'), (5, '충북'), (6, '충남'), (7, '대전'), (8, '경북'), (9, '경남'), (10, '대구'), (11, '울산'), (12, '부산'), (13, '전북'), (14, '전남'), (15, '광주'), (16, '제주');
INSERT INTO district (id, district, city_id) VALUES
(1, '강남구', 1),
(2, '강동구', 1),
(3, '강북구', 1),
(4, '강서구', 1),
(5, '관악구', 1),
(6, '광진구', 1),
(7, '구로구', 1),
(8, '금천구', 1),
(9, '노원구', 1),
(10, '도봉구', 1),
(11, '동대문구', 1),
(12, '동작구', 1),
(13, '마포구', 1),
(14, '서대문구', 1),
(15, '서초구', 1),
(16, '성동구', 1),
(17, '성북구', 1),
(18, '송파구', 1),
(19, '양천구', 1),
(20, '영등포구', 1),
(21, '용산구', 1),
(22, '은평구', 1),
(23, '종로구', 1),
(24, '중구', 1),
(25, '중랑구', 1);
