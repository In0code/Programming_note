---------------1--------------
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
--계정생성
CREATE USER anony IDENTIFIED BY test1234;
---------------2--------------
GRANT CONNECT TO anony;

GRANT resource TO anony;

---------------3--------------
SELECT *
FROM DBA_ROLE_PRIVS 
WHERE GRANTEE IN ('ANONY');

---------------4--------------
create table work_0810(
Prd_code varchar2(15),
Prd_name varchar2(20),
price number
);

ALTER USER anony DEFAULT TABLESPACE Users quota unlimited ON users;
INSERT INTO work_0810 VALUES ('k_0001','기계식키보드',150000);
INSERT INTO work_0810 VALUES ('M_0001','마우스',10000);
INSERT INTO work_0810 VALUES ('K_0001','기계식키보드',150000);
INSERT INTO work_0810 VALUES ('M_0001','마우스',10000);

SELECT  * FROM work_0810;
---------------5--------------
--view 생성 권한
grant CREATE VIEW TO anony;
--view 생성
CREATE VIEW prd_view (Prd_code,Prd_name,price)
AS (SELECT * FROM work_0810 );

SELECT *
FROM prd_view;;

---------------6--------------


---------------7--------------
--테이블 삭제
DROP VIEW prd_view;
--view 삭제
DROP TABLE work_0810;

--삭제 확인
SELECT * FROM work_0810;
SELECT * FROM user_indexes;

---------------8--------------

---------------9--------------
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
--계정 삭제 
DROP USER anony cascade;
