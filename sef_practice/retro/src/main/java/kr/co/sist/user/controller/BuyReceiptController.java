package kr.co.sist.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.user.service.BuyReceiptService;
import kr.co.sist.user.vo.BuyReceiptVO;

@Controller
public class BuyReceiptController {
	private BuyReceiptService brs=BuyReceiptService.getInstance();

	/**
	 * 판매 상태 변경 버튼 클릭 시 거래 방법 선택
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/user/product/addBuyReceipt.do")
	public String addBuyReceipt(HttpSession session, BuyReceiptVO buyRVO) {
	    String id = (String)session.getAttribute("id");
	    buyRVO.setId(id);
	    
	    return brs.addBuyReceipt(buyRVO).toJSONString();
	}//addBuyReceipt

}//class
