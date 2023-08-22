--문자열 함수
--replace( 컬럼명, 찾을 값, 치환할 값)

SELECT REPLACE ('ABCDE','C','KK') 
FROM   dual;

SELECT replace('키보 드',' ','')
FROM dual;

--cp_emp1테이블에서 부서번호가 20번인 부서의
--사원번호, 사원명, 직무, 연봉, 부서번호를 조회
--단, cp_emp1 테이블과 emp테이블에 같은 사원의 정보(사원번호가 같다)만 조회할 것


SELECT  empno, ename,SAL , DEPTNO  
FROM  CP_EMP1 
WHERE  DEPTNO =20 AND 
EXISTS (SELECT 1 FROM emp WHERE (emp.EMPNO) = (cp_emp1.EMPNO));

SELECT * FROM cp_emp1;

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP;




-------------------primary key-------------------
--컬럼에서 null을 허용하지 않으면서 값이 유일해야 할 때 사용
--아이디, 이름, 주소를 저장하는 테이블 생성
--컬럼단위
--테이블의 컬럼은 기본속성으로 null을 허용하면서 중복값도 허용한다

CREATE TABLE primary_column(
--id varchar2(20)  PRIMARY KEY,  --제약사항명이 자동으로 부여
	id varchar2(20) CONSTRAINT pk_primary_column PRIMARY KEY ,
	name varchar2(30) NULL,
	addr varchar2(300)
);

--DD에서 확인
SELECT *
FROM USER_CONSTRAINTS
WHERE constraint_type='P';

--제약사항명이 설정되어있는 테이블
INSERT INTO dept(deptno,dname,LOC)VALUES( 10,'개발부','서울');

--제약사항명이 설정되어있지 않는 테이블
INSERT INTO PRIMARY_COLUMN (id,name, ADDR) values('park','박상준','서울');


--------------추가성공-----------------
--최초 데이터 입력
INSERT INTO PRIMARY_COLUMN (id, name, addr) VALUES ('kim','김주민','서울시');
--id 컬럼에 중복되지 않는 데이터 입력
INSERT INTO PRIMARY_COLUMN (id, name, addr) VALUES ('kim1','김선경','인천시');

--다른 컬럼에는 PK컬럼과 같은 값이 들어있어도 괜찮다
INSERT INTO PRIMARY_COLUMN (id, name, addr) VALUES ('park','kim1','인천시');

SELECT * FROM PRIMARY_COLUMN ;

------------error 발생-----------------
--중복데이터 입력 : park은 이미 존재하므로 error
INSERT INTO PRIMARY_COLUMN (id, name, addr) VALUES ('park','홍찬영','경기도');

--null이 입력
--number, date => 컬럼명을 생략하면 null
--varchar2, char => 컬럼명을 생략하거나, insert할 때 ''를 넣으면 null

--컬럼명을 생략하는 경우 
INSERT INTO PRIMARY_COLUMN (name, addr) VALUES ('홍찬영','경기도');

-- '' ( empty )를 입력하는 경우
INSERT INTO PRIMARY_COLUMN (id, name) VALUES ('','서울시');


--테이블단위 제약사항
CREATE TABLE primary_table(
	id varchar2(20),
	name varchar2(30),
	addr varchar2(300),
--CONSTRAINT pk_primary_table PRIMARY key
 --어떤 컬럼이 primary를 받을 것인지 알 수 없으니 erorr가 난다 id를 해줘야함
CONSTRAINT pk_primary_table PRIMARY key(id)
);  

SELECT * FROM user_constraints
WHERE table_name='PRIMARY_TABLE';

--제약사항이 설정된 컬럼 확인 DD : user_cons_columns;
--제약사항 종류는 모름
SELECT *
FROM USER_CONS_COLUMNS ;

--인덱스 확인 DD : user_indexes;
SELECT *
FROM user_indexes;

--테이블의 컬럼정보 ( 컬럼명, 데이터형, 크기 등 ) DD : user_tab_cols
SELECT *
FROM user_tab_cols
WHERE table_name='EMP';






