package kr.co.sist.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.user.domain.WishDomain;
import kr.co.sist.user.service.WishService;
import kr.co.sist.user.vo.WishVO;

@Controller
public class WishController {
	private WishService ws=WishService.getInstance();

	
	/**
	 * 찜 등록
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/user/product/addWish.do")
	public String addWish(WishVO wVO) {
		
		return ws.addWish(wVO).toJSONString();
	}//productRegister
	
	/**
	 * 판매자가 보는 상품 상세 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/product/wishList.do")
	public String WishList(HttpServletRequest request, HttpSession session,Model model, BoardRangeVO brVO) {
		String id = (String)session.getAttribute("id");
		
		brVO.setId("1011kiy111");
		List<WishDomain> searchWishList=ws.searchWish(brVO);
		int selectAllCnt=ws.searchWishCnt("1011kiy111");
		
		model.addAttribute("searchWishList",searchWishList);
		model.addAttribute("selectAllCnt",selectAllCnt);
		
		return "user/product/wishList";
	}//WishList
	
	
	@ResponseBody
	@RequestMapping("/user/product/wishDelete.do")
	public String wishDelete(String pcode) {
		
		return ws.cancelWish(pcode).toJSONString();
	}//wishDelete
	
}//class
