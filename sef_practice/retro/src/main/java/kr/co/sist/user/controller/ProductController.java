package kr.co.sist.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	@RequestMapping("/user/product_register.do")
	public String productManage(HttpServletRequest request, Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "user/product_register";
	}//productManage
}//class
