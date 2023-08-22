----------------1-------------------
CREATE TABLE cp_zipcode AS
(SELECT * FROM zipcode);
ALTER TABLE CP_ZIPCODE ADD CONSTRAINT pk_cp_zipcode PRIMARY key(seq);

SELECT ZIPCODE, SIDO, GUGUN, DONG, BUNJI, SEQ
FROM CP_ZIPCODE;
COMMIT;
ㅏ
----------------2-------------------
CREATE TABLE work_0807(
	num number(10)  ,
	id varchar2(50) PRIMARY KEY ,
	name varchar2(10) NOT NULL,
	addr_seq number(30) CONSTRAINTS fk_work_name REFERENCES cp_zipcode(seq),
	phone varchar2(20) CONSTRAINTS uk_work_phone unique,
	age NUMBER(10) DEFAULT 0, 
	gender char(3) CHECK (gender IN ('M','F')),
	input_date DATE DEFAULT sysdate
);
COMMIT;

SELECT * FROM WORK_0807;
----------------3-------------------
--------성공하는 경우------------
--아이디와 이름이 null이 아니여야하고,
-- 아이디가 중복되지 않고, 전화번호는 없어도 되지만 있다면 중복 안되는경우
INSERT INTO WORK_0807 (num,id,name,addr_seq,phone,gender)
values (6, 'jjang','김짱구',168,'010-1234-0839','M');

INSERT INTO WORK_0807 (num,id,name,addr_seq,gender)
values (6, 'jjang12','김짱구',168,'M');



--------실패하는 경우------------
--name이 null인 경우
INSERT INTO work_0807 (num,id,addr_seq,phone,gender)
VALUES (1, 'kim',168,'010-1234-7890','M');

INSERT INTO WORK_0807 (num,id,name,addr_seq,phone,gender)
values (1, 'kim','',168,'010-1234-7890','M');

--id가 null인 경우
INSERT INTO WORK_0807 (num,name,addr_seq,phone,gender)
values (1,'김짱구',168,'010-1234-7890','M');

INSERT INTO WORK_0807 (num,id,name,addr_seq,phone,gender)
values (1, '','김주민',168,'010-1234-7890','M');

--check 제약조건 위배 : 성별이 'M'또는 'F'가 아닌경우
INSERT INTO WORK_0807 (num,id,name,addr_seq,phone,gender)
values (1, 'kim','김짱구',168,'010-1234-7890','A');

--부모테이블에 존재하지 않는 값으로 레코드를 추가하는 경우
INSERT INTO WORK_0807 (num,id,name,addr_seq,phone,gender)
values (1, 'kim','김짱구',1542525,'010-1234-7890','M');

--id가 중복되는 경우
INSERT INTO WORK_0807 (num,id,name,addr_seq,phone,gender)
values (4, 'kim2','김짱구',1,'010-4179-2222','F');

--전화번호가 중복되는 경우
INSERT INTO WORK_0807 (num,id,name,addr_seq,phone,gender)
values (1, 'kim123','김주민',168,'010-1234-7890','M');


----------------4-------------------
INSERT INTO WORK_0807 (num,id,name,addr_seq,phone,gender)
values (1, 'kim','김주민',168,'010-1234-7890','M');
INSERT INTO WORK_0807 (num,id,name,addr_seq,phone,gender)
values (2, 'kim1','김선경',52144,'010-2234-8811','M');
INSERT INTO WORK_0807 (num,id,name,addr_seq,phone,gender)
values (3, 'lee','동원',3298,'010-8471-1345','M');
INSERT INTO WORK_0807 (num,id,name,addr_seq,phone,gender)
values (4, 'kim2','김인영',1,'010-1111-2222','F');
INSERT INTO WORK_0807 (num,id,name,addr_seq,phone,gender)
values (5, 'hong','홍지성',35000,'010-4511-3134','M');
COMMIT;

SELECT * FROM WORK_0807;
----------------5-------------------
SELECT id,name,phone,(SELECT zipcode FROM CP_ZIPCODE WHERE seq=work_0807.addr_seq) zipcode,
(SELECT sido|| gugun ||dong FROM cp_zipcode WHERE seq=work_0807.addr_seq) addr
FROM work_0807;

