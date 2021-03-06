
insert into memb_t(nicknm, email, pwd, name, addr, lat, lon)
values('test01nickname', 'test01@test.com', '1234', 'test01name', '서울시 강남구 test1구', '37.497129', '127.027612');
insert into memb_t(nicknm, email, pwd, name, addr, lat, lon)
values('test02nickname', 'test02@test.com', '1234', 'test02name', '서울시 강남구 test2구', '37.496708', '127.026865');
insert into memb_t(nicknm, email, pwd, name, addr, lat, lon)
values('test03nickname', 'test03@test.com', '1234', 'test03name', '서울시 강남구 test3구', '37.498308', '127.026312');
insert into memb_t(nicknm, email, pwd, name, addr, lat, lon)
values('test04nickname', 'test04@test.com', '1234', 'test04name', '서울시 강남구 test4구', '37.497380', '127.027294');
insert into memb_t(nicknm, email, pwd, name, addr, lat, lon)
values('test05nickname', 'test05@test.com', '1234', 'test05name', '서울시 강남구 test5구', '37.498674', '127.028249');


insert into feed_t (mno, categry, contnt, cre_dt, title)
values ('1', '1', 'this is a content test1', '2000/1/1', 'this is a title test1');
insert into feed_t (mno, categry, contnt, cre_dt, title)
values ('1', '1', 'this is a content test2', '2000/1/2', 'this is a title test2');
insert into feed_t (mno, categry, contnt, cre_dt, title)
values ('2', '1', 'this is a content test3', '2000/1/3', 'this is a title test3');
insert into feed_t (mno, categry, contnt, cre_dt, title)
values ('2', '2', 'this is a content test4', '2000/1/4', 'this is a title test4');
insert into feed_t (mno, categry, contnt, cre_dt, title)
values ('3', '2', 'this is a content test5', '2000/1/5', 'this is a title test5');
insert into feed_t (mno, categry, contnt, cre_dt, title)
values ('3', '2', 'this is a content test6', '2000/1/6', 'this is a title test6');
insert into feed_t (mno, categry, contnt, cre_dt, title)
values ('3', '3', 'this is a content test7', '2000/1/7', 'this is a title test7');
insert into feed_t (mno, categry, contnt, cre_dt, title)
values ('4', '3', 'this is a content test8', '2000/1/8', 'this is a title test8');



-- MEMB_T
DROP TABLE IF EXISTS MEMB_T RESTRICT;

-- 참여친구
DROP TABLE IF EXISTS TABLE5 RESTRICT;

-- FEED_T
DROP TABLE IF EXISTS FEED_T RESTRICT;

-- 친구
DROP TABLE IF EXISTS TABLE7 RESTRICT;

-- 내지도
DROP TABLE IF EXISTS TABLE8 RESTRICT;

-- 채팅
DROP TABLE IF EXISTS TABLE14 RESTRICT;

-- FEED_PHOTOS
DROP TABLE IF EXISTS FPHOTO_T RESTRICT;

-- HOBBY_T
DROP TABLE IF EXISTS HOBBY_T RESTRICT;

-- MEMB_T
CREATE TABLE MEMB_T (
  MNO     INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  NICKNM  VARCHAR(50)  NOT NULL COMMENT '닉네임', -- 닉네임
  EMAIL   VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
  PWD     VARCHAR(50)  NOT NULL COMMENT '비밀번호', -- 비밀번호
  NAME    VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
  ADDR    VARCHAR(255) NOT NULL COMMENT '주소', -- 주소
  LAT     varchar(100) NOT NULL COMMENT '위도', -- 위도
  LON     varchar(100) NOT NULL COMMENT '경도', -- 경도
  HOMETWN varchar(100) NULL     COMMENT '출신지', -- 출신지
  SEX     INTEGER      NULL     COMMENT '성별', -- 성별
  MPHOTO  VARCHAR(100) NULL     COMMENT '사진경로', -- 사진경로
  CRE_DT  DATETIME     NULL     COMMENT '가입일' -- 가입일
)
COMMENT 'MEMB_T';

-- MEMB_T
ALTER TABLE MEMB_T
  ADD CONSTRAINT PK_MEMB_T -- MEMB_T Primary key
    PRIMARY KEY (
      MNO -- 회원번호
    );

-- MEMB_T Unique Index
CREATE UNIQUE INDEX UIX_MEMB_T
  ON MEMB_T ( -- MEMB_T
    EMAIL ASC,  -- 이메일
    NICKNM ASC  -- 닉네임
  );

ALTER TABLE MEMB_T
  MODIFY COLUMN MNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 참여친구
CREATE TABLE TABLE5 (
  FNO INTEGER NOT NULL COMMENT '글번호', -- 글번호
  MNO INTEGER NOT NULL COMMENT '회원번호' -- 회원번호
)
COMMENT '참여친구';

-- 참여친구
ALTER TABLE TABLE5
  ADD CONSTRAINT PK_TABLE5 -- 참여친구 기본키
    PRIMARY KEY (
      FNO, -- 글번호
      MNO  -- 회원번호
    );

-- FEED_T
CREATE TABLE FEED_T (
  FNO         INTEGER     NOT NULL COMMENT '글번호', -- 글번호
  MNO         INTEGER     NOT NULL COMMENT '회원번호', -- 회원번호
  CATEGRY     INTEGER     NOT NULL COMMENT '카테고리', -- 카테고리
  CONTNT      MEDIUMTEXT  NOT NULL COMMENT '글내용', -- 글내용
  CRE_DT      DATETIME    NOT NULL COMMENT '등록일', -- 등록일
  TITLE       VARCHAR(50) NOT NULL COMMENT '글제목', -- 글제목
  MAX_HEADCNT INTEGER     NULL     COMMENT '최대참여인원', -- 최대참여인원
  CNT         INTEGER     NULL     COMMENT '갯수', -- 갯수
  MEET_TIME   DATETIME    NULL     COMMENT '약속시간' -- 약속시간
)
COMMENT 'FEED_T';

-- FEED_T
ALTER TABLE FEED_T
  ADD CONSTRAINT PK_FEED_T -- FEED_T Primary key
    PRIMARY KEY (
      FNO -- 글번호
    );

ALTER TABLE FEED_T
  MODIFY COLUMN FNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '글번호';

-- 친구
CREATE TABLE TABLE7 (
  MNO2 INTEGER  NOT NULL COMMENT '회원1', -- 회원1
  MNO  INTEGER  NOT NULL COMMENT '회원2', -- 회원2
  COL3 INTEGER  NOT NULL COMMENT '상태', -- 상태
  COL4 DATETIME NOT NULL COMMENT '날짜' -- 날짜
)
COMMENT '친구';

-- 친구
ALTER TABLE TABLE7
  ADD CONSTRAINT PK_TABLE7 -- 친구 Primary key
    PRIMARY KEY (
      MNO2, -- 회원1
      MNO   -- 회원2
    );

-- 친구 Unique Index
CREATE UNIQUE INDEX UIX_TABLE7
  ON TABLE7 ( -- 친구
    MNO2 ASC -- 회원1
  );

-- 내지도
CREATE TABLE TABLE8 (
  COL2 INTEGER      NOT NULL COMMENT '지도번호', -- 지도번호
  MNO  INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  COL3 FLOAT        NULL     COMMENT '마커위도', -- 마커위도
  COL4 FLOAT        NULL     COMMENT '마커경도', -- 마커경도
  COL5 varchar(100) NULL     COMMENT '마커제목', -- 마커제목
  COL6 MEDIUMTEXT   NULL     COMMENT '마커내용', -- 마커내용
  COL7 VARCHAR(100) NULL     COMMENT '마커사진' -- 마커사진
)
COMMENT '내지도';

-- 내지도
ALTER TABLE TABLE8
  ADD CONSTRAINT PK_TABLE8 -- 내지도 기본키
    PRIMARY KEY (
      COL2 -- 지도번호
    );

-- 채팅
CREATE TABLE TABLE14 (
  COL  INTEGER NULL COMMENT '회원번호', -- 회원번호
  COL2 INTEGER NULL COMMENT '친구번호', -- 친구번호
  COL3 INTEGER NULL COMMENT '글번호' -- 글번호
)
COMMENT '채팅';

-- FEED_PHOTOS
CREATE TABLE FPHOTO_T (
  FNO    INTEGER      NULL COMMENT '글번호', -- 글번호
  FPHOTO VARCHAR(100) NULL COMMENT '사진' -- 사진
)
COMMENT 'FEED_PHOTOS';

-- HOBBY_T
CREATE TABLE HOBBY_T (
  MNO   INTEGER     NULL COMMENT '회원번호', -- 회원번호
  HOBBY VARCHAR(13) NULL COMMENT '취미' -- 취미
)
COMMENT 'HOBBY_T';

-- 참여친구
ALTER TABLE TABLE5
  ADD CONSTRAINT FK_FEED_T_TO_TABLE5 -- FEED_T -> 참여친구
    FOREIGN KEY (
      FNO -- 글번호
    )
    REFERENCES FEED_T ( -- FEED_T
      FNO -- 글번호
    );

-- 참여친구
ALTER TABLE TABLE5
  ADD CONSTRAINT FK_MEMB_T_TO_TABLE5 -- MEMB_T -> 참여친구
    FOREIGN KEY (
      MNO -- 회원번호
    )
    REFERENCES MEMB_T ( -- MEMB_T
      MNO -- 회원번호
    );

-- FEED_T
ALTER TABLE FEED_T
  ADD CONSTRAINT FK_MEMB_T_TO_FEED_T -- MEMB_T -> FEED_T
    FOREIGN KEY (
      MNO -- 회원번호
    )
    REFERENCES MEMB_T ( -- MEMB_T
      MNO -- 회원번호
    );

-- 친구
ALTER TABLE TABLE7
  ADD CONSTRAINT FK_MEMB_T_TO_TABLE7 -- MEMB_T -> 친구2
    FOREIGN KEY (
      MNO2 -- 회원1
    )
    REFERENCES MEMB_T ( -- MEMB_T
      MNO -- 회원번호
    );

-- 친구
ALTER TABLE TABLE7
  ADD CONSTRAINT FK_MEMB_T_TO_TABLE72 -- MEMB_T -> 친구
    FOREIGN KEY (
      MNO -- 회원2
    )
    REFERENCES MEMB_T ( -- MEMB_T
      MNO -- 회원번호
    );

-- 내지도
ALTER TABLE TABLE8
  ADD CONSTRAINT FK_MEMB_T_TO_TABLE8 -- MEMB_T -> 내지도
    FOREIGN KEY (
      MNO -- 회원번호
    )
    REFERENCES MEMB_T ( -- MEMB_T
      MNO -- 회원번호
    );

-- FEED_PHOTOS
ALTER TABLE FPHOTO_T
  ADD CONSTRAINT FK_FEED_T_TO_FPHOTO_T -- FEED_T -> FEED_PHOTOS
    FOREIGN KEY (
      FNO -- 글번호
    )
    REFERENCES FEED_T ( -- FEED_T
      FNO -- 글번호
    );

-- HOBBY_T
ALTER TABLE HOBBY_T
  ADD CONSTRAINT FK_MEMB_T_TO_HOBBY_T -- MEMB_T -> HOBBY_T
    FOREIGN KEY (
      MNO -- 회원번호
    )
    REFERENCES MEMB_T ( -- MEMB_T
      MNO -- 회원번호
    );

