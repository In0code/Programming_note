package self_practice_course_prj;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
//////////////인영 ///////////////
/////////// 학과관리 Event ///////////
public class MajorManageEvt  extends WindowAdapter implements ActionListener {

	private MajorManageDialog mmd;
	
	public MajorManageEvt(MajorManageDialog mmd) {
		this.mmd=mmd;
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		
	}

}//class
