--inner join: 양쪽 테이블에 같은 값이 있는 것만 조회 
--( 조인 조건에 사용되는 컬럼에 어느 한쪽 테이블에만 값이 존재하면 조인되지 않는다)

--사원번호, 사원명, 부서번호, 부서명, 위치 검색
--중복되는 컬럼명에는 테이블명을 기술하여 식별되도록 작성한다
SELECT EMPNO ,ENAME ,emp.DEPTNO ,dname,loc
FROM EMP 
INNER JOIN DEPT 
ON (emp.deptno=dept.deptno);

--테이블명이길면 작성하기 어렵다 => 테이블명에 alias를 붙여서 사용
--alias는 inline view에 반영되지 않는다
SELECT e.EMPNO ,e.ENAME ,e.DEPTNO ,d.dname,d.loc
FROM EMP e
INNER JOIN DEPT d
ON (e.deptno=d.deptno);

--oracle inner join 문법
SELECT empno, ENAME ,emp.DEPTNO ,dname,loc
FROM emp, DEPT 
WHERE emp.DEPTNO =dept.DEPTNO ;

--alias : 테이블명에 alias가 부여되면 이전 테이블명은 사용할 수 없다
SELECT e.EMPNO ,e.ENAME ,e.DEPTNO ,d.DEPTNO ,d.DNAME ,d.LOC 
FROM emp e, dept d
WHERE e.DEPTNO =d.DEPTNO ;

--차량의 제조국, 제조사, 모델명을검색 (존재하는 데이터만 출력할 것)
SELECT cc.COUNTRY ,cm.MAKER ,cm.MODEL 
FROM CAR_COUNTRY cc 
INNER JOIN CAR_MAKER CM 
ON cc.MAKER =cm.MAKER ;

--oracle )
SELECT cc.COUNTRY ,  cm.MAKER ,cm.MODEL 
FROM CAR_COUNTRY cc, CAR_MAKER cm
WHERE cc.MAKER =cm.MAKER ;


--보유중인 차량의 제조국, 제조사, 모델명, 가격, 연식을 조회
SELECT cc.COUNTRY ,cc.MAKER ,cma.MODEL ,cmo.PRICE ,cmo.CAR_YEAR 
FROM CAR_COUNTRY cc 
INNER JOIN CAR_MAKER cma
ON cc.maker = cma.MAKER
INNER JOIN CAR_MODEL cmo
ON cmo.MODEL =cma.MODEL;

SELECT cc.COUNTRY ,cc.MAKER ,cma.MODEL ,cmo.PRICE ,cmo.CAR_YEAR 
FROM CAR_COUNTRY cc ,CAR_MAKER cma,CAR_MODEL cmo
WHERE cc.maker = cma.MAKER AND cmo.MODEL =cma.MODEL ;

-------------outer join------------------
--모든 부서의 부서번호, 부서명, 사원번호, 사원명을 조회
SELECT d.DEPTNO ,d.DNAME , e.EMPNO ,e.ENAME 
FROM dept d 
left OUTER JOIN emp e 
ON e.DEPTNO =d.DEPTNO ;

--full outer join : 양쪽 테이블을 모두 참조하여 레코드를 조회하는 조인
SELECT d.DEPTNO ,d.DNAME , e.EMPNO ,e.ENAME 
FROM dept d 
full OUTER JOIN emp e 
ON e.DEPTNO =d.DEPTNO ;

--oracle join
SELECT d.DEPTNO ,d.DNAME ,e.EMPNO ,e.ENAME 
FROM DEPT d, EMP e
WHERE e.DEPTNO(+) =d.DEPTNO ;

SELECT * FROM EMP ;

--모든 차량모델의 제조국, 제조사, 모델명, 연식, 가격, 배기량 조회
SELECT cc.COUNTRY ,cc.MAKER ,cma.MODEL ,cmo.CAR_YEAR ,cmo.PRICE ,cmo.CC 
FROM CAR_COUNTRY cc ,CAR_MAKER cma ,CAR_MODEL cmo
WHERE cc.MAKER =cma.MAKER(+) AND cmo.MODEL(+) =cma.MODEL ;

SELECT cc.COUNTRY ,cc.MAKER ,cma.MODEL ,cmo.MODEL ,cmo.CAR_YEAR ,cmo.PRICE ,cmo.CC 
FROM CAR_COUNTRY cc
inner JOIN CAR_MAKER CMA 
ON cma.MAKER =cc.MAKER 
LEFT OUTER JOIN CAR_MODEL CMO 
ON cmo.MODEL =cma.MODEL ;

SELECT * FROM CAR_COUNTRY  ;
SELECT * FROM CAR_MAKER  ;
SELECT * FROM CAR_MODEL  ;
