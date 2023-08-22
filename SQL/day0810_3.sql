SELECT * FROM USER_INDEXES ;

SELECT rowid,zipcode,sido
FROM ZIPCODE ;

SELECT id,name,addr
FROM PRIMARY_COLUMN ;

UPDATE PRIMARY_COLUMN 
SET id='park1'
WHERE id='kim1';

SELECT * FROM  USER_INDEXES ;

--index rebuild
ALTER INDEX pk_emp rebuild;

SELECT *
FROM USER_IND_COLUMNS ;

CREATE TABLE zipcode1 AS (SELECT * FROM ZIPCODE );

--zipcode 테이블의 seq컬럼을 unique index로 설정
CREATE INDEX ind_zipcode ON zipcode (seq ) ;

SELECT * 
FROM USER_INDEXES ;

SELECT *
FROM USER_IND_COLUMNS 
WHERE table_name ='ZIPCODE';


--zipcode 테이블에서 seq가 50000~51000 사이의 레코드를 조회
SELECT  ZIPCODE ,SIDO ,GUGUN ,DONG ,BUNJI ,SEQ 
FROM ZIPCODE
WHERE SEQ BETWEEN 50000 AND 51000;

SELECT  ZIPCODE ,SIDO ,GUGUN ,DONG ,BUNJI ,SEQ 
FROM ZIPCODE1 
WHERE SEQ BETWEEN 50000 AND 51000;
	

SELECT  ZIPCODE ,SIDO ,GUGUN ,DONG ,BUNJI ,SEQ 
FROM ZIPCODE 
WHERE SEQ BETWEEN 50000 AND 51000
ORDER BY seq DESC ;
	

----------------index를 사용한 정렬-------------------------
--emp 테이블은 empno가 PK로 오름차순 인덱스로 생성되어 있따

--사원테이블에서 연봉이 1500~3000 사이인 사원번호, 사원명, 연봉, 입사일 조회
--단, 연봉의 오름차순으로 정렬하여 조회
--CREATE INDEX  ind_emp ON emp (sal desc) ; --내림 차순으로 INDEX 생성
CREATE INDEX  ind_emp ON emp (sal asc) ; --asc를 생략하면 오름 차순으로 INDEX 생성
DROP INDEX ind_emp;
e_name ='EMP';

--index 힌트 사용
SELECT 
SELECT EMPNO ,ENAME ,sal, HIREDATE 
FROM emp
WHERE sal BETWEEN 1500 AND 3000;


SELECT *
FROM USER_indexes

SELECT /*+ index(emp ind_emp) */ EMPNO ,ENAME ,sal, HIREDATE 
FROM emp
WHERE sal BETWEEN 1500 AND 3000;

SELECT *
FROM emp;

--사원 테이블에서 1981에 입사한 사원들의 사원번호, 사원명, 입사일을 조회
--단, 입사일의 오름차순 정렬하여 조회할 것
CREATE INDEX ind_emp_hire ON emp (hiredate);
DROP INDEX ind_emp_hire;

SELECT /*+ index_desc(emp ind_emp_hire) */empno, ename, to_char(HIREDATE ,'yyyy-mm-dd') hiredate
FROM EMP 
WHERE HIREDATE BETWEEN to_date('1981-01-01' ,'yyyy-mm-dd') 
		AND TO_date('1981-12-31' ,'yyyy-mm-dd')  ; 









