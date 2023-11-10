package day1109;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MybatisHandler;
import kr.co.sist.domain.EmpDomain;
import kr.co.sist.vo.EmpVO;

public class EmpDAO {

	public EmpDomain selectOneEmp( EmpVO eVO ) throws PersistenceException {
		EmpDomain ed=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		//1. MyBatis Handler 얻기
		SqlSession ss= mbh.getMyBatisHandler("kr/co/sist/dao/mybatis-config.xml", false);
		//2. Handler를 사용하여 조회 결과 얻기
		ed=ss.selectOne("kr.co.sist.emp.selectOneEmp",eVO);
		
		//3. Handler 닫기
		mbh.closeHandler(ss);
		
		return ed;
	}//selectOneEmp
	
	public List<EmpDomain> selectDeptEmp(int deptno)throws PersistenceException{
		List<EmpDomain> list=null;
		MybatisHandler mbh=MybatisHandler.getInstance();
		//1. MyBatis Handler 얻기
		SqlSession ss=mbh.getMyBatisHandler("kr/co/sist/dao/mybatis-config.xml", false);
		//2. Handler를 사용하여 조회결과 얻기
		list=ss.selectList("kr.co.sist.emp.selectDeptEmp",deptno);
		//3. Handler 닫기
		mbh.closeHandler(ss);
		return list;
	}//selectDeptEmp
	
}//class
