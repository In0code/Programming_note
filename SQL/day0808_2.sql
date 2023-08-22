--union : 중복데이터를 보여주지 않는다
--union all : 중복데이터를 보여준다


--cp_emp1테입블에서 모든 사원의 이름을 소문자로 변경

UPDATE  CP_EMP1 
SET ENAME =lower(ename);

UPDATE  CP_EMP1 
SET ENAME =upper(ename)
WHERE empno IN (7698,7521,7788,7900,7902);

--emp는 본사, cp_emp는 지사라고 하자.
--모든 본사사원과 지사사원을 조회 => union all
--조회 컬럼: 사원번호, 사원명, 부서번호, 입사일, 연봉
SELECT EMPNO ,ENAME ,DEPTNO ,HIREDATE ,SAL
FROM EMP 
UNION all
SELECT EMPNO ,ENAME ,DEPTNO ,HIREDATE ,SAL
FROM CP_EMP1  ;

--본사 사원과 지사 사원 조회
--단, 같은 레코드는 하나만 출력
SELECT EMPNO ,ENAME ,DEPTNO ,HIREDATE ,SAL
FROM EMP 
UNION
SELECT EMPNO ,ENAME ,DEPTNO ,HIREDATE ,SAL
FROM CP_EMP1  ;

--------error 발생 ------------
--컬럼의 수가 맞지 않은 경우
SELECT EMPNO ,ENAME ,DEPTNO ,HIREDATE ,SAL
FROM EMP 
UNION
SELECT EMPNO ,ENAME ,DEPTNO ,HIREDATE 
FROM CP_EMP1  ;

--컬럼의 데이터형이 맞지 않은 경우
SELECT EMPNO ,ENAME 
FROM EMP 
UNION
SELECT ENAME,EMPNO 
FROM CP_EMP1  ;

--컬럼명이 다른 경우에는 error가 발생하지 않는다
SELECT EMPNO, ENAME, JOB, DEPTNO, HIREDATE, SAL
FROM CP_EMP2
UNION all
SELECT  DEPTNO, JOB,ENAME,EMPNO, HIREDATE, SAL
FROM EMP ;


SELECT * FROM tab;

--우편번호 테이블에서 동이름이 '마계동'인 우편번호, 시도, 구군, 동, 번지와
--조회하고 접속 계정이 생성한 테이블명을 함께 조회
SELECT ZIPCODE ,SIDO ,GUGUN ,DONG ,BUNJI 
FROM ZIPCODE 
WHERE dong LIKE '%마계동%'
UNION 
SELECT tname,'0','0','0','0'
FROM tab;

SELECT *
FROM CP_EMP1 ;