package kr.co.sist.user.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.vo.JoinVO;

@Component
public class JoinDAO {
	
	private static String configPath="kr/co/sist/common/dao/mybatis-config.xml";

	public int insertUser(JoinVO jVO) throws PersistenceException {
		int result = 0;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(configPath, false);
		
		result = ss.insert("kr.co.sist.user.join.insertUser", jVO);
		if(result == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		mh.closeHandler(ss);
		
		return result;
	}
}
