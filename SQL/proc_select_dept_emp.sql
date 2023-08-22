--부서번호를 입력받아 해당 부서에 속한 모든 사원정보를 조회
--조회 컬럼 : 사원번호, 사원명, 연봉, 부서번호, 부서명, 위치

create or replace procedure select_dept_emp( in_deptno number,
cur_emp out SYS_REFCURSOR)

is
		temp_deptno number := in_deptno;
begin

	--제어 : 부서번호가 10,20,30,40이 아니라면 10번으로 설정
	if temp_deptno not in(10,20,30,40) then
		temp_deptno := 10;
	end if;

	open cur_emp for
		select  d.deptno, d.dname, d.loc, e.empno, e.ename, e.sal
		from   dept d, emp e
		where  ( e.deptno(+) = d.deptno ) and (d.deptno = temp_deptno );

end;





