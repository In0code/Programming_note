package kr.co.sist.admin.dao;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.admin.domain.EventDomain;
import kr.co.sist.admin.domain.TopRankDomain;
import kr.co.sist.common.dao.MybatisHandler;

public class DashBoardDAO {
	private static DashBoardDAO dbDAO;
	private static String configPath;
	
	private DashBoardDAO() {
		configPath="kr/co/sist/common/dao/mybatis-config.xml";
	}//DashBoardDAO
	
	public static DashBoardDAO getInstance() {
		if(dbDAO==null) {
			dbDAO= new DashBoardDAO();
		}
		
		return dbDAO;
	}//getInstance
	
	public int selectTodayJoin()throws PersistenceException {
		
		int joinCnt=0;
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(configPath,false);
		joinCnt=ss.selectOne("kr.co.sist.admin.dashboard.selectTodayJoin");
		System.out.println("dao"+joinCnt);
		mbh.closeHandler(ss);
		
		return joinCnt;
	}//selectTodayJoin
	
	public int selectTodayReport()throws PersistenceException {
		
		int reportCnt=0;
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(configPath,false);
		reportCnt=ss.selectOne("kr.co.sist.admin.dashboard.selectTodayReport");
		mbh.closeHandler(ss);
		return reportCnt;
	}//selectTodayReport
	
	public int selectTodayTrade()throws PersistenceException {
	
		int tradeCnt=0;
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(configPath,false);
		tradeCnt=ss.selectOne("kr.co.sist.admin.dashboard.selectTodayTrade");
		mbh.closeHandler(ss);
		return tradeCnt;
	}//selectTodayTrade
	
	public List<TopRankDomain> selectTop5Category() {
		List<TopRankDomain> list = null;
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(configPath,false);
		list=ss.selectList("kr.co.sist.admin.dashboard.selectTop5Category");
		return list;
	}
	
	public List<EventDomain> selectEvent() {
		List<EventDomain> list = null;
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(configPath,false);
		list=ss.selectList("kr.co.sist.admin.dashboard.selectEvent");
		return list;
	}
	
	public int selectTodayVisitor()throws PersistenceException {
		
		int visitorCnt=0;
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(configPath,false);
		visitorCnt=ss.selectOne("kr.co.sist.admin.dashboard.selectVisitor");
		mbh.closeHandler(ss);
		return visitorCnt;
	}//selectTodayTrade
	
	public int selectVisitors(Date date)throws PersistenceException {
		int visitorsCnt=0;
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(configPath,false);
		visitorsCnt=ss.selectOne("kr.co.sist.admin.dashboard.selectVisitors",date);
		mbh.closeHandler(ss);
		return visitorsCnt;
	}//selectTodayTrade
	
}//class
