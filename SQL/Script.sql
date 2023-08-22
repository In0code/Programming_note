SELECT to_char(sysdate,'YYYY-MM-DD q"분기"')
FROM dual;

--사원테이블에서 1분기, 3분기에 입사한 사원들의 사원번호,사원명,
--입사일, 분기 조회
SELECT EMPNO ,ENAME ,HIREDATE , to_char(HIREDATE,'q')
FROM EMP 
WHERE TO_CHAR(HIREDATE,'q') IN ('1','3') ;


SELECT TO_CHAR(1234.566,'9,999.99'),TO_CHAR(1234.566,'0,000.00'),
		TO_CHAR(1234.566,'9,999.00')
FROM dual;