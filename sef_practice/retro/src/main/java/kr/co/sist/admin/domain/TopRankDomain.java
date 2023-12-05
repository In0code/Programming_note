package kr.co.sist.admin.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class TopRankDomain {
	private int rank , total;
	private String category;
	
}
