--view 생성
--권한 부여
GRANT CREATE VIEW TO scott;

--검색
SELECT *
FROM dba_sys_privs
WHERE grantee='SCOTT';

--단순 view
CREATE VIEW emp_view (empno,ename,deptno,hiredate,sal)
AS (SELECT * FROM CP_EMP1 WHERE DEPTNO IN(10,30));

--VIEW 검색
SELECT *
FROM user_views;

--view를 사용하면 where절을 정의하지 않더라도 10,30번 부서사원만 볼 수 있따
SELECT empno,ename,deptno,to_char(hiredate,'yyyy-mm-dd')hiredate,sal
FROM emp_view
WHERE deptno=10;

--DML 가능 : 실제테이블에 반영된다
INSERT INTO emp_view (empno,ename,deptno,hiredate,sal)
VALUES (1114,'홍지성',10,sysdate,3200);

UPDATE emp_view 
SET sal=3000
WHERE empno=1114; 

DELETE FROM emp_view WHERE empno=1114;

SELECT *
FROM cp_emp1;


--read only : 
CREATE OR REPLACE VIEW emp2 AS (SELECT * FROM CP_EMP2 WHERE DEPTNO=30)
WITH READ only;

SELECT *
FROM user_views ;

SELECT * 
FROM EMp2; 

--whith read only는 DML(insert, delete, update)이 되지 않는다
INSERT INTO emp2 (empno,ename,job,deptno,hiredate,sal)
values(1111,'김선경','프로',10,sysdate,3500);

CREATE TABLE cp_dept as(SELECT*FROM dept);
CREATE TABLE cp_emp as(SELECT*FROM emp);
--cp_dept와 cp_emp를 사용한 복합 뷰 생성
CREATE OR REPLACE VIEW join_view as(
SELECT d.DEPTNO ,d.DNAME ,d.LOC ,e.EMPNO ,e.ENAME ,e.JOB ,e.SAL ,e.HIREDATE 
FROM  dept d, emp e 
WHERE (e.DEPTNO=d.DEPTNO)
); 

SELECT *
FROM user_views;

SELECT * 
FROM  join_view
WHERE deptno=10;

--복합뷰는 insert가 되지 않는다
INSERT INTO JOIN_VIEW (deptno,dname,loc,empno,ename,job,sal,hiredate)
values(10,'개발부','서울',1111,'김선경','개발자',3000,sysdate);

--update나 delete는 될 수도 있고 안될 수도 있다
--7782사원은 연봉을 3000으로 변경
UPDATE  join_view
SET   sal=3000
WHERE empno=7782;

--view 를 생성할 때 부서번호를 dept테이블에서 생성했기 때문에 변경할 수 없다 
UPDATE  join_view
SET   sal=3000, deptno=20  
WHERE empno=7782;

SELECT*
FROM join_view;

--view 삭제
DROP VIEW emp2;
DROP VIEW emp_view;
DROP VIEW join_view;

--scott계정에 부여된 view 생성권한을 회수 (관리자)
REVOKE CREATE VIEW FROM scott;

SELECT * FROM dba_sys_privs
WHERE grantee='SCOTT';

