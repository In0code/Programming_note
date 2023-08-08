select '김선경' name, 28 , sysdate input_date
from dual;

------------수치함수----------------------------------
--절대값: abs(값)
SELECT  abs(-8)
FROM  dual;

--반올림 : 반올림하여 볼 자리릿수
SELECT round(777.777,2),round(777.774,2),round(777.777,1)
				,round(777.777,0),round(777.777)
FROM dual;

--정수부는 해당 자리에서 반올림 수행
SELECT  round(777.777,-1), round(777.777,-2)
FROM  dual;

--올림: ceil
SELECT ceil(10.1),ceil(10.01),ceil(10.000001)
FROM dual;


--내림 : floor
select floor(10.9)
from dual;


--절자 : 잘라버림
select trunc(555.555,1),trunc(555.555,-1)
,trunc(555.555),trunc(555.555,0)
from dual;

--사원 테이블에서 사원번호, 사원명, 연봉, 세금을 조회
--단, 세금은 연봉의 3.3연산하고, 원단위 절사하여 출력
select empno, ename, sal, trunc(sal*0.033,-1)||' $' tax
from emp;

select * from EMP;

create table test_null(
	num number,
	name varchar2(30),
	input_date date
);

insert into test_null( num,name,input_date)
values(1,'강다연',sysdate);
commit;

select num, name, input_date
from test_null ;

--숫자나 날짜는
insert into test_null(name) values('김다영');
commit;

--가변길이형이나 고정길이형은 컬럼이 생략되거나, ''가
--입력되면 null이 입력된다

--컬럼이 생략되는 경우
insert into test_null(num) values (2);
commit;
-- '' ( empty ) 가 입력되는 경우
insert into test_null(num,name,input_date)
values (3,'',sysdate);
commit;

select * from TEST_NULL;


--nvl
--test_null 테이블에서 번호, 입력일을 조회
--단, 번호가 없다면 0으로, 날짜가 없다면 현재 날짜로 출력
select  nvl(num,0)num,nvl(input_date,sysdate) input_date
from 	  test_null;

select  nvl(num,0)num,nvl(input_date,'2022-08-02') input_date
from 	  test_null;

--error  : 같은 데이터형이 아니라면 error가 발생
select  nvl(num,'10번')num,nvl(input_date,'오늘은 수요일') input_date
from 	  test_null;

--nvl2
--test_null 테이블에서 이름과 이름이 있는지를 조회
--단, 이름이 있다면 '있음', 없으면 '익명' 을 보여준다
select  nvl2(name,'있음','익명')
from test_null;

--사원테이블에서 사원번호, 사원명, 연봉, 보너스, 총수령액을 조회
--단, 총 수령액은 연보오가 보너스를 합산한 금액으로 조회
select empno, ename, sal, comm, sal+(nvl(comm,0)) total
from emp  ;

--zipcode테이블에서 자신이 거주하는 동의
--우편번호, 시도, 구군, 동, 번지를 조회하세요
--단, 번지가 없다면 '번지없음'을 출력해보세요
select zipcode,sido,gugun,dong,nvl(bunji,'번지없음')
from zipcode
where dong like '%의정부%';


SELECT ZIPCODE, SIDO, GUGUN, DONG, BUNJI
FROM ZIPCODE
WHERE DONG LIKE '%역삼%';
