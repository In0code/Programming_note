package kr.co.sist.user.service.join;

import java.security.NoSuchAlgorithmException;
import java.util.regex.Pattern;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.sist.user.dao.JoinDAO;
import kr.co.sist.user.service.mypage.UserInfoEncryptionSerivice;
import kr.co.sist.user.vo.JoinVO;
import kr.co.sist.util.cipher.DataEncrypt;

@Service
public class JoinService {
	
	@Autowired
	private JoinDAO jDAO;
	@Autowired
	private UserInfoEncryptionSerivice encrypt;
	
	/**
	 * 회원 정보를 DB에 저장하기 위한 method
	 * @param jVO
	 */
	@PostMapping("/user_join_process.do")
	public void addUser(JoinVO jVO) {
		try {
			jVO.setPw(DataEncrypt.messageDigest("MD5", encrypt.oneWayEncryptData(jVO.getPw())));
			jDAO.insertUser(jVO);
			
		} catch (NoSuchAlgorithmException ne) {
			ne.printStackTrace();
		}
	}
	
	/**
	 * 유효성 검사
	 * @param jVO
	 * @return JSONObject
	 */
	public JSONObject chkInfo(JoinVO jVO) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("flag", false);
		jsonObj.put("flagMsg", "");
		
		String msg = "";
		if(! (checkEmail(jVO.getEmail()) && checkPhone(jVO.getPhone()) && checkIdNicknameByte(jVO.getId(), jVO.getNickname())) ) {
			jsonObj.put("flagMsg", "형식 오류 다시 시도해주세요.");
		} else {
			jsonObj.put("flag", true);			
		}
		
		return jsonObj;
	}
	
	public boolean checkEmail(String email) {
		String emailReg = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
		boolean flag = false;
		
		flag = Pattern.matches(emailReg, email) && !email.contains("@retro.co.kr") && !email.contains("@retro.com");
		
        return flag;
	}
	
	public boolean checkPhone(String phone) {
		String emailReg = "^\\d{3}\\d{3,4}\\d{4}$";
		return Pattern.matches(emailReg, phone);
	}
	
	public boolean checkIdNicknameByte(String id, String nickname) {
		boolean flag = false;
		
		int length = id.getBytes().length;
		if(length < 31) {
			flag = true;
		}
		
		length = nickname.getBytes().length;
		if(length < 31) {
			flag = true;
		}
		String[] unableNickname = {"관리자", "매니저"};
		for(String str : unableNickname) {
			flag = !nickname.contains(str);
		}
		
		return flag;
	}
}
