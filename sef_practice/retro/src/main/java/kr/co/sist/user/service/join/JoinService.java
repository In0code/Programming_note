package kr.co.sist.user.service.join;

import java.util.regex.Pattern;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.sist.user.dao.JoinDAO;
import kr.co.sist.user.vo.JoinVO;

@Service
public class JoinService {
	
	@Autowired
	private JoinDAO jDAO;
	
	@PostMapping("/user_join_process.do")
	public void addUser(JoinVO jVO) {
		jDAO.insertUser(jVO);
	}
	
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
        return Pattern.matches(emailReg, email);
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
		
		return flag;
	}
}
