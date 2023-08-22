--DD : Data Dictionary ( 데이터 사전 )
--DBMS의 운영정보가 들어있는 테이블
--계정마다 사용가능한 DD가 다르다.select * from TEST_NUMBER

select * from tab;

select * from TEST_NUMBER ;

select * from dba_users;


select * from TEST_NUMBER;

--TEST_NUMBER 테이블에 1, 28, 65.23을 추가
insert into test_number( num1, age, weight)
values(1, 28, 65.23);

--age컬럼은 숫자 3개만 입력가능 ( 0~999)
insert into test_number( num1, age, weight)
values(2, 128, 65.23);

insert into test_number( num1, age, weight)
values(3, 0, 65.23);

insert into test_number( num1, age, weight)
values(4, 999, 65.23);

--insert into test_number( num1, age, weight)
--values(4, 1000, 65.23);

--weight 0.00 ~ 999.99까지 입력 가능
insert into test_number( num1, age, weight)
values(5, 1, 0.00);

insert into test_number( num1, age, weight)
values(5, 1, 65.7);

insert into test_number( num1, age, weight)
values(6, 1, 999.99);

--정수가 3자리 초과하여 error가 발생
--insert into test_number( num1, age, weight)
--values(7, 1, 1000);

insert into test_number( num1, age, weight)
values(7, 1, 1.123);

commit;


select * from TEST_NUMBER ;
