package kr.co.sist.user.controller.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.pagination.Pagination;
import kr.co.sist.common.pagination.PaginationDomain;
import kr.co.sist.user.domain.MyPageEnterDomain;
import kr.co.sist.user.domain.reiview.ReiviewCntDomain;
import kr.co.sist.user.domain.reiview.ReiviewDomain;
import kr.co.sist.user.service.mypage.MyPageInfoDetailService;
import kr.co.sist.user.service.reiview.ReiviewService;
import kr.co.sist.user.vo.ChangePwVO;
import kr.co.sist.user.vo.ChangeUserInfoVO;
import kr.co.sist.user.vo.MyPageIdPwVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageInfoDetailService midService;
	@Autowired
	ReiviewService rService;
	
	@GetMapping("/mypage_enter.do")
	public String myPageEnterFrm() {
		return "user/user_mypage/user_info_enter";
	}
	
	@RequestMapping(value = "/mypage_info.do", method = {GET, POST})
	public String myPageEnter(String pw, Model model, HttpSession session) {
		MyPageIdPwVO mpeVO = new MyPageIdPwVO((String)session.getAttribute("id"), pw);
		
		MyPageEnterDomain mpeDomain = midService.isEnterable(mpeVO);
		model.addAttribute("privateInfo", mpeDomain);
		model.addAttribute("flag", true);
		
		if(mpeDomain == null) {
			model.addAttribute("flag", false);
		}
		
		return "user/user_mypage/mypage_detail_info";
	}
	
	@GetMapping("/changePw_frm.do")
	public String changePwFrm(HttpSession session) {
		return "user/user_mypage/change_pass_frm";
	}
	
	@PostMapping("/change_pw.do")
	public String changePw(String oldPw, String newPw, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		
		String flagMsg = midService.changePw(new ChangePwVO(id, oldPw, newPw));
		model.addAttribute("flagMsg", flagMsg);
		
		return "user/user_mypage/change_pw";
	}
	
	@RequestMapping(value = "/user_mypage_frm.do", method = {GET, POST})
	public String userMypageMainFrm() {
		return "user/user_mypage/user_mypage_frm";
	}
	
	@GetMapping("/byebye_frm.do")
	public String byebyeFrm() {
		return "user/user_mypage/byebye_frm";
	}
	
	@GetMapping("/reallyBye.do")
	public String reallyBye(HttpSession session) {
		String id = (String)session.getAttribute("id");
		midService.byebye(id);
		
		return "user/user_mypage/byebye_end";
	}
	
	@RequestMapping(value = "/user_buy_comment.do", method = {GET, POST})
	public String userBuyCommentFrm(HttpSession session,String id, String page, Model model) {
		String useId = "";
		if((String)session.getAttribute("id") != null) {
			useId = (String)session.getAttribute("id");			
		} else if(id == null) {
			useId = id;
		}
		
		BoardRangeVO brVO = new BoardRangeVO();
		brVO.setId(useId);
		
		int pageNum = 1;
		if(page != null && !"".equals(page)) {
			pageNum = Integer.parseInt(page);
		}
		
		int totalRecode = rService.totalReocodeCnt(useId);
		PaginationDomain pd = new Pagination().setStartEndPageNum(totalRecode, pageNum);
		
		brVO.setStartNum(pd.getStartNum());
		brVO.setEndNum(pd.getEndNum());
		
		List<ReiviewDomain> list = rService.searchUseProfileReiview(brVO);
		ReiviewCntDomain rcDomain = rService.getReiviewCnt(list);
		
		model.addAttribute("reiviews", list);
		model.addAttribute("reiviewCnt", rcDomain);
		model.addAttribute("pageStart", pd.getPaginationStartNum());
		model.addAttribute("pageEnd", pd.getPaginationEndNum());
		
		return "user/user_mypage/seller_comment_list";
	}
	
	@ResponseBody
	@PostMapping("/change_user_info.do")
	public String changeInfo(HttpSession session, String flag, String data) {
		String id = (String)session.getAttribute("id");
		ChangeUserInfoVO cuiVO = new ChangeUserInfoVO(id, data, flag);
		return midService.changeInfo(cuiVO).toJSONString();
	}
}
