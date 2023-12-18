package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BuyController {
	
	@GetMapping("user/pay/safe_payment.do")
	public String payment() {
		
		return "user/pay/safe_payment";
	}
	
}
