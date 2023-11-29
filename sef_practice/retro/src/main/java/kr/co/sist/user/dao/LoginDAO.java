package kr.co.sist.user.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.LoginDomain;
import kr.co.sist.user.vo.LoginVO;

public class LoginDAO {
	private static LoginDAO lDAO;
	private static String configPath;
	
	private LoginDAO() {
		configPath="kr/co/sist/common/dao/mybatis-config.xml";
	}
	
	public static LoginDAO getInstance() {
		if(lDAO==null) {
			lDAO= new LoginDAO();
		}
		
		return lDAO;
	}
	
	public LoginDomain selectLogin(LoginVO lVO)throws PersistenceException {
		
		LoginDomain ld = new LoginDomain();
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(configPath, false);
		
		ld=ss.selectOne("kr.co.sist.login.selectLogin", lVO);
		
		mbh.closeHandler(ss);
		
		return ld;
	}
}
