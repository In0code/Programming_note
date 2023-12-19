package kr.co.sist.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.admin.domain.AdminReportDomain;
import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.dao.MybatisHandler;

@Component
public class AdminReportDAO {
	public List<AdminReportDomain> selectReport(BoardRangeVO brVO) {
		List<AdminReportDomain> list = null;
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		list = ss.selectList("kr.co.sist.adminreport.selectReport",brVO);
		
		
		mh.closeHandler(ss);
		
		return list;
	}//selectReport
	
	public AdminReportDomain selectReportDetail(String rcode) {
		AdminReportDomain ard = new AdminReportDomain();
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		ard = ss.selectOne("kr.co.sist.adminreport.selectReportDetail",rcode);
		
		
		mh.closeHandler(ss);
		
		return ard;
	}//selectReportDetail
	
	public int updatePcancel(String rcode) {
		
		int result=0;
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.update("kr.co.sist.adminreport.updatePcancel",rcode);
		
		if(result==1) {
			ss.commit();
		}else {
			ss.rollback();
		}
		
		mh.closeHandler(ss);
		
		return result;
	}//updatePcancel
	
	public int selectTotalRecode() {
		int cnt=0;
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(false);
		cnt=ss.selectOne("kr.co.sist.adminreport.totalRecode");
		
		mbh.closeHandler(ss);
		
		return cnt;
		
	}
}
