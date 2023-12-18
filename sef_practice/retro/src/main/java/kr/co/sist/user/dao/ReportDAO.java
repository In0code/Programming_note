package kr.co.sist.user.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.vo.ReportVO;

@Component
public class ReportDAO {
	public int insertReport(ReportVO rVO) {
		int result=0;
		
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.insert("kr.co.sist.report.reportInsert",rVO);
		
		if(result == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		mh.closeHandler(ss);
		
		return result;
	}
}
