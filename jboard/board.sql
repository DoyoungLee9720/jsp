# 날짜 : 2024/08/19
# 이름 : 이도영
# 내용 : JSP 게시판 프로젝트 실습하기

# 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS `board`;
USE `board`;

# 사용자 생성

CREATE USER 'jboard'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `board`.* TO 'jboard'@'%';
FLUSH PRIVILEGES;
#테이블 생성
CREATE TABLE `user`(
	`uid`			VARCHAR(20) PRIMARY KEY,
	`pass`		VARCHAR(100),
	`name`		VARCHAR(20),
	`nick`		VARCHAR(20) UNIQUE,
	`email`		VARCHAR(50) UNIQUE,
	`hp`			CHAR(13) UNIQUE,
	`role`		VARCHAR(20) DEFAULT 'USER',
	`zip`			CHAR(5),
	`addr1`		VARCHAR(255),
	`addr2`		VARCHAR(255),
	`regip`		VARCHAR(100),
	`regDate`	datetime,
	`leaveDate`	datetime
);

CREATE TABLE `terms`(
	`terms`		TEXT, #대용량 자료형
	`privacy`	TEXT
);

CREATE TABLE `article`(
	`no`			INT AUTO_INCREMENT PRIMARY KEY ,
	`cate`		VARCHAR(20) DEFAULT 'free',
	`title`		VARCHAR(100) NOT NULL,
	`content`	TEXT NOT NULL,
	`comment`	INT DEFAULT 0,
	`file`		TINYINT DEFAULT 0,
	`hit`			INT DEFAULT 0,
	`writer`		VARCHAR(20) NOT NULL,
	`regip`		VARCHAR(100) NOT NULL,
	`rdate`		DATETIME,
	FOREIGN KEY(`writer`) REFERENCES `user`(`uid`)
);