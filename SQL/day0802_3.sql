----------------문자열함수-----------------
--length
select length('ABCD'),length('오늘은 수요일 입니다')
from dual;

--사원 테이블에서 사원명이 4자 이상인 사원들의 사원명, 연봉, 입사일 조회
SELECT  ename,length(ename)ename_leng,sal,hiredate
FROM  emp
WHERE length (ename)>=4;

--모두 대문자로 : upper , 모두 소문자로 :lower
select upper('AbcdEf')upper, lower('AbcdEf')lower
from  dual;

--사원 테이블에서 사원명이 'scott'인 사원의 사원번호, 사원명
--매니저번호 조회
select empno,ename,mgr
from emp
--where  ename= upper('scott');
where  lower(ename)= 'scott';

select ename, lower(ename) lower_ename
from EMP;


--첫글자를 대문자로
SELECT initcap('oracle'),initcap('ORACLE'),
				initcap('i am a girl'), initcap('java oracle jdbc html')
FROM dual;

select ename, initcap(ename)
from EMP;

--특정문자열의 인덱스 얻기( 오라클은 시작인덱스가 1번부터)
SELECT instr('ABCDEF','A'),instr('ABCDEF','B'),instr('ABCDEF','K'),
				instr('ABCDEF','CDE'),instr('ABCDEFAB','A',2)
FROM  dual;

--사원테이블에서 사원명에 두 번째 글자에 'A'가 있는 사원의
--사원명을 조회
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

--test_null테이블의 이메일 컬럼을 사용하여 메일주소와
--도메인 주소를 분리하여 조회
SELECT  substr(email,instr(email,1),(instr(email,'@')-1)) email,
		 substr(email,instr(email,'@')+1,instr(email,'.'))  domain

FROM  test_null;
--where substr(email,instr(email,'@')+1)='gmail.com';
--where instr(email,'gmail.com') != 0;   --권장
--WHERE email like '%gmail.com'


--trim
SELECT  '['||trim('   A BC   ')||']',
				'['||ltrim('   A BC   ')||']',
				'['||rtrim('   A BC   ')||']'
FROM    dual;

--특정 문자열 삭제
SELECT trim( '~'from'~~~~~~~Oracle~~~~~~~') trim
FROM    dual;


--특정문자 채우기
--Lpad( 값, 전체글자수, 채울문자열 )
SELECT lpad('ABCDE',10,'$'),lpad('가나다',10,'$'),
				lpad('가나다',11,'$'),lpad('가나다',11,'카')

FROM   dual;

--rpad( 값, 전체글자수, 채울문자열 )
SELECT  rpad('ABCDE',10,'#') ,rpad('ABCDE',8,'u'),
 				rpad('가나다',11,'$'),rpad('가나다',11,'카')
FROM   dual;

