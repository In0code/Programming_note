package day1113;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MybatisHandler;
import kr.co.sist.domain.CarDomain;
import kr.co.sist.domain.CarDomain2;
import kr.co.sist.domain.EmpDomain;
import kr.co.sist.domain.JoinDomain;
import kr.co.sist.vo.BoardVO;

public class ExamDAO3 {

	private String configPath;
	private static ExamDAO3 eDAO3;
	
	private ExamDAO3() {
		configPath="kr/co/sist/dao/mybatis-config.xml";
	}

	public static ExamDAO3 getInstance() {
		if(eDAO3 == null) {
			eDAO3=new ExamDAO3();
		}//end if
		return eDAO3;
	}//getInstance
	
	
	public List<CarDomain> selectSubquery(BoardVO bVO) throws PersistenceException{
		List<CarDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		//1. Handler 얻기
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		//2. Mapper.xml에서 실행할 SQL문을 찾고, 실행한다
		list=ss.selectList("kr.co.sist.exam3.subquery",bVO);
		
		//3. Handler 닫기
		mbh.closeHandler(ss);
		
		return list;
	}//selectSubquery
	
	public List<EmpDomain> union() throws PersistenceException{
		List<EmpDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		//1. Handler 얻기
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		//2. Mapper.xml에서 실행할 SQL문을 찾고, 실행한다
		list=ss.selectList("kr.co.sist.exam3.union");
		
		//3. Handler 닫기
		mbh.closeHandler(ss);
		
		return list;
	}//selectSubquery
	
	public List<JoinDomain> join() throws PersistenceException{
		List<JoinDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		//1. Handler 얻기
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		//2. Mapper.xml에서 실행할 SQL문을 찾고, 실행한다
		list=ss.selectList("kr.co.sist.exam3.join");
		
		//3. Handler 닫기
		mbh.closeHandler(ss);
		
		return list;
	}//selectSubquery
	
	public List<CarDomain2> subqueryJoin(String country) throws PersistenceException{
		List<CarDomain2> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		//1. Handler 얻기
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		//2. Mapper.xml에서 실행할 SQL문을 찾고, 실행한다
		list=ss.selectList("kr.co.sist.exam3.subqueryJoin",country);
		
		//3. Handler 닫기
		mbh.closeHandler(ss);
		
		return list;
	}//selectSubquery
	
	public List<EmpDomain> dollarSign(String tableName) throws PersistenceException{
		List<EmpDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		list=ss.selectList("kr.co.sist.exam3.dollarSign",tableName);
		mbh.closeHandler(ss);
		
		return list;
	}//dollarSign
	
	public static void main(String[] args) {

		BoardVO bV=new BoardVO();
		bV.setStartNum(1);
		bV.setEndNum(10);
		
//		ExamDAO3.getInstance().selectSubquery(bV);
//		ExamDAO3.getInstance().union();
//		ExamDAO3.getInstance().join();
//		ExamDAO3.getInstance().subqueryJoin("국산");
		ExamDAO3.getInstance().dollarSign("emp");
	}//main

}//class
