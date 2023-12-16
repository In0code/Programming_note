package kr.co.sist.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReviewController {
	
	@GetMapping("/purchase_review_write.do")
	public String buyCommentFrm() {
		return "/user/review/user_purchase_review";
	}
	
	@PostMapping("/purchase_review_write_prc.do")
	public String addBuyComment(@RequestParam(required = true, defaultValue = "1")String comment1, String[] comment2) {
		System.out.println(comment2[0]);
		System.out.println(comment2[1]);
		return "/user/review/review_complete";
	}
	
	@GetMapping("/user/review/user_sales_review.do")
	public String addSaleComment(Model model, HttpSession session) {
		return "user/review/user_sales_review";
	}//addSaleComment

}
