package self_practice_course_prj;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.sql.SQLException;
import java.util.List;

import javax.swing.JOptionPane;

/**
 * 인영 교수 수정 창 Event
 * 
 * @author user
 *
 */
public class EmployProfEditManageDialogEvt extends WindowAdapter implements ActionListener, MouseListener {
	private EmployProfEditManageDialog epemd;

	public EmployProfEditManageDialogEvt(EmployProfEditManageDialog epemd) {
		this.epemd = epemd;
		setDptNameCombo();
		setMajorNameCombo();
	}

	/**
	 * 텍스트 필드에 사용자가 입력한 정보를 얻어와서 교수를 수정하기 위한 일
	 */
	public void editProf() {
		int flag = JOptionPane.showConfirmDialog(epemd, "교수를 수정하겠습니까?", "교수수정", JOptionPane.YES_NO_OPTION);
		if (flag != JOptionPane.OK_OPTION) {
			return;
		} // end if

		ProfVO pVO = new ProfVO(epemd.getJtfName().getText().trim(), epemd.getJtfPhone().getText().trim(),
				epemd.getJtfEmail().getText().trim().concat(epemd.getJcbEmail().getSelectedItem().toString()),
				epemd.getJcbMajor().getSelectedItem().toString(), epemd.getJcbDept().getSelectedItem().toString(),
				epemd.getJlblSetEmpno().getText().trim());

		ProfDAO pDAO = ProfDAO.getInstance();
		try {
			pDAO.updateProf(pVO);
			pDAO.selectAllProf();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

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
		epemd.dcbmMajor.removeAllElements();
		try {
			dataList = pDAO.selectMajorComboBox(dpt);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		for (int i = 0; i < dataList.size(); i++) {
			ProfVO prof = dataList.get(i);
			epemd.getDcbmMajor().addElement(prof.getMajorName());
		} // end for
	}// setDptNameCombo

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
