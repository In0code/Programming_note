select '�輱��' name, 28 , sysdate input_date
from dual;

------------��ġ�Լ�----------------------------------
--���밪: abs(��)
SELECT  abs(-8)
FROM  dual;

--�ݿø� : �ݿø��Ͽ� �� �ڸ�����
SELECT round(777.777,2),round(777.774,2),round(777.777,1)
				,round(777.777,0),round(777.777)
FROM dual;

--�����δ� �ش� �ڸ����� �ݿø� ����
SELECT  round(777.777,-1), round(777.777,-2)
FROM  dual;

--�ø�: ceil
SELECT ceil(10.1),ceil(10.01),ceil(10.000001)
FROM dual;


--���� : floor
select floor(10.9)
from dual;


--���� : �߶����
select trunc(555.555,1),trunc(555.555,-1)
,trunc(555.555),trunc(555.555,0)
from dual;

--��� ���̺��� �����ȣ, �����, ����, ������ ��ȸ
--��, ������ ������ 3.3�����ϰ�, ������ �����Ͽ� ���
select empno, ename, sal, trunc(sal*0.033,-1)||' $' tax
from emp;

select * from EMP;

create table test_null(
	num number,
	name varchar2(30),
	input_date date
);

insert into test_null( num,name,input_date)
values(1,'���ٿ�',sysdate);
commit;

select num, name, input_date
from test_null ;

--���ڳ� ��¥��
insert into test_null(name) values('��ٿ�');
commit;

--�����������̳� ������������ �÷��� �����ǰų�, ''��
--�ԷµǸ� null�� �Էµȴ�

--�÷��� �����Ǵ� ���
insert into test_null(num) values (2);
commit;
-- '' ( empty ) �� �ԷµǴ� ���
insert into test_null(num,name,input_date)
values (3,'',sysdate);
commit;

select * from TEST_NULL;


--nvl
--test_null ���̺��� ��ȣ, �Է����� ��ȸ
--��, ��ȣ�� ���ٸ� 0����, ��¥�� ���ٸ� ���� ��¥�� ���
select  nvl(num,0)num,nvl(input_date,sysdate) input_date
from 	  test_null;

select  nvl(num,0)num,nvl(input_date,'2022-08-02') input_date
from 	  test_null;

--error  : ���� ���������� �ƴ϶�� error�� �߻�
select  nvl(num,'10��')num,nvl(input_date,'������ ������') input_date
from 	  test_null;

--nvl2
--test_null ���̺��� �̸��� �̸��� �ִ����� ��ȸ
--��, �̸��� �ִٸ� '����', ������ '�͸�' �� �����ش�
select  nvl2(name,'����','�͸�')
from test_null;

--������̺��� �����ȣ, �����, ����, ���ʽ�, �Ѽ��ɾ��� ��ȸ
--��, �� ���ɾ��� �������� ���ʽ��� �ջ��� �ݾ����� ��ȸ
select empno, ename, sal, comm, sal+(nvl(comm,0)) total
from emp  ;

--zipcode���̺��� �ڽ��� �����ϴ� ����
--�����ȣ, �õ�, ����, ��, ������ ��ȸ�ϼ���
--��, ������ ���ٸ� '��������'�� ����غ�����
select zipcode,sido,gugun,dong,nvl(bunji,'��������')
from zipcode
where dong like '%������%';


SELECT ZIPCODE, SIDO, GUGUN, DONG, BUNJI
FROM ZIPCODE
WHERE DONG LIKE '%����%';
