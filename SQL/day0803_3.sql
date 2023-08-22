--사원테이블에서 사원번호, 사원명, 연봉, 연봉의 순위
--단, 동일 연봉에는 동일 순위를 부여한다
SELECT EMPNO, ENAME ,SAL ,RANK()over(ORDER BY sal ASC)
FROM EMP ;


SELECT EMPNO, ENAME ,SAL ,ROW_NUMBER ()over(ORDER BY sal)
FROM EMP ;


--partition by : 동일 컬럼값으로 순위를 설정한다
--사원 테이블에서 매니저가 관리하는 사원의 연봉, 연봉 순위
SELECT MGR,EMPNO,ENAME  ,sal, ROW_NUMBER() OVER(PARTITION BY MGR ORDER BY SAL ) prt
FROM EMP ;

--사원 테이블에서 부서별, 사원번호, 사원명, 입사일, 입사일의 순위
--단, 입사일은 가장 마지막에 입사한 사원부터 1번을 부여한다
SELECT DEPTNO ,EMPNO ,ENAME ,HIREDATE ,
		ROW_NUMBER () OVER (PARTITION BY DEPTNO  
		ORDER BY HIREDATE DESC) hire
FROM EMP ;


--날짜함수
--날짜에 +가 사용되면 일이 더해진다
SELECT SYSDATE ,sysdate+1,SYSDATE +2,SYSDATE +30 
FROM dual;


--월을 더할 때
SELECT ADD_MONTHS(SYSDATE,2) 
FROM  dual;

--두 개월간의 차 =>  ( 실수가 나옴 )
SELECT MONTHS_BETWEEN(SYSDATE,'2023-06-04') 
FROM  dual;

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP;



--사원테이블에서 사원번호, 사원명, 입사일, 근속개월수를 조회
SELECT EMPNO ,ENAME ,HIREDATE ,TRUNC((MONTHS_BETWEEN(SYSDATE,HIREDATE)))  real_date
FROM EMP ;

