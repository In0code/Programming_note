package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EventController {
	
	@GetMapping("/user/event.do")
	public String eventList() {
		return "user/event";
	}

}
