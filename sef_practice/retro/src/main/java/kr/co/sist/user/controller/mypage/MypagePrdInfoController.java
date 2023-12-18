package kr.co.sist.user.controller.mypage;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.user.domain.mypage.MypagePrdDomain;
import kr.co.sist.user.service.mypage.MypagePrdInfoService;
import kr.co.sist.user.vo.MypageIDnFlagVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;;

@Controller
public class MypagePrdInfoController {
	
	@Autowired
	private MypagePrdInfoService mpiService;

	@RequestMapping(value = "/mypage_prd_all.do", method = {GET, POST})
	public String ajaxSearchAllProcess(HttpSession session,String flag, String id, Model model) {
		String sesId = (String)session.getAttribute("id");
		String userid = "".equals(sesId) ? (String)session.getAttribute("id") : id;
		MypageIDnFlagVO mVO = new MypageIDnFlagVO(userid, flag.charAt(0));
		
		List<MypagePrdDomain> list = mpiService.searchAllPrd(mVO);
		model.addAttribute("prdList", list);
		model.addAttribute("totalCnt", calcTotal(list));
		model.addAttribute("f", true);
		return "user/user_mypage/ajax_prd";
	}
	
	@RequestMapping(value = "/mypage_prd_onsale.do", method = {GET, POST})
	public String ajaxSearchOnProcess(HttpSession session,String flag, String id, Model model) {
		String sesId = (String)session.getAttribute("id");
		String userid = "".equals(sesId) ? (String)session.getAttribute("id") : id;
		MypageIDnFlagVO mVO = new MypageIDnFlagVO(userid, flag.charAt(0));

		List<MypagePrdDomain> list = mpiService.searchAllPrd(mVO);
		model.addAttribute("prdList", list);
		model.addAttribute("totalCnt", calcTotal(list));
		model.addAttribute("f", true);
		return "user/user_mypage/ajax_prd";
	}
	
	@RequestMapping(value = "/mypage_prd_completed.do", method = {GET, POST})
	public String ajaxSearchCompleted(HttpSession session,String flag, String id, Model model) {
		String sesId = (String)session.getAttribute("id");
		String userid = "".equals(sesId) ? (String)session.getAttribute("id") : id;
		MypageIDnFlagVO mVO = new MypageIDnFlagVO(userid, flag.charAt(0));

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
