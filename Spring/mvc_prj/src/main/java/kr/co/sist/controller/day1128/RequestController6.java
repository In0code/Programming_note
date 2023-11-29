package kr.co.sist.controller.day1128;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RequestController6 {

	/**
	 * 최초 호출 페이지
	 * @return
	 */
	@GetMapping("/day1128/use_forward.do")
	public String request() {
		System.out.println("최초 요청");
		//forward를 붙여주면 ViewResolver를 거치지 않고 Controller에서 바로 이동한다
		return "forward:use_forward2.do";
	}//request
	
	
	/**
	 * 최초 호출 후 이동하는 페이지이나 이 페이지가 호출 될 수도 있다
	 * @return
	 */
	@GetMapping("/day1128/use_forward2.do")
	public String request2() {
		
		System.out.println("최초 요청에서 이동한 요청");
		return "forward:use_forward3.do";
	}//request2
	
	
	/**
	 * 최종 호출 페이지
	 * @return
	 */
	@GetMapping("/day1128/use_forward3.do")
	public String request3() {
		
		System.out.println("최초 요청에서 이동한 요청");
		return "day1128/forward_chain";
	}//request3
	
	
	@RequestMapping("/day1128/include.do")
	public String includeDirective() {
		
		return "day1128/include_directive";
		
	}//includeDirective
	
	@RequestMapping("/day1128/include2.do")
	public String includeAction() {
		
		return "day1128/include_action";
		
	}//includeDirective
	
}//class
