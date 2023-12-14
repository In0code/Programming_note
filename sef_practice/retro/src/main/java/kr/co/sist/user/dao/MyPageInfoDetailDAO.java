package kr.co.sist.user.dao;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.MyPageEnterDomain;
import kr.co.sist.user.domain.mypage.MypageInfoDomain;
import kr.co.sist.user.vo.ChangePwVO;
import kr.co.sist.user.vo.ChangeUserInfoVO;
import kr.co.sist.user.vo.MyPageIdPwVO;


public class MyPageInfoDetailDAO {
	
	private static String configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	
	public MyPageEnterDomain isEnterable(MyPageIdPwVO mpeVO) {
		MyPageEnterDomain mpeDomain = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(configPath, false);
		
		mpeDomain = ss.selectOne("kr.co.sist.user.mypageInfoDetail.canEnter", mpeVO);
		
		mh.closeHandler(ss);
		
		return mpeDomain;
	}
	
	public int updatePw(ChangePwVO cpVO) {
		int result = 0;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.update("kr.co.sist.user.mypageInfoDetail.changeUserPw", cpVO);
		if(result == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		mh.closeHandler(ss);
		
		return result;
	}
	
	public int updateUserInfo(ChangeUserInfoVO cuiVO) {
		int result = 0;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.update("kr.co.sist.user.mypageInfoDetail.updateUserInfo", cuiVO);
		if(result == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		return result;
	}
	
	public int updateByeUser(String id) {
		int result = 0;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.update("kr.co.sist.user.mypageInfoDetail.byebye", id);
		if(result == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		mh.closeHandler(ss);
		
		return result;
	}
	
	/**
	 * 사용자의 기본적인 정보를 받아서 반환
	 * @param id
	 * @return MypageInfoDomain
	 */
	public MypageInfoDomain selectUserInfo(String id) {
		MypageInfoDomain miDomain = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		miDomain = ss.selectOne("kr.co.sist.user.mypageInfoDetail.selectUserInfo", id);
		
		mh.closeHandler(ss);
		
		return miDomain;
	}
}
