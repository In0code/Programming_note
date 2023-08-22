-- 사원테이블에서 사원명이 'SCOTT'인 사원보다 연봉을 많이 받는 사원의
-- 사원번호, 사원명, 입사일, 연봉조회
SELECT    EMPNO, ENAME, HIREDATE, SAL 
FROM    EMP 
WHERE  SAL > (SELECT sal FROM EMP WHERE ENAME = 'SCOTT');

-- self join은 조회용도 테이블과 조건용도 테이블을 구분하여 사용해야 한다.
SELECT   e.EMPNO, e.ENAME, e.HIREDATE, e.SAL  /*, e1.empno, e1.ename 조건용도의 테이블을 검색하지 않는다.*/
FROM    emp e, emp e1                               -- emp e는 조회 용도, emp e1은 조건 용도
WHERE   (e.sal >= e1.sal) AND (e1.ENAME = 'SCOTT');



-------------------------------------- 시퀀스 생성 --------------------------------------------------------------
-- 1~ 99999까지 1씩 중가하는 시퀀스 생성
CREATE SEQUENCE test_seq
START WITH 1
MAXVALUE 99999
INCREMENT BY 1;

SELECT    *
FROM    user_sequences;

-- currval 현재번호 : 시퀀스를 메모리에 올리는 일은 할 수 없다.
SELECT      test_seq.currval
FROM       dual;

-- nextval 다음번호 : 시퀀스가 메모리에 존재하지 않으면 메모리에 올리고, 다음 번호를 얻을 수 있다.
SELECT test_seq.nextval
FROM dual;

DROP SEQUENCE test_seq;

SELECT *
FROM user_sequences;

--10~9999990까지10씩 증가하는 시퀀스 생성. 메모르에 100씩 , 수가 모두 사용되면 ㅏㄴ복 실행
CREATE SEQUENCE test_seq
INCREMENT BY 10
START WITH 10
MAXVALUE 9999990
cache 100
CYCLE;

SELECT test_seq.nextval
FROM dual;

SELECT *
FROM user_sequences;

--insert 할 때 주로 사용
CREATE TABLE use_sequence(
num NUMBER,
name varchar2(30),
CONSTRAINT pk_use_sequence PRIMARY KEY (num)
);

--insert 할 때 사용하는 sequence 생성
CREATE SEQUENCE use_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 999999999
CYCLE;

--sequence를 사용한 insert 
--insert에 시퀀스는 insert문에서 oracle 11g부터 select없이 바로 사용 O
INSERT INTO use_sequence (num, name) values(use_seq.nextval, '강다연');

INSERT INTO use_sequence (num, name) values(use_seq.nextval, '김다영');

INSERT INTO use_sequence (num, name) values(use_seq.nextval, '김인영');

SELECT *
FROM use_sequence;


CREATE TABLE user_sequence2(
num char(8),
name varchar2(30),
CONSTRAINT pk_use_sequence2 PRIMARY KEY (num)
);

--use_sequence2 테이블에 아래와 같은 형태의 증가하는 문자열 추가
--증가하는 수는 use_seq 시퀀스를 사용
--번호 : s_000001, 이름 : 김주민, 다음번으로 박상준, 다음번으로 박서현

INSERT INTO user_sequence2 (num, name) VALUES ('s_'||lpad(use_seq.nextval,6,0),'김주민' );
INSERT INTO user_sequence2 (num, name) VALUES (concat('s_',lpad(use_seq.nextval,6,0)),'박상준' );
INSERT INTO user_sequence2 (num, name) VALUES (concat('s_',lpad(use_seq.nextval,6,0)),'박서현' );

SELECT *
FROM USER_SEQUENCE2;
