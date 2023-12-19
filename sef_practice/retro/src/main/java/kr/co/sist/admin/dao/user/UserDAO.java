package kr.co.sist.admin.dao.user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.admin.domain.user.UserDomain;
import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.dao.MybatisHandler;

@Component
public class UserDAO {

	public List<UserDomain> selectAllUser(BoardRangeVO brVO) {
		List<UserDomain> list = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.admin.userMng.selectAllUser", brVO);
		
		mh.closeHandler(ss);
		
		return list;
	}
		
	public UserDomain selectOneUser(String id) {
		UserDomain uDomain = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		uDomain = ss.selectOne("kr.co.sist.admin.userMng.selectOneUser", id);
		
		mh.closeHandler(ss);
		
		
		return uDomain;
	}
	
	public int updateUserStatus(String id) {
		int result = 0;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.update("kr.co.sist.admin.userMng.updateUserStatus", id);
		if(result ==1 ) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		
		return result;
	}
	
	public int updateUser(String id) {
		int result = 0;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.update("kr.co.sist.admin.userMng.updateDelUser", id);
		if(result == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		return result;
	}
	
	public int selectCntRecode() {
		int result = 0;
		
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.selectOne("kr.co.sist.admin.userMng.CntRecode");
		
		mh.closeHandler(ss);
		
		return result;
	}
}
