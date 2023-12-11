package kr.co.sist.admin.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sist.admin.domain.EventDomain;
import kr.co.sist.admin.domain.TopRankDomain;
import kr.co.sist.admin.service.DashBoardService;

@Controller
public class DashBoardController {
	
	@RequestMapping(value="/admin/dashboard.do", method= {GET,POST})
	public String adminMainfrm(Model model) {
		int todayJoinCnt=0;
		int todayReportCnt=0;
		int todayTradeCnt=0;
		int todayVisitorCnt=0;
		List<TopRankDomain>list = null;
		List<EventDomain>list2=null;
		List<Integer>list3=null;
		DashBoardService dbs=DashBoardService.getInstance();
		todayJoinCnt=dbs.searchTodayJoin();
		todayReportCnt=dbs.searchTodayReport();
		todayTradeCnt=dbs.searchTodayTrade();
		list=dbs.searchTop5Category();
		list2=dbs.searchEvent();
		list3=dbs.searchVisitors();
		todayVisitorCnt=dbs.searchTodayVisitor();
		model.addAttribute("joinCnt", todayJoinCnt);
		model.addAttribute("reportCnt", todayReportCnt);
		model.addAttribute("tradeCnt", todayTradeCnt);
		model.addAttribute("topList", list);
		model.addAttribute("visitorCnt", todayVisitorCnt);
		model.addAttribute("eventList", list2);
		model.addAttribute("visitorsList", list3);
		
		return "admin/admin_main";
	}//adminMainfrm
}
