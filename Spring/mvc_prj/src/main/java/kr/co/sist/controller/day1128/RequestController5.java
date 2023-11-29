package kr.co.sist.controller.day1128;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RequestController5 {

	@GetMapping("/day1128/use_send_value.do")
	public String useHttpServletRequest(HttpServletRequest request) {

		// 값 설정
		request.setAttribute("name", "홍지성");
		request.setAttribute("uri", request.getRequestURI()); // 이 페이지를 요청했을 때 URI를 얻을 수 있음

		String[] hobby = { "독서", "게임", "자바" };
		request.setAttribute("hobby", hobby);

		return "day1128/data_view";

	}// useHttpServletRequest

	//Model 선언
	@GetMapping("/day1128/use_send_value2.do")
	public String useModel(Model model) {

		// Model 값 설정 => HttpServletRequeset에 값이 설정된다.
		model.addAttribute("name", "임태균");
		model.addAttribute("uri", "/day1128/use_send_value2.do"); // 이 페이지를 요청했을 때 URI를 얻을 수 있음

		String[] hobby = { "유튜브", "독서", "낚시", "음악감상" };
		model.addAttribute("hobby", hobby);

		return "day1128/data_view";
	}// useModel
	
	@GetMapping("/day1128/use_send_value3.do")
	public ModelAndView useModelAndView() {
		//1. ModelAndView 생성
		ModelAndView mav=new ModelAndView();
		//2. view 페이지 설정
		mav.setViewName("day1128/data_view");
		//3. 데이터 추가
		mav.addObject("name","김인영");
		mav.addObject("uri","/day1128/use_send_value3.do");
		
		String[] hobby = { "유튜브", "서든", "작업실", "음악감상" };
		mav.addObject("hobby",hobby);
		
		//4. 반환
		return mav;
	}// useModel
	
	
	//redirect를 사용하여 .do의 이동
	@GetMapping("/day1128/use_redirect.do")
	public String useRedirectDo() {
		
		
		return "redirect:/day1128/use_send_value2.do";
	}//useRedirectDo
	
	@GetMapping("/day1128/use_redirect2.do")
	public String useRedirectJSP() {
		
//		return "redirect:../index.jsp";
		return "redirect:..//localhost/mvc_prj/index.jsp";
	}//useRedirectJSP
	
}// class







