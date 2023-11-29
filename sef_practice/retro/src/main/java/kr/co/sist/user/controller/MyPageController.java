package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.sist.user.domain.MyPageEnterDomain;
import kr.co.sist.user.service.mypage.MyPageInfoService;
import kr.co.sist.user.vo.MyPageEnterVO;

@Controller
public class MyPageController {
	
	@GetMapping("/mypage1111.do")
	public String myPageEnterFrm() {
		return "user/user_mypage/user_info_enter";
	}
	
	@PostMapping("/mypage_info.do")
	public String myPageEnter(String id, String pw, Model model) {
		MyPageEnterVO mpeVO = new MyPageEnterVO(id, pw);
		
		MyPageEnterDomain mpeDomain = new MyPageInfoService().isEnterable(mpeVO);
		System.out.println(mpeDomain);
		
		return "";
	}
}
