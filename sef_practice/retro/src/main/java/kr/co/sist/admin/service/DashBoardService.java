package kr.co.sist.admin.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.admin.dao.DashBoardDAO;
import kr.co.sist.admin.domain.EventDomain;
import kr.co.sist.admin.domain.TopRankDomain;

public class DashBoardService {
	private static DashBoardService ds;
	
	private DashBoardService() {
		
	}
	
	public static DashBoardService getInstance() {
		if(ds==null) {
			ds=new DashBoardService();
		}
		
		return ds;
	}
	
	public int searchTodayJoin() {
		DashBoardDAO dbDAO = DashBoardDAO.getInstance();
		int joinCnt=dbDAO.selectTodayJoin();
		return joinCnt;
	}//searchTodayJoin
	

	public int searchTodayReport() {
		DashBoardDAO dbDAO = DashBoardDAO.getInstance();
		int reportCnt=dbDAO.selectTodayReport();
		
		return reportCnt;
	}//searchTodayReport
	
	public int searchTodayTrade() {
		DashBoardDAO dbDAO = DashBoardDAO.getInstance();
		int tradeCnt=dbDAO.selectTodayTrade();
		
		return tradeCnt;
	}//searchTodayTrade
	
	
	public List<TopRankDomain> searchTop5Category( ){
		List<TopRankDomain> list= null;
		DashBoardDAO dbDA0= DashBoardDAO.getInstance();
		list=dbDA0.selectTop5Category();
		
		return list;
	}
	
	public List<EventDomain> searchEvent( ){
		List<EventDomain> list= null;
		DashBoardDAO dbDA0= DashBoardDAO.getInstance();
		list=dbDA0.selectEvent();
		
		return list;
	}//searchEvent
		
		
	public int searchTodayVisitor() {
		DashBoardDAO dbDAO = DashBoardDAO.getInstance();
		int visitorCnt=dbDAO.selectTodayVisitor();
		
		return visitorCnt;
	}//searchTodayVisitor
	
	
	public List<Integer> searchVisitors() {
		DashBoardDAO dbDAO = DashBoardDAO.getInstance();
		LocalDate lDate = LocalDate.now();
		
		
		List<Integer> list =new ArrayList<Integer>();
		
	    for (int i = 0; i < 5; i++) {
	        lDate = LocalDate.now().minusDays(i); // 일 수를 감소시켜 연속된 날짜를 얻음
	        Date date = java.sql.Date.valueOf(lDate);
	        list.add(dbDAO.selectVisitors(date));
	    }

		
	
		return list;
	}//searchVisitors
	
	
	
	
	
}//class
