package kr.co.sist.admin.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.admin.domain.AdminInquiryDomain;
import kr.co.sist.admin.vo.AdminInquiryVO;
import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.dao.MybatisHandler;

public class AdminInquiryDAO {
	private static AdminInquiryDAO aiDAO;
	private static String configPath;
	
	private AdminInquiryDAO() {
		configPath="kr/co/sist/common/dao/mybatis-config.xml";
		
	}
	
	public static AdminInquiryDAO getInstance() {
		if(aiDAO==null) {
			aiDAO=new AdminInquiryDAO();
		}
		
		return aiDAO;
	}
	
	public List<AdminInquiryDomain> selectInquiry(BoardRangeVO brVO)throws PersistenceException {
		List<AdminInquiryDomain> list=null;
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(configPath, false);
		list=ss.selectList("kr.co.sist.admininquiry.selectInquiry", brVO);
		
		mbh.closeHandler(ss);
		
		return list;
	}//selectInquiry
	
	public AdminInquiryDomain selectInquiryDetail(String inquiryCode) {
		
		AdminInquiryDomain aid = new AdminInquiryDomain();
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(configPath, false);
		aid=ss.selectOne("kr.co.sist.admininquiry.selectInquiryDetail", inquiryCode);
		mbh.closeHandler(ss);
		return aid;
		
	}//selectInquiryDetail
	
public int updateAnswer(AdminInquiryVO aiVO) {
		int cnt=0;
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(configPath, false);
		cnt=ss.update("kr.co.sist.admininquiry.updateAnswer", aiVO);
		if(cnt==1) {
			ss.commit();
		}
		mbh.closeHandler(ss);
		return cnt;
		
	}//updateAnswer

public int selectTotalRecode() {
	int cnt=0;
	MybatisHandler mbh= MybatisHandler.getInstance();
	SqlSession ss= mbh.getMyBatisHandler(configPath, false);
	cnt=ss.selectOne("kr.co.sist.admininquiry.totalRecode");
	
	mbh.closeHandler(ss);
	
	return cnt;
	
}
}
