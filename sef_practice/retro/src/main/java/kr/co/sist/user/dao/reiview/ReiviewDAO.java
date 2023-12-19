package kr.co.sist.user.dao.reiview;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.MyPurchaseDomain;
import kr.co.sist.user.domain.reiview.ReiviewDomain;

@Component
public class ReiviewDAO {

	public List<ReiviewDomain> selectUserProfileReiview(BoardRangeVO brVO) {
		List<ReiviewDomain> list = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.mypageReiview.myReiview", brVO);
		
		mh.closeHandler(ss);
		
		return list;
	}
	
	public int selectTotalRecode(String id) {
		int result = 0;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.selectOne("kr.co.sist.user.mypageReiview.totalRecode", id);
		
		mh.closeHandler(ss);
		
		return result;
	}
}
