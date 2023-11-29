package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("/user/login_frm.do")
	public String useLoginfrm() {
		
		return "user/login_frm";
	}
}
