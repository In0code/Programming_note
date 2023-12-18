package kr.co.sist.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChattingController {
	
	@GetMapping("/chat/chatting_room.do")
	public String chattingRoom() {
		return "chat/chatting_room";
	}

	@GetMapping("/chat/chatting.do")
	public String chatting() {
		return "chat/chatting";
	}
}
