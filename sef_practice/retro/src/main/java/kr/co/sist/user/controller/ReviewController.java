package kr.co.sist.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.sist.user.service.reiview.PurchaseReviewService;
import kr.co.sist.user.vo.ReviewVO;

@Controller
public class ReviewController {
	
	@Autowired
	private PurchaseReviewService prs;
	
	@PostMapping("/purchase_review_write.do")
	public String buyCommentFrm(String code, Model model) {
		model.addAttribute("info",prs.searchPurchaseInfo(code));
		return "/user/review/user_purchase_review";
	}
	
	@PostMapping("/purchase_review_write_prc.do")
	public String addBuyComment(ReviewVO rVO, Model model) {
		model.addAttribute("addFlag", prs.addReview(rVO) == 1 ? true : false);
		
		return "/user/review/review_complete";
	}
}
