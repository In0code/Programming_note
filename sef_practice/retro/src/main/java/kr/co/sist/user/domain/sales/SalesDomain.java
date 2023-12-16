package kr.co.sist.user.domain.sales;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class SalesDomain {

	/*************************************************************************
	 * id, nickname은 구매자의 정보이다.
	 * input_date는 구매내역 테이블 거다. 
	 ************************************************************************/
	private String pcode, pname, input_date, id, nickname, phone, payment, img, select2, context;
	private int price;
}
