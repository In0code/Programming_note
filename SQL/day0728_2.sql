--DD : Data Dictionary ( ������ ���� )
--DBMS�� ������� ����ִ� ���̺�
--�������� ��밡���� DD�� �ٸ���.select * from TEST_NUMBER

select * from tab;

select * from TEST_NUMBER ;

select * from dba_users;


select * from TEST_NUMBER;

--TEST_NUMBER ���̺� 1, 28, 65.23�� �߰�
insert into test_number( num1, age, weight)
values(1, 28, 65.23);

--age�÷��� ���� 3���� �Է°��� ( 0~999)
insert into test_number( num1, age, weight)
values(2, 128, 65.23);

insert into test_number( num1, age, weight)
values(3, 0, 65.23);

insert into test_number( num1, age, weight)
values(4, 999, 65.23);

--insert into test_number( num1, age, weight)
--values(4, 1000, 65.23);

--weight 0.00 ~ 999.99���� �Է� ����
insert into test_number( num1, age, weight)
values(5, 1, 0.00);

insert into test_number( num1, age, weight)
values(5, 1, 65.7);

insert into test_number( num1, age, weight)
values(6, 1, 999.99);

--������ 3�ڸ� �ʰ��Ͽ� error�� �߻�
--insert into test_number( num1, age, weight)
--values(7, 1, 1000);

insert into test_number( num1, age, weight)
values(7, 1, 1.123);

commit;


select * from TEST_NUMBER ;
