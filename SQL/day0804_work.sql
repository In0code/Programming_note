------------1-------------
CREATE TABLE emp_work as
(SELECT EMPNO ,ENAME ,SAL ,HIREDATE ,DEPTNO ,JOB ,MGR 
FROM emp 
WHERE sal BETWEEN 1500 AND 3000);

COMMIT;
SELECT * FROM emp_work;

------------2-------------
INSERT INTO emp_work(
SELECT EMPNO+1000 ,ENAME ,SAL ,HIREDATE ,DEPTNO ,JOB ,MGR  FROM emp WHERE deptno IN (10,30));
--UPDATE emp_work SET empno=(empno+1000) WHERE DEPTNO IN (10,30);
COMMIT;
------------3-------------
UPDATE emp_work 
SET sal=(SELECT sal FROM emp WHERE empno=7698)+(SELECT sal FROM emp WHERE empno=7782)
WHERE deptno = 10;

SELECT * FROM emp;

------------4-------------
INSERT INTO emp_work(EMPNO ,ENAME ,JOB ,hiredate)
VALUES ((SELECT MAX(EMPNO)+1 FROM EMP_WORK),'김선경','개발자',sysdate+1  )

------------5-------------
CREATE TABLE sales(
num number(1),
objname varchar2 (9),
price NUMBER (10),
sales_date DATE ,
quantity number
);
INSERT INTO sales values(1,'키보드',20000,'2023-08-25',1);
INSERT INTO sales values(2,'마우스',27000,'2023-08-25',1);
INSERT INTO sales values(3,'모니터',350000,'2023-08-25',1);
INSERT INTO sales values(4,'키보드',23000,'2023-08-25',1);
INSERT INTO sales values(5,'키보드',15000,'2023-08-25',1);
INSERT INTO sales values(6,'키보드',20000,'2023-08-26',1);
INSERT INTO sales values(7,'마우스',13000,'2023-08-26',1);
INSERT INTO sales values(8,'키보드',22000,'2023-08-26',1);
commit;

SELECT * FROM sales; 
DROP TABLE sales;

------------6-------------
CREATE TABLE sales_adjustment as(
SELECT objname , price price_total, quantity quantity_num, sales_date, sysdate input_date 
FROM sales 
WHERE 1=0
);
COMMIT;
SELECT * FROM sales_adjustment; 

------------7-------------
--복수행 서브쿼리 문법
INSERT INTO sales_adjustment (
SELECT objname, SUM(price),COUNT(objname),sales_date ,sysdate 
FROM sales 
WHERE sales_date='2023-08-25'
GROUP BY objname,sales_date );



SELECT * FROM SALES_ADJUSTMENT ;
