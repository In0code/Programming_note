package kr.co.sist.user.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.MyInquiryDomain;
import kr.co.sist.user.vo.MyInquiryVO;

public class MyInquiryDAO {
	private static MyInquiryDAO miDAO;
	private static String configPath;
	
	private MyInquiryDAO() {
		configPath="kr/co/sist/common/dao/mybatis-config.xml";
	}
	
	
	public static MyInquiryDAO getInstance() {
		if(miDAO==null) {
			miDAO= new MyInquiryDAO();
		}
		
		return miDAO;
	}//getInstance

public List<MyInquiryDomain> selectInquiry(BoardRangeVO brVO)throws PersistenceException {
		List<MyInquiryDomain> list=null;
		MyInquiryDomain mId = new MyInquiryDomain();
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(configPath, false);
		list=ss.selectList("kr.co.sist.inquiry.selectInquiry", brVO);
		
		mbh.closeHandler(ss);
		
		return list;
	}//selectInquiry

public MyInquiryDomain selectInquiryDetail(String icode)throws PersistenceException {
	MyInquiryDomain mId = new MyInquiryDomain();
	MybatisHandler mbh= MybatisHandler.getInstance();
	SqlSession ss= mbh.getMyBatisHandler(configPath, false);
	mId=ss.selectOne("kr.co.sist.inquiry.selectInquiryDetail", icode);
	
	mbh.closeHandler(ss);
	
	return mId;
}//selectInquiryDetail

public int updateInquiry( MyInquiryVO miVO)throws PersistenceException{
	int cnt= 0;
	MybatisHandler mbh = MybatisHandler.getInstance();
	SqlSession ss= mbh.getMyBatisHandler(configPath, false);
	
	cnt= ss.update("kr.co.sist.inquiry.updateInquiry",miVO);
	
	if(cnt==1) {
		ss.commit();
	}
	mbh.closeHandler(ss);
	
	return cnt;
}

public int deleteInquiry( String icode)throws PersistenceException{
	int cnt= 0;
	MybatisHandler mbh = MybatisHandler.getInstance();
	SqlSession ss= mbh.getMyBatisHandler(configPath, false);
	
	cnt= ss.delete("kr.co.sist.inquiry.deleteInquiry",icode);
	
	if(cnt==1) {
		ss.commit();
	}
	mbh.closeHandler(ss);
	
	return cnt;
}

public int insertInquiry( MyInquiryVO miVO)throws PersistenceException{
	int cnt= 0;
	MybatisHandler mbh = MybatisHandler.getInstance();
	SqlSession ss= mbh.getMyBatisHandler(configPath, false);
	
	cnt= ss.insert("kr.co.sist.inquiry.insertInquiry",miVO);
	
	if(cnt==1) {
		ss.commit();
	}
	mbh.closeHandler(ss);
	
	return cnt;
}

public int selectCntRecode(String id)throws PersistenceException{
	int cnt= 0;
	MybatisHandler mbh = MybatisHandler.getInstance();
	SqlSession ss= mbh.getMyBatisHandler(configPath, false);
	
	cnt= ss.selectOne("kr.co.sist.inquiry.cntRecode",id);
	
	mbh.closeHandler(ss);
	
	return cnt;
}

}
