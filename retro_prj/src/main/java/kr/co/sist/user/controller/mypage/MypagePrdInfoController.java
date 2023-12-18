package kr.co.sist.user.controller.mypage;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.sist.user.domain.mypage.MypagePrdDomain;
import kr.co.sist.user.service.mypage.MypagePrdInfoService;
import kr.co.sist.user.vo.MypageIDnFlagVO;

@Controller
public class MypagePrdInfoController {
	
	@Autowired
	private MypagePrdInfoService mpiService;

	@PostMapping("/mypage_prd_all.do")
	public String ajaxSearchAllProcess(HttpSession session,String flag, Model model) {
		MypageIDnFlagVO mVO = new MypageIDnFlagVO((String)session.getAttribute("id"), flag.charAt(0));
		
		List<MypagePrdDomain> list = mpiService.searchAllPrd(mVO);
		model.addAttribute("prdList", list);
		model.addAttribute("totalCnt", calcTotal(list));
		model.addAttribute("f", true);
		return "user/user_mypage/ajax_prd";
	}
	
	@PostMapping("/mypage_prd_onsale.do")
	public String ajaxSearchOnProcess(HttpSession session,String flag, Model model) {
		MypageIDnFlagVO mVO = new MypageIDnFlagVO((String)session.getAttribute("id"), flag.charAt(0));

		List<MypagePrdDomain> list = mpiService.searchAllPrd(mVO);
		model.addAttribute("prdList", list);
		model.addAttribute("totalCnt", calcTotal(list));
		model.addAttribute("f", true);
		return "user/user_mypage/ajax_prd";
	}
	
	@PostMapping("/mypage_prd_completed.do")
	public String ajaxSearchCompleted(HttpSession session,String flag, Model model) {
		MypageIDnFlagVO mVO = new MypageIDnFlagVO((String)session.getAttribute("id"), flag.charAt(0));

		List<MypagePrdDomain> list = mpiService.searchAllPrd(mVO);
		model.addAttribute("prdList", list);
		model.addAttribute("totalCnt", calcTotal(list));
		model.addAttribute("f", false);
		return "user/user_mypage/ajax_prd";
	}
	
	public int calcTotal(List<MypagePrdDomain> list) {
		return list.size();
	}
}
