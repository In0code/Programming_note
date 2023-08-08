---------1---------
SELECT empno, ename,hiredate, lpad(sal,8,'$')
FROM   emp
order by sal;

---------2---------
SELECT empno,initcap(ename) ename,job,hiredate,sal,comm,
			 round(((sal+comm)-((sal+comm)*0.033)),-1) real_total
FROM   emp

WHERE lower(job)in('manager','salesman','clerk');


---------3--------
SELECT MODEL,PRICE, CAR_YEAR, substr(car_option,1,instr(car_option,',',instr(CAR_OPTION,',')+1)), lower(CAR_IMG)
FROM  CAR_MODEL


WHERE  lower(MODEL) in('k5','╬ф╧щев','a8') or CAR_OPTION like '%ABC%'
order by price desc, model desc;

select * from CAR_MODEL;
