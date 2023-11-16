package day1115;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MybatisHandler;
import kr.co.sist.domain.WebMemberDomain;
import kr.co.sist.vo.WebMemberVO;

public class ExamDAO5 {

	private static ExamDAO5 eDAO;
	private String configPath;
	
	private ExamDAO5() {
		configPath="kr/co/sist/dao/mybatis-config.xml";
	}
	
	public static ExamDAO5 getInstance() {
		if(eDAO == null) {
			eDAO=new ExamDAO5();
		}//end if
		return eDAO;
	}//getInstance
	
	
	public List<String> selectAllId()throws PersistenceException {
		List<String> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		list=ss.selectList("kr.co.sist.exam5.selectWebMemberId");
		
		mbh.closeHandler(ss);
		
		return list;
	}//selectAllId
	
	public WebMemberDomain selectOneMember( String id)throws PersistenceException {
		WebMemberDomain wmd=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		wmd=ss.selectOne("kr.co.sist.exam5.selectOneMember",id);
		
		mbh.closeHandler(ss);
		
		return wmd;
	}//selectOneMember
	
	public int updateWebMember( WebMemberVO wmVO) throws PersistenceException {
		int cnt=0;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		cnt=ss.update("kr.co.sist.exam5.dynamicSet",wmVO);
		if(cnt == 1) {
			ss.commit();
		}//end if
		
		mbh.closeHandler(ss);
		return cnt;
	}//updateWebMember
	
	
	public static void main(String[] args) {
		ExamDAO5 eDAO=ExamDAO5.getInstance();
//		eDAO.selectAllId();
//		eDAO.selectOneMember("test2");
		WebMemberVO wmVO=new WebMemberVO();
		eDAO.updateWebMember(wmVO);
		
	}//main
	
	
}//class
