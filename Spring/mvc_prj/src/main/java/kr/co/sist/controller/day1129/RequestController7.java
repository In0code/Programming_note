package kr.co.sist.controller.day1129;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.util.WebUtils;

@Controller
public class RequestController7 {
	
	/**
	 * 세션에 값 설정
	 * @param request
	 * @return
	 */
	@GetMapping("/day1129/use_session.do")
//	public String setSession(HttpSession session) {//서비스와 다오가 위에 있어야된다.
	public String setSession(HttpServletRequest request) {
		
//		HttpSession session=request.getSession();
//		session.setAttribute("name", "홍루이젠");
//		session.setAttribute("year", 1985);
		
		//WebUtil을 사용하면 세션의 값을 손쉽게 넣을 수 있다
		WebUtils.setSessionAttribute(request, "name", "문영란");
		WebUtils.setSessionAttribute(request, "year", "1971");
		
		return "redirect:../index.html";
	}//setSession
	
	
	/**
	 * 세션에 할당된 값 얻기
	 * @param session
	 * @return
	 */
	@GetMapping("/day1129/use_session2.do")
//	public String getSession(HttpSession session) {//서비스와 다오가 위에 있어야된다.
	public String getSession(HttpServletRequest request) {
		
//		HttpSession session=request.getSession();
//		System.out.println(session.getAttribute("name"));
//		System.out.println(session.getAttribute("year"));
		
		//WebUtil을 사용하면 세션의 값을 손쉽게 넣을 수 있다
		System.out.println("이름"+WebUtils.getSessionAttribute(request, "name"));
		System.out.println("나이"+WebUtils.getSessionAttribute(request, "year"));
		
		return "day1129/session_get";
	}//getSession
	
	
	@GetMapping("/day1129/use_session3.do")
	public String removeSession(HttpSession session) {
		
		session.removeAttribute("name");
		session.removeAttribute("year");
		System.out.println(session.getAttribute("name"));
		System.out.println(session.getAttribute("year"));
		

		session.invalidate();
		return "day1129/session_get";
	}//removeSession
	
}
