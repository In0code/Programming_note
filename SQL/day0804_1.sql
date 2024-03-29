---create subquery 사용
--cp_emp1테이블을 생성하고사원테이블에서 모든 사원의 사원번호, 사원명,
--조회하여,부서번호, 입사일, 연봉을 조회하여 추가 

CREATE TABLE cp_emp1 as
(SELECT EMPNO ,ENAME ,DEPTNO ,HIREDATE ,SAL 
FROM EMP );

SELECT * FROM cp_emp1;



--user_costraints : 제약사항을 조회할 수 있는 DD( Data Dictionary)
SELECT * FROM USER_CONSTRAINTS ;
SELECT * FROM cp_emp1;

--cp_emp2테이블을 생성하고
--사원테이블에서 부서번호가 10,30번 부서의
--사원번호, 사원명, 직무, 부서번호, 입사일, 연봉을 조회하여 추가
CREATE TABLE cp_emp2 as
(SELECT EMPNO ,ENAME ,JOB ,DEPTNO ,HIREDATE ,SAL 
FROM EMP
WHERE DEPTNO IN (10,30));

SELECT * FROM cp_emp2;

ALTER TABLE TEST_NULL MODIFY email varchar2(50) NOT NULL;

SELECT * FROM user_constraints
WHERE table_name IN ('TEST_NULL2','TEST_NULL');

CREATE TABLE test_null2 as(SELECT email FROM TEST_NULL);
SELECT * FROM test_null2;


--emp테이블에 구조만 복사( 컬러명, 데이터형, 크기 )하여 cp_emp3테이블을 생성
--레코드가 검색되지 않도록 조회 : where 절에 false가 나오도록
CREATE TABLE cp_emp3 as
(SELECT * FROM EMP  
WHERE 1=0 ) ;

SELECT * FROM cp_emp3;

---------------insert subquery--------------------------
--다른 컬럼의 값으로 추가해야 할때 
-- cp_cmp1 테이블에 사원 정보를 추가
--사원번호 : 1111, 사원명 : 김선경, 부서번호 : 10, 입사일: 오늘,
--연봉 : 사원번호가 7788인 사원의 연봉과 동일한 연봉으로 추가
INSERT INTO cp_emp1(EMPNO ,ENAME ,DEPTNO ,HIREDATE ,SAL)
values(1111,'김선경',10,sysdate,(SELECT sal FROM emp WHERE EMPNO =7788));
COMMIT;

--cp_emp1테이블에 추가
--사원번호: 1112, 사원명: 장용석, 부서번호: cp_emp1테이블의 
--김선경 사원과 같은 부서, 입사일 : 내일, 연봉: 김선경 사원과 같은 연봉

INSERT INTO cp_emp1(EMPNO ,ENAME ,DEPTNO ,HIREDATE ,SAL)
VALUES(1112,'장용석',(SELECT DEPTNO FROM CP_EMP1 WHERE ENAME='김선경')
,sysdate+1,(SELECT sal FROM CP_EMP1 WHERE ENAME ='김선경'));
COMMIT;

 --단수행 자리에 복수행이 나오면 error 발생
INSERT INTO cp_emp1(EMPNO ,ENAME ,DEPTNO ,HIREDATE ,SAL)
VALUES(1112,'장용석',(SELECT DEPTNO FROM CP_EMP1)
,sysdate+1,(SELECT sal FROM CP_EMP1 WHERE ENAME ='김선경'));
COMMIT;


--emp테이블의 10번 부서의 모든 사원정보를 cp_emp3테이블로 추가
INSERT INTO CP_EMP3 
(SELECT *
FROM EMP 
WHERE DEPTNO =10);

CREATE TABLE emp_sal (
deptno number(2),
total_sal NUMBER,
input_date date
);

--emp 테이블에 부서별 연봉 합을 조회화여 emp_sal 테이블에 추가해보세요
--input_date는 추가하는 시점의 날짜 정보
INSERT INTO EMP_SAL 
(SELECT DEPTNO ,SUM(SAL), SYSDATE  
FROM EMP 
GROUP BY DEPTNO );

SELECT *
FROM EMP_SAL  ;



