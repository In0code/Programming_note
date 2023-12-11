package kr.co.sist.user.domain.mypage;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MypagePrdDomain {

	private String pcode, pname, loc, img;
	private String[] date_gap;
	private int price;
	private Date input_date;
}
