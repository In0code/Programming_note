----------update subquery---------------------------
--다른 컬럼의 값을 참조하여 변경할 때 사용

--cp_emp1테이블의 사원번호가 1111번인 사원의 부서번호를, cp_emp1테이블의
--사원번호가 7844인 사원의 부서번호로 변경.
UPDATE CP_EMP1 
SET   DEPTNO =(SELECT DEPTNO FROM CP_EMP1 WHERE EMPNO=7844)
WHERE EMPNO =1111;
COMMIT;

--복수행이 사용되면 error
UPDATE CP_EMP1 
SET   DEPTNO =(SELECT DEPTNO FROM CP_EMP1)
WHERE EMPNO =1111;

--cp_emp3 테이블의 사원번호가 emp테이블에 사원명이 'KING'인 사원과 
--동일한 사원을 찾아 연봉을 김선경사원과 동일한 연봉으로, 입사일을 장용석 사원과
--동일한 입사일로 변경
UPDATE CP_EMP1
SET  SAL= (SELECT sal FROM CP_EMP1 WHERE ENAME='김선경'),
HIREDATE =(SELECT HIREDATE  FROM CP_EMP1 WHERE ENAME='장용석')
WHERE EMPNO =(SELECT EMPNO FROM EMP WHERE ENAME='KING') ;

--where절에 in을 사용하면 복수행 서브쿼리도 가능
--cp_emp1 테이블에서 10번부서에 해당하는 사원번호를 모두 검색하여
--cp_emp1테이블에서 해당하는 사원들의 연봉을 5000으로 변경
UPDATE CP_EMP1  
SET SAL =5000
WHERE EMPNO IN  (SELECT EMPNO FROM EMP WHERE DEPTNO =10);


----------delete subquery-----------------------
--emp테이블에서 사원명이 'SCOTT'인 사원 사원번호를 조회하여
--cp_emp1테이블에서 같은 사원번호를 사용하는 레코드를 삭제
DELETE FROM CP_EMP1 
WHERE EMPNO =(SELECT EMPNO FROM emp WHERE ENAME ='SCOTT');

--IN을 사용하면 복수행 서브쿼리도 가능하다
--emp 테이블에서 10번 부서에 해당하는 사원번호를 모두 검색
--cp_emp1테이블에서 해당하는 사원들ㅇ르 삭제
DELETE FROM CP_EMP1 
WHERE EMPNO IN (SELECT EMPNO FROM emp WHERE DEPTNO=10);
COMMIT;

--emp 테이블에서 사원번호 7654인 사원이 입사한 년도를 조회하여
--cp_emp1 테이블에서 같은 년도에 입사한 모든 사원정보를 삭제
DELETE FROM CP_EMP1 
WHERE TO_CHAR(HIREDATE,'yyyy') IN (SELECT TO_CHAR(HIREDATE,'yyyy') FROM emp WHERE EMPNO =7654 );

--emp테이블에서 부서번호가 20,30인 부서에 근무하는 사원 정보를 cp_emp1에 추가
--추가 컬럼: 사원번호, 사원명, 부서번호, 입사일, 연봉
INSERT INTO CP_EMP1 
(SELECT EMPNO,ENAME,DEPTNO,HIREDATE,SAL 
FROM emp WHERE DEPTNO IN (20,30));

----------select 단수행서브쿼리-----------------------
--emp테이블에서 사원번호가 7698인 사원의 부서번호를 조회하여
--cp_emp1테이블에서 같은 부서에 근무하는 사원을 조회
--조회 컬럼 : 사원번호, 사원명, 부서번호, 연봉
SELECT EMPNO ,ENAME ,DEPTNO ,SAL 
FROM  CP_EMP1 
WHERE DEPTNO IN (SELECT DEPTNO FROM emp WHERE EMPNO=7698);


--scalar subquery
--사원번호, 사원명, 부서번호, 부서명을 조회
--단, 부서명은 dept테이블에 존재하는 이름으로 출력
SELECT EMPNO ,ENAME ,DEPTNO ,
	(SELECT DNAME  FROM DEPT WHERE dept.DEPTNO=emp.DEPTNO)
FROM EMP ;

--사원 테이블에서 평균연봉 이상인 사원의 사원번호, 사원명, 연봉을 조회
SELECT EMPNO ,ENAME ,SAL 
FROM emp
WHERE sal=(SELECT avg(sal) FROM emp ) ;

--사원 테이블에서 가장 많은 연봉을 받는 사원의 사원명 조회
SELECT EMPNO ,ENAME ,SAL 
FROM emp
WHERE sal=(SELECT max(sal) FROM emp ) ;


--사원테이블에서 최고연봉과, 최고연봉을 받는 사원명 조회
SELECT ENAME, SAL  
FROM emp 
WHERE SAL  =(SELECT MAX(SAL) FROM emp );

SELECT * FROM CP_EMP1 ;

SELECT EMPNO, ENAME, DEPTNO, HIREDATE, SAL
FROM CP_EMP1;
