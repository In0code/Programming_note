package kr.co.sist.course;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;
import java.util.List;

import javax.swing.JOptionPane;
import javax.swing.border.LineBorder;
import javax.swing.table.DefaultTableModel;

//---------------  교수용 학생 관리 ---------------
public class EmployStuProfManageEvt extends MouseAdapter implements ActionListener {

	private EmployStuProfManageDialog espmd;
	private String empNo;
	private boolean flag;

	public EmployStuProfManageEvt(EmployStuProfManageDialog espmd) {
		this.espmd = espmd;
		empNo = "KOR001501"; // 로그인한 사번 가져와서 넣기 EmployMainFrame.eVO.getEmpno()

		setDept();
		setMajor();

		espmd.addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				espmd.dispose();
			}
		});

	}

	/**
	 * 학부 설정
	 */
	public void setDept() {
		EmployStuManageDAO esmDAO = EmployStuManageDAO.getInstance();
		try {
			List<String> dptList = esmDAO.selectDept();
			for (String dpt : dptList) {
				espmd.getDcbmDept().addElement(dpt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 학과 설정
	 */
	public void setMajor() {
		EmployStuManageDAO esmDAO = EmployStuManageDAO.getInstance();
		espmd.getDcbmMajor().removeAllElements();
		String dptName = espmd.getDcbmDept().getElementAt(espmd.getJcbDept().getSelectedIndex());
		try {
			List<String> majorList = esmDAO.selectMajor(dptName);
			for (String major : majorList) {
				espmd.getDcbmMajor().addElement(major);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 검색 조건이 학번인지 이름인지
	 */
	public void searchStudentInfo() {
		espmd.getJbtnAdd().setEnabled(false);
		String searchItem = espmd.getDcbmSearch().getElementAt(espmd.getJcbSearch().getSelectedIndex());
		if (searchItem.equals("학번")) {
			searchStudentByNo();
		}

		if (searchItem.equals("이름")) {
			searchStudentByName();
		}
	}

	/**
	 * 학번 검색
	 */
	public void searchStudentByNo() {
		EmployStuManageDAO esmDAO = EmployStuManageDAO.getInstance();
		String searchText = espmd.getJtfSearch().getText().replace(" ", "");

		if (searchText.isEmpty()) {
			espmd.getJtfSearch().requestFocus();
			return;
		} else if (searchText.length() != 8) {
			espmd.getJtfSearch().requestFocus();
			espmd.getJtfSearch().setText("");
			JOptionPane.showMessageDialog(espmd, "학번은 연도 4자리 + 숫자 4자리로 구성되어있습니다.");
			return;
		}

		try {
			EmployStuManageVO stuInfo = esmDAO.selectProfStudentByNo(Integer.parseInt(searchText), empNo);
			if (stuInfo.getStuno() == 0) {
				espmd.getDtmStu().setRowCount(0);
				JOptionPane.showMessageDialog(espmd, searchText + "번 학생에 대한 결과가 없습니다.\n학번을 다시 한 번 확인해주세요.");
				espmd.getJtfSearch().setText("");
				espmd.getJtfSearch().requestFocus();
				return;
			}

			// JTable에 설정된 모든 행을 삭제 - setRowCount
			espmd.getDtmStu().setRowCount(0);

			String[] rowData = null;

			int no = 1;

			// 1.검색된 행을 채울 1차원 배열 생성
			rowData = new String[10];
			// 2.생성된 배열에 값을 설정
			rowData[0] = String.valueOf(no++);
			rowData[1] = String.valueOf(stuInfo.getStuno());
			rowData[2] = stuInfo.getsName();
			rowData[3] = stuInfo.getDptName();
			rowData[4] = stuInfo.getMajorName();
			rowData[5] = String.valueOf(stuInfo.getNowLevel());
			rowData[6] = stuInfo.getPhone();
			rowData[7] = stuInfo.getEmail();
			rowData[8] = stuInfo.getAddr();
			rowData[9] = stuInfo.getGrade();

			// 값을 가진 일차원 배열을 JTable에 설정하기 위해
			// Model 객체를 사용 - addRow
			espmd.getDtmStu().addRow(rowData);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NumberFormatException nfe) {
			JOptionPane.showMessageDialog(espmd, "학번은 숫자를 입력해야합니다.");
			espmd.getJtfSearch().requestFocus();
			espmd.getJtfSearch().setText("");
		}
	}

	/**
	 * 이름 검색
	 */
	public void searchStudentByName() {
		EmployStuManageDAO esmDAO = EmployStuManageDAO.getInstance();
		String searchText = espmd.getJtfSearch().getText().replace(" ", "");

		if (searchText.isEmpty()) {
			espmd.getJtfSearch().requestFocus();
			return;
		}

		try {
			List<EmployStuManageVO> stuInfo = esmDAO.selectProfStudentByName(searchText, empNo);

			if (stuInfo.isEmpty()) {
				espmd.getDtmStu().setRowCount(0);
				JOptionPane.showMessageDialog(espmd, searchText + " 학생에 대한 결과가 없습니다.\n이름을 다시 한 번 확인해주세요.");
				espmd.getJtfSearch().setText("");
				espmd.getJtfSearch().requestFocus();
				return;
			}

			// JTable에 설정된 모든 행을 삭제 - setRowCount
			espmd.getDtmStu().setRowCount(0);

			String[] rowData = null;

			int no = 1;
			for (EmployStuManageVO esmVO : stuInfo) {
				// 1.검색된 행을 채울 1차원 배열 생성
				rowData = new String[10];
				// 2.생성된 배열에 값을 설정
				rowData[0] = String.valueOf(no++);
				rowData[1] = String.valueOf(esmVO.getStuno());
				rowData[2] = esmVO.getsName();
				rowData[3] = esmVO.getDptName();
				rowData[4] = esmVO.getMajorName();
				rowData[5] = String.valueOf(esmVO.getNowLevel());
				rowData[6] = esmVO.getPhone();
				rowData[7] = esmVO.getEmail();
				rowData[8] = esmVO.getAddr();
				rowData[9] = esmVO.getGrade();

				// 값을 가진 일차원 배열을 JTable에 설정하기 위해
				// Model 객체를 사용 - addRow
				espmd.getDtmStu().addRow(rowData);
				espmd.getJtfSearch().setText("");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 학부&학과로 검색
	 */
	public void searchStudentsByDM() {
		espmd.getJbtnAdd().setEnabled(false);
		String majorName = espmd.getDcbmMajor().getElementAt(espmd.getJcbMajor().getSelectedIndex());
		EmployStuManageDAO esmDAO = EmployStuManageDAO.getInstance();
		try {
			List<EmployStuManageVO> stuInfo = esmDAO.selectProfStudentsByDM(majorName, empNo);

			if (stuInfo.isEmpty()) {
				espmd.getDtmStu().setRowCount(0);
				JOptionPane.showMessageDialog(espmd, "검색 결과가 없습니다.");
				return;
			}

			// JTable에 설정된 모든 행을 삭제 - setRowCount
			espmd.getDtmStu().setRowCount(0);

			String[] rowData = null;

			int no = 1;
			for (EmployStuManageVO esmVO : stuInfo) {
				// 1.검색된 행을 채울 1차원 배열 생성
				rowData = new String[10];
				// 2.생성된 배열에 값을 설정
				rowData[0] = String.valueOf(no++);
				rowData[1] = String.valueOf(esmVO.getStuno());
				rowData[2] = esmVO.getsName();
				rowData[3] = esmVO.getDptName();
				rowData[4] = esmVO.getMajorName();
				rowData[5] = String.valueOf(esmVO.getNowLevel());
				rowData[6] = esmVO.getPhone();
				rowData[7] = esmVO.getEmail();
				rowData[8] = esmVO.getAddr();
				rowData[9] = esmVO.getGrade();

				// 값을 가진 일차원 배열을 JTable에 설정하기 위해
				// Model 객체를 사용 - addRow
				espmd.getDtmStu().addRow(rowData);
				espmd.getJtfSearch().setText("");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 성적 등록/수정
	 */
	public void editGrade() {
		EmployStuManageDAO esmDAO = EmployStuManageDAO.getInstance();

		DefaultTableModel dtmStu = espmd.getDtmStu();
		int row = espmd.getJtStu().getSelectedRow();

		// 값 가져오기 - getValueAt
		int stuNo = Integer.parseInt(dtmStu.getValueAt(row, 1).toString());
		int level = Integer.parseInt(dtmStu.getValueAt(row, 5).toString());
		String grade = (String) dtmStu.getValueAt(row, 9);
		try {
			int cnt = esmDAO.updateGrade(grade, empNo, stuNo, level);

			if (cnt == 1) {
				JOptionPane.showMessageDialog(espmd, "성적이 정상적으로 반영되었습니다.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(espmd, "성적 등록에 실패하였습니다.");
		}
	}

	/**
	 * 성적 콤보박스가 선택됐을 때 성적 값이 '-' 인지
	 */
	public void btnAddEnabledCB() {
		String grade = espmd.getDcbmScore().getElementAt(espmd.getJcbScore().getSelectedIndex());
		flag = true;

		if (grade.equals("-")) {
			espmd.getJbtnAdd().setEnabled(false);
		} else {
			espmd.getJbtnAdd().setEnabled(true);
		}
	}

	/**
	 * Table이 선택됐을 때 성적 값이 '-' 인지
	 */
	public void btnAddEnabledJT() {
		int row = espmd.getJtStu().getSelectedRow();
		String grade = espmd.getDtmStu().getValueAt(row, 9).toString().trim();

		if (!grade.equals("-") && flag) {
			espmd.getJbtnAdd().setEnabled(true);
		} else {
			espmd.getJbtnAdd().setEnabled(false);
		}
	}

	@Override
	public void actionPerformed(ActionEvent ae) {
		espmd.getJtfSearch().setBorder(new LineBorder(new Color(0xCFCFCF)));
		flag = false;

		// 학부에 맞게 학과 셋
		if (ae.getSource() == espmd.getJcbDept()) {
			setMajor();
		}

		// 검색 이벤트 - 학부&학과
		if (ae.getSource() == espmd.getJbtnDMSearch()) {
			searchStudentsByDM();
		}

		// 검색 이벤트 - 학번,이름
		if (ae.getSource() == espmd.getJbtnSearch()) {
			searchStudentInfo();
		}

		// 성적 등록
		if (ae.getSource() == espmd.getJbtnAdd()) {
			editGrade();
		}

		// 성적 콤보 박스가 선택되면 등록 버튼 활성화
		if (ae.getSource() == espmd.getJcbScore()) {
			btnAddEnabledCB();
		}

		// 검색 조건 바뀌면 텍스트필드 초기화
		if (ae.getSource() == espmd.getJcbSearch()) {
			espmd.getJtfSearch().setText("");
		}

	}

	@Override
	public void mouseClicked(MouseEvent me) {
		if (me.getSource() == espmd.getJtfSearch()) {
			espmd.getJtfSearch().setBorder(new LineBorder(new Color(0xD0E0EF), 3));
		}

		// 테이블이 선택되면 등록 버튼 활성화
		if (me.getSource() == espmd.getJtStu()) {
			switch (me.getButton()) {
			case MouseEvent.BUTTON1:
				btnAddEnabledJT();
			}
		}
	}
}
