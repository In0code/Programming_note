package self_practice_course_prj;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class EmployProfEditManageDialogEvt extends WindowAdapter implements ActionListener, MouseListener {
//////////////인영 ///////////////
/////////// 교수등록 Event ///////////
	private EmployProfAddManageDialog epad;

	public EmployProfEditManageDialogEvt(EmployProfAddManageDialog epad) {
		this.epad = epad;
	}
	
	public void addProf() {
		int flag=JOptionPane.showConfirmDialog(epad, "교수를 등록하겠습니까?","교수등록",JOptionPane.YES_NO_OPTION);
		if(flag != JOptionPane.OK_OPTION) {
			return ;
		}
//		String selectedMajor = epad.getJcbMajor().getSelectedItem() != null
//				? epad.getJcbMajor().getSelectedItem().toString()
//				: "";
//		String selectedDept = epad.getJcbDept().getSelectedItem() != null
//				? epad.getJcbDept().getSelectedItem().toString()
//				: "";

		ProfVO pVO = new ProfVO(epad.getJtfName().getText().trim(), epad.getJtfPhone().getText().trim(),
				epad.getJtfEmail().getText().trim().concat(epad.getJcbEmail().getSelectedItem().toString()), epad.getJcbMajor().getSelectedItem().toString(), epad.getJcbDept().getSelectedItem().toString(), "");
		
		ProfDAO pDAO=ProfDAO.getInstance();
		try {
			pDAO.insertProf(pVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
	}//addProf
	
	@Override
	public void actionPerformed(ActionEvent ae) {
		if (ae.getSource() == epad.getJbtnAdd()) {
			addProf();
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

}//class
