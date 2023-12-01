package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPurchaseController {
	
	@GetMapping("my/purchase.do")
	public String purchaseList() {
		return "/user/user_mypage/user_purchase";
	}

}
