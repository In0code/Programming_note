package kr.co.sist.user.controller.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.user.domain.MyPageEnterDomain;
import kr.co.sist.user.service.mypage.MyPageInfoDetailService;
import kr.co.sist.user.vo.ChangePwVO;
import kr.co.sist.user.vo.ChangeUserInfoVO;
import kr.co.sist.user.vo.MyPageIdPwVO;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageInfoDetailService midService;
	
	@GetMapping("/mypage_enter.do")
	public String myPageEnterFrm() {
		return "user/user_mypage/user_info_enter";
	}
	
	@PostMapping("/mypage_info.do")
	public String myPageEnter(String pw, Model model, HttpSession session) {
		MyPageIdPwVO mpeVO = new MyPageIdPwVO((String)session.getAttribute("id"), pw);
		
		MyPageEnterDomain mpeDomain = midService.isEnterable(mpeVO);
		model.addAttribute("privateInfo", mpeDomain);
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
		String id = (String)session.getAttribute("id");
		
		String flagMsg = midService.changePw(new ChangePwVO(id, oldPw, newPw));
		model.addAttribute("flagMsg", flagMsg);
		
		return "user/user_mypage/change_pw";
	}
	
	@PostMapping("/user_mypage_frm.do")
	public String userMypageMainFrm() {
		return "user/user_mypage/user_mypage_frm";
	}
	
	@GetMapping("/byebye_frm.do")
	public String byebyeFrm() {
		return "user/user_mypage/byebye_frm";
	}
	
	@GetMapping("/reallyBye.do")
	public String reallyBye(HttpSession session) {
		String id = (String)session.getAttribute("id");
		midService.byebye(id);
		
		return "user/user_mypage/byebye_end";
	}
	
	@ResponseBody
	@PostMapping("/change_user_info.do")
	public String changeInfo(HttpSession session, String flag, String data) {
		String id = (String)session.getAttribute("id");
		ChangeUserInfoVO cuiVO = new ChangeUserInfoVO(id, data, flag);
		return midService.changeInfo(cuiVO).toJSONString();
	}
}
