package kr.co.sist.controller.day1129;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.util.WebUtils;

@SessionAttributes({"name","addr","age"})
@Controller
public class RequestController8 {

	@GetMapping("/day1129/use_session_attributes.do")
	public String setSession(Model model) {
		model.addAttribute("name","김아영");
		model.addAttribute("addr","서울시 성동구");
		model.addAttribute("age","27");
		
		return "redirect:../index.html";
	}//setSession
	
	
	@GetMapping("/day1129/use_session_attributes2.do")
	public String getSession(HttpSession session,Model model) {
		//spring 5.2 부터는 model를 사용하여 세션의 값을 얻을 수 있다
		System.out.println("--------session-------");
		System.out.println(session.getAttribute("name"));
		System.out.println(session.getAttribute("addr"));
		System.out.println(session.getAttribute("age"));
		System.out.println("--------model-------");
		System.out.println(model.getAttribute("name"));
		System.out.println(model.getAttribute("addr"));
		System.out.println(model.getAttribute("age"));
		
		
		return "day1129/model_get";
	}//setSession
	
	/*
	 * HttpSession을 사용하여 값을 삭제할 수 없다.
	 * @GetMapping("/day1129/use_session_attributes3.do") public String
	 * removeSession(HttpSession session) { session.removeAttribute("name");
	 * session.removeAttribute("addr"); session.removeAttribute("age");
	 * 
	 * return "day1129/model_get"; }//removeSession
	 */	
	
	@GetMapping("/day1129/use_session_attributes3.do")
	public String removeSession(SessionStatus ss) {	
		
		ss.setComplete();
		
		return "day1129/model_get";
	}//removeSession
	
	
	@GetMapping("/day1129/use_cookie.do")
	public String addCookie(HttpServletResponse response) {
		//1. cookie 생성
		Cookie cookie=new Cookie("name", "김문경");
		Cookie cookie2=new Cookie("age", "20");
		
		//2. 쿠키의 생존 시간 설정 : 시간을 설정하지 않으면 브라우저가 열려있는 동안에만 쿠키가 유지된다./
		cookie.setMaxAge(60*60*1);
		
		//3. 쿠키 심기
		response.addCookie(cookie);
		response.addCookie(cookie2);
		
		return "day1129/add_cookie";
	}//addCookie
	
	@GetMapping("/day1129/use_cookie2.do")
	public String readCookie(@CookieValue(value="name", defaultValue="익명") String name, 
			@CookieValue(value="age", defaultValue="0")String age, Model model) {
		
		model.addAttribute("name",name);
		model.addAttribute("age",age);
		System.out.println("쿠키 값 : "+ name+", "+age);
		
		return "day1129/read_cookie";
		
	}//readCookie
	
	@GetMapping("/day1129/use_cookie3.do")
	public String readCookie2(HttpServletRequest request,Model model) {
		
		String name=((Cookie)WebUtils.getCookie(request, "name")).getValue();
		String age=((Cookie)WebUtils.getCookie(request, "age")).getValue();
		
		
		model.addAttribute("name",name);
		model.addAttribute("age",age);
		System.out.println("WebUtils 쿠키 값 : "+ name+", "+age);
		
		return "day1129/read_cookie";
		
	}//readCookie
	
	
}//class
