package kr.co.sist.course;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;
import java.util.List;

import javax.swing.DefaultComboBoxModel;

public class LectureManageProfEditEvt extends WindowAdapter implements ActionListener, MouseListener {
	
	private SubjectManageDialog smd;
	private LecturePlanProfEditDialog lpped;
	private ProfSubjectManageDialog psmd;
	
	public LectureManageProfEditEvt(LecturePlanProfEditDialog lpped) {
		this.lpped=lpped;
		bringPlan(lpped.getSubCode());
	}
	
//	public void initDptJcb() {
//		DefaultComboBoxModel<String> dcbm = psmd.getDcbmDpt();
//		try {
//			List<String> list = LecturePlanProfDAO.getInstance().selectAllDpt();
//			dcbm.removeAllElements();
//			
//			for(int i=0; i<list.size(); i++) {
//				dcbm.addElement(list.get(i));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}//end catch
//	}//initDptJcb
	
	
	public void bringPlan(String subCode) {
		LecturePlanProfDAO lppDAO=LecturePlanProfDAO.getInstance();
		
		try {
			LecturePlanProfVO lppVO=lppDAO.selectedContents(subCode);
			
			lpped.getJtfLectureName().setText(lppVO.getSubName());
			lpped.getJtfLectureGoal().setText(lppVO.getSubGoal());
			lpped.getJtaLectureInfo().setText(lppVO.getLectureInfo());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	public void mouseClicked(MouseEvent e) {
		
	}//mouseClicked
	
	@Override
	public void actionPerformed(ActionEvent e) {
	}
	
	@Override
	public void windowClosing(WindowEvent we) {
		psmd.dispose();
	}//windowClosing
	
	@Override
	public void mousePressed(MouseEvent e) {}

	@Override
	public void mouseReleased(MouseEvent e) {}
	
	@Override
	public void mouseEntered(MouseEvent e) {}
	
	@Override
	public void mouseExited(MouseEvent e) {}
	
}
