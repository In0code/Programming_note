create table test_date(
now_date date
);

--��¥ �߰�
--sysdate : �ý����� ���� ���� ����
insert into test_date(now_date) values(sysdate);
--��¥ ������ ���ڿ� : ���� ��¥�� �ƴ� �ٸ� ���ڸ� �Է��� �� �ִ�
insert into test_date(now_date) values('2023-07-29');

--to_date �Լ�
insert into test_date(now_date) values(to_date('2023-07-31','yyy-mm-dd'));

commit;
select * from test_date;

--1. test_table ���̺��� �����ϰ�
--��ȣ, �̸�, ����, ����, �̸���, ��, �Է����� ���� �� �ִ� ���̺��� �����ϼ���
-- ��ȣ : ���� 5������ �Է� ( 0~99999 )
--�̸� : �ʴ� 10�ڱ��� �Է°���
--���� : ���� �Ǵ� ���ڸ� �Է�
--�� : A, B, C, D�� �������� �ѱ��ڸ� �Է�
--�Է��� : �����Ͱ� �߰��Ǵ� ���� ��¥�� ����

--2. test_talbe ���̺� �Ʒ� ���ڵ带 �߰��ϼ���
---- 1, ���ٿ�, 25, ����, kang@daum.net, A, ���� ��¥
---- 2, ���±���, 25, ����, Limg@naver.com, B, 2023-08-30
---- 3, ȫ..����, 26, ����, hong@gmail.com, C, ���� ��¥

create table test_table(
num varchar(5),
name varchar(15),
age varchar(200),
gender char(6),
email varchar(50),
class varchar(4),
now_date date
);

insert into test_table
values(1,'���ٿ�',25,'����','kang@daum.net','A',sysdate);
insert into test_table
values(2,'���±���',25,'����','Lim@naver.com','B','2023-08-30');
insert into test_table
values(3,'ȫ..����',26,'����','hong@gmail.com','C',sysdate);

select * from test_table;

insert into test_string(name)
values('��뼮');

select*from test_string;

update test_string
set name='ȫ������'
where name='ȫ����';


