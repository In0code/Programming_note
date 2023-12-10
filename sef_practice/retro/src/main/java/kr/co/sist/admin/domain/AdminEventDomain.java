package kr.co.sist.admin.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminEventDomain {
	private String eventcode, title, context, img, id;
	private Date input_date, start_date, end_date;
}
