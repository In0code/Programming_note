package day1116;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MybatisHandler;
import kr.co.sist.domain.DeptEmpDomain;
import kr.co.sist.vo.InsertProcedureVO;
import oracle.sql.DATE;

public class ExamDAO6 {

	private static ExamDAO6 eDAO;
	private String configPath;
	
	private ExamDAO6() {
		configPath="kr/co/sist/dao/mybatis-config.xml";
	}
	
	public static ExamDAO6 getInstance() {
		if(eDAO == null){
			eDAO=new ExamDAO6();
		}//end if
		return eDAO;
	}//getInstance
	
	
	public void insertProcedure(InsertProcedureVO ipVO) throws PersistenceException {
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		ss.selectOne("kr.co.sist.exam6.insert_proc",ipVO);
		
		mbh.closeHandler(ss);
		
	}//insertProcedure
	
	
	public List<DeptEmpDomain> selectProcedure( Map<String, Object> map) throws PersistenceException{
		List<DeptEmpDomain> list=new ArrayList<DeptEmpDomain>();
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		ss.selectOne("kr.co.sist.exam6.select_proc",map);
		
		mbh.closeHandler(ss);
		
		List<Map<String, Object>> tempList=
				(List<Map<String, Object>>)map.get("selectData");
		
//		int i=0;
//		BigDecimal bd=null;
//		Timestamp ts=null;
		DeptEmpDomain ded=null;
		
		for( Map<String, Object> resultMap :tempList) {
//			bd=(BigDecimal)resultMap.get("EMPNO");
//			i=bd.intValue();
//			System.out.println(i);
//			ts=(Timestamp)resultMap.get("HIREDATE");
//			date=new Date(ts.getTime());
//			System.out.println(date);
			
			ded=new DeptEmpDomain();
			ded.setDeptno(((BigDecimal)resultMap.get("DEPTNO")).intValue());
			ded.setDname((String)resultMap.get("DNAME"));
			ded.setLoc((String)resultMap.get("LOC"));
			
			if(resultMap.get("ENAME") != null) {
				ded.setEmpno(((BigDecimal)resultMap.get("EMPNO")).intValue());
				ded.setEname((String)resultMap.get("ENAME"));
				ded.setSal(((BigDecimal)resultMap.get("SAL")).intValue());
				ded.setHiredate(new Date(((Timestamp)resultMap.get("HIREDATE")).getTime() ));
			}//end if
			list.add(ded);
		}//end for
		
		return list;
	}//selectProcedure

	
	public List<DeptEmpDomain> selectAllProcedure( ) throws PersistenceException{
		List<DeptEmpDomain> list=new ArrayList<DeptEmpDomain>();
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		ss.selectOne("kr.co.sist.exam6.select_all_proc");
		
		mbh.closeHandler(ss);
		Map<String, Object>map=null;
		List<Map<String, Object>> tempList=
				(List<Map<String, Object>>)map.get("selectData2");
		
//		int i=0;
//		BigDecimal bd=null;
//		Timestamp ts=null;
		DeptEmpDomain ded=null;
		
		for( Map<String, Object> resultMap :tempList) {
//			bd=(BigDecimal)resultMap.get("EMPNO");
//			i=bd.intValue();
//			System.out.println(i);
//			ts=(Timestamp)resultMap.get("HIREDATE");
//			date=new Date(ts.getTime());
//			System.out.println(date);
			
			ded=new DeptEmpDomain();
			ded.setDeptno(((BigDecimal)resultMap.get("DEPTNO")).intValue());
			ded.setDname((String)resultMap.get("DNAME"));
			ded.setLoc((String)resultMap.get("LOC"));
			
			if(resultMap.get("ENAME") != null) {
				ded.setEmpno(((BigDecimal)resultMap.get("EMPNO")).intValue());
				ded.setEname((String)resultMap.get("ENAME"));
				ded.setSal(((BigDecimal)resultMap.get("SAL")).intValue());
				ded.setHiredate(new Date(((Timestamp)resultMap.get("HIREDATE")).getTime() ));
			}//end if
			list.add(ded);
		}//end for
		
		return list;
	}//selectProcedure
	
	
	
	
	
	public static void main(String[] args) {
		ExamDAO6 eDAO=ExamDAO6.getInstance();
		
		Map<String, Object> map=new HashMap<String, Object>();
//		map.put("deptno", 10);
//		eDAO.selectProcedure(map);
		eDAO.selectAllProcedure();
		
//		InsertProcedureVO ipVO=new InsertProcedureVO();
//		ipVO.setDeptno(82);
//		ipVO.setDname("TF");
//		ipVO.setLoc("제주");
//		
//		eDAO.insertProcedure(ipVO);
//		
//		System.out.println(ipVO);
		
		
	}//main

}//class
