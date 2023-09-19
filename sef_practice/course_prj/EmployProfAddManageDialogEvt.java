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
 * 인영
 * 교수 등록 Event
 * @author user
 *
 */
public class EmployProfAddManageDialogEvt extends WindowAdapter implements ActionListener, MouseListener {
	private EmployProfAddManageDialog epad;

	public EmployProfAddManageDialogEvt(EmployProfAddManageDialog epad) {
		this.epad = epad;
		setDptNameCombo();
		setMajorNameCombo();
	}
	
	public void setDptNameCombo() {
		ProfDAO pDAO = ProfDAO.getInstance();
		List<ProfVO> dataList=null;
		try {
			dataList=pDAO.setDptComboBox();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		for(int i=0; i<dataList.size(); i++) {
			ProfVO prof=dataList.get(i);
			epad.getDcbmDept().addElement(prof.getDptName());
		}//end for
	}//setDptNameCombo
	
	public void setMajorNameCombo() {
		ProfDAO pDAO = ProfDAO.getInstance();
		ProfVO pVO=null;
		List<ProfVO> dataList=null;
		try {
			pVO=new ProfVO();
			dataList=pDAO.setMajorComboBox(pVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		for(int i=0; i<dataList.size(); i++) {
			ProfVO prof=dataList.get(i);
//			epad.getDcbmMajor().addElement(major.getDptName());
			epad.getDcbmMajor().addElement(prof.getMajorName());
		}//end for
	}//setDptNameCombo
	
	/**
	 * 텍스트 필드에 사용자가 입력한 정보를 얻어와서 교수를 등록하기 위한 일
	 */
	public void addProf() {
		int flag=JOptionPane.showConfirmDialog(epad, "교수를 등록하겠습니까?","교수등록",JOptionPane.YES_NO_OPTION);
		if(flag != JOptionPane.OK_OPTION) {
			return ;
		}//end if
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
		if (ae.getSource() == epad.getJbtnAdd()) { //등록 버튼을 누르면 동작
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
