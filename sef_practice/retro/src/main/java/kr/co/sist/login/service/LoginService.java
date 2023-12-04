package kr.co.sist.login.service;

import kr.co.sist.login.dao.LoginDAO;
import kr.co.sist.login.domain.LoginDomain;
import kr.co.sist.login.vo.LoginVO;

public class LoginService {
	private static LoginService ls;
	
	private LoginService() {
		
	}
	
	public static LoginService getInstance() {
		if(ls==null) {
			ls= new LoginService();
		}
		
		return ls;
	}
	
	public LoginDomain selectLogin(LoginVO lVO) {
		LoginDomain ld= new LoginDomain();
		LoginDAO lDAO = LoginDAO.getInstance();
		
		ld=lDAO.selectLogin(lVO);
		
		return ld;
		
	}//selectLogin
	
	
	public LoginDomain selectId(LoginVO lVO) {
		LoginDomain ld= new LoginDomain();
		LoginDAO lDAO = LoginDAO.getInstance();
		
		ld=lDAO.selectId(lVO);
		
		return ld;
		
	}//selectId
	
	public LoginDomain selectTempPw(LoginVO lVO) {
		LoginDomain ld= new LoginDomain();
		LoginDAO lDAO = LoginDAO.getInstance();
		
		ld=lDAO.selectTempPw(lVO);
		
		
		return ld;
		
	}//selectTempPw
}
