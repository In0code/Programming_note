--여러 개의 컬럼이 하나의 PK로 구성
CREATE TABLE primary_multi(
	id varchar2(20),
	num NUMBER (6),
	name varchar2(30),
	hiredate DATE,
	CONSTRAINTS pk_primary_multi PRIMARY KEY(id, num)
);


SELECT *
FROM user_constraints
WHERE table_name='PRIMARY_MULTI';

--여러 개의 컬럼이 하나의 PK로 구성
SELECT *
FROM user_cons_columns
WHERE table_name='PRIMARY_MULTI';


-----------추가성공--------------
--최초 입력
INSERT INTO PRIMARY_MULTI (id,num,name,hiredate)
VALUES('kim',1,'김주민',sysdate);

--모든 PK컬럼에 다른 값이 들어가는 경우
INSERT INTO PRIMARY_MULTI (id,num,name,hiredate)
VALUES('kim',2,'김주민',sysdate);

INSERT INTO PRIMARY_MULTI (id,num,name,hiredate)
VALUES('park',2,'김주민',sysdate);

SELECT * FROM PRIMARY_MULTI ;

-----------추가실패--------------
--이전 레코드와 동일한 값이 입력되는 경우
INSERT INTO PRIMARY_MULTI (id,num,name,hiredate)
VALUES('kim',1,'홍찬영',sysdate+1);

--null이 입력되는 경우
--id에 null이 입력 => 컬럼명을 생략
INSERT INTO PRIMARY_MULTI (name,hiredate)
VALUES('홍찬영',sysdate+1);

--num 에 null이 입력 => 컬럼명 생략
INSERT INTO PRIMARY_MULTI (id,name,hiredate)
VALUES('hong','홍찬영',sysdate+1);

INSERT INTO PRIMARY_MULTI (id,num,name,hiredate)
VALUES('',0,'홍찬영',sysdate+1);


-----------------foreign key------------------
--자식테이블의 컬럼명은 부모테이블의 컬럼며오가 같을 필요는 없으나 대부분 같게 설정한다
--데이터형은 반드시 같아야한다
--컬럼단위제약

CREATE TABLE foreign_column(
	id varchar2(20) CONSTRAINT fk_foreign_column_id REFERENCES PRIMARY_column(id),
	age number(3)
);
COMMIT;
---------추가 성공-------------------
--부모테이블의 PK 컬럼 값으로만 추가 될때
SELECT  id,name, addr
FROM PRIMARY_COLUMN ;

INSERT INTO foreign_column(id,age) values('kim',20);
INSERT INTO foreign_column(id,age) values('kim',21);
INSERT INTO foreign_column(id,age) values('kim',22);
INSERT INTO foreign_column(id,age) values('park',22);

--null이 입력 될때
--''입력
INSERT INTO foreign_column(id,age) VALUES ('',22);

--컬럼 생략
INSERT INTO foreign_column(age) VALUES(32);

SELECT id, age 
FROM foreign_column;

---------추가실패----------------
--부모테이블에 존재하지 않는 값으로 레코드를 추가할 때
INSERT INTO foreign_column(id,age) values('hong',22);

SELECT * FROM foreign_column;

--테이블단위 제약사항
--참조컬럼명을 다르게 설정
CREATE TABLE foregin_table(
	r_id varchar2(20),
	age number(3),
	CONSTRAINT fk_foreign_table_r_id FOREIGN KEY(r_id) REFERENCES PRIMARY_table(id)
);

SELECT * 
FROM user_constraints
WHERE constraint_type='R';

--일반컬럼은 Foreign key로 참조할 수 없다
CREATE TABLE cp_emp_fk_test(
empno number(4) CONSTRAINT fk_cp_emp_empno REFERENCES cp_emp1(empno),
ZIPCODE char(7)
);

--

