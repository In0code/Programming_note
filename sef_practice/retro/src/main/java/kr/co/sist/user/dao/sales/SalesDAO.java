package kr.co.sist.user.dao.sales;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.sales.SalesDomain;
import kr.co.sist.user.domain.sales.SalesListDomain;
import kr.co.sist.user.vo.sales.SalesVO;

@Component
public class SalesDAO {

	public List<SalesListDomain> selectAllSales(String id) {
		List<SalesListDomain> list = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.userSales.allSales", id);
		
		mh.closeHandler(ss);
		
		return list;
	}
	
	public List<SalesListDomain> selectOnSales(String id) {
		List<SalesListDomain> list = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.userSales.onSales", id);
		
		mh.closeHandler(ss);
		
		return list;
	}
	
	public List<SalesListDomain> selectFinishedSales(String id) {
		List<SalesListDomain> list = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.userSales.finishedSales", id);
		
		mh.closeHandler(ss);
		
		return list;
	}
	
	public SalesDomain selectOneSale(SalesVO sVO) {
		SalesDomain sDomain = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		sDomain = ss.selectOne("kr.co.sist.user.userSales.salesDetail", sVO);
		
		mh.closeHandler(ss);
		
		return sDomain;
	}
	
	public int selectTotalRecode(String id) {
		int result = 0;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.selectOne("kr.co.sist.user.userSales.totalRecode", id);
		
		mh.closeHandler(ss);
		
		return result;
	}
}
