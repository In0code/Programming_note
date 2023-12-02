package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.sist.user.domain.LoginDomain;
import kr.co.sist.user.service.LoginService;
import kr.co.sist.user.vo.LoginVO;
@SessionAttributes({"id","nickname"})
@Controller
public class LoginController {
	
	@GetMapping("/user/login/login_frm.do")
	public String loginfrm() {
		
		
		return "user/login/login_frm";
	}//loginfrm
	
	@PostMapping("/user/login/login_process.do")
	public String loginSuccessProcess(Model model,LoginVO lVO) {

		String url="user/login/login_frm";
		String msg="계정 정보가 맞지않습니다. 아이디와 비밀번호를 확인해주세요.";
		
		LoginService ls = LoginService.getInstance();
		LoginDomain ld = ls.selectLogin(lVO);
		if(ld!=null) {
			model.addAttribute("id", ld.getId());
			model.addAttribute("nickname",ld.getNickname());
			msg="";
			url="user/main";
		}
		model.addAttribute("msg", msg);
		return url;
		
		
	}//loginSuccessProcess
	
	
	@GetMapping("/user/login/find_id_frm.do")
	public String findIdFrm() {
		
		return "user/login/find_id_frm";
	}
	
	@GetMapping("/user/login/find_pw_frm.do")
	public String findPwFrm() {
		
		return "user/login/find_pw_frm";
	}
	
	@PostMapping("/user/login/find_id_process.do")
	public String findIdProcess(Model model, LoginVO lVO) {
		String url="";
		LoginService ls =LoginService.getInstance();
		LoginDomain ld = ls.selectId(lVO);
		if(ld!=null) {
			model.addAttribute("id", ld.getId());
			url="user/login/find_id_success";
		}
		return url;
	}

	@GetMapping("/user/login/find_pw_success.do")
	public String findpwSuccess() {
		
		return "user/login/find_pw_success";
	}


}
