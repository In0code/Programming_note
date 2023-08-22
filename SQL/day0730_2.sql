insert into test_table( num, name ) values( 1, '박상준' );
commit;

--테이블 삭제 : 삭제된 테이블은 휴지통으로 들어간다.

drop table test_table;

--휴지통 보기 : show는 SQLplus 문장이고,
-- golden은 SQLplus문을 지원하지 않는다.
show recyclebin;


select * from tab;

--휴지통에 있는 테이블 복구
--복구하는 테이블인 original_name을 사용한다.
flashback table test_table to before drop;     
select * from test_table;

--테이블 삭제
drop table test_table;

--휴지통 비우기
purge recyclebin;



---------------------DML  : insert   --------------------------------------------------------
--컬럼명을 생략하여 insert
insert into test_string values('박상준','M','서울시 양천구');

--값이 꼬일 수 있다 : 값이 들어갈 컬럼명이 명시되어있지 않기 때문에 
insert into test_string values('양천구','M','박상준');

select *from test_string;
