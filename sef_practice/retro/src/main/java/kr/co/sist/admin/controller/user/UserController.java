package kr.co.sist.admin.controller.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.admin.service.user.UserService;
import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.pagination.PaginationDomain;

@Controller
public class UserController {

	@Autowired
	private UserService uService;
	
	@GetMapping("/user_list.do")
	public String userList(Model model, String page, String keyword, String field) {
		PaginationDomain pd = uService.totalRecode(page);
		BoardRangeVO brVO = new BoardRangeVO();
		brVO.setStartNum(pd.getStartNum());
		brVO.setEndNum(pd.getEndNum());
		brVO.setKeyword(keyword);
		brVO.setField(field);
		
		System.out.println(brVO);
		
		model.addAttribute("userList", uService.seachUserList(brVO));
		model.addAttribute("pageStart", pd.getPaginationStartNum());
		model.addAttribute("pageEnd", pd.getPaginationEndNum());
		model.addAttribute("startNum", brVO.getStartNum());
		
		return "admin/usermng/user_list";
	}
	
	@GetMapping("/member_detail.do")
	public String userDetail(Model model, String userId) {
		model.addAttribute("userData", uService.searchOneUser(userId));
		
		return "admin/usermng/user_detail";
	}
	
	@ResponseBody
	@PostMapping("/user_withdraw.do")
	public String userWithdraw(String userId) {
		return uService.UserWithdraw(userId).toJSONString();
	}
	
	@ResponseBody
	@PostMapping("/user_status_change.do")
	public String userStatusChange(String userId) {
		return uService.UserStatusChange(userId).toJSONString();
	}
}
