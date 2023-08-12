--사원테이블에서 사원번호, 사원명, 연봉, 연봉의 순위
--단, 동일 연봉에는 동일 순위를 부여한다
SELECT EMPNO, ENAME ,SAL ,RANK()over(ORDER BY sal)
FROM EMP ;










SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP;
