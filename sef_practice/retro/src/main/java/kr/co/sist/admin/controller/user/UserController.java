package kr.co.sist.admin.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import kr.co.sist.admin.service.user.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService uService;
	
	public String userList(HttpSession session, Model model) {
		model.addAttribute("userList", uService.seachUserList());
		
		return "admin/usermng/user_list";
	}
	public String userDetail(HttpSession session, Model model, String id) {
		model.addAttribute("userData", uService.searchOneUser(id));
		
		return "admin/usermng/user_detail";
	}
	public String userWithdraw(HttpSession session, Model model, String id) {
		model.addAttribute("flag", uService.UserWithdraw(id));
		
		return "";
	}
	public String userStatusChange(HttpSession session, Model model, String id) {
		model.addAttribute("flag", uService.UserStatusChange(id));
		
		return "";
	}
}
