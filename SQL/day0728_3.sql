--문자열을 저장할 때

create table test_string(
ssn char,    --크기를 설정하지 않으면 값이 입력되지 못한다
name varchar2(1));

insert into test_string(ssn,name) values('abc','a');

drop table test_string;
purge recyclebin;

--이름,성별, 주소저장하는 테이블 생성             *
create table test_string(
 name varchar2(15),
 gender char(1),
 addr varchar2(200));

 --계정이 가 지고 있는 테이블을 검색
 select  tname
 from		tab;



 --갑 추가 - 한글 1자는 3byte, 영문자나 숫자 하나는 1byte로 계산
 insert into test_string (name, gender,addr)
 values('박상준' ,'M','서울시 역삼동 한독빌딩 8층 4강의실 뒷자리');

 select * from test_string;

  insert into test_string (name, gender, addr)
 values('황금독수리' ,'M','서울');

  insert into test_string (name, gender, addr)
 values('MMMMMMMMMMMMMM1' ,'M','서울');
