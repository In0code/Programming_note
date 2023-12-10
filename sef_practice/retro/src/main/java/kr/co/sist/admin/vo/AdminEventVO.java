package kr.co.sist.admin.vo;

import java.sql.Date;

import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminEventVO {
	private String title, img, id, eventcode;
	private Date start_date, input_date, end_date;
}
