--unique
--컬럼단위
CREATE TABLE unique_column(
	name varchar2(30),
	email varchar2(50) CONSTRAINT uk_unique_column_email UNIQUE
);

---------추가 성공---------------
--최초 입력 
INSERT INTO UNIQUE_COLUMN (name, email)
VALUES('박상준','park@test.com');
--다른 값으로 추가
INSERT INTO UNIQUE_COLUMN (name, email)
VALUES('박상준','kim@test.com');

--null 추가
INSERT INTO UNIQUE_COLUMN (name, email)
VALUES('박상준','');

INSERT INTO UNIQUE_COLUMN (name)
VALUES('송지하');

SELECT NAME, EMAIL
FROM UNIQUE_COLUMN;

----------추가 실패----------------
--중복값이 입력되면 추가 실패
INSERT INTO UNIQUE_COLUMN (name, email)
VALUES('홍찬영','kim@test.com');


--테이블단위
CREATE TABLE unique_table(
	name varchar2(30),
	phone varchar2(13),
	CONSTRAINT uk_unique_table_phone unique(phone)
);

-----------unique로 FK설정--------------------
CREATE TABLE FOREIGN_unique(
email varchar2(50) CONSTRAINT fk_foreign_unique_email REFERENCES unique_column(email)
);

SELECT EMAIL
FROM FOREIGN_UNIQUE;


------------추가성공--------------------
--부모테이블에 존재하는 값으로만 추가
INSERT INTO FOREIGN_UNIQUE (email) VALUES ('park@test.com');
INSERT INTO FOREIGN_UNIQUE (email) VALUES ('kim@test.com');

--null입력
INSERT INTO FOREIGN_UNIQUE (email) VALUES ('');


------------추가실패-------------------
--부모테이블에 존재하지 않는 값으로 추가
INSERT INTO FOREIGN_UNIQUE (email)
VALUES ('1011kiy@test.com');


------------check not null default-------------------
--나이 : 20~30대까지만 입력가능, 이름 : 반드시 입력해야되고, 
--입력일 : 컬럼이 생략되면 현재 날짜로 입력
CREATE TABLE other_constraints(
	age number(2) CHECK (age>=20 AND age<40),
	name varchar2(30) NOT null,
	input_date DATE DEFAULT SYSDATE 
);

SELECT *
FROM user_constraints
WHERE constraint_type='C';

SELECT *
FROM USER_tab_cols 
WHERE table_name='OTHER_CONSTRAINTS';

---------------추가성공--------------------
--나이가 20~30대이고, 이름이 있고, 입력일이 있는 경우

INSERT INTO OTHER_CONSTRAINTS (age,name, INPUT_DATE) 
values(25,'홍찬영','2023-08-06');

--나이가 20~30대이고, 이름이 있고, 입력일이 생략인 경우(default)
INSERT INTO OTHER_CONSTRAINTS (age,name) 
values(25,'홍찬영');

---------------추가실패--------------------
--나이가 20~30대가 아닌경우
INSERT INTO OTHER_CONSTRAINTS (age,name) 
values(19,'홍찬영');

--이름에 null이 추가되는 경우
INSERT INTO OTHER_CONSTRAINTS (age, name) 
values(25,'');

INSERT INTO OTHER_CONSTRAINTS (age) 
values(25);

SELECT AGE, NAME, INPUT_DATE
FROM OTHER_CONSTRAINTS;



