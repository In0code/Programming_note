--관리자의 작업

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

CREATE USER anony1 IDENTIFIED BY test1234; 

SELECT *
FROM dba_users
WHERE username='ANONY1';

GRANT CONNECT , resource TO anony1;

SELECT *
FROM DBA_ROLE_PRIVS
WHERE grantee='ANONY1';

--resource로는 테이블을 생성할 수 있지만, 생성된 테이블이 tablespace에 사용제한이 
--걸려있기 때문에, 사용제한을 풀어준다
ALTER USER anony1 DEFAULT TABLESPACE users quota unlimited ON users;

--view 생성 권한 부여
GRANT CREATE VIEW TO anony1;

SELECT *
FROM DBA_sys_PRIVS
WHERE grantee='ANONY1';

--생성된 사용자의 작업

CREATE TABLE produck(
prd_code char(6),
Prd_name varchar2 (60),
price NUMBER
); 

INSERT INTO produck(prd_code,PRD_NAME,PRICE) VALUES('K_0001','키보드',15000);

CREATE VIEW prd_view as(SELECT * FROM PRODUCK);

SELECT * FROM USER_views;
SELECT * FROM PRODUCK ;


DROP TABLE PRODUCK ;
DROP VIEW prd_view;

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
--계정 삭제 
DROP USER anony1 cascade;



