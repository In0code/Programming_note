package kr.co.sist.user.dao.reiview;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.reiview.ReiviewDomain;

@Component
public class ReiviewDAO {

	public List<ReiviewDomain> selectUserProfileReiview(String id) {
		List<ReiviewDomain> list = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.mypageReiview.myReiview", id);
		
		mh.closeHandler(ss);
		
		return list;
	}
}
