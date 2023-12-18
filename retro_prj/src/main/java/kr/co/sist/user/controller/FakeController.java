package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sist.user.domain.FakeDomain;
import kr.co.sist.user.service.FakeService;
import kr.co.sist.user.vo.FakeVO;

@Controller
public class FakeController {
	
	@GetMapping("/fraud.do")
	public String fakeFrm() {
		return "user/fake/fakeFrm";
	}
	
	@GetMapping("/result.do")
	public String searchFake(FakeVO fVO, Model model) {
		FakeService fs = FakeService.getInstance();
		fVO.setFraudKeyword(fVO.getFraudKeyword().toLowerCase());
		FakeDomain fd = fs.searchFake(fVO);
		
		model.addAttribute("fakeResult",fd);
		
		return "user/fake/searchFake";
	}

}
