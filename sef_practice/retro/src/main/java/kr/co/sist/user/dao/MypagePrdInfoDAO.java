package kr.co.sist.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.mypage.MypagePrdDomain;

@Component
public class MypagePrdInfoDAO {

	public List<MypagePrdDomain> selectOnProcess(String id) {
		List<MypagePrdDomain> list = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.mypagePrdInfo.selectPrdOnProcess", id);
		
		mh.closeHandler(ss);
		
		return list;
	}
}
