package kr.co.sist.user.dao;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.MyPageEnterDomain;
import kr.co.sist.user.vo.MyPageEnterVO;

public class EnterMyPageInfoDAO {
	
	private static EnterMyPageInfoDAO mpDAO;
	private static String configPath;
	
	private EnterMyPageInfoDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}
	
	public static EnterMyPageInfoDAO getInstance() {
		if(mpDAO == null) {
			mpDAO = new EnterMyPageInfoDAO();
		}
		return mpDAO;
	}
	
	public MyPageEnterDomain isEnterable(MyPageEnterVO mpeVO) {
		MyPageEnterDomain mpeDomain = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(configPath, false);
		
		mpeDomain = ss.selectOne("kr.co.sist.user.join.canEnter", mpeVO);
		
		mh.closeHandler(ss);
		
		return mpeDomain;
	}
}
