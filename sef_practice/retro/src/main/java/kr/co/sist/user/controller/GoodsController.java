package kr.co.sist.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.common.PageVO;
import kr.co.sist.user.domain.GoodsDomain;
import kr.co.sist.user.service.GoodsService;

@Controller
public class GoodsController {
	@Autowired
	private GoodsService gs;
	
	/**
	 * 대분류 상품 조회, 페이징처리
	 * @param category
	 * @param model
	 * @return
	 */
	@GetMapping("/goods/goods_list1.do")
	public String goodsList1(@RequestParam("category1") String category, @RequestParam(required = false, defaultValue="1") Integer pageNo, Model model) {
		PageVO pageVO = new PageVO(pageNo);
//		System.out.println("==========================");
//		System.out.println(pageVO);
		pageVO.setCategory(category);
		int totalCnt = gs.searchGoodsList1Cnt(pageVO);
		pageVO.setTotalCnt(totalCnt);
		
		List<GoodsDomain> list=null;
//		list=gs.searchGoodsList1(category);
		list=gs.searchGoodsList1(pageVO);
		model.addAttribute("bigCate", list);
		model.addAttribute("pageVO", pageVO);
		
		return "goods/goods_list";
	}
	
	/**
	 * 중분류 상품 조회
	 * @param category
	 * @param model
	 * @return
	 */
	@GetMapping("/goods/goods_list2.do")
	public String goodsList2(@RequestParam("category2") String category, Model model) {
		System.out.println(category);
		List<GoodsDomain> list=null;
		list=gs.searchGoodsList2(category);
		model.addAttribute("midCate", list);
		
		return "goods/goods_list";
	}
	
	/**
	 * 소분류 상품 조회
	 * @param category
	 * @param model
	 * @return
	 */
	@GetMapping("/goods/goods_list3.do")
	public String goodsList3(@RequestParam("category3") String category, Model model) {
		
		List<GoodsDomain> list=null;
		list=gs.searchGoodsList3(category);
		model.addAttribute("smallCate", list);
		
		return "goods/goods_list";
	}
	
	/**
	 * 상품 검색, 페이징처리
	 * @param category
	 * @param model
	 * @return
	 */
	@GetMapping("/goods/goods_search_by_text.do")
	public String goodsSearchByText(@RequestParam String searchText, @RequestParam(required = false, defaultValue="1") Integer pageNo, Model model) {
		PageVO pageVO = new PageVO(pageNo);
		pageVO.setSearchText(searchText);
		int totalCnt = gs.searchByTextCnt(pageVO);
		pageVO.setTotalCnt(totalCnt);
		
		List<GoodsDomain> list=null;
//		list=gs.searchByText(searchText);
		list=gs.searchByText(pageVO);
		model.addAttribute("bigCate", list);
		model.addAttribute("pageVO", pageVO);
		
		return "goods/goods_list_search";
	}
	
	
	@GetMapping("/goods/goods_info.do")
	public String goodsInfo(@RequestParam String pcode, Model model) {
		
		GoodsDomain gd=gs.searchGoodsDetail(pcode);
		
		model.addAttribute("img",gd.getImg());
		model.addAttribute("img2",gd.getImg2());
		model.addAttribute("img3",gd.getImg3());
		model.addAttribute("img4",gd.getImg4());
		model.addAttribute("img5",gd.getImg5());
		model.addAttribute("c_code",gd.getC_code());
		model.addAttribute("c2_code",gd.getC2_Code());
		model.addAttribute("c3_code",gd.getC3_Code());
		model.addAttribute("pname",gd.getPname());
		model.addAttribute("price",gd.getPrice());
		model.addAttribute("date",gd.getInput_date());
		model.addAttribute("pview",gd.getPview());
		model.addAttribute("wish",gd.getWish());
		model.addAttribute("delivery",gd.getDelivery());
		model.addAttribute("status",gd.getStatus());
		model.addAttribute("loc",gd.getLoc());
		model.addAttribute("context",gd.getContext());
		model.addAttribute("id",gd.getId());
		model.addAttribute("level",gd.getCredit_level());
		
		
		return "goods/goods_info";
	}
	
	
	
	@GetMapping("/seller/seller_info.do")
	public String sellerInfo() {
		return "seller/seller_info";
	}

	@GetMapping("/seller/seller_review.do")
	public String sellerReview() {
		return "seller/seller_review";
	}
	
	
	
}
