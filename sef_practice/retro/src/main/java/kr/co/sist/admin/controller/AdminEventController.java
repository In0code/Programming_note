package kr.co.sist.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sist.admin.domain.AdminEventDomain;
import kr.co.sist.admin.service.AdminEventService;
import kr.co.sist.common.BoardRangeVO;

@Controller
public class AdminEventController {
	
	@Autowired
	private AdminEventService aes;
	
	/**
	 * 이벤트 리스트
	 * @return
	 */
	@GetMapping("/admin/event.do")
	public String eventList(Model model, HttpSession session, BoardRangeVO brVO) {
		
		List<AdminEventDomain> list = aes.searchAllEvent(brVO);
		
		model.addAttribute("eventList", list);
		
		return "admin/event/event_managing";
	}

	
	/**
	 * 이벤트 상세 보기
	 * @return
	 */
	@GetMapping("/admin/eventDetail.do")
	public String eventDetail(String ecode, Model model) {
		AdminEventDomain event = aes.searchOneEvent(ecode);
		
		model.addAttribute("event", event);
		
		return "admin/event/eventDetail_managing";
	}

	
	/**
	 * 이벤트 등록 화면
	 * @return
	 */
	@GetMapping("/admin/eventAddFrm.do")
	public String eventAddFrm() {
		return "admin/event/event_add_frm";
	}

}
