package kr.co.sist.assembly;

import kr.co.sist.dao.DAO;
import kr.co.sist.dao.MysqlDAOImpl;
import kr.co.sist.dao.OracleDAOImpl;
import kr.co.sist.service.Service;
import kr.co.sist.service.ServiceImpl;

public class Assembly {

	public Service getBean() {
		Service service=null;
		//의존성 주입할 클래스 생성
		DAO dao=new OracleDAOImpl();
//		DAO dao=new MysqlDAOImpl();
		
		//Service와 DAO를 외부 클래스에서 의존성 주입하여 다른 동작을 수행한다 - 약결합
		service=new ServiceImpl(dao);
		
		return service;
	}//getBean
}//class
