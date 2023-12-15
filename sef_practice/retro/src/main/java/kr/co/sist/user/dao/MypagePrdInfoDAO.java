package kr.co.sist.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.mypage.MypagePrdDomain;
import kr.co.sist.user.vo.MypageIDnFlagVO;

/**
 * 전체, 판매중, 판매완료, 예약중인 사용자의 상품 정보를 불러오는 DAO class
 * @author ㅌㅌ
 */
@Component
public class MypagePrdInfoDAO {
	
	private MybatisHandler mh;
	
	/**
	 * 모든 상품을 불러온다
	 * @param id
	 * @return  List&lt;MypagePrdDomain&gt;
	 */
	public List<MypagePrdDomain> selectAllPrd(MypageIDnFlagVO mVO) {
		List<MypagePrdDomain> list = null;
		
		mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.mypagePrdInfo.selectAllPrd", mVO);
		
		mh.closeHandler(ss);
		
		return list;
	}

	/**
	 * 판매중인 상품을 가져옴
	 * @param id
	 * @return List&lt;MypagePrdDomain&gt;
	 */
	public List<MypagePrdDomain> selectPrdOnProcess(MypageIDnFlagVO mVO) {
		List<MypagePrdDomain> list = null;
		
		mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.mypagePrdInfo.selectPrdOnProcess", mVO);
		
		mh.closeHandler(ss);
		
		return list;
	}
	
	/**
	 * 판매완료한 상품 조회
	 * @param id
	 * @return  List&lt;MypagePrdDomain&gt;
	 */
	public List<MypagePrdDomain> selectCompletedPrd(MypageIDnFlagVO mVO) {
		List<MypagePrdDomain> list = null;
		
		mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.mypagePrdInfo.selectCompletedPrd", mVO);
		
		mh.closeHandler(ss);
		
		return list;
	}
}
