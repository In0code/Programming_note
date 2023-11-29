package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sist.user.service.FakeService;
import kr.co.sist.user.vo.FakeVO;

@Controller
public class FakeController {
	
	@GetMapping("/fraud.do")
	public String fakeFrm() {
		return "user/fakeFrm";
	}
	
	@GetMapping("/result.do")
	public String searchFake(FakeVO fVO, Model model) {
		System.out.println("----result");
		FakeService fs = FakeService.getInstance();
		int cnt = fs.searchFake(fVO);
		
		model.addAttribute("fakeCnt",cnt);
		
		return "user/searchFake";
	}

}
