package kr.co.sist.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.mypage.MypagePrdDomain;

/**
 * 전체, 판매중, 판매완료, 예약중인 사용자의 상품 정보를 불러오는 DAO class
 * @author marklim
 */
@Component
public class MypagePrdInfoDAO {
	
	private MybatisHandler mh;
	
	/**
	 * 모든 상품을 불러온다
	 * @param id
	 * @return  List&lt;MypagePrdDomain&gt;
	 */
	public List<MypagePrdDomain> selectAllPrd(String id) {
		List<MypagePrdDomain> list = null;
		
		mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.mypagePrdInfo.selectAllPrd", id);
		
		mh.closeHandler(ss);
		
		return list;
	}

	/**
	 * 판매중인 상품을 가져옴
	 * @param id
	 * @return List&lt;MypagePrdDomain&gt;
	 */
	public List<MypagePrdDomain> selectPrdOnProcess(String id) {
		List<MypagePrdDomain> list = null;
		
		mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.mypagePrdInfo.selectPrdOnProcess", id);
		
		mh.closeHandler(ss);
		
		return list;
	}
	
	/**
	 * 판매완료한 상품 조회
	 * @param id
	 * @return  List&lt;MypagePrdDomain&gt;
	 */
	public List<MypagePrdDomain> selectCompletedPrd(String id) {
		List<MypagePrdDomain> list = null;
		
		mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.mypagePrdInfo.selectCompletedPrd", id);
		
		mh.closeHandler(ss);
		
		return list;
	}
	
	/**
	 * 예약중 상품 조회
	 * @param id
	 * @return  List&lt;MypagePrdDomain&gt;
	 */
	public List<MypagePrdDomain> selectReservationPrd(String id) {
		List<MypagePrdDomain> list = null;
		
		mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.mypagePrdInfo.selectReservationPrd", id);
		
		mh.closeHandler(ss);
		
		return list;
	}
}
