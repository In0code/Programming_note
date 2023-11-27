package kr.co.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Hello {

	@GetMapping("/hello.do")
	public String helloTest(Model model) {
		String[] names= {"홍지성","김주민","김다영","정민교","차준식"};
		String[] lunch= {"구내식당","짜장면","볶음밥","마라탕","로제찜닭",
						"스파게티","감바스","감자탕","제육볶음"};
		model.addAttribute("data",names);
		model.addAttribute("lunch",lunch);
		return "hello";
				
	}//helloTest
	
}//class
