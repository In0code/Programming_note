package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
//동원

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
@Controller
public class MainController {
	@RequestMapping(value="/indexdw.do", method= {GET,POST})//get과 post로 올 수 있다. 포스트  -> 로그인 프로세스  포스트 -> 메인 //메인 첫 호출 시 -> 겟
	public String userMain() {
		
		return "user/main";
	}
}
