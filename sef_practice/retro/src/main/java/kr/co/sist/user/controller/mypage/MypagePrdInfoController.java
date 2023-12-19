package kr.co.sist.user.controller.mypage;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.pagination.Pagination;
import kr.co.sist.common.pagination.PaginationDomain;
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
	public String ajaxSearchAllProcess(HttpSession session,String flag, String id, String page, Model model) {
		String sesId = (String)session.getAttribute("id");
		String userid = !"".equals(sesId) && sesId != null ? sesId : id;
//		MypageIDnFlagVO mVO = new MypageIDnFlagVO(userid, flag.charAt(0));
		
		int pageNum = 1;
		if(page != null && "".equals(page)) {
			pageNum = Integer.parseInt(page);
		}
		
		BoardRangeVO brVO = new BoardRangeVO();
		brVO.setId(userid);
		brVO.setStatus(null);
		brVO.setOrderby(flag);
		
		int totalRecode = mpiService.totalRecodeCnt(brVO);
		PaginationDomain pd = new Pagination().setStartEndPageNum(totalRecode, pageNum);
		
		brVO.setStartNum(pd.getStartNum());
		brVO.setEndNum(pd.getEndNum());
		
		List<MypagePrdDomain> list = mpiService.searchAllPrd(brVO);
		model.addAttribute("prdList", list);
		model.addAttribute("totalCnt", list.size());
		model.addAttribute("f", true);
		model.addAttribute("pageStart", pd.getPaginationStartNum());
		model.addAttribute("pageEnd", pd.getPaginationEndNum());
		model.addAttribute("pageurl", "mypage_prd_all.do");
		
		System.out.println(list);
		
		return "user/user_mypage/ajax_prd";
	}
	
	@RequestMapping(value = "/mypage_prd_onsale.do", method = {GET, POST})
	public String ajaxSearchOnProcess(HttpSession session,String flag, String id, String page, Model model) {
		String sesId = (String)session.getAttribute("id");
		String userid = !"".equals(sesId) && sesId != null ? sesId : id;
//		MypageIDnFlagVO mVO = new MypageIDnFlagVO(userid, flag.charAt(0));
		
		int pageNum = 1;
		if(page != null && "".equals(page)) {
			pageNum = Integer.parseInt(page);
		}
		
		BoardRangeVO brVO = new BoardRangeVO();
		brVO.setId(userid);
		brVO.setStatus("N");
		brVO.setOrderby(flag);
		
		int totalRecode = mpiService.totalRecodeCnt(brVO);
		PaginationDomain pd = new Pagination().setStartEndPageNum(totalRecode, pageNum);
		
		brVO.setStartNum(pd.getStartNum());
		brVO.setEndNum(pd.getEndNum());

		List<MypagePrdDomain> list = mpiService.searchPrdOnProcess(brVO);
		model.addAttribute("prdList", list);
		model.addAttribute("totalCnt", list.size());
		model.addAttribute("f", true);
		model.addAttribute("pageStart", pd.getPaginationStartNum());
		model.addAttribute("pageEnd", pd.getPaginationEndNum());
		model.addAttribute("pageurl", "mypage_prd_onsale.do");
		
		System.out.println(list);
		
		return "user/user_mypage/ajax_prd";
	}
	
	@RequestMapping(value = "/mypage_prd_completed.do", method = {GET, POST})
	public String ajaxSearchCompleted(HttpSession session,String flag, String id, String page, Model model) {
		String sesId = (String)session.getAttribute("id");
		String userid = !"".equals(sesId) && sesId != null ? sesId : id;
//		MypageIDnFlagVO mVO = new MypageIDnFlagVO(userid, flag.charAt(0));
		
		int pageNum = 1;
		if(page != null && "".equals(page)) {
			pageNum = Integer.parseInt(page);
		}
		
		BoardRangeVO brVO = new BoardRangeVO();
		brVO.setId(userid);
		brVO.setStatus("Y");
		brVO.setOrderby(flag);
		
		int totalRecode = mpiService.totalRecodeCnt(brVO);
		PaginationDomain pd = new Pagination().setStartEndPageNum(totalRecode, pageNum);
		
		brVO.setStartNum(pd.getStartNum());
		brVO.setEndNum(pd.getEndNum());

		List<MypagePrdDomain> list = mpiService.searchCompletedPrd(brVO);
		model.addAttribute("prdList", list);
		model.addAttribute("totalCnt", list.size());
		model.addAttribute("f", false);
		model.addAttribute("pageStart", pd.getPaginationStartNum());
		model.addAttribute("pageEnd", pd.getPaginationEndNum());
		model.addAttribute("pageurl", "mypage_prd_completed.do");
		
		System.out.println(list);
		
		return "user/user_mypage/ajax_prd";
	}
}
