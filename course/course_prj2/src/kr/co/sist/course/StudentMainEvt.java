package kr.co.sist.course;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.ImageIcon;

import kr.co.sist.dao.ClientImageIO;
//돼라
/* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 */
public class StudentMainEvt extends WindowAdapter implements ActionListener {
	
	private StudentMainFrame smf;
	
	public StudentMainEvt(StudentMainFrame smf) {
		this.smf = smf;
		initInfo();
	}
	
	public void logout() {
		new LoginFrame();
		smf.dispose();
	}
	
	public void myPage() {
		new StudentProfileDialog(smf);
	}
	
	public void mySubject() {
		new MySubjectDialog(smf);
	}
	
	public void courseApplication() {
		new StudentSubjectDialog(smf);
	}
	
	public void myGrade() {
		new StudentScoreDialog(smf);
	}
	
	public void setLoginTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		smf.getJlblLoginTime().setText(sdf.format(new Date()));
	}
	
	public void initInfo() {
//		StudentVO sVO = StudentMainFrame.sVO;
		smf.getJlblMyName().setText(StudentMainFrame.sVO.getName());
		smf.getJlblDept().setText(StudentMainFrame.sVO.getDptName());
		smf.getJlblMajor().setText(StudentMainFrame.sVO.getMajorName());
		smf.getJlblEmail().setText(StudentMainFrame.sVO.getEmail());
		try {
			ImageIcon image = ClientImageIO.readImage(String.valueOf(StudentMainFrame.sVO.getId()));
			smf.getJlblMyPhoto().setIcon(image);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		setLoginTime();
	}
	
	@Override
	public void actionPerformed(ActionEvent ae) {
		if(ae.getSource() == smf.getJbtnMyProfile()) {
			myPage();
		}
		if(ae.getSource() == smf.getJbtnLogout()) {
			logout();
		}
		if(ae.getSource() == smf.getJbtnRegisterSubject()) {
			mySubject();
		}
		if(ae.getSource() == smf.getJbtnGradeSearch()) {
			myGrade();
		}
		if(ae.getSource() == smf.getJbtnCourseApply()) {
			courseApplication();
		}
	}

	@Override
	public void windowClosing(WindowEvent we) {
		smf.dispose();
	}
	
}
