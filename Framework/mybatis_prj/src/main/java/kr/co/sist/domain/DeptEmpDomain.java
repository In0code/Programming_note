package kr.co.sist.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeptEmpDomain {
	private int deptno, empno, sal;
	private String dname, loc, ename;
	private Date hiredate;
}
