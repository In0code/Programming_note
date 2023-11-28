package kr.co.sist.user.service.join;

import kr.co.sist.user.dao.JoinDAO;
import kr.co.sist.user.vo.JoinVO;

public class JoinService {
	
	private static JoinService js;
	
	private JoinService() {
	}
	
	public static JoinService getInstance() {
		if(js == null) {
			js = new JoinService();
		}
		return js;
	}
	
	public void addUser(JoinVO jVO) {
		JoinDAO jDAO = JoinDAO.getInstance();
	}
}
