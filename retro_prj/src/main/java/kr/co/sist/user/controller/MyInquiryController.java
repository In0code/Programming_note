package kr.co.sist.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.user.domain.MyInquiryDomain;
import kr.co.sist.user.service.MyInquiryService;
import kr.co.sist.user.vo.MyInquiryVO;

@Controller
public class MyInquiryController {
	@GetMapping("/user/inquiry/inquiry_frm.do")
	public String inquery_frm(Model model, HttpSession hs) {
		List<MyInquiryDomain> list = null;
		String id = hs.getId();
		//로그인 후 아이디 가져와야함.
		//System.out.println("--------"+hs.getId());
		MyInquiryService mis= MyInquiryService.getInstance();
		list = mis.searchInquiry("tuna51277");
		
		model.addAttribute("inquiryList", list);
		
		return "user/inquiry/inquiry_frm";
	}
	

	
	
	@GetMapping("/user/inquiry/inquiry_detail_frm.do")
	public String inquery_detail_frm(Model model, @RequestParam("icode") String icode) {
		
		
		//로그인 후 아이디 가져와야함.
		//System.out.println("--------"+hs.getId());
		MyInquiryService mis= MyInquiryService.getInstance();
		MyInquiryDomain mid = new MyInquiryDomain();
		
		 mid=mis.searchInquiryDetail(icode); model.addAttribute("icode",
		 mid.getInquiryCode());
		 model.addAttribute("type", mid.getType());
		 model.addAttribute("status", mid.getStatus());
		 model.addAttribute("context",mid.getContext());
		 model.addAttribute("icode",mid.getInquiryCode());
		 model.addAttribute("answer",mid.getAnswer());
		 model.addAttribute("askdate",mid.getAskDate());
		 
		
		
		
		return "user/inquiry/inquiry_detail_frm";
	}
	
	@RequestMapping("/user/inquiry/inquiry_updt_frm.do")
	public String inquiry_updt_frm( Model model, MyInquiryVO miVO) {
		
		
		MyInquiryService mis= MyInquiryService.getInstance();
		
		
		 int cnt=mis.modifyInquiry(miVO);
		 
		 model.addAttribute("cnt", cnt);
		
		
		
		return "user/inquiry/inquiry_updt_frm";
	}
	
	@RequestMapping("/user/inquiry/inquiry_delete_frm.do")
	public String inquiry_updt_frm( Model model, String inquiryCode) {
		
		
		MyInquiryService mis= MyInquiryService.getInstance();
		
		
		 int cnt=mis.removeInquiry(inquiryCode);
		 
		 model.addAttribute("cnt", cnt);
		
		
		
		return "user/inquiry/inquiry_delete_frm";
	}
	
	@GetMapping("/user/inquiry/inquiry_write_frm.do")
	public String inquiry_write_frm() {
		
		
		
		
		
		return "user/inquiry/inquiry_write_frm";
	}
	
	@RequestMapping("/user/inquiry/inquiry_write_success.do")
	public String inquiry_write_success(Model model, MyInquiryVO miVO) {
		miVO.setId("tuna51277");
		MyInquiryService mis= MyInquiryService.getInstance();
		int cnt = mis.addInquiry(miVO);
		model.addAttribute("cnt", cnt);
		
		
		return "user/inquiry/inquiry_write_success";
	}
	

}
