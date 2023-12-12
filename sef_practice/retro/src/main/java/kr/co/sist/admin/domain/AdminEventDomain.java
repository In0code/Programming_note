package kr.co.sist.admin.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminEventDomain {
	private String eventcode, title, context, img, img2, id, input_date, start_date, end_date;
}
