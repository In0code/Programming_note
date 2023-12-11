package kr.co.sist.admin.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class EventDomain {
	private String title;
	private Date start_date, end_date;
}
