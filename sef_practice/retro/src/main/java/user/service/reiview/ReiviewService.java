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
			for(ReiviewDomain reiview : list) {
				if(reiview.getSelect1() != '1') {
					switch (reiview.getSelect2()) {
					case '1':
						rcDomain.setOne(++one);
						break;
					case '2':
						rcDomain.setTwo(++two);
						break;
					case '3':
						rcDomain.setThree(++three);
						break;
					case '4':
						rcDomain.setFour(++four);
						break;
					}
				}
			}
			
			rcDomain.setTotal(list.size());
		}
		
		return rcDomain;
	}
}
