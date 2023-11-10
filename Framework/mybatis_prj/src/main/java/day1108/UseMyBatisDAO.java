package day1108;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MybatisHandler;
import kr.co.sist.vo.DeptVO;

public class UseMyBatisDAO {

	public void insertDeptno(int deptno)throws PersistenceException{
		//1. MyBatis Handler 얻기
		SqlSession handler = MybatisHandler.getInstance()
				.getMyBatisHandler("kr/co/sist/dao/mybatis-config.xml", false); 
		//2. 쿼리문을 찾아서 실행 ( <insert id="아이디"> )
		int cnt = handler.insert("kr.co.sist.dept.insertCpDeptno",deptno);
		//int cnt = handler.update("kr.co.sist.dept.insertCpDeptno",deptno);
		//int cnt = handler.delete("kr.co.sist.dept.insertCpDeptno",deptno);
		if(cnt == 1) {
			handler.commit();
		}//end if
		handler.close();
	}//insertDeptno
	
	public void insertSeqDeptno()throws PersistenceException{
		//1. MyBatis Handler 얻기
		SqlSession handler = MybatisHandler.getInstance()
				.getMyBatisHandler("kr/co/sist/dao/mybatis-config.xml", false); 
		//2. 쿼리문을 찾아서 실행 ( <insert id="아이디"> )
		int cnt = handler.insert("kr.co.sist.dept.insertSeqCpDept");
		if(cnt == 1) {
			handler.commit();
		}//end if
		if( handler != null) { handler.close(); }//end if
	}//insertDeptno
	
	
	public int updateDeptno( DeptVO dVO )throws PersistenceException{
		int cnt=0;
		//1. MyBatis Handler 얻기
		SqlSession handler = MybatisHandler.getInstance()
				.getMyBatisHandler("kr/co/sist/dao/mybatis-config.xml", false); 
		//2. 쿼리문을 찾아서 실행 ( <insert id="아이디"> )
		cnt = handler.update("kr.co.sist.dept.updateCpDept",dVO);
		if(cnt == 1) {
			handler.commit();
		}//end if
		handler.close();
		return cnt;
	}//updateDeptno
	
	public int deleteDeptno(int deptno )throws PersistenceException{
		int cnt=0;
		//1. MyBatis Handler 얻기
		SqlSession handler = MybatisHandler.getInstance()
				.getMyBatisHandler("kr/co/sist/dao/mybatis-config.xml", false); 
		//2. 쿼리문을 찾아서 실행 ( <insert id="아이디"> )
		cnt = handler.delete("kr.co.sist.dept.deleteCpDept", deptno);
		if(cnt == 1) {
			handler.commit();
		}//end if
		handler.close();
		return cnt;
	}//insertDeptno
	
}//class
