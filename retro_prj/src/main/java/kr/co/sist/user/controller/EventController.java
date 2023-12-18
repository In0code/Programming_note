package kr.co.sist.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.sist.user.service.EventService;

@Controller
public class EventController {
	
	@Autowired
	private EventService es;
	
	@GetMapping("/event.do")
	public String eventList(@RequestParam(required = false, defaultValue = "ING")String searchType, Model model) {
		
		model.addAttribute("eventList",es.searchAllEvent(searchType));
		
		return "user/event/event";
	}

	@GetMapping("/event/detail.do")
	public String eventDetail(String eventcode, Model model) {
		
		model.addAttribute("event",es.searchOneEvent(eventcode));
		
		return "user/event/event_detail";
	}

}
