package kr.co.sist.user.domain.mypage;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MypageInfoDomain {

	private int credit_level, total_buyreceipt, total_product, total_buycomment, total_wish;
}
