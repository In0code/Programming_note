----------------���ڿ��Լ�-----------------
--length
select length('ABCD'),length('������ ������ �Դϴ�')
from dual;

--��� ���̺��� ������� 4�� �̻��� ������� �����, ����, �Ի��� ��ȸ
SELECT  ename,length(ename)ename_leng,sal,hiredate
FROM  emp
WHERE length (ename)>=4;

--��� �빮�ڷ� : upper , ��� �ҹ��ڷ� :lower
select upper('AbcdEf')upper, lower('AbcdEf')lower
from  dual;

--��� ���̺��� ������� 'scott'�� ����� �����ȣ, �����
--�Ŵ�����ȣ ��ȸ
select empno,ename,mgr
from emp
--where  ename= upper('scott');
where  lower(ename)= 'scott';

select ename, lower(ename) lower_ename
from EMP;


--ù���ڸ� �빮�ڷ�
SELECT initcap('oracle'),initcap('ORACLE'),
				initcap('i am a girl'), initcap('java oracle jdbc html')
FROM dual;

select ename, initcap(ename)
from EMP;

--Ư�����ڿ��� �ε��� ���( ����Ŭ�� �����ε����� 1������)
SELECT instr('ABCDEF','A'),instr('ABCDEF','B'),instr('ABCDEF','K'),
				instr('ABCDEF','CDE'),instr('ABCDEFAB','A',2)
FROM  dual;

--������̺��� ����� �� ��° ���ڿ� 'A'�� �ִ� �����
--������� ��ȸ
SELECT  ename
FROM   emp
where instr( ename,'A', 2 ) = 2 ;

--substr
SELECT substr('ABCDEF',2,3),substr('ABCDEF',3)
FROM dual;

alter table test_null add email varchar2(50) default 'test@test.com';

insert into test_null(email) values('kim@daum.net');
insert into test_null(email) values('sangjun@gmail.com');
insert into test_null(email) values('hongchanyoung@nate.com');
insert into test_null(email) values('chacha@chacha.co.kr');

commit;

select * from TEST_NULL;

--test_null���̺��� �̸��� �÷��� ����Ͽ� �����ּҿ�
--������ �ּҸ� �и��Ͽ� ��ȸ
SELECT  substr(email,instr(email,1),(instr(email,'@')-1)) email,
		 substr(email,instr(email,'@')+1,instr(email,'.'))  domain

FROM  test_null;
--where substr(email,instr(email,'@')+1)='gmail.com';
--where instr(email,'gmail.com') != 0;   --����
--WHERE email like '%gmail.com'


--trim
SELECT  '['||trim('   A BC   ')||']',
				'['||ltrim('   A BC   ')||']',
				'['||rtrim('   A BC   ')||']'
FROM    dual;

--Ư�� ���ڿ� ����
SELECT trim( '~'from'~~~~~~~Oracle~~~~~~~') trim
FROM    dual;


--Ư������ ä���
--Lpad( ��, ��ü���ڼ�, ä�﹮�ڿ� )
SELECT lpad('ABCDE',10,'$'),lpad('������',10,'$'),
				lpad('������',11,'$'),lpad('������',11,'ī')

FROM   dual;

--rpad( ��, ��ü���ڼ�, ä�﹮�ڿ� )
SELECT  rpad('ABCDE',10,'#') ,rpad('ABCDE',8,'u'),
 				rpad('������',11,'$'),rpad('������',11,'ī')
FROM   dual;

