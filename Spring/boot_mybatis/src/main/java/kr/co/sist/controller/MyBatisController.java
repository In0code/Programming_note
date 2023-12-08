package kr.co.sist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sist.domain.EmpDomain;
import kr.co.sist.service.TestService;

@Controller
public class MyBatisController {
	
	@Autowired
	private TestService ts;
	
	@GetMapping("/")
	public String main(Model model) {
		model.addAttribute("msg", "오늘은 목요일");
		List<EmpDomain> list = ts.searchAllEmp(); 
		System.out.println(list);
		
		model.addAttribute("empList", list);
		return "main";
	}//main

}//class
