package day1114;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MybatisHandler;
import kr.co.sist.domain.EmpDomain;
import kr.co.sist.vo.BoardVO;

public class ExamDAO4 {

	private static ExamDAO4 eDAO;
	private String configPath;
	
	private ExamDAO4() {
		configPath="kr/co/sist/dao/mybatis-config.xml";
	}

	public static ExamDAO4 getInstance() {
		if(eDAO == null) {
			eDAO=new ExamDAO4();
		}//end if
		return eDAO;
	}//getInstance
	
	public List<EmpDomain> dynamicWhere(int deptno)throws PersistenceException{
		List<EmpDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		list=ss.selectList("kr.co.sist.exam4.dynamicWhere",deptno);
		
		mbh.closeHandler(ss);
		return list;
		
	}//dynamicWhere
	
	public int dynamicIf(BoardVO bVO)throws PersistenceException{
		int cnt=0;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		cnt=ss.selectOne("kr.co.sist.exam4.dynamicIf",bVO);
		
		mbh.closeHandler(ss);
		
		return cnt;
	}//dynamicWhere
	
	public List<EmpDomain> dynamicChoose(int tempNo)throws PersistenceException{
		List<EmpDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		list=ss.selectList("kr.co.sist.exam4.dynamicChoose",tempNo);
		
		return list;
	}//dynamicChoose
	
	public List<EmpDomain> dynamicForeach(Map<String, Object> map)throws PersistenceException{
		List<EmpDomain> list=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(configPath, false);
		list=ss.selectList("kr.co.sist.exam4.dynamicForeach",map);
		
		return list;
	}//dynamicChoose
	
	
	
	public static void main(String[] args) {
		ExamDAO4 ed=ExamDAO4.getInstance();
//		ed.dynamicWhere(10);
		
//		BoardVO bVO=new BoardVO();
//		bVO.setKeyword("간");
//		bVO.setFieldName("content");
//		ed.dynamicIf(bVO);
		
//		ed.dynamicChoose(20);
		Map<String, Object> map=new HashMap<String, Object>();
		
		List<String> list=new ArrayList<String>();
		list.add("SALESMAN");
		list.add("MANAGER");
		list.add("ANALYST");
		list.add("PRESIDENT");
		
		map.put("deptno", 10);
		map.put("job_list", list);
		
		ed.dynamicForeach(map);
	}//main
	
}//class
