CREATE TABLE HR.T_BOARD (
  NO          NUMBER(6)          primary key, 
  TITLE       VARCHAR2(200)      NOT NULL, 
  WRITER      VARCHAR2(30)       NOT NULL, 
  CONTENT     VARCHAR2(4000)     NOT NULL, 
  VIEW_CNT    NUMBER(6)          DEFAULT 0, 
  REG_DATE    DATE               DEFAULT sysdate
);

SELECT * FROM T_BOARD;

CREATE SEQUENCE SEQ_T_BOARD_NO; 
SELECT SEQ_T_BOARD_NO.NEXTVAL FROM dual;

-- 20번정도 실행합니다.(페이징을 위한 기본 데이터 생성)
INSERT INTO T_BOARD(
	NO, title, 
	writer, content
) values (
    SEQ_T_BOARD_NO.NEXTVAL, 'title' || SEQ_T_BOARD_NO.CURRVAL, 
    'writer' || SEQ_T_BOARD_NO.CURRVAL, 'content' || SEQ_T_BOARD_NO.CURRVAL
);