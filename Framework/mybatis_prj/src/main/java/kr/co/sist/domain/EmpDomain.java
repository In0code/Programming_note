package kr.co.sist.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmpDomain {
	private int empno, sal, deptno;
	private String ename, job;
	private Date hiredate;
}
