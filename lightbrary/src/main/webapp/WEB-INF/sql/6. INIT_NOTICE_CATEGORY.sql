DELETE FROM NOTICE_CATEGORY;
INSERT INTO NOTICE_CATEGORY VALUE(CODE, NAME, SCHEDULE_FLAG) VALUES('0', '공지', 'N');
INSERT INTO NOTICE_CATEGORY VALUE(CODE, NAME, SCHEDULE_FLAG) VALUES('1', '행사', 'Y');
INSERT INTO NOTICE_CATEGORY VALUE(CODE, NAME, SCHEDULE_FLAG) VALUES('2', '휴관', 'Y');
COMMIT;
SELECT * FROM NOTICE_CATEGORY;