package kr.co.sist.user.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.ProductDomain;
import kr.co.sist.user.domain.WishDomain;
import kr.co.sist.user.vo.ProductVO;
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
			insertCnt = ss.insert("user.product.insertWish", wVO);
	        if (insertCnt == 1) {
	            ss.commit();
	        } else {
	            ss.rollback();
	        }//end else
	    } finally {
	        mbh.closeHandler(ss);
	    }//finally
		return insertCnt;
	}// selectCategory
	
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
		allWishList = ss.selectList("user.product.selectAllWish", brVO);

		mbh.closeHandler(ss);

		return allWishList;
	}// selectProduct
}
