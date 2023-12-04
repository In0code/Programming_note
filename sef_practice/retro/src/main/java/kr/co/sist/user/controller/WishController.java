package kr.co.sist.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sist.common.BoardRangeVO;

@Controller
public class WishController {

	@GetMapping("/user/product/wishList.do")
	public String wishList(Model model, HttpSession session, BoardRangeVO brVO){
		
		return "user/product/wishList";
	}//wishList
	
}//class
