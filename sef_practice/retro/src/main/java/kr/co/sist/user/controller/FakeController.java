package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FakeController {
	
	@GetMapping("/user/fraud.do")
	public String fakeFrm() {
		return "user/fakeFrm";
	}
	
	@GetMapping("/user/result.do")
	public String searchFake() {
		//컴
		return "user/searchFake";
	}

}
