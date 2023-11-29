package kr.co.sist.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class AdminLoginController {

	@GetMapping("/admin/admin_display.do")
	public String admin_display() {
		
		return "admin/admin_display";
	}
	
	@GetMapping("/admin/login_frm.do")
	public String admin_login() {
		
		return "admin/login_frm";
	}
}
