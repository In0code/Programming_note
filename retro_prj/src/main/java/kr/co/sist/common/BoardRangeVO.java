package kr.co.sist.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardRangeVO {
	private int startNum, endNum;
	private String keyword, field, orderby, id, status;
}
