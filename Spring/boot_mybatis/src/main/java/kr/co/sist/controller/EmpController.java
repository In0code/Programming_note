package kr.co.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sist.service.EmpService;
import kr.co.sist.vo.EmpVO;

@Controller
public class EmpController {
	
	@Autowired
	private EmpService es;
	
	@GetMapping("/add_emp_frm")
	public String empFrm(){
		return "emp_frm";
	}
	
	@GetMapping("/add_emp_process")
	public String empFrmProcess(EmpVO eVO, Model model) {
		int cnt = es.addEmp(eVO);
		System.out.println("----- cnt is ==> " +  cnt);
		model.addAttribute("cnt", cnt);
		
		return "emp_add_result";
	}

}
