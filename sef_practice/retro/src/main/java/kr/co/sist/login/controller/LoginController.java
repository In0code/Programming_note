package kr.co.sist.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.sist.login.domain.LoginDomain;
import kr.co.sist.login.service.LoginService;
import kr.co.sist.login.vo.LoginVO;
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
		LoginDomain ld = ls.Login(lVO);
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
	}//findIdFrm
	
	@PostMapping("/user/login/find_id_process.do")
	public String findIdProcess(Model model, LoginVO lVO) {
		String url="user/login/find_id_frm";
		LoginService ls =LoginService.getInstance();
		LoginDomain ld = ls.searchId(lVO);
		String msg ="등록된 아이디가 없습니다.핸드폰 번호와 이메일을 확인해주세요.";
		if(ld!=null) {
			model.addAttribute("id", ld.getId());
			url="user/login/find_id_success";
			msg ="";
		}
		
		model.addAttribute("msg", msg);
		return url;
	}//findIdProcess
	
	@GetMapping("/user/login/find_pw_frm.do")
	public String findPwFrm() {
		
		return "user/login/find_pw_frm";
	}//findPwFrm
	
	
	@PostMapping("/user/login/find_pw_process.do")
	public String findPwProcess(Model model, LoginVO lVO) {
		String url="user/login/find_pw_frm";
		String msg="입력한 정보가 맞지 않습니다. 아이디와 이메일을 다시 한 번 확인해주세요.";
		LoginService ls =LoginService.getInstance();
		LoginDomain ld = ls.searchTempPw(lVO);
		
		
		if(ld!=null) {
			model.addAttribute("pw", ld.getPw());
			
			url="user/login/find_pw_success";
			msg="";
		}
		
		model.addAttribute("msg", msg);
		return url;
	}//findPwProcess
	
//------------------admin
	
	@GetMapping("/admin/login/admin_login_frm.do")
	public String adminLoginFrm() {
		
		
		return "admin/login/admin_login_frm";
	}//adminLoginFrm
	
	@PostMapping("/admin/login/admin_login_process.do")
	public String adminloginSuccessProcess(Model model,LoginVO lVO) {

		String url="/admin/login/admin_login_frm";
		String msg="아이디와 비밀번호를 확인해주세요.";
		
		LoginService ls = LoginService.getInstance();
		LoginDomain ld = ls.adminLogin(lVO);
		if(ld!=null) {
			model.addAttribute("id", ld.getId());
			msg="";
			url="admin/admin_main";
		}
		model.addAttribute("msg", msg);
		
		return url;
		
		
	}//loginSuccessProcess
	
	@GetMapping("/admin/admin_main.do")
	public String adminMainfrm() {
		
		
		return "admin/admin_main";
	}//adminMainfrm
	
	@GetMapping("/admin/login/admin_logout_process.do")
	public String removeAdminSession( SessionStatus ss) {
		ss.setComplete();
		
		
		

		
		return "admin/login/admin_login_frm";
	}//removeAdminSession

	


}