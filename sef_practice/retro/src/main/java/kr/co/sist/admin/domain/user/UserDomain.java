package kr.co.sist.admin.domain.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserDomain {

	private String id, nickName, userName, phone, input_date, email;
	private char status;
}
