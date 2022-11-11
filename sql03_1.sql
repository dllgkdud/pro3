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
INSERT INTO notice VALUES(
	1,
	"공지사항1",
	"공지사항1의 내용입니다.",
	NOW() TO_DAYS("yy-MM-dd"),
	0
);
SELECT * FROM notice;