--�μ���ȣ�� �Է¹޾� �ش� �μ��� ���� ��� ��������� ��ȸ
--��ȸ �÷� : �����ȣ, �����, ����, �μ���ȣ, �μ���, ��ġ

create or replace procedure select_dept_emp( in_deptno number,
cur_emp out SYS_REFCURSOR)

is
		temp_deptno number := in_deptno;
begin

	--���� : �μ���ȣ�� 10,20,30,40�� �ƴ϶�� 10������ ����
	if temp_deptno not in(10,20,30,40) then
		temp_deptno := 10;
	end if;

	open cur_emp for
		select  d.deptno, d.dname, d.loc, e.empno, e.ename, e.sal
		from   dept d, emp e
		where  ( e.deptno(+) = d.deptno ) and (d.deptno = temp_deptno );

end;





