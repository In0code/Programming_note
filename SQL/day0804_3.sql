--select 복수행 subquery
--inline view를 사용한 조회 : 많은 양의 레코드에서 일부분만 잘라내서 볼때
--바깥 쿼리는 안쪽 쿼리에서 조회된 결과( 레코드, 컬럼 )만 사용할 수 있다

SELECT EMPNO ,ename, job, SALARY, /*hiredate*/ COMM
FROM (SELECT EMPNO ,ENAME ,JOB ,SAL salary,nvl(comm,0) comm
	FROM EMP  );


-----rownum : 조회결과에 가상번호 부여하기-----------
--사원테이블에서 번호, 사원번호, 사원명 조회
SELECT rownum , empno, ename
FROM EMP ;

--1번부터는 검색이 되나 그 이외의 번호부터는 검색되지 않는다
--사원 테이블에서 번호, 사원번호 , 사원명을 조회
--단, 번호의 1~5번까지만 검색
SELECT rownum, EMPNO , ENAME 
FROM EMP 
WHERE rownum BETWEEN 1 AND 5;
--WHERE rownum BETWEEN 2 AND 5;  --1이 아니라면 검색 안됨

--order by와 함께 사용되면 번호가 먼저 부여되고 정렬되기 때문에 번호가 뒤섞인다
SELECT rownum, ENAME , SAL 
FROM  EMP 
ORDER BY sal;

--rownum은 select마다 각각 사용된다
--이름의 오름차순으로 정렬하고, 정렬된 이름에 순차적인 번호를 부여
SELECT rownum, r ,EMPNO ,ENAME  
FROM (SELECT rownum r, EMPNO , ENAME 
	 FROM EMP 
	 ORDER BY ename );

	
--사원테이블에서 가장 마지막에 입사한 사원부터 5명의 사원정보를 조회
--조회 컬럼, 사원번호, 사원명, 입사일 연봉
SELECT  rownum,empno, ename, hiredate, sal 
FROM (SELECT rownum,empno, ename, hiredate, sal 
	 FROM EMP 
	 ORDER BY hiredate DESC)
WHERE ROWNUM BETWEEN 1 AND 5;

--사원테이블에서 가장 마지막에 입사한 이전 사원부터 5명의 사원정보를 조회
--조회 컬럼, 사원번호, 사원명, 입사일 연봉
--1. 가장 마지막에 입사한 사원한테 1번 부여 
--2. rownum은 1번부터만 비교된다 ( 문제: alias는 붙어있는 where절에서 사용할 수 없다)
--3. 2번의 문제를 해결하기 위해 alias를 실제 컬럼처럼 사용하기 위해
--inline view를 하나 더 만든다
SELECT  r2, r1, EMPNO ,ENAME ,HIREDATE ,SAL 
FROM (SELECT rownum r2, r1,EMPNO ,ENAME ,HIREDATE ,SAL 
	FROM(SELECT rownum r1,EMPNO ,ENAME ,HIREDATE ,SAL 
		 FROM EMP 
	 	ORDER BY HIREDATE DESC) )
WHERE r2 BETWEEN 2 AND 6 ;

SELECT EMPNO ,ENAME ,HIREDATE ,SAL,rnum
from(SELECT EMPNO ,ENAME ,HIREDATE ,SAL ,row_number()over(ORDER BY HIREDATE DESC) rnum
FROM  EMP )
WHERE rnum BETWEEN 2 AND 6;
