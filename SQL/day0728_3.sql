--���ڿ��� ������ ��

create table test_string(
ssn char,    --ũ�⸦ �������� ������ ���� �Էµ��� ���Ѵ�
name varchar2(1));

insert into test_string(ssn,name) values('abc','a');

drop table test_string;
purge recyclebin;

--�̸�,����, �ּ������ϴ� ���̺� ����             *
create table test_string(
 name varchar2(15),
 gender char(1),
 addr varchar2(200));

 --������ �� ���� �ִ� ���̺��� �˻�
 select  tname
 from		tab;



 --�� �߰� - �ѱ� 1�ڴ� 3byte, �����ڳ� ���� �ϳ��� 1byte�� ���
 insert into test_string (name, gender,addr)
 values('�ڻ���' ,'M','����� ���ﵿ �ѵ����� 8�� 4���ǽ� ���ڸ�');

 select * from test_string;

  insert into test_string (name, gender, addr)
 values('Ȳ�ݵ�����' ,'M','����');

  insert into test_string (name, gender, addr)
 values('MMMMMMMMMMMMMM1' ,'M','����');
