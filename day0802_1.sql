--�ߺ�����
--distinct, group by�� �� �� �ִ�.

--distinct
--������̺��� �Ŵ��� ��ȣ�� ��ȸ
--��, �ߺ��� �Ŵ��� ��ȣ�� ������� �ʴ´�
SELECT  DISTINCT mgr
FROM  emp;

--group by
select mgr
from  emp
group by mgr;

--distinct�� error�� �߻����� �ʴ´� ( �ߺ������� ���� �ʴ´�)
--������̺��� �Ŵ��� ��ȣ, ����� ��ȸ
--��, �ߺ��� �Ŵ��� ��ȣ�� ������� �ʴ´�
SELECT DISTINCT mgr, deptno
FROM emp;


--group by �Ŀ� ���� ���� ���� �÷��� select �÷���
--���Ǹ� error�� �߻�
SELECT mgr, ename  --error
FROM   emp
GROUP BY  mgr;


SELECT mgr, deptno
FROM   emp
GROUP BY  mgr, deptno;

--group by having : �׷����� �������� ������ ����
--��� ���̺��� 10�� �μ��� �ƴ� �μ��� �μ���ȣ�� �˻�
SELECT deptno         --4.��ȸ
FROM   emp            --1.emp���̺���
GROUP BY  deptno      --3.�׷����� ����
HAVING deptno != 10;  --2.10�� �μ��� �ƴ� �μ���

--����� ������ ������ ���ݾ� �ٸ���
SELECT deptno         --4.��ȸ
FROM   emp            --1.emp���̺���
where  deptno != 10   --2.10�� �μ��� �ƴ� �μ��� ��ȸ�Ͽ�
GROUP BY  deptno ;    --3.�׷����� ���� ��


----------------------����----------------------------
--���� ����
--������̺��� �����ȣ, �����, ������ �˻�
--��, ������ ������������ �����Ͽ� ��ȸ
SELECT  empno, ename, sal
FROM  emp
--ORDER BY sal asc;     --asc�� ��������
ORDER BY sal;

--������̺��� �����ȣ �����,������ �˻�
--��, ������� ������������ �����Ͽ� ��ȸ
SELECT empno, ename, sal
FROM  emp
ORDER BY ename desc;

--������̺��� �����ȣ, �����,������ �˻�
--��, ������ ������������ �����Ͽ� ��ȸ, ���� ������ �����ϸ�
--������� ������������ �����Ͽ� ��ȸ

--ó���÷��� ���� ���� �����ϸ�, ���� �÷����� ������ �����Ѵ�.
SELECT empno, ename, sal
FROM  emp
ORDER BY sal, ename ;

--���ڿ��� ������ �ڸ����� ����
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
