package day1108;

import org.apache.ibatis.exceptions.PersistenceException;

import kr.co.sist.vo.DeptVO;

public class UseMyBatis {

	public void useInsertDeptno() {
		UseMyBatisDAO umDAO=new UseMyBatisDAO();
		 try {
		umDAO.insertDeptno(54);
		System.out.println("추가성공");
		 }catch(PersistenceException pe){
			 System.out.println("추가실패");
			 pe.printStackTrace();
		 }//end catch
	}//useInsertDeptno
	
	public void useInsertSeqDeptno() {
		UseMyBatisDAO umDAO=new UseMyBatisDAO();
		try {
			umDAO.insertSeqDeptno();
			System.out.println("추가성공");
		}catch(PersistenceException pe){
			System.out.println("추가실패");
			pe.printStackTrace();
		}//end catch
	}//useInsertDeptno
	
	public void useUpdateDeptno() {
		UseMyBatisDAO umDAO=new UseMyBatisDAO();
		try {
			DeptVO dVO=new DeptVO();
			dVO.setDeptno(10);
			dVO.setDname("SI");
			dVO.setLoc("서울");
			
			int cnt=umDAO.updateDeptno(dVO);
			if(cnt == 1) {
				System.out.println("변경성공");
			}else {
				System.out.println("변경된 값이 없습니다");
			}//end else
		}catch(PersistenceException pe){
			System.out.println("에러");
			pe.printStackTrace();
		}//end catch
	}//useInsertDeptno
	
	public void useDeleteDeptno() {
		UseMyBatisDAO umDAO=new UseMyBatisDAO();
		try {
			int deptno=10;
			int cnt=umDAO.deleteDeptno(deptno);
			if(cnt == 1) {
				System.out.println("삭제성공");
			}else {
				System.out.println("삭제된 행이 없습니다");
			}//end else
		}catch(PersistenceException pe){
			System.out.println("에러");
			pe.printStackTrace();
		}//end catch
	}//useInsertDeptno
	
	
	
	public static void main(String[] args) {
		UseMyBatis umb=new UseMyBatis();
		//umb.useInsertDeptno();
//		umb.useInsertSeqDeptno();
		umb.useUpdateDeptno();
		//umb.useDeleteDeptno();
	}//main
}//class
