package kr.co.sist.user.service;

import kr.co.sist.user.dao.FakeDAO;
import kr.co.sist.user.domain.FakeDomain;
import kr.co.sist.user.vo.FakeVO;

public class FakeService {
	private static FakeService fs;
	
	private FakeService() {
		
	}
	
	public static FakeService getInstance() {
		if(fs==null) {
			fs = new FakeService();
		}
		return fs;
	}
	
	public FakeDomain searchFake(FakeVO fVO) {
		FakeDAO fDAO = FakeDAO.getInstance();
		FakeDomain fd = new FakeDomain();
		
		String keyword = fVO.getFraudKeyword().toLowerCase();
		String field = fVO.getFraudField();
		String tempKey = "";
		
		int index = 2;
		
		if( keyword!= null && !"".equals(keyword)){
			if(keyword.length() > 7 && !"email".equals(field)){
				index = keyword.length()-5;
			}
			tempKey = keyword.substring(0,index);
			for(int i = index; i < keyword.length() ; i++){
				tempKey = tempKey.concat("*");
			}
		}
		
		fd.setCnt(fDAO.searchFake(fVO));
		fd.setFraudKeyword(tempKey);
		
		return fd;
	}

}
