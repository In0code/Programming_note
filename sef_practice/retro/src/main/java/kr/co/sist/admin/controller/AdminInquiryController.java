package kr.co.sist.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.admin.domain.AdminInquiryDomain;
import kr.co.sist.admin.service.AdminInquiryService;
import kr.co.sist.admin.vo.AdminInquiryVO;
import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.pagination.Pagination;
import kr.co.sist.common.pagination.PaginationDomain;

@Controller
public class AdminInquiryController {
	@GetMapping("/admin/admin_inquiry_frm.do")
	public String admin_inquery_frm(Model model, BoardRangeVO brVO, String page) {
		List<AdminInquiryDomain> list= null;
		AdminInquiryService ais= AdminInquiryService.getInstance();
		
		int totalRecode = ais.totalRecode();
		int pageNum = 1;
		if(page != null && !"".equals(page)) {
			pageNum = Integer.parseInt(page);
		}
		
		PaginationDomain pd = new Pagination().setStartEndPageNum(totalRecode, pageNum);
		brVO.setStartNum(pd.getStartNum());
		brVO.setEndNum(pd.getEndNum());
		
		list=ais.searchInquiry(brVO);
		model.addAttribute("inquiryList", list);
		model.addAttribute("pageStart", pd.getPaginationStartNum());
		model.addAttribute("startNum", pd.getStartNum());
		model.addAttribute("pageEnd", pd.getPaginationEndNum());
		
		return"admin/admin_inquiry_frm";
	}
	@GetMapping("/admin/admin_inquiry_detail_frm.do")
	public String admin_inquery_detail_frm(Model model,String inquiryCode) {
		
		AdminInquiryService ais= AdminInquiryService.getInstance();
		AdminInquiryDomain aid= new AdminInquiryDomain();
		
		aid=ais.searchInquiryDetail(inquiryCode);
		
		model.addAttribute("aid", aid);
		
		return"admin/admin_inquiry_detail_frm";
	}
	
	@RequestMapping("/admin/admin_inquiry_update_success.do")
	public String admin_inquery_detail_frm(Model model,AdminInquiryVO aiVO) {
		int cnt=0;
		AdminInquiryService ais= AdminInquiryService.getInstance();
		String msg="문의답변 등록이 실패했습니다. 다시 시도 해주세요";
		cnt=ais.modifyAnswer(aiVO);
		if(cnt==1) {
			msg="문의 답변 등록이 완료되었습니다.";
		}
		model.addAttribute("msg", msg);
		
		return"admin/admin_inquiry_update_success";
	}
}
