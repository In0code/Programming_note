package kr.co.sist.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	
	@GetMapping("/purchase_review_write.do")
	public String addBuyComment() {
		return "/user/review/user_purchase_review";
	}
	
	
	@GetMapping("/user/review/user_sales_review.do")
	public String addSaleComment(Model model, HttpSession session) {
		return "user/review/user_sales_review";
	}//addSaleComment

}
