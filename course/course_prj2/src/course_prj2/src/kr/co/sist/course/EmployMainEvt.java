package kr.co.sist.course;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.JOptionPane;

/* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 */
public class EmployMainEvt extends WindowAdapter implements ActionListener {
	
	private EmployMainFrame emf;
	
	public EmployMainEvt(EmployMainFrame emf) {
		this.emf = emf;
		initInfo();
	}
	
	public void goMyProfile() {
		new EmployProfileDialog(emf);
	}
	
	public void goStuManage() {
		if(emf.getFlag()) { //관리자
			new EmployStuManageDialog(emf);			
		}else {				//교수
			new EmployStuProfManageDialog(emf);
		}
	}
	
	public void goDrManage() {
		if(emf.getFlag()) {
			new EmployProfManageDialog(emf);
		} else {
			JOptionPane.showMessageDialog(emf, "접근 권한이 없습니다.");
		}
	}

	public void goMajorManage() {
		if(emf.getFlag()) {
			new MajorManageDialog(emf);
		} else {
			JOptionPane.showMessageDialog(emf, "접근 권한이 없습니다.");
		}
	}
	
	public void goLectureManage() {
		new SubjectManageDialog(emf);
	}
	
	public void setLoginTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		emf.getJlblLoginTime().setText(sdf.format(new Date()));
	}
	
	public void initInfo() {
		EmployVO eVO = EmployMainFrame.geteVO();
		
		if(emf.getFlag()) {
			emf.getJlblMyName().setText(eVO.getName()+"(관리자)");
			emf.getJlblTwo().setText(eVO.getEmpno());
		} else {
			emf.getJlblMyName().setText(eVO.getName()+"(교수)");
			emf.getJlblOne().setText(eVO.getDptName());
			emf.getJlblTwo().setText(eVO.getMajorName());
		}
		emf.getJlblMyEmail().setText(eVO.getEmail());
		setLoginTime();
	}
	
	public void logout() {
		new LoginFrame();
		emf.dispose();
	}
	
	@Override
	public void actionPerformed(ActionEvent ae) {
		if(ae.getSource() == emf.getJbtnMyProfile()) {
			goMyProfile();
		}
		if(ae.getSource() == emf.getJbtnLogout()) {
			logout();
		}
		if(ae.getSource() == emf.getJbtnStuManage()) {
			goStuManage();
		}
		if(ae.getSource() == emf.getJbtnProfesorManage()) {
			goDrManage();
		}
		if(ae.getSource() == emf.getJbtnMajorManage()) {
			goMajorManage();
		}
		if(ae.getSource() == emf.getJbtnSubjectManage()) {
			goLectureManage();
		}
	}

	@Override
	public void windowClosing(WindowEvent we) {
		emf.dispose();
	}

}
