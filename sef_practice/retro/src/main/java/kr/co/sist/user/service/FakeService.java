package kr.co.sist.user.service;

import kr.co.sist.user.dao.FakeDAO;
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
	
	public int searchFake(FakeVO fVO) {
		FakeDAO fDAO = FakeDAO.getInstance();
		
		int cnt = fDAO.searchFake(fVO);
		
		return cnt;
	}

}
