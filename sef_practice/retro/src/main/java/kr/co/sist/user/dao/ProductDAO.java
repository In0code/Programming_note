package kr.co.sist.user.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.ProductDomain;

public class ProductDAO {

	private static ProductDAO pDAO;
	private String configPath;

	private ProductDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}

	public static ProductDAO getInstance() {
		if (pDAO == null) {
			pDAO = new ProductDAO();
		} // end if
		return pDAO;
	}// getInstance

	/**
	 * 카테고리 검색
	 * @return
	 * @throws PersistenceException
	 */
	public ProductDomain selectCategory() throws PersistenceException {
		ProductDomain pd= null;

		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(configPath,false);
		pd=ss.selectOne("user.product.selectCategory");
		
		mbh.closeHandler(ss);
			
		return pd;
	}//selectCategory


}// class
