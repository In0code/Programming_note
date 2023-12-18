package kr.co.sist.user.domain.sales;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class SalesListDomain {

	private String pcode, pname, input_date, wish, img;
	private int price;
}
