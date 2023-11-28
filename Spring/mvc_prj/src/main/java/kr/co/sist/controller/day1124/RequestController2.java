package kr.co.sist.controller.day1124;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RequestController2 {

	@GetMapping("/req.do") 
	public String responseJSP() {
	
		//요청 URI와 응답 JSP는 아무 관련이 없다
		return "day1124/req2"; //WEB-INF/views/day1124/req.jsp가 응답
	}//responseJSP
	
	@GetMapping("/day1124/req2.do") 
	public String responseJSP2() {
		
		//요청 URI와 응답 JSP는 아무 관련이 없다
		return "day1124/sub/req3"; //WEB-INF/views/day1124/req.jsp가 응답
	}//responseJSP
	
	@GetMapping("/param_frm.do") 
	public String webParameterFrm() {
		
		return "day1124/param_frm"; //WEB-INF/views/param_frm.jsp가 응답 
	}//responseJSP
	
	@GetMapping("/use_req.do") 
	public String webParameterFrm(HttpServletRequest request) {
		//name 속성이 유일
		String name=request.getParameter("name");
		System.out.println("이름이 유일 "+ name);
		//name 속성이 중복
		String[] age=request.getParameterValues("age");
		System.out.println("이름이 중복");
		if(age != null) {
			for(String i :age) {
				System.out.println(i);
			}//end for
		}//end if
				
		return "day1124/param_frm"; //WEB-INF/views/param_frm.jsp가 응답 
	}//responseJSP
	
}//class
