package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class GoodsController {
	
	@GetMapping("/goods/goods_list.do")
	public String goodsList() {
		return "goods/goods_list";
	}
	
	@GetMapping("/goods/goods_info.do")
	public String goodsInfo() {
		return "goods/goods_info";
	}
	
	@GetMapping("/seller/seller_info.do")
	public String sellerInfo() {
		return "seller/seller_info";
	}

	@GetMapping("/seller/seller_review.do")
	public String sellerReview() {
		return "seller/seller_review";
	}
	
	
	
}
