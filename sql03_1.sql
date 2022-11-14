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
	pw VARCHAR(50) NOT NULL,
	name VARCHAR(30) NOT NULL,
	tel VARCHAR(11) NOT NULL,
	bitrh VARCHAR(8) NOT NULL,
	email VARCHAR(50) NOT NULL,
	address VARCHAR(500) NOT NULL,
	grade VARCHAR(5),
	visited INT DEFAULT 1
);
DESC user;

-- 더미데이터
INSERT INTO user(id, pw, name, tel, birth, email, address) VALUES("admin","1234","관리자","01011111111","20221114","admin@naver.com","website");