package kr.co.sist.user.dao;

import java.util.List;

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
	public List<ProductDomain> selectCategory() throws PersistenceException {
		List<ProductDomain> list= null;

		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		list=ss.selectList("user.product.selectCategory");
		
		mbh.closeHandler(ss);
			
		return list;
	}//selectCategory
	
	public static void main(String[] args) {
		ProductDAO pd=ProductDAO.getInstance();
		pd.selectCategory();
	}//main


}// class
