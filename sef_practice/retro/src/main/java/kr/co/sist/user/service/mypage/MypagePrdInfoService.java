package kr.co.sist.user.service.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.user.dao.MypagePrdInfoDAO;
import kr.co.sist.user.domain.mypage.MypagePrdDomain;
import kr.co.sist.user.vo.MypageIDnFlagVO;

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
	@PostMapping("/mypage_prd_all.do")
	public List<MypagePrdDomain> searchAllPrd(BoardRangeVO brVO) {
		return mpDAO.selectAllPrd(brVO);
	}
	
	/**
	 * 판매중인 상품 검색
	 * @param id
	 * @return List&lt;MypagePrdDomain&gt;
	 */
	@PostMapping("/mypage_prd_onsale.do")
	public List<MypagePrdDomain> searchPrdOnProcess(BoardRangeVO brVO) {
		return mpDAO.selectPrdOnProcess(brVO);
	}
	
	/**
	 * 판매완료한 상품 검색
	 * @param id
	 * @return JSONObject
	 */
	@GetMapping("/mypage_prd_completed.do")
	public List<MypagePrdDomain> searchCompletedPrd(BoardRangeVO brVO) {
		return mpDAO.selectCompletedPrd(brVO);
	}
	
	public int totalRecodeCnt(BoardRangeVO brVO) {
		return mpDAO.selectTotalRecode(brVO);
	}
}
