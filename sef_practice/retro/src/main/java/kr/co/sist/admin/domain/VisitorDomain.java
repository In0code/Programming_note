package kr.co.sist.admin.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class VisitorDomain {
	private Date daily_Date;
	private int total_cnt;
}
