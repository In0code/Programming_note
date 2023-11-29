package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sist.user.domain.LoginDomain;
import kr.co.sist.user.service.LoginService;
import kr.co.sist.user.vo.LoginVO;

@Controller
public class LoginController {
	
	@GetMapping("/user/login_frm.do")
	public String loginfrm() {
		/*
		 * LoginService ls= LoginService.getInstance();
		 * 
		 * LoginDomain ld= new LoginDomain(); ld=ls.selectLogin(lVO);
		 * 
		 * model.addAttribute("id",ld.getId());
		 * model.addAttribute("nickname",ld.getNickname());
		 */
		
		return "user/login_frm";
	}
	@GetMapping("/user/find_id_frm.do")
	public String findIdFrm() {
		
		return "user/find_id_frm";
	}
	
	@GetMapping("/user/find_pw_frm.do")
	public String findPwFrm() {
		
		return "user/find_pw_frm";
	}
}
