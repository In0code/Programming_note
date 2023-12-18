package kr.co.sist.user.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.user.domain.MyPurchaseDomain;
import kr.co.sist.user.service.MyPurchaseService;

@Controller
public class MyPurchaseController {
	
	@Autowired
	private MyPurchaseService mps;
	
	@GetMapping("/my/purchase.do")
	public String purchaseList(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		HashMap<String, Object> data = (HashMap<String, Object>) mps.searchAllList(id);
		
		model.addAttribute("tcList", (List<MyPurchaseDomain>) data.get("tc"));
		model.addAttribute("ccList", (List<MyPurchaseDomain>) data.get("cc"));
		model.addAttribute("pcList", (List<MyPurchaseDomain>) data.get("pc"));
		
		model.addAttribute("dealCnt", data.get("dealCnt"));
		model.addAttribute("payCnt", data.get("payCnt"));
		model.addAttribute("cancelCnt", data.get("cancelCnt"));
		
		return "/user/user_mypage/user_purchase";
	}

	@GetMapping("/my/purchase/detail.do")
	public String purchaseDetail(HttpSession session, String code, Model model) {
		if(code.startsWith("B")){
			model.addAttribute("purchase", mps.searchBuyDetail(code));
		}
		
		if(code.startsWith("S")){
			model.addAttribute("purchase", mps.searchPayDetail(code));
		}
		
		return "/user/user_mypage/user_purchase_detail";
	}
	
	@ResponseBody
	@PostMapping("/my/purchase_cancel.do")
	public String purchaseCancel(HttpSession session, String code) {
		return mps.cancelBuy(code).toJSONString();
	}

}
