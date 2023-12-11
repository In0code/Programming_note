package kr.co.sist.user.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.sist.user.domain.MyPageEnterDomain;
import kr.co.sist.user.service.mypage.MyPageInfoDetailService;
import kr.co.sist.user.vo.ChangePwVO;
import kr.co.sist.user.vo.MyPageIdPwVO;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageInfoDetailService midService;
	
	@GetMapping("/mypage_enter.do")
	public String myPageEnterFrm(HttpSession session) {
		return "user/user_mypage/user_info_enter";
	}
	
	@PostMapping("/mypage_info.do")
	public String myPageEnter(String id, String pw, Model model, HttpSession session) {
		MyPageIdPwVO mpeVO = new MyPageIdPwVO(id, pw);
		
		MyPageEnterDomain mpeDomain = midService.isEnterable(mpeVO);
		model.addAttribute("userInfo", mpeDomain);
		model.addAttribute("flag", true);
		
		if(mpeDomain == null) {
			model.addAttribute("flag", false);
		}
		
		return "user/user_mypage/mypage_detail_info";
	}
	
	@GetMapping("/changePw_frm.do")
	public String changePwFrm(HttpSession session) {
		return "user/user_mypage/change_pass_frm";
	}
	
	@PostMapping("/change_pw.do")
	public String changePw(String oldPw, String newPw, Model model, HttpSession session) {
		System.out.println("oldPw :: "+oldPw+" / newPw :: "+newPw);
		String id = (String)session.getAttribute("sesId");
		
		String flagMsg = midService.changePw(new ChangePwVO(id, oldPw, newPw));
		model.addAttribute("flagMsg", flagMsg);
		
		return "user/user_mypage/change_pw";
	}
	
	@PostMapping("/user_mypage_frm.do")
	public String userMypageMainFrm(HttpSession session, Model model, String id) {
		session.setAttribute("sesId", id);
		model.addAttribute("userInfo", midService.searchUserInfo(id));
		
		return "user/user_mypage/user_mypage_frm";
	}
	
	@GetMapping("/byebye_frm.do")
	public String byebyeFrm(HttpSession session) {
		return "user/user_mypage/byebye_frm";
	}
	
	@GetMapping("/reallyBye.do")
	public String reallyBye(HttpSession session, HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("reallyBye :: "+id+"----------------------------------------------------------------------------------");
		midService.byebye(id);
		
		return "user/user_mypage/byebye_end";
	}
}
