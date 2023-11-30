package kr.co.sist.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	@RequestMapping("/user/product/product_register.do")
	public String productRegister(HttpServletRequest request, Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "user/product/product_register";
	}//productRegister
	
	@RequestMapping("/user/product/product_detail.do")
	public String productDetail(HttpServletRequest request, Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "user/product/product_detail";
	}//productDetail
	
	@RequestMapping("/user/product/product_status_change.do")
	public String productDetail2(HttpServletRequest request, Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "user/product/product_status_change";
	}//productDetail
}//class
