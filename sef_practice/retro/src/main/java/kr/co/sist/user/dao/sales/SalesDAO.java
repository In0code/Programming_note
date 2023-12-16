package kr.co.sist.user.dao.sales;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.sales.SalesDomain;

@Component
public class SalesDAO {

	public List<SalesDomain> selectAllSales(String id) {
		List<SalesDomain> list = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.userSales.allSales", id);
		
		mh.closeHandler(ss);
		
		return list;
	}
	
	public List<SalesDomain> selectOnSales(String id) {
		List<SalesDomain> list = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.userSales.onSales", id);
		
		mh.closeHandler(ss);
		
		return list;
	}
	
	public List<SalesDomain> selectFinishedSales(String id) {
		List<SalesDomain> list = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("kr.co.sist.user.userSales.finishedSales", id);
		
		mh.closeHandler(ss);
		
		return list;
	}
}
