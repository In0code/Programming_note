package kr.co.sist.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.admin.domain.AdminProductDomain;
import kr.co.sist.admin.service.AdminProductService;
import kr.co.sist.common.BoardRangeVO;


@Controller
public class AdminProductController {
	
	private AdminProductService aps=AdminProductService.getInstance();
	
	@RequestMapping("/admin/product_managing.do")
	public String productManage(HttpServletRequest request,BoardRangeVO brVO, Model model) {
		
		
		
		
		  String keyword=request.getParameter("keyword"); String
		  field=request.getParameter("field");
		 
		
		brVO.setKeyword(keyword);
		brVO.setField(field);
		
		List<AdminProductDomain> productList=aps.searchAllProduct(brVO);
		
		model.addAttribute("productList",productList);
		
		
		return "admin/product_managing";
	}//productManage
		
	
	
	
	@RequestMapping("/admin/productDetail_managing.do")
	public String productManageDetail(HttpServletRequest request, Model model) {
		
		model.addAttribute("method",request.getMethod());
		
		return "admin/productDetail_managing";
	}//productManage
	
}//class
	
	

