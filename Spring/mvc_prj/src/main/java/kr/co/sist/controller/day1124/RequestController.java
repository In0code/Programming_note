package kr.co.sist.controller.day1124;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RequestController {
	
//	@RequestMapping("/request_get.do")
	@RequestMapping(value="/request_get.do",method=RequestMethod.GET)
	public String requestGet(HttpServletRequest request,Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "day1124/response";
	}//requestGet
	
	
	@GetMapping("/request_get2.do")
	public String requestGet2(HttpServletRequest request,Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "day1124/response";
	}//requestGet2
	

	@RequestMapping(value="/request_post.do",method=RequestMethod.POST)
	public String requestPost(HttpServletRequest request,Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "day1124/respo"
				+ "nse";
	}//requestPost
	
	
	@RequestMapping(value="/request_post2.do",method=RequestMethod.POST)
	public String requestPost2(HttpServletRequest request,Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "day1124/response";
	}//requestPost2
	
	//GetMapping과 PostMapping은 하나만 사용할 수 있다
//	@PostMapping("/request_multi.do")
//	@GetMapping("/request_multi.do")
	@RequestMapping(value="/request_multi.do",
			method={ RequestMethod.GET,RequestMethod.POST })
	public String requestMulti(HttpServletRequest request,Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "day1124/response";
	}//requestMulti
	
	//가상경로
	@GetMapping("/temp/req.do")
	public String request(HttpServletRequest request,Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		System.out.println("--------가상경로");
		
		return "day1124/response";
	}//requestGetPost
	
}//class
