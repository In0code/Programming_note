package kr.co.sist.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.user.service.MyPurchaseService;

@Controller
public class MyPurchaseController {
	
	@Autowired
	private MyPurchaseService mps;
	
	@GetMapping("/my/purchase.do")
	public String purchaseList(HttpSession session, Model model) {

		
		return "/user/user_mypage/user_purchase";
	}

	@ResponseBody
	@RequestMapping(value = "/my/purchase_t.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String purchaseDCList() {
		System.out.println(mps.searchDealComplete("urface").toJSONString());
		
		return mps.searchDealComplete("urface").toJSONString();
	}
	
	@ResponseBody
	@PostMapping("/my/purchase_p.do")
	public String purchasePCList(HttpSession session) {
		String id = (String)session.getAttribute("id");
		
		return mps.searchPayComplete("urface").toJSONString();
	}

	@ResponseBody
	@PostMapping("/my/purchase_c.do")
	public String purchaseCCList(HttpSession session) {
		String id = (String)session.getAttribute("id");
		
		return mps.searchPayComplete("urface").toJSONString();
	}

	@GetMapping("/my/purchase/detail.do")
	public String purchaseDetail() {
		return "/user/user_mypage/user_purchase_detail";
	}

}
