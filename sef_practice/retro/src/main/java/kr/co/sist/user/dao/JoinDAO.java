package kr.co.sist.user.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.vo.JoinVO;

public class JoinDAO {
	
	private static JoinDAO jDAO;
	private static String configPath;
	
	private JoinDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}
	
	public static JoinDAO getInstance() {
		if(jDAO == null) {
			jDAO = new JoinDAO();
		}
		return jDAO;
	}

	public int insertUser(JoinVO jVO) throws PersistenceException {
		int result = 0;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(configPath, false);
		
		result = ss.selectOne("kr.co.sist.user.join.chkId", jVO);
		
		mh.closeHandler(ss);
		
		return result;
	}
}
