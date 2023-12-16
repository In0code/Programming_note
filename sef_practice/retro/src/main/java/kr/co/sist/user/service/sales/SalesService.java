package kr.co.sist.user.service.sales;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.sales.SalesDAO;
import kr.co.sist.user.domain.sales.SalesDomain;
import kr.co.sist.user.domain.sales.SalesListDomain;
import kr.co.sist.user.vo.sales.SalesListVO;
import kr.co.sist.user.vo.sales.SalesVO;

@Service
public class SalesService {

	@Autowired
	private SalesDAO sDAO;
	
	public List<SalesListDomain> searchSales(SalesListVO slVO) {
		List<SalesListDomain> list = null;

		switch (slVO.getFlag()) {
		case 'A':
			list = searchAllSales(slVO.getId());
			break;
		case 'O':
			list = searchOnSales(slVO.getId());
			break;
		case 'F':
			list = searchFinishedSales(slVO.getId());
			break;
		}
		
		return list;
	}
	
	public List<SalesListDomain> searchAllSales(String id) {
		return sDAO.selectAllSales(id);
	}
	
	public List<SalesListDomain> searchOnSales(String id) {
		return sDAO.selectOnSales(id);
	}
	
	public List<SalesListDomain> searchFinishedSales(String id) {
		return sDAO.selectFinishedSales(id);
	}
	
	public SalesDomain searchOneSales(SalesVO sVO) {
		return sDAO.selectOneSale(sVO);
	}
}
