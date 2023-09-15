package self_practice_course_prj;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.sql.SQLException;

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
	}

	/**
	 * 텍스트 필드에 사용자가 입력한 정보를 얻어와서 교수를 수정하기 위한 일
	 */
	public void editProf() {
		int flag = JOptionPane.showConfirmDialog(epemd, "교수를 수정하겠습니까?", "교수등록", JOptionPane.YES_NO_OPTION);
		if (flag != JOptionPane.OK_OPTION) {
			return;
		}
//		String selectedMajor = epad.getJcbMajor().getSelectedItem() != null
//				? epad.getJcbMajor().getSelectedItem().toString()
//				: "";
//		String selectedDept = epad.getJcbDept().getSelectedItem() != null
//				? epad.getJcbDept().getSelectedItem().toString()
//				: "";

		ProfVO pVO = new ProfVO(epemd.getJtfName().getText().trim(), epemd.getJtfPhone().getText().trim(),
				epemd.getJtfEmail().getText().trim().concat(epemd.getJcbEmail().getSelectedItem().toString()),
				epemd.getJcbMajor().getSelectedItem().toString(), epemd.getJcbDept().getSelectedItem().toString(), "");

		ProfDAO pDAO = ProfDAO.getInstance();
		try {
			pDAO.insertProf(pVO);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

	}// addProf

	@Override
	public void actionPerformed(ActionEvent ae) {
		if (ae.getSource() == epemd.getJbtnEdit()) { // 수정 버튼을 누리면 동작
			editProf();
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
