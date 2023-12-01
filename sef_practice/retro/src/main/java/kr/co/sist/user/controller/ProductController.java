package kr.co.sist.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	/**
	 * 상품 등록 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/product/product_register.do")
	public String productRegister(HttpServletRequest request, Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "user/product/product_register";
	}//productRegister
	
	
	/**
	 * 판매자가 보는 상품 상세 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/product/product_detail.do")
	public String productDetail(HttpServletRequest request, Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "user/product/product_detail";
	}//productDetail
	
	/**
	 * 상품 등록 완료 시 나오는 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/product/product_register_ok.do")
	public String productRegisterOk(HttpServletRequest request, Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "user/product/product_register_ok";
	}//productDetail
	
	/**
	 * 상품 등록 완료 시 나오는 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/product/product_practice.do")
	public String productPractice(HttpServletRequest request, Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "user/product/product_practice";
	}//productDetail
}//class
