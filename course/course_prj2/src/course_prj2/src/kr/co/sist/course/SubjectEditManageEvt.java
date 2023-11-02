package kr.co.sist.course;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JDialog;

@SuppressWarnings("serial")
public class SubjectEditManageEvt extends JDialog implements ActionListener {

	private SubjectEditManageDialog semd;
	private SubjectManageVO smVO;
	
	public SubjectEditManageEvt(SubjectEditManageDialog semd, SubjectManageVO smVO) {
		this.semd = semd;
		this.smVO = smVO;
	}
	
	public void setComboBox() {
		semd.getDcbmDept().addElement(smVO.getDptName());
		semd.getDcbmMajor().addElement(smVO.getMajorName());
		
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		
	}

}
