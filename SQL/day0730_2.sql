insert into test_table( num, name ) values( 1, '�ڻ���' );
commit;

--���̺� ���� : ������ ���̺��� ���������� ����.

drop table test_table;

--������ ���� : show�� SQLplus �����̰�,
-- golden�� SQLplus���� �������� �ʴ´�.
show recyclebin;


select * from tab;

--�����뿡 �ִ� ���̺� ����
--�����ϴ� ���̺��� original_name�� ����Ѵ�.
flashback table test_table to before drop;     
select * from test_table;

--���̺� ����
drop table test_table;

--������ ����
purge recyclebin;



---------------------DML  : insert   --------------------------------------------------------
--�÷����� �����Ͽ� insert
insert into test_string values('�ڻ���','M','����� ��õ��');

--���� ���� �� �ִ� : ���� �� �÷����� ��õǾ����� �ʱ� ������ 
insert into test_string values('��õ��','M','�ڻ���');

select *from test_string;
