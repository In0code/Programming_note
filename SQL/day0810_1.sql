--시노님 생성 권한 부여( CREATE SYNONYM)--관리자 계정만 가능
GRANT CREATE SYNONYM TO SCOTT;


--부여된 권할을 조회 (dba_sys_privs)
SELECT *
FROM dba_sys_privs
WHERE GRANTEE ='SCOTT';

SELECT *
FROM dba_role_privs
WHERE GRANTEE ='SCOTT';

--시노님 생성 ( 권한이 있어야 생성 가능)

CREATE SYNONYM EMPLOYEE FOR CP_EMP1;

--생성된 시노님 조회 USER_SYNONYMS

SELECT *
FROM USER_SYNONYMS;

--시노님 사용
SELECT *
FROM CP_EMP1;

SELECT *
FROM EMPLOYEE;

INSERT INTO EMPLOYEE (EMPNO,ENAME, DEPTNO, HIREDATE,SAL)
VALUES (1113,'홍찬영',10,SYSDATE,3000);
--시노님 삭제
DROP SYNONYM EMPLOYEE;

--시노님 권한 회수 ( 관리자 )
SELECT *
FROM DBA_SYS_PRIVS 
WHERE GRANTEE ='SCOTT';

REVOKE CREATE synonym FROM SCOTT;

SELECT *
FROM dba_users;

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER kiy IDENTIFIED BY 1234;
GRANT CONNECT, resource TO kiy;

--계정 잠그기
ALTER USER kiy account LOCK;

--계정 열기
ALTER USER kiy account unLOCK;

--계정 삭제
DROP USER kiy;



