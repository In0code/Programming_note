package kr.co.sist.course;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.sql.SQLException;
import java.util.List;

import javax.swing.JOptionPane;
import javax.swing.JTextField;

/**
 * 인영 교수 수정 창 Event
 * ㄴ
 * 
 * @author user
 *
 */
public class EmployProfEditManageDialogEvt extends WindowAdapter implements ActionListener, MouseListener {
	private EmployProfEditManageDialog epemd;
	private String dptName;

	public EmployProfEditManageDialogEvt(EmployProfEditManageDialog epemd,String dptName) {
		this.epemd = epemd;
		this.dptName=dptName;
		setDptNameCombo();
		setMajorNameCombo();
	}

	/**
	 * 텍스트 필드에 사용자가 입력한 정보를 얻어와서 교수를 수정하기 위한 일
	 */
	public void editProf() {
		ProfVO pVO = new ProfVO(epemd.getJtfName().getText().trim(), epemd.getJtfPhone().getText().trim(),
				epemd.getJtfEmail().getText().trim().concat(epemd.getJcbEmail().getSelectedItem().toString()),
				epemd.getJcbMajor().getSelectedItem().toString(), epemd.getJcbDept().getSelectedItem().toString(),
				epemd.getJlblSetEmpno().getText().trim());
		if (checkInputData(pVO)) {
			int flag = JOptionPane.showConfirmDialog(epemd, "교수를 수정하겠습니까?", "교수수정", JOptionPane.YES_NO_OPTION);
			if (flag != JOptionPane.OK_OPTION) {
				return;
			} // end if

			ProfDAO pDAO = ProfDAO.getInstance();
			try {
				pDAO.updateProf(pVO);
				pDAO.selectAllProf();
			} catch (SQLException e) {
				e.printStackTrace();
			} // end catch
		} // end if
	}// addProf

	/**
	 * 학부를 불러와서 콤보박스에 넣는 일
	 */
	public void setDptNameCombo() {
		ProfDAO pDAO = ProfDAO.getInstance();
		List<ProfVO> dataList = null;
		try {
			dataList = pDAO.selectDptComboBox();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		for (int i = 0; i < dataList.size(); i++) {
			ProfVO prof = dataList.get(i);
			epemd.getDcbmDept().addElement(prof.getDptName());
		} // end for
	}// setDptNameCombo

	/**
	 * 학부 콤보박스가 선택되면, 그에 맞는 학과만 콤포박스에 나타내는 일
	 */
	public void setMajorNameCombo() {
		ProfDAO pDAO = ProfDAO.getInstance();
		List<ProfVO> dataList = null;
		String dpt = epemd.getDcbmDept().getElementAt(epemd.getJcbDept().getSelectedIndex());
		epemd.getDcbmMajor().removeAllElements();
		try {
			dataList = pDAO.selectMajorComboBox(dptName);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		for (int i = 0; i < dataList.size(); i++) {
			ProfVO prof = dataList.get(i);
			epemd.getDcbmMajor().addElement(prof.getMajorName());
		} // end for
	}// setDptNameCombo

	/**
	 * 입력 값 검사
	 * 
	 * @param esmVO
	 * @return
	 */
	public boolean checkInputData(ProfVO pVO) {
		if (pVO.getEname().replace(" ", "").isEmpty()) {
			showErrorMsg("이름은 필수 입력 사항입니다.", epemd.getJtfName());
			return false;
		}

		if ((pVO.getEname().matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣].*") && pVO.getEname().length() > 6)
				|| (pVO.getEname().matches(".*[a-zA-Z].*") && pVO.getEname().length() > 20)) {
			showErrorMsg("이름 : 한글 6자, 영문 20자를 초과할 수 없습니다.", epemd.getJtfName());
			return false;
		}

		if (pVO.getPhone().replace(" ", "").isEmpty()) {
			showErrorMsg("전화번호는 필수 입력 사항입니다.", epemd.getJtfPhone());
			return false;
		}

		String[] phoneArr = pVO.getPhone().split("-");
		if (phoneArr.length != 3 || phoneArr[0].length() != 3 || phoneArr[1].length() != 4
				|| phoneArr[2].length() != 4) {
			showErrorMsg("전화번호의 형식은 010-1234-5678 입니다.", epemd.getJtfPhone());
			return false;
		}

		if (!pVO.getEmail().equals("-")
				&& (pVO.getEmail().length() > 30 || pVO.getEmail().matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣].*"))) {
			showErrorMsg("이메일 : @주소 포함 최대 30글자, 한글은 사용 할 수 없습니다.", epemd.getJtfEmail());
			return false;
		}

		return true;
	}

	/**
	 * 에러 메시지 표시
	 * 
	 * @param msg - 에러 문구
	 * @param jtf - 에러 발생한 jTextfield
	 */
	public void showErrorMsg(String msg, JTextField jtf) {
		JOptionPane.showMessageDialog(epemd, msg);
		jtf.setText("");
		jtf.requestFocus();
	}

	@Override
	public void actionPerformed(ActionEvent ae) {
		if (ae.getSource() == epemd.getJbtnEdit()) { // 수정 버튼을 누리면 동작
			editProf();
		} // end if
			// 학부 콤보박스가 눌리면 학과 콤보박스를 setting
		if (ae.getSource() == epemd.getJcbDept()) {
			setMajorNameCombo();
		} // end if

	}

	@Override
	public void mouseClicked(MouseEvent e) {
	}

	@Override
	public void mousePressed(MouseEvent e) {
	}

	@Override
	public void mouseReleased(MouseEvent e) {
	}

	@Override
	public void mouseEntered(MouseEvent e) {
	}

	@Override
	public void mouseExited(MouseEvent e) {
	}

}// class
