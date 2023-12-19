package kr.co.sist.common.pagination;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class PaginationDomain {

	private int startNum, endNum, paginationStartNum, paginationEndNum;
}
