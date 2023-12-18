package kr.co.sist.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.user.service.ReportService;
import kr.co.sist.user.vo.ReportVO;

@Controller
public class ReportController {
	@Autowired
	private ReportService rs;
	
	@GetMapping("user/goods/report_frm.do")
	public String Report_frm() {
		return "user/report_frm";
	}
	
	@ResponseBody
	@PostMapping("/user/goods/report_add_success.do")
	public String userStatusChange(ReportVO rVO) {
		return rs.ReportAdd(rVO).toJSONString();
	}
}
