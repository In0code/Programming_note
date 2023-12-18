package kr.co.sist.user.controller.sales;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
	public String userSalesProcess(HttpSession session, char flag, Model model) {
		String id = (String)session.getAttribute("id");
		SalesListVO sVO = new SalesListVO(id, flag);
		
		model.addAttribute("saleList", sService.searchSales(sVO));
		
		return "user/user_mypage/user_sales_process";
	}
	
	public String salesDetail(HttpSession session, String pcode, Model model) {
		String id = (String)session.getAttribute("id");
		SalesVO sVO = new SalesVO(id, pcode);
		
		model.addAttribute("data", sService.searchOneSales(sVO));
		
		return "user/user_mypage/user_sales_detail";
	}
}
