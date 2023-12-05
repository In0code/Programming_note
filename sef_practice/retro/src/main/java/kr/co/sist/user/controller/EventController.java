package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EventController {
	
	@GetMapping("/event.do")
	public String eventList() {
		return "user/event/event";
	}

	@GetMapping("/event/detail.do")
	public String eventDetail(String evtcode) {
		System.out.println(evtcode);
		return "user/event/event_detail";
	}

}
