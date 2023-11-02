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

//---------------  관리자용 학생 관리 ---------------
public class EmployStuManageEvt extends MouseAdapter implements ActionListener {

	private EmployStuManageDialog esmd;

	public EmployStuManageEvt(EmployStuManageDialog esmd) {
		this.esmd = esmd;
		
		setDept();
		setMajor();
		
		esmd.addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				esmd.dispose();
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
				esmd.getDcbmDept().addElement(dpt);
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
		esmd.getDcbmMajor().removeAllElements();
		String dptName = esmd.getDcbmDept().getElementAt(esmd.getJcbDept().getSelectedIndex());
		try {
			List<String> majorList = esmDAO.selectMajor(dptName);
			for (String major : majorList) {
				esmd.getDcbmMajor().addElement(major);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 검색 조건이 학번인지 이름인지
	 */
	public void searchStudentInfo() {
		String searchItem = esmd.getDcbmSearch().getElementAt(esmd.getJcbSearch().getSelectedIndex());
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
		String searchText = esmd.getJtfSearch().getText().replace(" ", "");

		if (searchText.isEmpty()) {
			esmd.getJtfSearch().requestFocus();
			return;
		} else if (searchText.length() != 8) {
			esmd.getJtfSearch().requestFocus();
			esmd.getJtfSearch().setText("");
			JOptionPane.showMessageDialog(esmd, "학번은 연도 4자리 + 숫자 4자리로 구성되어있습니다.");
			return;
		}

		try {
			EmployStuManageVO stuInfo = esmDAO.selectStudentByNo(Integer.parseInt(searchText));
			if (stuInfo.getStuno() == 0) {
				esmd.getDtmStu().setRowCount(0);
				JOptionPane.showMessageDialog(esmd, searchText + "번 학생은 존재하지 않습니다.");
				esmd.getJtfSearch().setText("");
				esmd.getJtfSearch().requestFocus();
				return;
			}

			// JTable에 설정된 모든 행을 삭제 - setRowCount
			esmd.getDtmStu().setRowCount(0);

			String[] rowData = null;

			int no = 1;

			// 1.검색된 행을 채울 1차원 배열 생성
			rowData = new String[9];
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

			esmd.getDtmStu().addRow(rowData);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NumberFormatException nfe) {
			JOptionPane.showMessageDialog(esmd, "학번은 숫자를 입력해야합니다.");
			esmd.getJtfSearch().requestFocus();
			esmd.getJtfSearch().setText("");
		}
	}

	/**
	 * 이름 검색
	 */
	public void searchStudentByName() {
		EmployStuManageDAO esmDAO = EmployStuManageDAO.getInstance();
		String searchText = esmd.getJtfSearch().getText().replace(" ", "");

		if (searchText.isEmpty()) {
			esmd.getJtfSearch().requestFocus();
			return;
		}

		try {
			List<EmployStuManageVO> stuInfo = esmDAO.selectStudentByName(searchText);

			if (stuInfo.isEmpty()) {
				esmd.getDtmStu().setRowCount(0);
				JOptionPane.showMessageDialog(esmd, searchText + " 학생은 존재하지 않습니다.");
				esmd.getJtfSearch().setText("");
				esmd.getJtfSearch().requestFocus();
				return;
			}

			// JTable에 설정된 모든 행을 삭제 - setRowCount
			esmd.getDtmStu().setRowCount(0);

			String[] rowData = null;

			int no = 1;
			for (EmployStuManageVO esmVO : stuInfo) {
				// 1.검색된 행을 채울 1차원 배열 생성
				rowData = new String[9];
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

				esmd.getDtmStu().addRow(rowData);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 학부&학과로 검색
	 */
	public void searchStudentsByDM() {
		String dptName = esmd.getDcbmDept().getElementAt(esmd.getJcbDept().getSelectedIndex());
		String majorName = esmd.getDcbmMajor().getElementAt(esmd.getJcbMajor().getSelectedIndex());
		EmployStuManageDAO esmDAO = EmployStuManageDAO.getInstance();
		try {
			List<EmployStuManageVO> stuInfo = esmDAO.selectStudentsByDM(dptName, majorName);

			if (stuInfo.isEmpty()) {
				esmd.getDtmStu().setRowCount(0);
				return;
			}

			// JTable에 설정된 모든 행을 삭제 - setRowCount
			esmd.getDtmStu().setRowCount(0);

			String[] rowData = null;

			int no = 1;
			for (EmployStuManageVO esmVO : stuInfo) {
				// 1.검색된 행을 채울 1차원 배열 생성
				rowData = new String[9];
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

				// 값을 가진 일차원 배열을 JTable에 설정하기 위해
				// Model 객체를 사용 - addRow
				esmd.getDtmStu().addRow(rowData);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 학생 등록
	 */
	public void addStudent() {
		// 등록이면 true
		new EmployStuEditManageDialog(esmd, null, true);
	}

	/**
	 * 학생 수정
	 */
	public void editStudent() {
		int row = esmd.getJtStu().getSelectedRow();
		EmployStuManageVO esmVO = new EmployStuManageVO(
				Integer.parseInt(esmd.getDtmStu().getValueAt(row, 1).toString()), // 학번
				null, // 이미지
				esmd.getDtmStu().getValueAt(row, 2).toString(), // 이름
				esmd.getDtmStu().getValueAt(row, 3).toString(), // 학부
				esmd.getDtmStu().getValueAt(row, 4).toString(), // 학과
				Integer.parseInt(esmd.getDtmStu().getValueAt(row, 5).toString()), // 학년
				esmd.getDtmStu().getValueAt(row, 6).toString(), // 번호
				esmd.getDtmStu().getValueAt(row, 7).toString(), // 이메일
				esmd.getDtmStu().getValueAt(row, 8).toString() // 주소
		);
		// 수정이면 false
		new EmployStuEditManageDialog(esmd, esmVO, false);
		esmd.getJbtnEdit().setEnabled(true);
	}

	@Override
	public void actionPerformed(ActionEvent ae) {
		esmd.getJtfSearch().setBorder(new LineBorder(new Color(0xCFCFCF)));
		esmd.getJbtnEdit().setEnabled(false);
		
		// 학부에 맞게 학과 셋
		if (ae.getSource() == esmd.getJcbDept()) {
			setMajor();
		}
		
		// 검색 이벤트 - 학부&학과
		if (ae.getSource() == esmd.getJbtnDMSearch()) {
			searchStudentsByDM();
		}

		// 검색 이벤트 - 학번,이름
		if (ae.getSource() == esmd.getJbtnSearch()) {
			searchStudentInfo();
		}

		// 학생 등록
		if (ae.getSource() == esmd.getJbtnAdd()) {
			addStudent();
		}

		// 학생 수정
		if (ae.getSource() == esmd.getJbtnEdit()) {
			editStudent();
		}

		// 검색 조건 바뀌면 텍스트필드 초기화
		if (ae.getSource() == esmd.getJcbSearch()) {
			esmd.getJtfSearch().setText("");
		}
	}

	@Override
	public void mouseClicked(MouseEvent me) {
		if (me.getSource() == esmd.getJtfSearch()) {
			esmd.getJtfSearch().setBorder(new LineBorder(new Color(0xD0E0EF), 3));
		}

		// 테이블이 선택되면 수정 버튼 활성화
		if (me.getSource() == esmd.getJtStu()) {
			esmd.getJbtnEdit().setEnabled(true);
		}

	}

}
