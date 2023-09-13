package self_practice_course_prj;

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
		System.out.println("profile");
	}
	
	public void goStuManage() {
//		new EmployStuManageDialog(emf);
		System.out.println("학생관리");
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
			System.out.println("학과관리");
		} else {
			JOptionPane.showMessageDialog(emf, "접근 권한이 없습니다.");
		}
	}
	
	public void goLectureManage() {
//		new SubjectManageDialog(emf);
		System.out.println("과목관리");
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
		System.out.println("Logout");
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
