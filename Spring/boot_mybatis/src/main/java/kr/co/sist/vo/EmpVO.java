package kr.co.sist.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmpVO {
	private int empno, sal;
	private String ename, job;
	private Date hiredate;

}
