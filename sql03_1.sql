commit;

-- test테이블
CREATE TABLE test(
	NAME VARCHAR(50),
	POINT INT
);

-- 더미데이터
INSERT INTO test VALUES(
	"이하영", 100
);
SELECT * FROM test;


-- notice테이블
CREATE TABLE notice(
	no INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(100),
	content VARCHAR(500),
	regDate DATE DEFAULT NOW(),
	visited INT DEFAULT 0
);

-- 더미데이터
INSERT INTO notice(title, content) VALUES(
	"공지사항1",
	"공지사항1의 내용입니다."
);
SELECT * FROM notice;
update notice set visited=visited+1 WHERE NO=1;


-- user테이블
CREATE TABLE user(
	id VARCHAR(30) PRIMARY KEY,
	pw VARCHAR(300) NOT NULL,
	name VARCHAR(30) NOT NULL,
	tel VARCHAR(11) NOT NULL,
	birth DATE,
	email VARCHAR(50) NOT NULL,
	addr VARCHAR(500) NOT NULL,
	grade VARCHAR(5) DEFAULT "F",
	visited INT DEFAULT 1,
	regdate DATETIME DEFAULT NOW()
);
SELECT * from user;
ALTER TABLE user modify pw VARCHAR(300);
ALTER TABLE user modify grade VARCHAR(5) DEFAULT "F";
ALTER TABLE user add regdate DATETIME DEFAULT NOW();
UPDATE user SET grade="M" WHERE id="admin";
DELETE FROM user WHERE id="test1";


-- tour테이블
CREATE TABLE tour(
	no INT PRIMARY KEY AUTO_INCREMENT,
	tourno VARCHAR(20),
	cate VARCHAR(30),
	place VARCHAR(100),
	comment1 VARCHAR(500),
	comment2 VARCHAR(500),
	imgURL VARCHAR(500)
);
SELECT * from tour;
DROP TABLE tour;


-- pic테이블
CREATE TABLE pic(
	no INT PRIMARY KEY AUTO_INCREMENT,
	pos INT,
	tourno VARCHAR(20),
	picname VARCHAR(500)
);
SELECT * from pic;
DROP TABLE pic;


-- review테이블
CREATE TABLE review(
	no INT PRIMARY KEY AUTO_INCREMENT,
	tourno VARCHAR(20),	
	cate VARCHAR(30),
	id VARCHAR(30),
	content VARCHAR(1000),
	rate DOUBLE,
	imgURL VARCHAR(500),
	regdate DATETIME DEFAULT NOW()
);
SELECT * from review;