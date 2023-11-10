package day1109;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MybatisHandler;

public class ExamDAO {

	private static ExamDAO eDAO;
	private ExamDAO() {
	}
	
	public static ExamDAO getInstance() {
		if(eDAO == null) {
			eDAO=new ExamDAO();
		}//end if
		return eDAO;
	}//getInstance
	
	public String scsr(int deptno)throws PersistenceException{
		String dname="";
		//1. MyBatis Handler 얻기
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler("kr/co/sist/dao/mybatis-config.xml", false);
		//2. Query문 실행
		dname=ss.selectOne("kr.co.sist.exam.scsr",deptno);
		//3. Handler 닫기
		mbh.closeHandler(ss);
		return dname;
	}//scsr
	
	
}//class
