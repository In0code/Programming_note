package kr.co.sist.user.service.sales;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.sales.SalesDAO;
import kr.co.sist.user.domain.sales.SalesDomain;
import kr.co.sist.user.vo.sales.SalesVO;

@Service
public class SalesService {

	@Autowired
	private SalesDAO sDAO;
	
	public List<SalesDomain> searchSales(SalesVO sVO) {
		List<SalesDomain> list = null;

		switch (sVO.getFlag()) {
		case 'A':
			list = searchAllSales(sVO.getId());
			break;
		case 'O':
			list = searchOnSales(sVO.getId());
			break;
		case 'F':
			list = searchFinishedSales(sVO.getId());
			break;
		}
		
		return list;
	}
	
	public List<SalesDomain> searchAllSales(String id) {
		return sDAO.selectAllSales(id);
	}
	
	public List<SalesDomain> searchOnSales(String id) {
		return sDAO.selectOnSales(id);
	}
	
	public List<SalesDomain> searchFinishedSales(String id) {
		return sDAO.selectFinishedSales(id);
	}
}
