package kr.co.sist.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminEventController {
	
	@GetMapping("/admin/event.do")
	public String eventList() {
		return "admin/event_managing";
	}

}
