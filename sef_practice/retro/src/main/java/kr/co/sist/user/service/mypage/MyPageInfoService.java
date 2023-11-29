package kr.co.sist.user.service.mypage;

import kr.co.sist.user.dao.EnterMyPageInfoDAO;
import kr.co.sist.user.domain.MyPageEnterDomain;
import kr.co.sist.user.vo.MyPageEnterVO;

public class MyPageInfoService {
	
	public MyPageEnterDomain isEnterable(MyPageEnterVO mpeVO) {
		MyPageEnterDomain mpeDomain = null;
		
		mpeDomain = EnterMyPageInfoDAO.getInstance().isEnterable(mpeVO);
		
		return mpeDomain;
	}

}
