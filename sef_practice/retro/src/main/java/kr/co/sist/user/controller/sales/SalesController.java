package kr.co.sist.user.controller.sales;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.pagination.Pagination;
import kr.co.sist.common.pagination.PaginationDomain;
import kr.co.sist.user.service.sales.SalesService;
import kr.co.sist.user.vo.sales.SalesListVO;
import kr.co.sist.user.vo.sales.SalesVO;

@Controller
public class SalesController {

	@Autowired
	private SalesService sService;
	
	@GetMapping("/user_sales_frm.do")
	public String userSalesFrm(HttpSession session, Model model) {
		return "user/user_mypage/user_sales_frm";
	}
	
	@GetMapping("/user_sales.do")
	public String userSalesProcess(HttpSession session, String flag, String page, Model model) {
		String id = (String)session.getAttribute("id");
//		SalesListVO sVO = new SalesListVO(id, flag);
		
		BoardRangeVO brVO = new BoardRangeVO();
		brVO.setId(id);
		brVO.setStatus(flag);
		
		int pageNum = 1;
		if(page != null && !"".equals(page)) {
			pageNum = Integer.parseInt(page);
		}
		
		int totalRecode = sService.totalRecodeCnt(id);
		PaginationDomain pDomain = new Pagination().setStartEndPageNum(totalRecode, pageNum);
		
		model.addAttribute("saleList", sService.searchSales(brVO));
		model.addAttribute("pageStart", pDomain.getPaginationStartNum());
		model.addAttribute("pageEnd", pDomain.getPaginationEndNum());
		
		return "user/user_mypage/user_sales_process";
	}
	
	@GetMapping("/user_sales_detail.do")
	public String salesDetail(HttpSession session, String pcode, Model model) {
		String id = (String)session.getAttribute("id");
		SalesVO sVO = new SalesVO(id, pcode);
		
		model.addAttribute("data", sService.searchOneSales(sVO));
		
		return "user/user_mypage/user_sales_detail";
	}
}
