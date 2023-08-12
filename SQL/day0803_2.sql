--집계함수
--count : null 인 컬럼은 포함하지 않는다
SELECT COUNT(EMPNO), COUNT(MGR), COUNT(COMM)  
FROM EMP ;


--사원테이블에서 보너스를 수령하지 않는 사원 수를 조회
SELECT COUNT(EMPNO)-COUNT(COMM)  
FROM EMP;

--null이 아닌 레코드가 존재하는 컬럼을 모두 조회한다 
SELECT COUNT(*)  
FROM EMP ;

--사원 테이블에서 연봉의 합, 평균, 최고연봉, 최저연봉  조회
SELECT sum(SAL),AVG(SAL) , MAX(SAL), MIN(sal)  
FROM EMP ;

--사원테이블에서 평균연봉이상인 사람들의 사원번호, 연봉, 입사일을 조회
-- ->  집계함수는 where절에 직접 사용할 수 없다
SELECT EMPNO ,SAL ,HIREDATE  
FROM EMP
--WHERE SAL >= AVG(sal) ;
WHERE SAL >= (SELECT AVG(sal) FROM EMP ) ;


--group by 와 함게 사용되면 그룹별 집계를 얻을 수 있따

--사원테이블에서 부서별, 사원수, 평균 연봉을 조회
SELECT DEPTNO, COUNT(EMPNO) dept_cnt, TRUNC(AVG(SAL))  sal_avg
FROM EMP 
GROUP BY DEPTNO 
ORDER BY DEPTNO ;

--사원테이블에서 매니저별, 관리하는 사원수를 조회
--단, null은 출력하지 않는다 
SELECT MGR ,COUNT(EMPNO) 
FROM EMP 
WHERE mgr IS NOT NULL
GROUP BY MGR;

--사원테이블에서 부서별,인원수,최고연봉, 최저연봉, 최고연봉과 최저연봉의 차이
SELECT  DEPTNO  ,COUNT(EMPNO), MAX(SAL), MIN(SAL), MAX(sal)-MIN(sal) amount 
FROM  EMP 
GROUP BY  DEPTNO ;


--rollup : 소계 후 합계
--사원테이블에서 부서별, 사원수와 사원수의 총 합조회
SELECT DEPTNO, COUNT(EMPNO) ,SUM(SAL) 
FROM  EMP 
GROUP BY ROLLUP (DEPTNO);


--사원테이블에서 부서별, 사원수의 총합 후 사원수 합을 조회
SELECT DEPTNO, COUNT(EMPNO) ,SUM(SAL) 
FROM  EMP 
GROUP BY CUBE  (DEPTNO);


--사원테이블에서 부서별, 매니저가 관리하는 사원의 연봉의 합과 총합 조회
SELECT DEPTNO ,mgr,SUM(sal)  
FROM EMP 
GROUP BY ROLLUP  (DEPTNO ,mgr);

--사원 테이블에서 부서별, 매니저가 관리하는 사원의 총계와 연봉합계,소계를조회
SELECT DEPTNO , MGR ,sum (SAL)
FROM EMP 
GROUP BY CUBE (DEPTNO ,MGR );


--사원 테이블에서 매니저별, 직무의 인원수, 연봉의합, 총합 조회
SELECT mgr,JOB,COUNT(*), SUM(SAL)  
FROM EMP 
WHERE mgr IS NOT NULL 
GROUP BY ROLLUP (mgr,job);


SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP;

