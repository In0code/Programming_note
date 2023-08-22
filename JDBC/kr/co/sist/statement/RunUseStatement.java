package kr.co.sist.statement;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

public class RunUseStatement {

	public void useCreateStudentTable() {
		UseStatementDAO usDAO = new UseStatementDAO();
		try {
			usDAO.createStudentTable();
			usDAO.createStudentTableIndex();
		} catch (SQLException e) {
			e.printStackTrace();
		} // END CATCH
	}// useCreateStudentTable

	public void useInsertStudent() {
		StudentVO sVO = new StudentVO(1, "강다연", 25, "Kang@test.com", null);
		UseStatementDAO usDAO = new UseStatementDAO();
		try {
			usDAO.insertStudent(sVO);
		} catch (SQLException e) {
			e.printStackTrace();
		} // END CATCH
	}// USEINSERTSTUDENT

	public void useUpdateStudent() {
		StudentVO sVO = new StudentVO(1, "", 0, "kang1@daum.net", null);
		UseStatementDAO usDAO = new UseStatementDAO();

		try {
			int cnt = usDAO.updateStudent(sVO);
			if (cnt == 0) {
				System.out.println("학생의 번호를 확인해주세요");
			} else {
				System.out.println("학생 정보가 변경되었습니다");
			} // end else
//		usDAO.updateStudent(sVO);
		} catch (SQLException e) {
		} // end catch
	}// useUpdateStudent

	public void useSelectOneStudent() {
		UseStatementDAO usDAO = new UseStatementDAO();

		try {
			int num = 1;
			StudentVO stuVO = usDAO.selectOneStudent(num);
			if (stuVO == null) {
				System.out.println(num + " 학번으로는 학생의 정보가 조회되지 않음");
				return;

			} // end if

			Calendar cal = Calendar.getInstance();
			System.out.println("검색된 학생정보");
			System.out.println("번호 : " + stuVO.getNum());
			System.out.println("이름 : " + stuVO.getName());
			System.out.println("나이 : " + stuVO.getAge());
			System.out.println("태어난 해 : " + (cal.get(Calendar.YEAR) - stuVO.getAge()));
			System.out.println("이메일 : " + stuVO.getEmail());
			System.out.println("입력일 : " + stuVO.getInput_date());

		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
	}// useSelectOneStudent

	public void useSelectAllStudent() {
		UseStatementDAO usDAO = new UseStatementDAO();

		try {
			List<StudentVO> list = usDAO.selectAllStudent();

			if (list.isEmpty()) {
				System.out.println("학생정보가 존재하지 않음");
				return;
			} // end if
			int maxNum = 0;
			int temp;
			for (StudentVO stuVO : list) {
				System.out.println(stuVO.getNum() + " / " + stuVO.getName() + " / " + stuVO.getAge() + " / "
						+ stuVO.getEmail() + " / " + stuVO.getInput_date());
				maxNum = stuVO.getNum();
			} // end for

		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

	}// useSelectAllStudent

	public static void main(String[] args) {
		RunUseStatement rus = new RunUseStatement();
//    rus.useCreateStudentTable();
//      rus.useInsertStudent();
//      rus.useUpdateStudent();
//		rus.useSelectOneStudent();
		rus.useSelectAllStudent();

	}// main

}// class