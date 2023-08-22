--하나의 테이블에서 사용
--emp테이블에서 7788사원이 존재한다면, 직무가 'MANAGER'인 사원들을 검색
--조회컬럼 : 사원번호, 사원명, 직무, 연봉을 조회
--(사원번호가 7789사원은 존재하지 않으므로 바깥 쿼리가 실행되지 않아 조회 결과가 나오지 않는다)

SELECT EMPNO ,ENAME ,JOB ,SAL 
FROM EMP 
WHERE JOB ='MANAGER'AND EXISTS (SELECT 1 FROM emp WHERE empno=7788);
--WHERE JOB ='MANAGER'AND EXISTS (SELECT 1 FROM emp WHERE empno=7789);

--cp_emp1테이블과 emp 테이블에 동일하게 존재하는 사원에대해서 
--사원번호, 사원명, 부서번호, 입사일, 연봉을 조회 
--exist에 들어가는 subquery의 조건에 두 테이블의 사원번호를 비교해야 한다

SELECT EMPNO ,ENAME ,DEPTNO ,TO_CHAR(HIREDATE,'yyyy-mm-dd') ,SAL 
FROM CP_EMP1 
WHERE EXISTS (SELECT 1 FROM emp WHERE EMPNO=cp_emp1.EMPNO);

--cp_emp1테이블과 emp 테이블에 동일하게 존재하는 사원이 있으면, 20번 부서 사원에 대해서
--사원번호, 사원명, 부서번호, 입사일, 연봉을 조회 
--exist에 들어가는 subquery의 조건에 두 테이블의 사원번호를 비교해야 한다

SELECT EMPNO ,ENAME ,DEPTNO ,TO_CHAR(HIREDATE,'yyyy-mm-dd') ,SAL 
FROM CP_EMP1 
WHERE DEPTNO =20 AND EXISTS (SELECT 1 FROM emp WHERE EMPNO=cp_emp1.EMPNO);


SELECT EMPNO, ENAME, DEPTNO, HIREDATE, SAL
FROM CP_EMP1;

--car model테이블과 car_maker테이블에서 동일 모델이 존재하는 경우에
--모델이 K5인 차량에 대해서 모델명, 년식, 가격, 옵션을 조회 
SELECT MODEL ,CAR_YEAR ,PRICE ,CAR_OPTION 
FROM CAR_MODEL 
WHERE MODEL ='K5' AND  EXISTS (SELECT 1 FROM CAR_MAKER WHERE MODEL=car_maker.MODEL)



--------------------alter를 사용한 테이블 변경----------------------
CREATE TABLE test_alter(
num NUMBER,
neam varchar2(20),
addr number
);

--컬럼명 변경
ALTER TABLE test_alter RENAME COLUMN neam TO name;

--데이터형 변경
--레코드가 없는 경우 : 데이터형 자체를 변경할 수 있따
--addr 컬럼을 number -> varchar2(300)
ALTER TABLE test_alter MODIFY addr varchar2(300);

INSERT INTO test_alter (num,name,addr) 
values(1,'김선경','서울시 강남구');
--레코드가 있는 경우 : 동일 데이터형에서 크기만 변경할 수 있다
--addr을 varchar2 -> number
ALTER TABLE test_alter MODIFY addr number(22); --error. 데이터 유형을 변경할 열은 비어있어야한다

ALTER TABLE test_alter MODIFY addr varchar2(300) NOT NULL;

SELECT * FROM test_alter;

SELECT * FROM USER_constraints
WHERE table_name='TEST_ALTER';

--컬럼추가
--test_alter 테이블에 age 컬럼을 추가
ALTER TABLE test_alter ADD age number(3) CHECK (age BETWEEN 20 AND 29);

--test_alter 테이블에 primary key 제약을가지는 id 컬럼을 추가
--컬럼의 크기는 20byte
--모든 레코드를 삭제한 후 컬럼을 primary key 제약을 가지는 컬럼을 추가해야한다
--모든 레코드 절삭  => 절삭하기 전에 primary key를 주면 error가 난다
TRUNCATE TABLE test_alter;
ALTER TABLE test_alter ADD id varchar2(20) CONSTRAINT test_alter PRIMARY KEY; 


INSERT INTO test_alter (num,name,addr,age,id) 
values(1,'김선경','서울시 강남구',25,'kim');
INSERT INTO test_alter (num,name,addr,age,id) 
values(2,'임태군','경기도 용인시 처인구',25,'lim');


--컬럼 삭제
--age 컬럼 삭제  => 제약사항을 가지고 있어도 삭제가 된다.
ALTER TABLE TEST_ALTER DROP COLUMN age;

--테이블명 변경
--test_alter  ->  test_alter1
ALTER TABLE test_alter RENAME TO test_alter1;
SELECT * FROM test_alter1;


-----------제약사항 추가, 삭제--------------------
--test_alter1 테이블에서 PK 삭제
ALTER table test_alter1 DROP CONSTRAINT test_alter;
--test_alter1 테이블에 check 조건 삭제
ALTER TABLE test_alter1 DROP CONSTRAINT SYS_C007462;

--제약사항이 삭제 되었으므로 제약사항에 위배되는 레코드를 추가할 수 있다
INSERT INTO TEST_ALTER1 (id ) VALUES ('kim');

--제약사항 추가 : 레코드의 상황에 따라 다르다
--id에 PK 제약을 설정  => 중복된 id를 싹 다 지우고 추가해야 한다
--중복된 아이디를 모두 삭제 
DELETE FROM test_alter1 WHERE  num IS NULL;
ALTER TABLE test_alter1 ADD CONSTRAINT pk_test_alter1 PRIMARY KEY (id); --error

--제약사항의 활성화, 비활성화
--id 컬럼의 제약사항을 비활성화 => 같은 id가 입력된다
ALTER TABLE test_alter1 disable CONSTRAINT pk_test_alter1;
--비활성화 했으니 동일 아이디가 입력이 된다
INSERT INTO TEST_ALTER1 (id ) VALUES ('kim');
SELECT * FROM test_alter1;

--제약사항 활성화 : 레코드의 상태에 따라 다르다
--제약사항에 위배되는 레코드를 삭제한 후 활성화해야한다  => 중복되는 id를 지워야함
--ALTER TABLE test_alter1 inable CONSTRAINT pk_test_alter1; -- error
ALTER TABLE test_alter1 enable CONSTRAINT pk_test_alter1; 
DELETE FROM test_alter1 WHERE  num IS NULL;

SELECT * FROM USER_constraints
WHERE table_name='TEST_ALTER1';






