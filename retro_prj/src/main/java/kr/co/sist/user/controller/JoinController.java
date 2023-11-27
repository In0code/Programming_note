package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sist.user.vo.JoinVO;

@Controller
public class JoinController {
	
	private static JoinController jc;
	
	private JoinController() {
	}
	
	public static JoinController getInstance() {
		if(jc == null) {
			jc = new JoinController();
		}
		return jc;
	}
	
	@GetMapping("/user_join.do")
	public String joinFrm() {		
		return "user/user_join";
	}
	
	public String joinComplete(JoinVO jVO) {
		
		return "user/complete";
	}
	
}
