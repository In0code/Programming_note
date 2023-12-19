package kr.co.sist.user.service.sales;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.user.dao.sales.SalesDAO;
import kr.co.sist.user.domain.sales.SalesDomain;
import kr.co.sist.user.domain.sales.SalesListDomain;
import kr.co.sist.user.vo.sales.SalesListVO;
import kr.co.sist.user.vo.sales.SalesVO;

@Service
public class SalesService {

	@Autowired
	private SalesDAO sDAO;
	
	public List<SalesListDomain> searchSales(BoardRangeVO brVO) {
		List<SalesListDomain> list = null;

		switch (brVO.getStatus().charAt(0)) {
		case 'A':
			list = searchAllSales(brVO.getId());
			break;
		case 'O':
			list = searchOnSales(brVO.getId());
			break;
		case 'F':
			list = searchFinishedSales(brVO.getId());
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
		SalesDomain sDomain = sDAO.selectOneSale(sVO);
		
		if(sDomain != null) {
			String[] select = {sDomain.getSelect2_1(), sDomain.getSelect2_2(), sDomain.getSelect2_3(), sDomain.getSelect2_4()};
			String[] comment = {"친절/매너가 좋아요.", "응답이 빨라요.", "제가 있는 곳까지 와서 거래했어요.", "거래 시간을 잘 지켜요."};
			
			if("3".equals(sDomain.getSelect1())) {
				comment[0] = "친절/매너가 아쉬워요.";
				comment[1] = "응답이 느려요.";
				comment[2] = "원하지 않는 가격을 계속 요구해요.";
				comment[3] = "거래 시간을 안 지켜요.";
			}
			
			List<String> commentList = new ArrayList<String>();
			for(int i = 0; i < select.length; i++) {
				if(select[i] != null) {
					for(int j = 0; i < comment.length; j++) {
						if(String.valueOf(j+1).equals(select[i])) {
							commentList.add(comment[j]);
							break;
						}
					}
				}
			}
			
			sDomain.setCommentList(commentList);
		}
		
		return sDomain;
	}
	
	public int totalRecodeCnt(String id) {
		return sDAO.selectTotalRecode(id);
	}
}
