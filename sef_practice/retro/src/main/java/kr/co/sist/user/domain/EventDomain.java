package kr.co.sist.user.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EventDomain {
	private String eventcode, title, context, img, img2, start_date, end_date, dday;
}
