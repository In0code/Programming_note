package kr.co.sist.user.dao;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.vo.FakeVO;


public class FakeDAO {
	private static FakeDAO fDAO;
	private String configPath;
	
	private FakeDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}
	
	public static FakeDAO getInstance() {
		if(fDAO == null) {
			fDAO = new FakeDAO();
		}
		return fDAO;
	}
	
	public int searchFake(FakeVO fVO) {
		int cnt = 0;
		
		//1.
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		
		//2.
		cnt = ss.selectOne("kr.co.sist.fake.fakeSearch", fVO);
		
		//3.
		mbh.closeHandler(ss);
		
		return cnt;
	}

}
