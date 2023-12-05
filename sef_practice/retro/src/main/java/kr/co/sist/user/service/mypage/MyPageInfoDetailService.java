package kr.co.sist.user.service.mypage;

import kr.co.sist.user.dao.MyPageInfoDetailDAO;
import kr.co.sist.user.domain.MyPageEnterDomain;
import kr.co.sist.user.vo.ChangePwVO;
import kr.co.sist.user.vo.MyPageIdPwVO;

public class MyPageInfoDetailService {
	
	public MyPageEnterDomain isEnterable(MyPageIdPwVO mpeVO) {
		MyPageEnterDomain mpeDomain = null;
		
		mpeDomain = MyPageInfoDetailDAO.getInstance().isEnterable(mpeVO);
		
		return mpeDomain;
	}

	public String changePw(ChangePwVO cpVO) {
		String flagMsg = "비밀번호 변경에 실패하였습니다. 다시 시도해주세요.";
		
		int result = MyPageInfoDetailDAO.getInstance().updatePw(cpVO);
		if(result == 1) {
			flagMsg = "비밀번호를 성공적으로 변경하였습니다.";
		}
		
		return flagMsg;
	}
	
	public void byebye(String id) {
		MyPageInfoDetailDAO.getInstance().updateByeUser(id);
	}
}
