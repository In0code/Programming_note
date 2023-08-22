--cp_dept에 부서번호, 부서명, 위치를 추가하는 procedure생성
--부서번호는 0~99 사이의 값을 추가할 수 있다
--0~99 사이의 값이 아니라면 값을 추가하지 않는다

create or replace procedure insert_proc(deptno in number,
dname in varchar2, loc varchar2, cnt out number, msg out varchar2)
is

begin

	if deptno between 0 and 99 then
		insert into cp_dept(deptno, dname, loc) vlaues deptno,dname,loc);

  cnt :=sql%rowcount;

  if cnt = 1 then
  msg := '부서정보 추가 성공';
  	commit;
  end if;

	end if;
	
	exception
	when DUP_VAL_ON_INDEX then 
	  msg := '부서정보 추가 실패. 부서가 이미 존재함';

end;
/
