/*1. 배기량이 1500~3000 사이인 차량의 제조국,제조사,모델명,년식,가격,
    이미지,입력일,배기량, 옵션을 조회
   단. 출력은 배기량의 내림차순 정렬 했을 때 3~6번째 레코드만 조회하고,
     옵션은 처음 ',' 까지만 출력 할것. 가격과 연식은 3자리마다 ,를 넣어 출력,
     입력 일은 월-일-년 의 형식으로 출력 할 것.
*/

--함수는 밖으로 => 일을 덜함
--모든 정보를 가져와야 하기 때문에 outer join으로 작성
SELECT   country, maker, model, to_char(car_year, '9,999') car_year, price, car_img, to_char(cc, '9,999') cc, 
         to_char(hiredate, 'mm-dd-yyyy') hiredate,
         substr(car_option, 1, instr(car_option, ',')), rnum
FROM (SELECT    cc.COUNTRY , cc.MAKER , 
               cma.MODEL , 
               cmo.CAR_YEAR , cmo.PRICE , cmo.CAR_IMG , cmo.cc, cmo.HIREDATE, cmo.CAR_OPTION,
               ROW_NUMBER() over( ORDER BY cmo.cc desc ) rnum
         from    CAR_COUNTRY cc, CAR_MAKER cma, CAR_MODEL cmo
WHERE    (cma.MAKER=cc.MAKER AND cmo.MODEL=cma.MODEL) AND 
         ( cmo.cc BETWEEN 1500 AND 3000)) 
WHERE rnum BETWEEN 3 AND 6; 
--WHERE rnum IN (3,4,5,6);


SELECT COUNTRY, MAKER
FROM SCOTT.CAR_COUNTRY;

SELECT MAKER, MODEL
FROM SCOTT.CAR_MAKER;

SELECT MODEL, CAR_YEAR, PRICE, CC, CAR_OPTION, CAR_IMG, HIREDATE
FROM SCOTT.CAR_MODEL;



/*2. 부서번호가 10, 30,40번인 모든 부서의 사원번호,사원명,입사일,
   연봉,연봉순위,부서명,부서번호,위치, 우편번호,시도, 구군,동,번지 를 조회.
  단,출력은 사원번호의 오름차순으로 정렬했을 때 2~5번째 레코드만 출력,
   우편번호는 '-' 뒤부터 끝까지 출력, 번지가 없다면 '번지없음'으로 대체
  하여 출력 ,입사일은 월-일-년 요일까지 출력  ( emp 사원번호와 zipcode SEQ컬럼을 조인조건 사용)
  
*/
SELECT empno, ename, to_char(hiredate, 'mm-dd-yyyy dy') hiredate, sal, sal_rank, dname, deptno, loc, 
      substr(zipcode, instr(zipcode, '-')+1) zipcode, sido, gugun, dong, nvl(bunji,'번지없음'), empno_asc
FROM (SELECT   empno, ename, hiredate, sal, sal_rank, dname, deptno, loc, zipcode, sido, gugun, dong, bunji, 
               ROW_NUMBER () over(ORDER BY empno) empno_asc
         FROM (SELECT    e.empno, e.ename, e.hiredate, e.sal, ROW_NUMBER() OVER(ORDER BY sal desc) sal_rank, 
                           d.dname, d.deptno, d.loc, 
                           z.zipcode, z.sido, z.gugun, z.dong, z.bunji
                  FROM    dept d, emp e, zipcode z
                  WHERE    (e.deptno(+)=d.deptno AND z.seq(+)=e.empno) AND (d.deptno IN (10,30,40))))
WHERE empno_asc BETWEEN 2 AND 5;



----------------------------------- 3번 ---------------------------------------------
SELECT		cc.COUNTRY, INITCAP(cc.MAKER), cmo.MODEL, cmo.CAR_YEAR, cmo.price, cmo.CAR_OPTION,substr(CMO.CAR_IMG ,1,instr(CMO.CAR_IMG,'.')-1) img_name,
				substr(cmo.CAR_IMG ,instr(cmo.CAR_IMG ,'.')+1 ) img_extension, cmo.CC
FROM 		CAR_COUNTRY cc, CAR_MAKER cmk, CAR_MODEL cmo
WHERE 		cc.MAKER = CMK.MAKER AND  cmk.MODEL = cmo.MODEL AND cmk.MAKER  IN ('현대', '기아', '삼성', 'BMW', 'AUDI') AND
				(cmo.CAR_OPTION LIKE '%ABS%' OR cmo.CAR_OPTION LIKE '%TCS%')
ORDER BY cmo.car_year DESC, cmo.PRICE DESC;


----------------------------------- 4번 ---------------------------------------------
SELECT 		rnum, '[ ' || model || ' ] 차량의 연식은 [' || TO_CHAR(car_year,'0,000') || ' ]이고, 제조국은 [' || COUNTRY || ']이며, [' || maker || ']사가 제조사 입니다. 가격은 [' ||
				PRICE || ']만원 입니다.'
FROM 		(SELECT	ROW_NUMBER () over(ORDER BY cmo.PRICE asc) rnum, cmo.MODEL, cc.COUNTRY, cmk.MAKER, cmo.price, cmo.CAR_YEAR 
				FROM		CAR_COUNTRY cc, CAR_MAKER cmk, CAR_MODEL cmo
				WHERE 	cc.MAKER = CMK.MAKER AND  cmk.MODEL = cmo.MODEL AND cmo.MODEL IN ('K5','아반테','소렌토','A8','SM3'))
WHERE 		rnum BETWEEN 2 AND 7;


----------------------------------- 5번 ---------------------------------------------
SELECT 		CAR_YEAR, MODEL, sum(price) total_price
FROM 		(SELECT 		cmo.CAR_YEAR, cmo.MODEL,cmo.PRICE  
				FROM 	 	CAR_MAKER cmk, CAR_MODEL cmo
				WHERE 		cmo.MODEL = cmk.MODEL AND CMK.MAKER = '현대')
GROUP BY car_year, model
ORDER BY car_year asc;


SELECT * FROM CAR_MODEL;

----------------------------------- 6번 ---------------------------------------------
SELECT		e.EMPNO , lower(e.ENAME), e.HIREDATE, e.SAL, e.SAL*0.033 tax,
			to_char(e.SAL+(TRUNC(MONTHS_BETWEEN(SYSDATE ,e.HIREDATE))*(e.sal/4))+nvl(e.comm,0)-(e.SAL*0.033),'999,999,999') real_pay,
			case d.deptno when 10 then e.sal*0.07
				             when 20 then (e.sal+nvl(e.comm,0))*0.04
				             when 30 then (e.sal+nvl(e.comm,0))*0.1
				             else e.sal*0.03
				 end salary_increase, d.DEPTNO, lower(d.DNAME), lower(d.LOC), z.ZIPCODE, z.SIDO,z.GUGUN,z.DONG,z.BUNJI  
FROM 		emp e, dept d, ZIPCODE z
WHERE 		e.DEPTNO = d.DEPTNO AND z.SEQ  = e.EMPNO AND (e.ENAME LIKE '%S' OR (LENGTH(e.ENAME) = 5 AND SUBSTR(e.ENAME, 3, 1) = 'A'));  


