package kr.co.sist.user.service.mypage;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.MypagePrdInfoDAO;
import kr.co.sist.user.domain.mypage.MypagePrdDomain;

@Service
public class MypagePrdInfoService {

	private MypagePrdInfoDAO mpDAO;
	
	public List<MypagePrdDomain> searchPrdOnProcess(String id) {
		List<MypagePrdDomain> list = null;
		
		mpDAO.selectOnProcess(id);
		
		return list;
	}
}
