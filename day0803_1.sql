--조건함수

SELECT  DECODE( 'l','A','소심하다','B','터프하다',
'AB','싸이코','O','우유부단','사람이 아니무이다') as 혈액형
FROM   dual;

--사원테입즐에서 사원번호, 사원명, 부서번호, 부서명을 조회
--단, 부서명은 부서번호가 10번인 경우 개발부, 20번-유지보수,
--30-영업 , 그 외 축구부
SELECT EMPNO, ENAME, DEPTNO ,
			DECODE( DEPTNO, 10,'개발부',20,'유지보수',30,'영업',
			'축구부') as deptname
FROM  EMP;

--case문 사용
SELECT  EMPNO, ENAME, DEPTNO,
				case deptno when 10 then '개발부'
										when 20 then '유지보수'
										when 30 then '영업부'
										else '축구부'
				end hangul_dname
FROM EMP;

--사원테이블에서 사원번호, 사원명, 부서번호, 연봉, 특별
--보너스를 조회
--단, 특별보너스는 부서별로 균등지급
--10번 부서는 연봉의 10%로 설정
--20번 부서는 연봉과 보너스를 합산한 금액 15%
--30번 부서는 연봉의 50% ,그 외 연봉 100%로 출력
SELECT EMPNO, ENAME, DEPTNO, SAL
			case  when
					  when
					  when
					  else
			end
FROM  EMP;

                                ㅣ
------------변환함수-------------------------
--날짜변환
SELECT sysdate, to_char(sysdate,'yyyy-mm-dd d dy day am hh(hh12, hh24):mi:ss') as "date"
FROM   dual;

--날짜 형식이 너무 길면 error 발생
SELECT to_char
(sysdate,'yyyy " 년" mm " 월" dd " 일 " hh " 시 " mi " 분 " ss " 초 "  ') as "date"
FROM   dual;


--사원 테이블에서 사원 번호, 사원명, 입사일 조회
--단, 입사일은 월-일-년 요일의 형식으로 출력
SELECT EMPNO, ENAME, to_char(HIREDATE, 'mm - dd - yyyy') as hiredate
FROM  EMP;

--사원테이블에서 입사년도가 1981년인 사원이 사원번호, 사원명
--입사일, 연봉을 조회
SELECT EMPNO, ENAME, HIREDATE, SAL
FROM  EMP
WHERE to_char(HIREDATE,'yyyy') = 1981 ;


--숫자변환
SELECT '['||to_char(2023,'0,000,000') ,'['||to_char(2023,'9,999,999'),
				to_char(202308,'0,000')
FROM   dual;

--사원테이블에서 사원번호, 연봉, 부서번호를 조회
--단, 연봉은 데이터가 있는 것 까지만 3자마다 , 를 넣어출력
SELECT EMPNO, to_char(SAL,'9,999,999'), DEPTNO
FROM 	EMP ;


--날자변환
select * from TEST_DATE;
--date 컬럼에 sysdate로 추가하는 경우에 시간 정보가 들어간다
--date 컬럼에 다른 날자 정보를 추가할 때에는 날짜형식의
--문자열을 사용하거나 to_date 함수를 사용
insert into test_date values('2023-08-04');

--년월일형식이 아니어서 error
insert into test_date values('08-04-2023');

--to_date 함수를 사용하여 날짜정보 추가
insert into test_date values(to_date('2023-08-04','yyyy-mm-dd'));
--to_date로 문자열이 pattern에 해당되는 날짜로 변환되기
--때문에 insert가 된다.
insert into test_date values(to_date('08-04-2023','mm-dd-yyyy'));

select * from TEST_DATE;

--to_date를 사용하지 않았을때 error : 함수호출하는 경우에만
--to_char함수의 첫 번째 매개변수는 date로 선언되어있다.
SELECT  to_char('2023-08-24','mm-dd-yyyy')
FROM 	dual;

--해결법 : 문자열을 TEST_LIKE, TEST_LIKE날짜 형식으로 변경해야 한다
--to_date 사용
SELECT  to_char(to_date('2023-08-05','yyyy-mm-dd'),'dd-mm-yyyy')
FROM   dual;


--숫자변환
SELECT  '8'+'3' ,to_number('8') + to_number('3')
FROM   dual;

