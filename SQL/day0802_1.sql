--중복배제
--distinct, group by로 할 수 있다.

--distinct
--사원테이블에서 매니저 번호를 조회
--단, 중복된 매니저 번호는 출력하지 않는다
SELECT  DISTINCT mgr
FROM  emp;

--group by
select mgr
from  emp
group by mgr;

--distinct는 error가 발생하지 않는다 ( 중복배제를 하지 않는다)
--사원테이블에서 매니저 번호, 사원명를 조회
--단, 중복된 매니저 번호는 출력하지 않는다
SELECT DISTINCT mgr, deptno
FROM emp;


--group by 식에 정의 되지 않은 컬럼이 select 컬럼에
--사용되면 error가 발생
SELECT mgr, ename  --error
FROM   emp
GROUP BY  mgr;


SELECT mgr, deptno
FROM   emp
GROUP BY  mgr, deptno;

--group by having : 그룹으로 묶여지는 조건을 설정
--사원 테이블에서 10번 부서가 아닌 부서의 부서번호를 검색
SELECT deptno         --4.조회
FROM   emp            --1.emp테이블에서
GROUP BY  deptno      --3.그룹으로 묶고
HAVING deptno != 10;  --2.10번 부서가 아닌 부서만

--결과는 같으나 순서가 조금씩 다르다
SELECT deptno         --4.조회
FROM   emp            --1.emp테이블에서
where  deptno != 10   --2.10번 부서가 아닌 부서만 조회하여
GROUP BY  deptno ;    --3.그룹으로 묶은 후


----------------------정렬----------------------------
--숫자 정렬
--사원테이블에서 사원번호, 사원명, 연봉을 검색
--단, 연봉의 오름차순으로 정렬하여 조회
SELECT  empno, ename, sal
FROM  emp
--ORDER BY sal asc;     --asc는 생략가능
ORDER BY sal;

--사원테이블에서 사원번호 사원명,연봉을 검색
--단, 사원명의 내림차순으로 정렬하여 조회
SELECT empno, ename, sal
FROM  emp
ORDER BY ename desc;

--사원테이블에서 사원번호, 사원명,연봉을 검색
--단, 연봉의 오름차순으로 정렬하여 조회, 같은 연봉이 존재하면
--사원명의 오름차순으로 정렬하여 조회

--처음컬럼에 같은 값이 존재하면, 다음 컬럼으로 정렬을 수행한다.
SELECT empno, ename, sal
FROM  emp
ORDER BY sal, ename ;

--문자열의 정렬은 자릿수의 정렬
create table test_orderby(
num varchar2(5));

insert into test_orderby values('1');
insert into test_orderby values('101');
insert into test_orderby values('2');
insert into test_orderby values('10002');
insert into test_orderby values('25');
insert into test_orderby values('201');
insert into test_orderby values('3');

commit;

select *
from TEST_ORDERBY
order by num ;
