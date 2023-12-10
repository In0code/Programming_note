package kr.co.sist.user.controller.mypage;


import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sist.user.service.mypage.MypagePrdInfoService;

@Controller
public class MypagePrdInfoController {
	
	@Autowired
	private MypagePrdInfoService mpiService;

	@GetMapping("/")
	public String mypageMainFrm(HttpSession session) {
		return "user/user_mypage/user_mypage_frm";
	}
	
	@GetMapping("/mypage_prd_all.do")
	public String ajaxSearchAllProcess(HttpSession session, String id, Model model) {
		model.addAttribute("prdList", mpiService.searchAllPrd(id));
		return "user/user_mypage/ajax_prd";
	}
	
	@GetMapping("/mypage_prd_onsale.do")
	public String ajaxSearchOnProcess(HttpSession session, String id, Model model) {
		model.addAttribute("prdList", mpiService.searchPrdOnProcess(id));
		return "user/user_mypage/ajax_prd";
	}
	
	@GetMapping("/mypage_prd_completed.do")
	public String ajaxSearchCompleted(HttpSession session, String id, Model model) {
		model.addAttribute("prdList", mpiService.searchCompletedPrd(id));
		return "user/user_mypage/ajax_prd";
	}
	
	@GetMapping("/mypage_prd_reservation.do")
	public String ajaxSearchReservation(HttpSession session, String id, Model model) {
		model.addAttribute("prdList", mpiService.searchReservationPrd(id));
		return "user/user_mypage/ajax_prd";
	}
}
