package kr.co.sist.user.service;

import kr.co.sist.user.dao.LoginDAO;
import kr.co.sist.user.domain.LoginDomain;
import kr.co.sist.user.vo.LoginVO;

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
		
	}
	
	
	public LoginDomain selectId(LoginVO lVO) {
		LoginDomain ld= new LoginDomain();
		LoginDAO lDAO = LoginDAO.getInstance();
		
		ld=lDAO.selectId(lVO);
		
		return ld;
		
	}
}
