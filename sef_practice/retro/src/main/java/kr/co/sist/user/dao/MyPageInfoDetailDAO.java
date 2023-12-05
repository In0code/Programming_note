package kr.co.sist.user.dao;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.MyPageEnterDomain;
import kr.co.sist.user.vo.ChangePwVO;
import kr.co.sist.user.vo.MyPageIdPwVO;

public class MyPageInfoDetailDAO {
	
	private static MyPageInfoDetailDAO mpDAO;
	private static String configPath;
	
	private MyPageInfoDetailDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}
	
	public static MyPageInfoDetailDAO getInstance() {
		if(mpDAO == null) {
			mpDAO = new MyPageInfoDetailDAO();
		}
		return mpDAO;
	}
	
	public MyPageEnterDomain isEnterable(MyPageIdPwVO mpeVO) {
		MyPageEnterDomain mpeDomain = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(configPath, false);
		
		mpeDomain = ss.selectOne("kr.co.sist.user.mypageInfoDetail.canEnter", mpeVO);
		
		mh.closeHandler(ss);
		
		return mpeDomain;
	}
	
	public int updatePw(ChangePwVO cpVO) {
		int result = 0;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.update("kr.co.sist.user.mypageInfoDetail.changeUserPw", cpVO);
		if(result == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		mh.closeHandler(ss);
		
		return result;
	}
	
	public int updateByeUser(String id) {
		int result = 0;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.update("kr.co.sist.user.mypageInfoDetail.byebye", id);
		if(result == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		mh.closeHandler(ss);
		
		return result;
	}
}
