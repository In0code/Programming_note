package kr.co.sist.login.dao;

import java.security.NoSuchAlgorithmException;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.core.NestedExceptionUtils;
import org.springframework.web.util.NestedServletException;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.login.domain.LoginDomain;
import kr.co.sist.login.vo.LoginVO;
import kr.co.sist.user.service.mypage.UserInfoEncryptionSerivice;

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
	}//selectLogin
	
public LoginDomain selectId(LoginVO lVO)throws PersistenceException {
		
		LoginDomain ld = new LoginDomain();
		MybatisHandler mbh= MybatisHandler.getInstance();
		SqlSession ss= mbh.getMyBatisHandler(configPath, false);
		ld=ss.selectOne("kr.co.sist.login.selectId", lVO);
		mbh.closeHandler(ss);
		
		return ld;
	}//selectId

public LoginDomain selectTempPw(LoginVO lVO)throws PersistenceException {
	
	LoginDomain ld = new LoginDomain();
	MybatisHandler mbh= MybatisHandler.getInstance();
	SqlSession ss= mbh.getMyBatisHandler(configPath, false);
	ld=ss.selectOne("kr.co.sist.login.selectRandomPw", lVO);
	if(ld!=null) {
		
		String pw = ld.getPw();
		UserInfoEncryptionSerivice encrypt = new UserInfoEncryptionSerivice();
		try {
			lVO.setPw(encrypt.oneWayEncryptData(pw));
			int cnt=ss.update("kr.co.sist.login.updateTempPw", lVO);
			if(cnt == 1) {
				ss.commit();
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}
	

	
	mbh.closeHandler(ss);
	
	return ld;
	
	
}//selectTempPw


public LoginDomain selectAdminLogin(LoginVO lVO)throws PersistenceException {
	
	LoginDomain ld = new LoginDomain();
	MybatisHandler mbh= MybatisHandler.getInstance();
	SqlSession ss= mbh.getMyBatisHandler(configPath, false);
	ld=ss.selectOne("kr.co.sist.login.selectAdminLogin", lVO);
	
	mbh.closeHandler(ss);
	
	return ld;
}//selectLogin
}
