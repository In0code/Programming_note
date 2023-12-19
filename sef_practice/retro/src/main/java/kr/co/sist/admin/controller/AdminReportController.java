package kr.co.sist.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.admin.dao.AdminReportDAO;
import kr.co.sist.admin.domain.AdminReportDomain;
import kr.co.sist.admin.service.AdminReportService;
import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.pagination.Pagination;
import kr.co.sist.common.pagination.PaginationDomain;

@Controller
public class AdminReportController {
	@Autowired
	private AdminReportService ars;
	
	@GetMapping("/admin/admin_report_frm.do")
	public String admin_report_frm(Model model , BoardRangeVO brVO,String page) {
		List<AdminReportDomain> list=null;
		int totalRecode=ars.totalRecode();
		int pageNum=1;
		if(page!=null && !"".equals(page)) {
			pageNum = Integer.parseInt(page);
		}
		PaginationDomain pd = new Pagination().setStartEndPageNum(totalRecode, pageNum);
		brVO.setStartNum(pd.getStartNum());
		brVO.setEndNum(pd.getEndNum());
		list=ars.searchReport(brVO);
		model.addAttribute("pageStart", pd.getPaginationStartNum());
		model.addAttribute("startNum", pd.getStartNum());
		model.addAttribute("pageEnd", pd.getPaginationEndNum());
		model.addAttribute("reportList", list);
		return "/admin/admin_report_frm";
	}//admin_report_frm
	
	@GetMapping("/admin/admin_report_detail_frm.do")
	public String admin_report_detail_frm(Model model ,@RequestParam String rcode) {
		AdminReportDomain ard= new AdminReportDomain();
		ard=ars.searchReportDetail(rcode);
		model.addAttribute("ard", ard);
		return "admin/admin_report_detail_frm";
	}//admin_report_detail_frm
	
	@GetMapping("/admin/admin_report_update_success.do")
	public String admin_report_update_success(Model model ,@RequestParam String rcode) {
		int result=0;
		
		result=ars.modifyPcancel(rcode);
		model.addAttribute("result", result);
		return "admin/admin_report_update_success";
	}//admin_report_update_success
}
