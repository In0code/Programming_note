package kr.co.sist.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.dao.TestDAO;

@Component
public class ServiceImpl5 implements Service {

	@Autowired // 생성자를 만들고 의존성 주입을 받는 코드를 작성할 필요가 없다.
	private TestDAO tDAO;
	
	@Override
	public void addName(String name) {
		try {
			tDAO.insertName(name+"님 어서오고");
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
	}//addName

	@Override
	public List<String> searchName() {
		List<String> list=null;
		
		try {
			list=tDAO.selectAllNames();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return list;
	}//searchName

}//class
