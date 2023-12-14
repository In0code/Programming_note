package kr.co.sist.user.service.reiview;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.reiview.ReiviewDAO;
import kr.co.sist.user.domain.reiview.ReiviewCntDomain;
import kr.co.sist.user.domain.reiview.ReiviewDomain;

@Service
public class ReiviewService {
	
	@Autowired
	private ReiviewDAO rDAO;

	public List<ReiviewDomain> searchUseProfileReiview(String id) {
		return rDAO.selectUserProfileReiview(id);
	}
	
	public ReiviewCntDomain getReiviewCnt(List<ReiviewDomain> list) {
		ReiviewCntDomain rcDomain = new ReiviewCntDomain();
		int one = 0;
		int two = 0;
		int three = 0;
		int four = 0;
		
		if(list != null) {
			for(ReiviewDomain reiviews : list) {
				switch (reiviews.getSelect2()) {
				case '1':
					rcDomain.setROne(one++);
					break;
				case '2':
					rcDomain.setRTwo(two++);
					break;
				case '3':
					rcDomain.setRThree(three++);
					break;
				case '4':
					rcDomain.setRFour(four++);
					break;
				}
				
			}
			
		}
		
		return rcDomain;
	}
}
