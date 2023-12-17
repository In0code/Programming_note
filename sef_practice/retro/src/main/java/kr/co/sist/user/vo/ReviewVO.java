package kr.co.sist.user.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	String id, code, comment1, comment2_1, comment2_2, comment2_3, comment2_4, context;
	String[] comment2;
}
