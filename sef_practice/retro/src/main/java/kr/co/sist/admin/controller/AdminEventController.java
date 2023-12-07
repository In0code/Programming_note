package kr.co.sist.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminEventController {
	
	@GetMapping("/admin/event.do")
	public String eventList() {
		return "admin/event/event_managing";
	}

	@GetMapping("/admin/eventDetail.do")
	public String eventDetail() {
		return "admin/event/eventDetail_managing";
	}

	@GetMapping("/admin/eventAddFrm.do")
	public String eventAddFrm() {
		return "admin/event/eventAdd_managing";
	}

}
