package kr.co.sist.user.service.mypage;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.MypagePrdInfoDAO;
import kr.co.sist.user.domain.mypage.MypagePrdDomain;

/**
 * @author marklim
 * 사용자 마이페이지 메인 화면에서 보여지는 상품목록을 검색한다.
 */
@Service
public class MypagePrdInfoService {

	@Autowired
	private MypagePrdInfoDAO mpDAO;
	
	/**
	 * 사용자의 모든 상품을 검색
	 * @param id
	 * @return List&lt;MypagePrdDomain&gt;
	 */
	public List<MypagePrdDomain> searchAllPrd(String id) {
		return mpDAO.selectAllPrd(id);
	}
	
	/**
	 * 판매중인 상품 검색
	 * @param id
	 * @return List&lt;MypagePrdDomain&gt;
	 */
	public List<MypagePrdDomain> searchPrdOnProcess(String id) {
		return mpDAO.selectPrdOnProcess(id);
	}
	
	/**
	 * 판매완료한 상품 검색
	 * @param id
	 * @return JSONObject
	 */
	public List<MypagePrdDomain> searchCompletedPrd(String id) {
		return mpDAO.selectCompletedPrd(id);
	}
	
	/**
	 * 예약중인 상품을 검색
	 * @param id
	 * @return JSONObject
	 */
	public List<MypagePrdDomain> searchReservationPrd(String id) {
		return mpDAO.selectReservationPrd(id);
	}
}
