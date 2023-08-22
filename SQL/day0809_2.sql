--_ORACLE_SCRIPT를 사용해야 c##이 붙어있지 않는 계정을 생성할 수 있따
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

--자신의 이름의 이니셜로 계정 생성
CREATE USER kiy IDENTIFIED BY 1234;

--계정 조회 : dba_users DD 사용
SELECT *
FROM dba_users
WHERE username IN ('SCOTT','KIY');

--권한 조회 : dba_role_privs ,dba_sys_privs DD 사용
SELECT *
FROM DBA_ROLE_PRIVS
WHERE GRANTEE IN ('SCOTT','KIY');

SELECT *
FROM DBA_sys_privs
WHERE GRANTEE IN ('SCOTT','KIY');

--생성한 계정에 접속권한 부여
GRANT connect TO kiy;

--생성된 계정에 DB 사용권한 부여
GRANT resource TO kiy;

--생성한 계정에 DBA 사용권한 부여
GRANT dba TO kiy;

--권한 회수
REVOKE dba FROM kiy;

--계정삭제 
--객체를 생성하지않는 계정삭제
DROP USER kiy_sub;

--객체를 생성한 계정을 삭제 : cascade 옵션을 붙임 =>  접속되어있는 계정은 삭제할 수 없음
DROP USER kiy CASCADE;

SELECT *
FROM dba_users
WHERE username IN ('SCOTT','KIY');
