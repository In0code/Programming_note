package kr.co.sist.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

	@GetMapping("/admin/dashboard/dashboard.do")
	public String dashboard() {
		
		return "admin/dashboard/dashboard";
	}//dashboard
	
	@GetMapping("/admin/member/member_list.do")
	public String memberList() {
		
		return "admin/member/member_list";
	}//memberList
	
}//class
