package kr.co.sist.login.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import kr.co.sist.login.dao.LoginDAO;
import kr.co.sist.login.domain.LoginDomain;
import kr.co.sist.login.vo.LoginVO;
import kr.co.sist.util.cipher.DataEncrypt;

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
	
	public LoginDomain Login(LoginVO lVO) {
		LoginDomain ld= new LoginDomain();
		LoginDAO lDAO = LoginDAO.getInstance();
		
		try {
			DataEncrypt de = new DataEncrypt("singsungsaengsungyeon");
			lVO.setPw(DataEncrypt.messageDigest("MD5", lVO.getPw()));
			ld=lDAO.selectLogin(lVO);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return ld;
		
	}//Login
	
	
	public LoginDomain searchId(LoginVO lVO) {
		LoginDomain ld= new LoginDomain();
		LoginDAO lDAO = LoginDAO.getInstance();
		
		ld=lDAO.selectId(lVO);
		
		return ld;
		
	}//searchId
	
	public LoginDomain searchTempPw(LoginVO lVO) {
		LoginDomain ld= new LoginDomain();
		LoginDAO lDAO = LoginDAO.getInstance();
		
		ld=lDAO.selectTempPw(lVO);
		
		
		return ld;
		
	}//searchTempPw
	
	public LoginDomain adminLogin(LoginVO lVO) {
		LoginDomain ld= new LoginDomain();
		LoginDAO lDAO = LoginDAO.getInstance();
		
		ld=lDAO.selectAdminLogin(lVO);
		
		return ld;
		
	}//Login
}
