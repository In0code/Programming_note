package kr.co.sist.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class JoinDomain {
	private String dname,ename;
	private int deptno,empno,sal;
}
