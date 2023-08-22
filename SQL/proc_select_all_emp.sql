-- 사원 테이블에서 모든 사원의 사원번호, 사원명, 연봉
--, 부서번호, 입사일 조회

create or replace procedure select_all_emp( cur out sys_refcursor)
is

begin

	--커서를연다
	open cur for 
	select empno, ename, sal, to_char(hiredate, 'yyyy-mm-dd') hiredate
	from emp;

end;
/