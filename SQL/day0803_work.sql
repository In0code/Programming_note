--------------------1-------------------
SELECT EMPNO ,ENAME ,JOB ,MGR ,SAL,
		TO_CHAR( HIREDATE,'mm-dd-yyyy day') HIREDATE  
FROM EMP; 

--------------------2-------------------
SELECT DEPTNO , EMPNO , SAL ,comm ,sal+(NVL( COMM,0)) total,
		TRUNC((sal+(NVL( COMM,0)))-((sal+(NVL( COMM,0)))*0.033)) real_total,
		TRUNC(sal/12) mon_sal, HIREDATE 
FROM EMP ;

--------------------3-------------------
CREATE TABLE test_1(
name varchar2(9),
age NUMBER (20),
bone varchar2 (20),
identi varchar2(12)
);

INSERT INTO  test_1 VALUES ('강다연',25,1995,'950101-2234567');
INSERT INTO  test_1 VALUES ('김다영',25,1995,'951126-1234567');
INSERT INTO  test_1 VALUES ('김선경',26,1994,'940101-2234567');
INSERT INTO  test_1 VALUES ('김인영',26,1994,'940101-1234567');
INSERT INTO  test_1 VALUES ('김주민',27,1993,'930101-5234567');

COMMIT;

SELECT * FROM test_1; 

--------------------4-------------------
SELECT name, age, bone, identi,  
		DECODE(substr(identi,8,1),1 ,'남자',3,'남자',2,'여자',4,'여자'
		,5,'외국인',6,'외국인',7,'외국인',8,'외국인','오류')
FROM test_1;

--------------------5-------------------
