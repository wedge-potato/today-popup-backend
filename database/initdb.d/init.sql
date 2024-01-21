CREATE DATABASE IF NOT EXISTS today_popup;

USE today_popup;

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

INSERT INTO category (id, name) VALUES (1, '팝업'), (2, '전시회'), (3, '공연'), (4, '페스티벌');
INSERT INTO sido (name) VALUES ('서울특별시'), ('부산광역시'), ('대구광역시'), ('인천광역시'), ('광주광역시'), ('대전광역시'), ('울산광역시'), ('세종특별자치시'), ('경기도'), ('강원도'), ('충청북도'), ('충청남도'), ('전라북도'), ('전라남도'), ('경상북도'), ('경상남도'), ('제주특별자치도');
INSERT INTO sigungu (name, sido_id) VALUES ('강남구', 1), ('강동구', 1), ('강북구', 1), ('강서구', 1), ('관악구', 1), ('광진구', 1), ('구로구', 1), ('금천구', 1), ('노원구', 1), ('도봉구', 1), ('동대문구', 1), ('동작구', 1), ('마포구', 1), ('서대문구', 1), ('서초구', 1), ('성동구', 1), ('성북구', 1), ('송파구', 1), ('양천구', 1), ('영등포구', 1), ('용산구', 1), ('은평구', 1), ('종로구', 1), ('중구', 1), ('중랑구', 1);

INSERT INTO `popup` (id, title, thumbnail, start_date, end_date, category_id, sido_id, sigungu_id, info_id) VALUES
(1, '팝업 1', 'http://example.com/thumbnail1', '2020-01-01', '2020-01-31', 1, 1, 1, 1),
(2, '팝업 2', 'http://example.com/thumbnail2', '2020-01-01', '2020-01-31', 1, 1, 1, 2),
(3, '팝업 3', 'http://example.com/thumbnail3', '2020-01-01', '2020-01-31', 1, 1, 1, 3),
(4, '팝업 4', 'http://example.com/thumbnail4', '2020-01-01', '2020-01-31', 1, 1, 1, 4),
(5, '팝업 5', 'http://example.com/thumbnail5', '2020-01-01', '2020-01-31', 1, 1, 1, 5),
(6, '팝업 6', 'http://example.com/thumbnail6', '2020-01-01', '2020-01-31', 1, 1, 1, 6),
(7, '팝업 7', 'http://example.com/thumbnail7', '2020-01-01', '2020-01-31', 1, 1, 1, 7),
(8, '팝업 8', 'http://example.com/thumbnail8', '2020-01-01', '2020-01-31', 1, 1, 1, 8),
(9, '팝업 9', 'http://example.com/thumbnail9', '2020-01-01', '2020-01-31', 1, 1, 1, 9),
(10, '팝업 10', 'http://example.com/thumbnail10', '2020-01-01', '2020-01-31', 1, 1, 1, 10),
(11, '팝업 11', 'http://example.com/thumbnail11', '2020-01-01', '2020-01-31', 1, 1, 1, 11),
(12, '팝업 12', 'http://example.com/thumbnail12', '2020-01-01', '2020-01-31', 1, 1, 1, 12),
(13, '팝업 13', 'http://example.com/thumbnail13', '2020-01-01', '2020-01-31', 1, 1, 1, 13),
(14, '팝업 14', 'http://example.com/thumbnail14', '2020-01-01', '2020-01-31', 1, 1, 1, 14),
(15, '팝업 15', 'http://example.com/thumbnail15', '2020-01-01', '2020-01-31', 1, 1, 1, 15),
(16, '팝업 16', 'http://example.com/thumbnail16', '2020-01-01', '2020-01-31', 1, 1, 1, 16),
(17, '팝업 17', 'http://example.com/thumbnail17', '2020-01-01', '2020-01-31', 1, 1, 1, 17),
(18, '팝업 18', 'http://example.com/thumbnail18', '2020-01-01', '2020-01-31', 1, 1, 1, 18),
(19, '팝업 19', 'http://example.com/thumbnail19', '2020-01-01', '2020-01-31', 1, 1, 1, 19),
(20, '팝업 20', 'http://example.com/thumbnail20', '2020-01-01', '2020-01-31', 1, 1, 1, 20);

INSERT INTO `popup_info` (id, url_link, introduction, address, lat, lng, start_time, end_time, create_date, update_date) VALUES
(1, 'http://example.com/url_link1', '소개1', '주소1', '위도1', '경도1', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(2, 'http://example.com/url_link2', '소개2', '주소2', '위도2', '경도2', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(3, 'http://example.com/url_link3', '소개3', '주소3', '위도3', '경도3', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(4, 'http://example.com/url_link4', '소개4', '주소4', '위도4', '경도4', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(5, 'http://example.com/url_link5', '소개5', '주소5', '위도5', '경도5', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(6, 'http://example.com/url_link6', '소개6', '주소6', '위도6', '경도6', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(7, 'http://example.com/url_link7', '소개7', '주소7', '위도7', '경도7', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(8, 'http://example.com/url_link8', '소개8', '주소8', '위도8', '경도8', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(9, 'http://example.com/url_link9', '소개9', '주소9', '위도9', '경도9', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(10, 'http://example.com/url_link10', '소개10', '주소10', '위도10', '경도10', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(11, 'http://example.com/url_link11', '소개11', '주소11', '위도11', '경도11', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(12, 'http://example.com/url_link12', '소개12', '주소12', '위도12', '경도12', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(13, 'http://example.com/url_link13', '소개13', '주소13', '위도13', '경도13', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(14, 'http://example.com/url_link14', '소개14', '주소14', '위도14', '경도14', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(15, 'http://example.com/url_link15', '소개15', '주소15', '위도15', '경도15', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(16, 'http://example.com/url_link16', '소개16', '주소16', '위도16', '경도16', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(17, 'http://example.com/url_link17', '소개17', '주소17', '위도17', '경도17', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(18, 'http://example.com/url_link18', '소개18', '주소18', '위도18', '경도18', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(19, 'http://example.com/url_link19', '소개19', '주소19', '위도19', '경도19', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00'),
(20, 'http://example.com/url_link20', '소개20', '주소20', '위도20', '경도20', '09:00:00', '18:00:00', '2020-01-01 00:00:00', '2020-01-01 00:00:00');

INSERT INTO `image` (popup_id, url) VALUES
(1, 'http://example.com/image1.jpg'),
(1, 'http://example.com/image2.jpg'),
(1, 'http://example.com/image3.jpg'),
(2, 'http://example.com/image4.jpg'),
(2, 'http://example.com/image5.jpg'),
(2, 'http://example.com/image6.jpg'),
(3, 'http://example.com/image7.jpg'),
(3, 'http://example.com/image8.jpg'),
(3, 'http://example.com/image9.jpg'),
(4, 'http://example.com/image10.jpg'),
(4, 'http://example.com/image11.jpg'),
(4, 'http://example.com/image12.jpg'),
(5, 'http://example.com/image13.jpg'),
(5, 'http://example.com/image14.jpg'),
(5, 'http://example.com/image15.jpg'),
(6, 'http://example.com/image16.jpg'),
(6, 'http://example.com/image17.jpg'),
(6, 'http://example.com/image18.jpg'),
(7, 'http://example.com/image19.jpg'),
(7, 'http://example.com/image20.jpg'),
(7, 'http://example.com/image21.jpg'),
(8, 'http://example.com/image22.jpg'),
(8, 'http://example.com/image23.jpg'),
(8, 'http://example.com/image24.jpg'),
(9, 'http://example.com/image25.jpg'),
(9, 'http://example.com/image26.jpg'),
(9, 'http://example.com/image27.jpg'),
(10, 'http://example.com/image28.jpg'),
(10, 'http://example.com/image29.jpg'),
(10, 'http://example.com/image30.jpg'),
(11, 'http://example.com/image31.jpg'),
(11, 'http://example.com/image32.jpg'),
(11, 'http://example.com/image33.jpg'),
(12, 'http://example.com/image34.jpg'),
(12, 'http://example.com/image35.jpg'),
(12, 'http://example.com/image36.jpg'),
(13, 'http://example.com/image37.jpg'),
(13, 'http://example.com/image38.jpg'),
(13, 'http://example.com/image39.jpg'),
(14, 'http://example.com/image40.jpg'),
(14, 'http://example.com/image41.jpg'),
(14, 'http://example.com/image42.jpg'),
(15, 'http://example.com/image43.jpg'),
(15, 'http://example.com/image44.jpg'),
(15, 'http://example.com/image45.jpg'),
(16, 'http://example.com/image46.jpg'),
(16, 'http://example.com/image47.jpg'),
(16, 'http://example.com/image48.jpg'),
(17, 'http://example.com/image49.jpg'),
(17, 'http://example.com/image50.jpg'),
(17, 'http://example.com/image51.jpg'),
(18, 'http://example.com/image52.jpg'),
(18, 'http://example.com/image53.jpg'),
(18, 'http://example.com/image54.jpg'),
(19, 'http://example.com/image55.jpg'),
(19, 'http://example.com/image56.jpg'),
(19, 'http://example.com/image57.jpg'),
(20, 'http://example.com/image58.jpg'),
(20, 'http://example.com/image59.jpg'),
(20, 'http://example.com/image60.jpg'),
(21, 'http://example.com/image61.jpg'),
(21, 'http://example.com/image62.jpg'),
(21, 'http://example.com/image63.jpg'),
(22, 'http://example.com/image64.jpg'),
(22, 'http://example.com/image65.jpg'),
(22, 'http://example.com/image66.jpg'),
(23, 'http://example.com/image67.jpg'),
(23, 'http://example.com/image68.jpg'),
(23, 'http://example.com/image69.jpg'),
(24, 'http://example.com/image70.jpg'),
(24, 'http://example.com/image71.jpg'),
(24, 'http://example.com/image72.jpg'),
(25, 'http://example.com/image73.jpg'),
(25, 'http://example.com/image74.jpg'),
(25, 'http://example.com/image75.jpg'),
(26, 'http://example.com/image76.jpg'),
(26, 'http://example.com/image77.jpg'),
(26, 'http://example.com/image78.jpg'),
(27, 'http://example.com/image79.jpg'),
(27, 'http://example.com/image80.jpg'),
(27, 'http://example.com/image81.jpg'),
(28, 'http://example.com/image82.jpg'),
(28, 'http://example.com/image83.jpg'),
(28, 'http://example.com/image84.jpg'),
(29, 'http://example.com/image85.jpg'),
(29, 'http://example.com/image86.jpg'),
(29, 'http://example.com/image87.jpg'),
(30, 'http://example.com/image88.jpg'),
(30, 'http://example.com/image89.jpg'),
(30, 'http://example.com/image90.jpg'),
(31, 'http://example.com/image91.jpg'),
(31, 'http://example.com/image92.jpg'),
(31, 'http://example.com/image93.jpg'),
(32, 'http://example.com/image94.jpg'),
(32, 'http://example.com/image95.jpg'),
(32, 'http://example.com/image96.jpg'),
(33, 'http://example.com/image97.jpg'),
(33, 'http://example.com/image98.jpg'),
(33, 'http://example.com/image99.jpg'),
(34, 'http://example.com/image100.jpg'),
(34, 'http://example.com/image101.jpg'),
(34, 'http://example.com/image102.jpg'),
(35, 'http://example.com/image103.jpg'),
(35, 'http://example.com/image104.jpg'),
(35, 'http://example.com/image105.jpg'),
(36, 'http://example.com/image106.jpg'),
(36, 'http://example.com/image107.jpg'),
(36, 'http://example.com/image108.jpg'),
(37, 'http://example.com/image109.jpg'),
(37, 'http://example.com/image110.jpg'),
(37, 'http://example.com/image111.jpg'),
(38, 'http://example.com/image112.jpg'),
(38, 'http://example.com/image113.jpg'),
(38, 'http://example.com/image114.jpg'),
(39, 'http://example.com/image115.jpg'),
(39, 'http://example.com/image116.jpg'),
(39, 'http://example.com/image117.jpg'),
(40, 'http://example.com/image118.jpg'),
(40, 'http://example.com/image119.jpg'),
(40, 'http://example.com/image120.jpg'),
(41, 'http://example.com/image121.jpg'),
(41, 'http://example.com/image122.jpg'),
(41, 'http://example.com/image123.jpg'),
(42, 'http://example.com/image124.jpg'),
(42, 'http://example.com/image125.jpg'),
(42, 'http://example.com/image126.jpg'),
(43, 'http://example.com/image127.jpg'),
(43, 'http://example.com/image128.jpg'),
(43, 'http://example.com/image129.jpg'),
(44, 'http://example.com/image130.jpg'),
(44, 'http://example.com/image131.jpg'),
(44, 'http://example.com/image132.jpg'),
(45, 'http://example.com/image133.jpg'),
(45, 'http://example.com/image134.jpg'),
(45, 'http://example.com/image135.jpg'),
(46, 'http://example.com/image136.jpg'),
(46, 'http://example.com/image137.jpg'),
(46, 'http://example.com/image138.jpg'),
(47, 'http://example.com/image139.jpg'),
(47, 'http://example.com/image140.jpg'),
(47, 'http://example.com/image141.jpg'),
(48, 'http://example.com/image142.jpg'),
(48, 'http://example.com/image143.jpg'),
(48, 'http://example.com/image144.jpg'),
(49, 'http://example.com/image145.jpg'),
(49, 'http://example.com/image146.jpg'),
(49, 'http://example.com/image147.jpg'),
(50, 'http://example.com/image148.jpg'),
(50, 'http://example.com/image149.jpg'),
(50, 'http://example.com/image150.jpg'),
(51, 'http://example.com/image151.jpg'),
(51, 'http://example.com/image152.jpg'),
(51, 'http://example.com/image153.jpg'),
(52, 'http://example.com/image154.jpg'),
(52, 'http://example.com/image155.jpg'),
(52, 'http://example.com/image156.jpg'),
(53, 'http://example.com/image157.jpg'),
(53, 'http://example.com/image158.jpg'),
(53, 'http://example.com/image159.jpg'),
(54, 'http://example.com/image160.jpg'),
(54, 'http://example.com/image161.jpg'),
(54, 'http://example.com/image162.jpg'),
(55, 'http://example.com/image163.jpg'),
(55, 'http://example.com/image164.jpg'),
(55, 'http://example.com/image165.jpg'),
(56, 'http://example.com/image166.jpg'),
(56, 'http://example.com/image167.jpg'),
(56, 'http://example.com/image168.jpg'),
(57, 'http://example.com/image169.jpg'),
(57, 'http://example.com/image170.jpg'),
(57, 'http://example.com/image171.jpg'),
(58, 'http://example.com/image172.jpg'),
(58, 'http://example.com/image173.jpg'),
(58, 'http://example.com/image174.jpg'),
(59, 'http://example.com/image175.jpg'),
(59, 'http://example.com/image176.jpg'),
(59, 'http://example.com/image177.jpg'),
(60, 'http://example.com/image178.jpg'),
(60, 'http://example.com/image179.jpg'),
(60, 'http://example.com/image180.jpg'),
(61, 'http://example.com/image181.jpg'),
(61, 'http://example.com/image182.jpg'),
(61, 'http://example.com/image183.jpg'),
(62, 'http://example.com/image184.jpg'),
(62, 'http://example.com/image185.jpg'),
(62, 'http://example.com/image186.jpg'),
(63, 'http://example.com/image187.jpg'),
(63, 'http://example.com/image188.jpg'),
(63, 'http://example.com/image189.jpg'),
(64, 'http://example.com/image190.jpg'),
(64, 'http://example.com/image191.jpg'),
(64, 'http://example.com/image192.jpg'),
(65, 'http://example.com/image193.jpg'),
(65, 'http://example.com/image194.jpg'),
(65, 'http://example.com/image195.jpg'),
(66, 'http://example.com/image196.jpg'),
(66, 'http://example.com/image197.jpg'),
(66, 'http://example.com/image198.jpg'),
(67, 'http://example.com/image199.jpg'),
(67, 'http://example.com/image200.jpg'),
(67, 'http://example.com/image201.jpg'),
(68, 'http://example.com/image202.jpg'),
(68, 'http://example.com/image203.jpg'),
(68, 'http://example.com/image204.jpg'),
(69, 'http://example.com/image205.jpg'),
(69, 'http://example.com/image206.jpg'),
(69, 'http://example.com/image207.jpg'),
(70, 'http://example.com/image208.jpg'),
(70, 'http://example.com/image209.jpg'),
(70, 'http://example.com/image210.jpg'),
(71, 'http://example.com/image211.jpg'),
(71, 'http://example.com/image212.jpg'),
(71, 'http://example.com/image213.jpg'),
(72, 'http://example.com/image214.jpg'),
(72, 'http://example.com/image215.jpg'),
(72, 'http://example.com/image216.jpg'),
(73, 'http://example.com/image217.jpg'),
(73, 'http://example.com/image218.jpg'),
(73, 'http://example.com/image219.jpg'),
(74, 'http://example.com/image220.jpg'),
(74, 'http://example.com/image221.jpg'),
(74, 'http://example.com/image222.jpg'),
(75, 'http://example.com/image223.jpg'),
(75, 'http://example.com/image224.jpg'),
(75, 'http://example.com/image225.jpg'),
(76, 'http://example.com/image226.jpg'),
(76, 'http://example.com/image227.jpg'),
(76, 'http://example.com/image228.jpg'),
(77, 'http://example.com/image229.jpg'),
(77, 'http://example.com/image230.jpg'),
(77, 'http://example.com/image231.jpg'),
(78, 'http://example.com/image232.jpg'),
(78, 'http://example.com/image233.jpg'),
(78, 'http://example.com/image234.jpg'),
(79, 'http://example.com/image235.jpg'),
(79, 'http://example.com/image236.jpg'),
(79, 'http://example.com/image237.jpg'),
(80, 'http://example.com/image238.jpg'),
(80, 'http://example.com/image239.jpg'),
(80, 'http://example.com/image240.jpg'),
(81, 'http://example.com/image241.jpg'),
(81, 'http://example.com/image242.jpg'),
(81, 'http://example.com/image243.jpg'),
(82, 'http://example.com/image244.jpg'),
(82, 'http://example.com/image245.jpg'),
(82, 'http://example.com/image246.jpg'),
(83, 'http://example.com/image247.jpg'),
(83, 'http://example.com/image248.jpg'),
(83, 'http://example.com/image249.jpg'),
(84, 'http://example.com/image250.jpg'),
(84, 'http://example.com/image251.jpg'),
(84, 'http://example.com/image252.jpg'),
(85, 'http://example.com/image253.jpg'),
(85, 'http://example.com/image254.jpg'),
(85, 'http://example.com/image255.jpg'),
(86, 'http://example.com/image256.jpg'),
(86, 'http://example.com/image257.jpg'),
(86, 'http://example.com/image258.jpg'),
(87, 'http://example.com/image259.jpg'),
(87, 'http://example.com/image260.jpg'),
(87, 'http://example.com/image261.jpg'),
(88, 'http://example.com/image262.jpg'),
(88, 'http://example.com/image263.jpg'),
(88, 'http://example.com/image264.jpg'),
(89, 'http://example.com/image265.jpg'),
(89, 'http://example.com/image266.jpg'),
(89, 'http://example.com/image267.jpg'),
(90, 'http://example.com/image268.jpg'),
(90, 'http://example.com/image269.jpg'),
(90, 'http://example.com/image270.jpg'),
(91, 'http://example.com/image271.jpg'),
(91, 'http://example.com/image272.jpg'),
(91, 'http://example.com/image273.jpg'),
(92, 'http://example.com/image274.jpg'),
(92, 'http://example.com/image275.jpg'),
(92, 'http://example.com/image276.jpg'),
(93, 'http://example.com/image277.jpg'),
(93, 'http://example.com/image278.jpg'),
(93, 'http://example.com/image279.jpg'),
(94, 'http://example.com/image280.jpg'),
(94, 'http://example.com/image281.jpg'),
(94, 'http://example.com/image282.jpg'),
(95, 'http://example.com/image283.jpg'),
(95, 'http://example.com/image284.jpg'),
(95, 'http://example.com/image285.jpg'),
(96, 'http://example.com/image286.jpg'),
(96, 'http://example.com/image287.jpg'),
(96, 'http://example.com/image288.jpg'),
(97, 'http://example.com/image289.jpg'),
(97, 'http://example.com/image290.jpg'),
(97, 'http://example.com/image291.jpg'),
(98, 'http://example.com/image292.jpg'),
(98, 'http://example.com/image293.jpg'),
(98, 'http://example.com/image294.jpg'),
(99, 'http://example.com/image295.jpg'),
(99, 'http://example.com/image296.jpg'),
(99, 'http://example.com/image297.jpg'),
(100, 'http://example.com/image298.jpg'),
(100, 'http://example.com/image299.jpg'),
(100, 'http://example.com/image300.jpg'),
(101, 'http://example.com/image301.jpg'),
(101, 'http://example.com/image302.jpg'),
(101, 'http://example.com/image303.jpg'),
(102, 'http://example.com/image304.jpg'),
(102, 'http://example.com/image305.jpg'),
(102, 'http://example.com/image306.jpg'),
(103, 'http://example.com/image307.jpg'),
(103, 'http://example.com/image308.jpg'),
(103, 'http://example.com/image309.jpg'),
(104, 'http://example.com/image310.jpg'),
(104, 'http://example.com/image311.jpg'),
(104, 'http://example.com/image312.jpg'),
(105, 'http://example.com/image313.jpg'),
(105, 'http://example.com/image314.jpg'),
(105, 'http://example.com/image315.jpg'),
(106, 'http://example.com/image316.jpg'),
(106, 'http://example.com/image317.jpg'),
(106, 'http://example.com/image318.jpg'),
(107, 'http://example.com/image319.jpg'),
(107, 'http://example.com/image320.jpg'),
(107, 'http://example.com/image321.jpg'),
(108, 'http://example.com/image322.jpg'),
(108, 'http://example.com/image323.jpg'),
(108, 'http://example.com/image324.jpg'),
(109, 'http://example.com/image325.jpg'),
(109, 'http://example.com/image326.jpg'),
(109, 'http://example.com/image327.jpg'),
(110, 'http://example.com/image328.jpg'),
(110, 'http://example.com/image329.jpg'),
(110, 'http://example.com/image330.jpg'),
(111, 'http://example.com/image331.jpg'),
(111, 'http://example.com/image332.jpg'),
(111, 'http://example.com/image333.jpg'),
(112, 'http://example.com/image334.jpg'),
(112, 'http://example.com/image335.jpg'),
(112, 'http://example.com/image336.jpg'),
(113, 'http://example.com/image337.jpg'),
(113, 'http://example.com/image338.jpg'),
(113, 'http://example.com/image339.jpg'),
(114, 'http://example.com/image340.jpg'),
(114, 'http://example.com/image341.jpg'),
(114, 'http://example.com/image342.jpg'),
(115, 'http://example.com/image343.jpg'),
(115, 'http://example.com/image344.jpg'),
(115, 'http://example.com/image345.jpg'),
(116, 'http://example.com/image346.jpg'),
(116, 'http://example.com/image347.jpg'),
(116, 'http://example.com/image348.jpg'),
(117, 'http://example.com/image349.jpg'),
(117, 'http://example.com/image350.jpg'),
(117, 'http://example.com/image351.jpg'),
(118, 'http://example.com/image352.jpg'),
(118, 'http://example.com/image353.jpg'),
(118, 'http://example.com/image354.jpg'),
(119, 'http://example.com/image355.jpg'),
(119, 'http://example.com/image356.jpg'),
(119, 'http://example.com/image357.jpg'),
(120, 'http://example.com/image358.jpg'),
(120, 'http://example.com/image359.jpg'),
(120, 'http://example.com/image360.jpg'),
(121, 'http://example.com/image361.jpg'),
(121, 'http://example.com/image362.jpg'),
(121, 'http://example.com/image363.jpg'),
(122, 'http://example.com/image364.jpg'),
(122, 'http://example.com/image365.jpg'),
(122, 'http://example.com/image366.jpg'),
(123, 'http://example.com/image367.jpg'),
(123, 'http://example.com/image368.jpg'),
(123, 'http://example.com/image369.jpg'),
(124, 'http://example.com/image370.jpg'),
(124, 'http://example.com/image371.jpg'),
(124, 'http://example.com/image372.jpg'),
(125, 'http://example.com/image373.jpg'),
(125, 'http://example.com/image374.jpg'),
(125, 'http://example.com/image375.jpg'),
(126, 'http://example.com/image376.jpg'),
(126, 'http://example.com/image377.jpg'),
(126, 'http://example.com/image378.jpg'),
(127, 'http://example.com/image379.jpg'),
(127, 'http://example.com/image380.jpg'),
(127, 'http://example.com/image381.jpg'),
(128, 'http://example.com/image382.jpg'),
(128, 'http://example.com/image383.jpg'),
(128, 'http://example.com/image384.jpg'),
(129, 'http://example.com/image385.jpg'),
(129, 'http://example.com/image386.jpg'),
(129, 'http://example.com/image387.jpg'),
(130, 'http://example.com/image388.jpg'),
(130, 'http://example.com/image389.jpg'),
(130, 'http://example.com/image390.jpg'),
(131, 'http://example.com/image391.jpg'),
(131, 'http://example.com/image392.jpg'),
(131, 'http://example.com/image393.jpg'),
(132, 'http://example.com/image394.jpg'),
(132, 'http://example.com/image395.jpg'),
(132, 'http://example.com/image396.jpg'),
(133, 'http://example.com/image397.jpg'),
(133, 'http://example.com/image398.jpg'),
(133, 'http://example.com/image399.jpg'),
(134, 'http://example.com/image400.jpg'),
(134, 'http://example.com/image401.jpg'),
(134, 'http://example.com/image402.jpg'),
(135, 'http://example.com/image403.jpg'),
(135, 'http://example.com/image404.jpg'),
(135, 'http://example.com/image405.jpg'),
(136, 'http://example.com/image406.jpg'),
(136, 'http://example.com/image407.jpg'),
(136, 'http://example.com/image408.jpg'),
(137, 'http://example.com/image409.jpg'),
(137, 'http://example.com/image410.jpg'),
(137, 'http://example.com/image411.jpg'),
(138, 'http://example.com/image412.jpg'),
(138, 'http://example.com/image413.jpg'),
(138, 'http://example.com/image414.jpg'),
(139, 'http://example.com/image415.jpg'),
(139, 'http://example.com/image416.jpg'),
(139, 'http://example.com/image417.jpg'),
(140, 'http://example.com/image418.jpg'),
(140, 'http://example.com/image419.jpg'),
(140, 'http://example.com/image420.jpg'),
(141, 'http://example.com/image421.jpg'),
(141, 'http://example.com/image422.jpg'),
(141, 'http://example.com/image423.jpg'),
(142, 'http://example.com/image424.jpg'),
(142, 'http://example.com/image425.jpg'),
(142, 'http://example.com/image426.jpg'),
(143, 'http://example.com/image427.jpg'),
(143, 'http://example.com/image428.jpg'),
(143, 'http://example.com/image429.jpg'),
(144, 'http://example.com/image430.jpg'),
(144, 'http://example.com/image431.jpg'),
(144, 'http://example.com/image432.jpg'),
(145, 'http://example.com/image433.jpg'),
(145, 'http://example.com/image434.jpg'),
(145, 'http://example.com/image435.jpg'),
(146, 'http://example.com/image436.jpg'),
(146, 'http://example.com/image437.jpg'),
(146, 'http://example.com/image438.jpg'),
(147, 'http://example.com/image439.jpg'),
(147, 'http://example.com/image440.jpg'),
(147, 'http://example.com/image441.jpg'),
(148, 'http://example.com/image442.jpg'),
(148, 'http://example.com/image443.jpg'),
(148, 'http://example.com/image444.jpg'),
(149, 'http://example.com/image445.jpg'),
(149, 'http://example.com/image446.jpg'),
(149, 'http://example.com/image447.jpg'),
(150, 'http://example.com/image448.jpg'),
(150, 'http://example.com/image449.jpg'),
(150, 'http://example.com/image450.jpg'),
(151, 'http://example.com/image451.jpg'),
(151, 'http://example.com/image452.jpg'),
(151, 'http://example.com/image453.jpg'),
(152, 'http://example.com/image454.jpg'),
(152, 'http://example.com/image455.jpg'),
(152, 'http://example.com/image456.jpg'),
(153, 'http://example.com/image457.jpg'),
(153, 'http://example.com/image458.jpg'),
(153, 'http://example.com/image459.jpg'),
(154, 'http://example.com/image460.jpg'),
(154, 'http://example.com/image461.jpg'),
(154, 'http://example.com/image462.jpg'),
(155, 'http://example.com/image463.jpg'),
(155, 'http://example.com/image464.jpg'),
(155, 'http://example.com/image465.jpg'),
(156, 'http://example.com/image466.jpg'),
(156, 'http://example.com/image467.jpg'),
(156, 'http://example.com/image468.jpg'),
(157, 'http://example.com/image469.jpg'),
(157, 'http://example.com/image470.jpg'),
(157, 'http://example.com/image471.jpg'),
(158, 'http://example.com/image472.jpg'),
(158, 'http://example.com/image473.jpg'),
(158, 'http://example.com/image474.jpg'),
(159, 'http://example.com/image475.jpg'),
(159, 'http://example.com/image476.jpg'),
(159, 'http://example.com/image477.jpg'),
(160, 'http://example.com/image478.jpg'),
(160, 'http://example.com/image479.jpg'),
(160, 'http://example.com/image480.jpg'),
(161, 'http://example.com/image481.jpg'),
(161, 'http://example.com/image482.jpg'),
(161, 'http://example.com/image483.jpg'),
(162, 'http://example.com/image484.jpg'),
(162, 'http://example.com/image485.jpg'),
(162, 'http://example.com/image486.jpg'),
(163, 'http://example.com/image487.jpg'),
(163, 'http://example.com/image488.jpg'),
(163, 'http://example.com/image489.jpg'),
(164, 'http://example.com/image490.jpg'),
(164, 'http://example.com/image491.jpg'),
(164, 'http://example.com/image492.jpg'),
(165, 'http://example.com/image493.jpg'),
(165, 'http://example.com/image494.jpg'),
(165, 'http://example.com/image495.jpg'),
(166, 'http://example.com/image496.jpg'),
(166, 'http://example.com/image497.jpg'),
(166, 'http://example.com/image498.jpg'),
(167, 'http://example.com/image499.jpg'),
(167, 'http://example.com/image500.jpg'),
(167, 'http://example.com/image501.jpg'),
(168, 'http://example.com/image502.jpg'),
(168, 'http://example.com/image503.jpg'),
(168, 'http://example.com/image504.jpg'),
(169, 'http://example.com/image505.jpg'),
(169, 'http://example.com/image506.jpg'),
(169, 'http://example.com/image507.jpg'),
(170, 'http://example.com/image508.jpg'),
(170, 'http://example.com/image509.jpg'),
(170, 'http://example.com/image510.jpg'),
(171, 'http://example.com/image511.jpg'),
(171, 'http://example.com/image512.jpg'),
(171, 'http://example.com/image513.jpg'),
(172, 'http://example.com/image514.jpg'),
(172, 'http://example.com/image515.jpg'),
(172, 'http://example.com/image516.jpg'),
(173, 'http://example.com/image517.jpg'),
(173, 'http://example.com/image518.jpg'),
(173, 'http://example.com/image519.jpg'),
(174, 'http://example.com/image520.jpg'),
(174, 'http://example.com/image521.jpg'),
(174, 'http://example.com/image522.jpg'),
(175, 'http://example.com/image523.jpg'),
(175, 'http://example.com/image524.jpg'),
(175, 'http://example.com/image525.jpg'),
(176, 'http://example.com/image526.jpg'),
(176, 'http://example.com/image527.jpg'),
(176, 'http://example.com/image528.jpg'),
(177, 'http://example.com/image529.jpg'),
(177, 'http://example.com/image530.jpg'),
(177, 'http://example.com/image531.jpg'),
(178, 'http://example.com/image532.jpg'),
(178, 'http://example.com/image533.jpg'),
(178, 'http://example.com/image534.jpg'),
(179, 'http://example.com/image535.jpg'),
(179, 'http://example.com/image536.jpg'),
(179, 'http://example.com/image537.jpg'),
(180, 'http://example.com/image538.jpg'),
(180, 'http://example.com/image539.jpg'),
(180, 'http://example.com/image540.jpg'),
(181, 'http://example.com/image541.jpg'),
(181, 'http://example.com/image542.jpg'),
(181, 'http://example.com/image543.jpg'),
(182, 'http://example.com/image544.jpg'),
(182, 'http://example.com/image545.jpg'),
(182, 'http://example.com/image546.jpg'),
(183, 'http://example.com/image547.jpg'),
(183, 'http://example.com/image548.jpg'),
(183, 'http://example.com/image549.jpg'),
(184, 'http://example.com/image550.jpg'),
(184, 'http://example.com/image551.jpg'),
(184, 'http://example.com/image552.jpg'),
(185, 'http://example.com/image553.jpg'),
(185, 'http://example.com/image554.jpg'),
(185, 'http://example.com/image555.jpg'),
(186, 'http://example.com/image556.jpg'),
(186, 'http://example.com/image557.jpg'),
(186, 'http://example.com/image558.jpg'),
(187, 'http://example.com/image559.jpg'),
(187, 'http://example.com/image560.jpg'),
(187, 'http://example.com/image561.jpg'),
(188, 'http://example.com/image562.jpg'),
(188, 'http://example.com/image563.jpg'),
(188, 'http://example.com/image564.jpg'),
(189, 'http://example.com/image565.jpg'),
(189, 'http://example.com/image566.jpg'),
(189, 'http://example.com/image567.jpg'),
(190, 'http://example.com/image568.jpg'),
(190, 'http://example.com/image569.jpg'),
(190, 'http://example.com/image570.jpg'),
(191, 'http://example.com/image571.jpg'),
(191, 'http://example.com/image572.jpg'),
(191, 'http://example.com/image573.jpg'),
(192, 'http://example.com/image574.jpg'),
(192, 'http://example.com/image575.jpg'),
(192, 'http://example.com/image576.jpg'),
(193, 'http://example.com/image577.jpg'),
(193, 'http://example.com/image578.jpg'),
(193, 'http://example.com/image579.jpg'),
(194, 'http://example.com/image580.jpg'),
(194, 'http://example.com/image581.jpg'),
(194, 'http://example.com/image582.jpg'),
(195, 'http://example.com/image583.jpg'),
(195, 'http://example.com/image584.jpg'),
(195, 'http://example.com/image585.jpg'),
(196, 'http://example.com/image586.jpg'),
(196, 'http://example.com/image587.jpg'),
(196, 'http://example.com/image588.jpg'),
(197, 'http://example.com/image589.jpg'),
(197, 'http://example.com/image590.jpg'),
(197, 'http://example.com/image591.jpg'),
(198, 'http://example.com/image592.jpg'),
(198, 'http://example.com/image593.jpg'),
(198, 'http://example.com/image594.jpg'),
(199, 'http://example.com/image595.jpg'),
(199, 'http://example.com/image596.jpg'),
(199, 'http://example.com/image597.jpg'),
(200, 'http://example.com/image598.jpg'),
(200, 'http://example.com/image599.jpg'),
(200, 'http://example.com/image600.jpg');

UPDATE popup SET category_id = 1;
