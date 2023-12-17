package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.sist.user.service.reiview.SaleReviewService;
import kr.co.sist.user.vo.ReviewVO;

@Controller
public class SaleReviewController {
	
	private SaleReviewService srs=SaleReviewService.getInstance();
	
	@PostMapping("/sales_review_write.do")
	public String saleCommentFrm(String buyerId, Model model) {
		
		
		model.addAttribute("info",srs.searchBuyerInfo(buyerId));
		return "user/review/user_sales_review";
	}//saleCommentFrm
	
	@PostMapping("/sales_review_write_prc.do")
	public String addSaleComment(ReviewVO rVO, Model model) {
		model.addAttribute("addFlag", srs.addSaleReview(rVO) == 1 ? true : false);
		
		return "user/review/review_complete";
	}//addSaleComment
	

}//class
