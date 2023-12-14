package kr.co.sist.user.service.mypage;

import java.security.NoSuchAlgorithmException;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.MyPageInfoDetailDAO;
import kr.co.sist.user.domain.MyPageEnterDomain;
import kr.co.sist.user.domain.mypage.MypageInfoDomain;
import kr.co.sist.user.vo.ChangePwVO;
import kr.co.sist.user.vo.ChangeUserInfoVO;
import kr.co.sist.user.vo.MyPageIdPwVO;

@Service
public class MyPageInfoDetailService {
	
	private MyPageInfoDetailDAO midDAO;
	@Autowired
	private UserInfoEncryptionSerivice encrypt;
	
	public MyPageEnterDomain isEnterable(MyPageIdPwVO mpeVO) {
		MyPageEnterDomain mpeDomain = null;
		midDAO = new MyPageInfoDetailDAO();
		
		try {
			mpeVO.setPw(encrypt.oneWayEncryptData(mpeVO.getPw()));
			mpeDomain = midDAO.isEnterable(mpeVO);
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return mpeDomain;
	}

	public String changePw(ChangePwVO cpVO) {
		String flagMsg = "비밀번호 변경에 실패하였습니다. 다시 시도해주세요.";
		midDAO = new MyPageInfoDetailDAO();
		
		try {
			cpVO.setOldPw(encrypt.oneWayEncryptData(cpVO.getOldPw()));
			cpVO.setNewPw(encrypt.oneWayEncryptData(cpVO.getNewPw()));
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		int result = midDAO.updatePw(cpVO);
		if(result == 1) {
			flagMsg = "비밀번호를 성공적으로 변경하였습니다.";
		}
		
		return flagMsg;
	}
	
	public JSONObject changeInfo(ChangeUserInfoVO cuiVO) {
		JSONObject jsonObj = new JSONObject();
		
		midDAO = new MyPageInfoDetailDAO();
		boolean flag = midDAO.updateUserInfo(cuiVO) == 1 ? true : false;
		jsonObj.put("flag", flag);
		
		return jsonObj;
	}
	
	public void byebye(String id) {
		midDAO = new MyPageInfoDetailDAO();
		midDAO.updateByeUser(id);
	}
	
	public MypageInfoDomain searchUserInfo(String id) {
		midDAO = new MyPageInfoDetailDAO();
		return midDAO.selectUserInfo(id);
	}
}
