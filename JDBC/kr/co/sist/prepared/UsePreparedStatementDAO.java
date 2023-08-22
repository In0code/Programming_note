package kr.co.sist.prepared;

import java.sql.SQLException;
import java.util.List;

import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import kr.co.sist.statement.StudentVO;

public class UsePreparedStatementDAO {

	public void useInsertStudent() {

		String inputData = JOptionPane.showInputDialog("추가할 학생의 번호, 이름, 나이, 이메일을 입력해주세요");

		if (inputData != null) {
			String[] arrData = inputData.split(",");
			String msg = "";
			try {
				// 입력된 값으로 VO 생성
				StudentVO stuVO = new StudentVO(Integer.parseInt(arrData[0]), arrData[1], Integer.parseInt(arrData[2]),
						arrData[3], null);
				// DAO 객체 얻기
				PreparedStatementDAO psDAO = PreparedStatementDAO.getInstance();
				// 쿼리문을 실행
				psDAO.insertStudent(stuVO);

				msg = arrData[1] + " 학생 정보가 성공적으로 추가되었습니다";

			} catch (NumberFormatException nfe) {
				msg = "번호나 나이는 숫자이어야 합니다";
			} catch (SQLException se) {
				se.printStackTrace();
				switch (se.getErrorCode()) {
				case 1:
					msg = arrData[0] + "번 학생은 이미 존재합니다.";
					break;
				case 1438:
					msg = "학번은 5자리, 나이는 3자리를 초과할 수 없습니다.";
					break;
				case 12899:
					msg = "이름은 한글 10자, 이메일은 50글자를 초과할 수 없습니다.";
					break;
				default:
					msg = "뎨동합니다";
				}// end switch
			} // end catch

			JOptionPane.showMessageDialog(null, msg);

		} // end if

	}// useInsertStudent

	public void useUpdateStudent() {
		String inputData = JOptionPane.showInputDialog("변경할 학생의 번호, 나이, 이메일을 입력해주세요");

		if (inputData != null) {
			String[] arrData = inputData.split(",");
			if (arrData.length != 3) {
				JOptionPane.showMessageDialog(null, "입력값의 수가 올바르지 않습니다\n번호,나이,이메일을 입력해주세요");
				return;
			} // end if
			String msg = "";
			try {
				// 입력된 값으로 VO 생성
				StudentVO stuVO = new StudentVO(Integer.parseInt(arrData[0]), "", Integer.parseInt(arrData[1]),
						arrData[2], null);
				// DAO 객체 얻기
				PreparedStatementDAO psDao = PreparedStatementDAO.getInstance();
				// 쿼리문을 실행
				int cnt = psDao.updateStudent(stuVO);
				if (cnt == 0) {
					msg = arrData[1] + " 학생 정보를 확인해주세요";
				} else {
					msg = arrData[1] + " 학생 정보가 변경되었습니다";
				} // end else

			} catch (NumberFormatException nfe) {
				msg = "번호는 숫자이어야 합니다";
			} catch (SQLException se) {
				se.printStackTrace();
				switch (se.getErrorCode()) {
				case 1438:
					msg = "나이는 3자리를 초과할 수 없습니다.";
					break;
				case 12899:
					msg = "이메일은 50글자를 초과할 수 없습니다.";
					break;
				default:
					msg = "뎨동합니다";
				}// end switch
			} // end catch

			JOptionPane.showMessageDialog(null, msg);

		} // end if
	}// useUpdateStudent

	public void useDeleteStudent() {
		String inputData = JOptionPane.showInputDialog("변경할 학생의 번호를 입력해주세요");

		String msg = "";
		try {
			// DAO 객체 얻기
			PreparedStatementDAO psDao = PreparedStatementDAO.getInstance();
			// 쿼리문을 실행
			int cnt = psDao.deleteStudent(Integer.parseInt(inputData));
			if (cnt == 0) {
				msg = inputData + " 학생 정보를 확인해주세요";
			} else {
				msg = inputData + " 학생 정보가 삭제되었습니다";
			} // end else

		} catch (NumberFormatException nfe) {
			msg = "번호는 숫자이어야 합니다";
		} catch (SQLException se) {
			se.printStackTrace();
			msg = "뎨동합니다";
		} // end catch

		JOptionPane.showMessageDialog(null, msg);

	}// useDeleteStudent

	public void useSelectOneStudent() {

		String inputData = JOptionPane.showInputDialog("조회할 학생의 번호를 입력해주세요");

		String msg = "";
		try {
			// DAO 객체 얻기
			PreparedStatementDAO psDao = PreparedStatementDAO.getInstance();
			// 쿼리문을 실행
			StudentVO stuVO = psDao.selectOneStudent(Integer.parseInt(inputData));
			if (stuVO == null) {
				msg = inputData + " 학생 정보를 확인해주세요";
			} else {
				StringBuilder result = new StringBuilder();
				result.append("검색결과\n이름 : ").append(stuVO.getName()).append("( 학번").append(stuVO.getNum())
						.append(" )\n").append("나이 : ").append(stuVO.getAge()).append("살\n").append("이메일 : ")
						.append(stuVO.getEmail()).append("\n").append("입력일 : ").append(stuVO.getInput_date());

				msg = result.toString();
			} // end else

		} catch (NumberFormatException nfe) {
			msg = "번호는 숫자이어야 합니다";
		} catch (SQLException se) {
			se.printStackTrace();
			msg = "뎨동합니다";
		} // end catch

		JOptionPane.showMessageDialog(null, msg);

	}// useSelectOneStudent

	public void useSelectAllStudent() {

		PreparedStatementDAO psDAO = PreparedStatementDAO.getInstance();

		try {
			List<StudentVO> list = psDAO.selectAllStudent();

			StringBuilder result = new StringBuilder();
			JTextArea jta = new JTextArea();
			JScrollPane jsp = new JScrollPane(jta);

			if (list.isEmpty()) {
				result.append("학생정보가 없습니다\n학생정보를 추가해주세요");
			} else {
				jta.append("번호\t이름\t나이\t이메일\t입력일\n");

				for (StudentVO stuVO : list) {
					jta.append(stuVO.getNum() + "\t");
					jta.append(stuVO.getName() + "\t");
					jta.append(stuVO.getAge() + "\t");
					jta.append(stuVO.getEmail() + "\t");
					jta.append(stuVO.getInput_date() + "\n");

				} // end for
			} // end else

			JOptionPane.showMessageDialog(null, result.length() == 0 ? jsp : result.toString());

		} catch (SQLException e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "뎨둉하다~잠시후 다시 시도");
		} // end catch

	}// userSelectAllStudent

	public static void main(String[] args) {
		UsePreparedStatementDAO upsDAO = new UsePreparedStatementDAO();
//		upsDAO.useInsertStudent();
//		upsDAO.useUpdateStudent();
//		upsDAO.useDeleteStudent();
		upsDAO.useSelectOneStudent();
//		upsDAO.useSelectAllStudent();

	}// main

}// class
