package kr.co.sist.course;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.sql.SQLException;


public class LecturePlanEvt  extends WindowAdapter implements ActionListener {
	
	private LecturePlanDialog lp;
	private LecturePlanVO lpVO;
//	private LecturePlanVO lpVO;
//	private MySubjectVO msVO;
//	private StudentSubjectVO ssVO;
	
	
	

	//서브젝트 코드는 어떻게 받을 건지?
	public LecturePlanEvt(LecturePlanDialog lp) {
		this.lp = lp;
		
	setLecturePlanData(lp.getSubjectCode());
 
	}


	@Override
	public void actionPerformed(ActionEvent e) {

		if (e.getSource() == lp.getJbtnApply()) {
			addContents();
			
		}
		
		
		
	}
	
//	public void StudentSubject () {
//	 new LecturePlanDialog( lp,lpVO,true);
//	}
	
	public void addContents() {
	StudentSubjectDAO ssDAO= StudentSubjectDAO.getInstance();
	
	
	
	 try {
		ssDAO.insertLecture(lp.getSubjectCode());
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	
	public void setLecturePlanData(String subjectCode) {
	LecturePlanDao lpDAO=LecturePlanDao.getInstance();
	try {
		  lpVO=lpDAO.selectedContents(subjectCode);
		
			lp.getJtSubName().setText(lpVO.getSubName());
			lp.getJtSubGoal().setText(lpVO.getSubGoal());
			lp.getJtaSubInfo().setText(lpVO.getSubInfo());
	
	} catch (SQLException e) {
	e.printStackTrace();
		}
	}
	
	
}
