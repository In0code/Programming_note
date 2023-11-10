package day1110;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MybatisHandler;
import kr.co.sist.domain.CpDeptDomain;
import kr.co.sist.domain.EmpDomain;

public class ExamDAO2 {

	private static ExamDAO2 eDAO2;
	
	private ExamDAO2() {
	}
	
	public static ExamDAO2 getInstance() {
		if(eDAO2 == null) {
			eDAO2 = new ExamDAO2();
		}//end if
		return eDAO2;
	}//getInstance
	
	/**
	 * 여러 컬럼에 행 하나 조회
	 * @param deptno
	 * @return
	 * @throws PersistenceException
	 */
	public CpDeptDomain mcsr(int deptno)throws PersistenceException {
		
		CpDeptDomain cdd=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		//1. Handler 얻기
		SqlSession ss=mbh.getMyBatisHandler("kr/co/sist/dao/mybatis-config.xml", false);
		//2. 수행후 결과 얻기
		cdd=ss.selectOne("kr.co.sist.exam2.mcsr",deptno);
		//3. Handler 닫기
		mbh.closeHandler(ss);
		
		return cdd;
	}//mcsr
	
	
	/**
	 *  컬럼하나에 여러 행 조회
	 * @param deptno
	 * @return
	 * @throws PersistenceException
	 */
	public List<String> scmr(int deptno) throws PersistenceException{
		List<String> list=null;
		MybatisHandler mbh=MybatisHandler.getInstance();
		//1. Handler 얻기
		SqlSession ss=mbh.getMyBatisHandler("kr/co/sist/dao/mybatis-config.xml", false);
		//2. 파싱할 노드를 찾고, 쿼리를 수행
		list=ss.selectList("kr.co.sist.exam2.scmr",deptno);
		//3. Handler 닫기
		mbh.closeHandler(ss);
		return list;
	}//scmr
	
	/**
	 * 부서별 사원번호 조회 : 연습문제
	 * @param deptno
	 * @return
	 * @throws PersistenceException
	 */
	public List<Integer> exam(int deptno)throws PersistenceException{
		List<Integer> list=null;
		MybatisHandler mbh=MybatisHandler.getInstance();
		//1. Handler 얻기
		SqlSession ss=mbh.getMyBatisHandler("kr/co/sist/dao/mybatis-config.xml", false);
		//2. 파싱할 노드를 찾고, 쿼리를 수행
		//'부적합한 열유형 1111'에러는 parameterType 속성은 존재하나, 값을 넣지않을 때 발생하는 error.
//		list=ss.selectList("kr.co.sist.exam2.exam"); // 값이 들어가지 않으므로 error
		list=ss.selectList("kr.co.sist.exam2.exam",deptno); // 값이 들어가므로 정상 동작
		//3. Handler 닫기
		mbh.closeHandler(ss);
		return list;
	}//exam
	
	public List<EmpDomain> mcmr()throws PersistenceException{
		List<EmpDomain> list=null;
		MybatisHandler mbh=MybatisHandler.getInstance();
		//1. Handler 얻기
		SqlSession ss=mbh.getMyBatisHandler("kr/co/sist/dao/mybatis-config.xml", false);
		//2. 파싱할 노드를 찾고, 쿼리를 수행
		//parameterType 속성이 없으므로 매개변수 하나인 method를 호출
		list=ss.selectList("kr.co.sist.exam2.mcmr"); 
		//3. Handler 닫기
		mbh.closeHandler(ss);
		return list;
	}//exam
	
	
	public static void main(String[] args) {
		ExamDAO2 ed=ExamDAO2.getInstance();
		//System.out.println(ed.mcsr(20));
		//System.out.println(ed.exam(20));
		System.out.println(ed.mcmr());
	}
	
}//class
