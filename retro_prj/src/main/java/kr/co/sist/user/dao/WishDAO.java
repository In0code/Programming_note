package kr.co.sist.user.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.WishDomain;
import kr.co.sist.user.vo.WishVO;

public class WishDAO {
	
	private static WishDAO wDAO;
	private String configPath;

	private WishDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}

	public static WishDAO getInstance() {
		if (wDAO == null) {
			wDAO = new WishDAO();
		} // end if
		return wDAO;
	}// getInstance


	/**
	 * 찜 총 레코드 수
	 * 
	 * @return
	 * @throws PersistenceException
	 */
	public int selectWishCnt(String id) throws PersistenceException {
		int selectAllCnt = 0;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		try {
			selectAllCnt = ss.selectOne("user.wish.selectWishCnt", id);
	    } finally {
	        mbh.closeHandler(ss);
	    }//finally
		return selectAllCnt;
	}// selectWishCnt
	
	
	/**
	 * 찜 추가
	 * 
	 * @return
	 * @throws PersistenceException
	 */
	public int insertWish(WishVO wVO) throws PersistenceException {
		int insertCnt = 0;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		try {
			insertCnt = ss.insert("user.wish.insertWish", wVO);
	        if (insertCnt == 1) {
	            ss.commit();
	        } else {
	            ss.rollback();
	        }//end else
	    } finally {
	        mbh.closeHandler(ss);
	    }//finally
		return insertCnt;
	}// insertWish
	
	/**
	 * 찜 리스트 전체 조회
	 * 
	 * @param String
	 * @return
	 * @throws PersistenceException
	 */
	public List<WishDomain> selectAllWish(BoardRangeVO brVO) throws PersistenceException {
		List<WishDomain> allWishList = null;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		allWishList = ss.selectList("user.wish.selectAllWish", brVO);

		mbh.closeHandler(ss);

		return allWishList;
	}// selectAllWish
	
	public int deleteWish(String pcode) throws PersistenceException {
	    int deleteCnt=0;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
	    SqlSession ss = mbh.getMyBatisHandler(configPath, false);
	    try {
	        deleteCnt = ss.delete("user.wish.deleteWish", pcode);
	        if (deleteCnt == 1) {
	            ss.commit();
	        } else {
	            ss.rollback();
	        }//end else
	    } finally {
	        mbh.closeHandler(ss);
	    }//end finally
	    return deleteCnt;
	}//deleteWish
	
//	public static void main (String[] args) {
//		WishDAO wdd=WishDAO.getInstance();
////		BoardRangeVO brVO=new BoardRangeVO();
//		WishVO wVO=new WishVO();
//		wVO.setId("1011kiy111");
//		wVO.setPcode("P00108");
//////		brVO.setId("1011kiy111");
//		wdd.insertWish(wVO);
//////		System.out.println(wdd.selectWishCnt("1011kiy111"));
//////		wdd.selectAllWish(brVO);
////		wdd.deleteWish("P00107");
//	}
	
}//class
