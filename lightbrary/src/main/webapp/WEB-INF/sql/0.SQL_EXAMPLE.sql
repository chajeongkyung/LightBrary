--회원가입
INSERT INTO MEMBER
VALUE(NO, GRADE_CODE, NAME, PHONE, EMAIL, PASSWORD, ADDRESS)
VALUES(MEMBER_NO_SEQ.NEXTVAL, 1, '윤형식', '01054958125', 'puhahaha3000@naver.com', 'puha3000!@', '경기도 수원시 영통구 청명북로33, 434동 1901호');

--로그인
SELECT * FROM MEMBER
WHERE EMAIL = 'puhahaha3000@naver.com'
AND PASSWORD = 'puha3000!@';

--이메일찾기
SELECT EMAIL FROM MEMBER
WHERE NAME = '윤형식'
AND PHONE = '01054958125';

--비밀번호초기화
UPDATE MEMBER SET PASSWORD='1234!@#$'
WHERE EMAIL='puhahaha3000@naver.com';

--회원검색
SELECT NO, NAME, PHONE, EMAIL, CREATED_DATE
FROM MEMBER
WHERE NAME LIKE '%형식%'
AND EMAIL LIKE '%puha%'
AND CREATED_DATE BETWEEN
TO_DATE('20200501', 'YYYYMMDD')
AND TO_DATE('20200630', 'YYYYMMDD');

--회원탈퇴
UPDATE MEMBER SET DEL_FLAG='Y'
WHERE NO=103;

--도서 등록
INSERT INTO BOOK
VALUE(NO, STATUS_CODE, CATEGORY_CODE, IMAGE_NO, NAME, PUBLISH, PUBLISH_DATE, WRITER, DEL_FLAG)
VALUES(BOOK_NO_SEQ.NEXTVAL, '0', '823', '0', '임계장 이야기', '휴마니터스', '2020-03-30', '조정진', 'N');

--도서 수정
UPDATE BOOK
SET
STATUS_CODE=(SELECT CODE FROM BOOK_STATUS WHERE NAME='파손')
WHERE NO=15196;

--도서 조회
SELECT *
FROM BOOK
WHERE NAME LIKE '%임계장%'
AND WRITER LIKE '%조정진%'
AND PUBLISH LIKE '%휴마%'
AND PUBLISH_DATE BETWEEN TO_DATE('20200301', 'YYYYMMDD') AND TO_DATE('20200430', 'YYYYMMDD')
AND CATEGORY_CODE LIKE '8__';

--특정 상태의 도서 조회
SELECT *
FROM BOOK B
JOIN BOOK_STATUS BS
ON B.STATUS_CODE = BS.CODE
WHERE BS.NAME = '파손';

--대출예약
UPDATE BOOK
SET
STATUS_CODE = (SELECT CODE FROM BOOK_STATUS WHERE NAME='예약')
WHERE NO=15196;

INSERT INTO RENT
VALUE(NO, MEMBER_NO, BOOK_NO, RESERVE_DATE)
VALUES(RENT_NO_SEQ.NEXTVAL, 103, 15196, SYSDATE);

--예약도서 대출로 변경
UPDATE BOOK
SET
STATUS_CODE = (SELECT CODE FROM BOOK_STATUS WHERE NAME='대출')
WHERE NO=15196;

UPDATE RENT
SET
RENT_DATE=SYSDATE,
EXPIRE_DATE=SYSDATE+7
WHERE NO=1;

--대출도서 반납처리
UPDATE BOOK
SET
STATUS_CODE = (SELECT CODE FROM BOOK_STATUS WHERE NAME='보관')
WHERE NO=15196;

UPDATE RENT
SET
RETURN_DATE = SYSDATE
WHERE NO=1;

SELECT * FROM RENT;

--대출현황조회
SELECT B.NAME, B.WRITER, B.PUBLISH, M.NAME, M.EMAIL, 
    (SELECT NAME FROM BOOK_STATUS BS WHERE B.STATUS_CODE = BS.CODE), R.RETURN_DATE
FROM RENT R
JOIN MEMBER M
ON R.MEMBER_NO = M.NO
JOIN BOOK B
ON R.BOOK_NO = B.NO;

--연체현황조회
SELECT B.NAME, M.NAME, M.EMAIL, FLOOR(SYSDATE - EXPIRE_DATE), EXPIRE_DATE
FROM RENT R
JOIN MEMBER M
ON R.MEMBER_NO = M.NO
JOIN BOOK B
ON R.BOOK_NO = B.NO
WHERE (SELECT NAME FROM BOOK_STATUS BS WHERE BS.CODE = B.STATUS_CODE) = '연체';

