package kr.co.sist.course;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.LineBorder;
//돼라
/* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 */
@SuppressWarnings("serial")
public class StudentMainFrame extends JFrame {
	
	private JButton jbtnMyProfile; 
	private JButton jbtnLogout;
	private JButton jbtnRegisterSubject;
	private JButton jbtnGradeSearch;
	private JButton jbtnCourseApply;
	private JLabel jlblMyPhoto;
	private JLabel jlblMyName;
	private JLabel jlblDept;
	private JLabel jlblMajor;
	private JLabel jlblEmail;
	private JLabel jlblLoginTime;

	static StudentVO sVO;
	
	/**
	 * 학생 화면 설정
	 * @param stuVO 로그인한 학생의 StudentVO
	 */
	public StudentMainFrame(StudentVO stuVO) {
		sVO = stuVO;
		
		Font font = new Font("Pretendard", Font.BOLD, 18);
		Font font14 = new Font("Pretendard", Font.BOLD, 14);
		Font font16 = new Font("Pretendard", Font.BOLD, 16);
		LineBorder border = new LineBorder(new Color(0xE0E0E0));
		
		//배경 사진 설정
		JLabel jlblBg = new JLabel(new ImageIcon("E:/images/mainBg.png"));
		jlblBg.setBounds(0, 0, 1200, 800);
		
		//학생 사진을 보여주는 라벨 설정
		jlblMyPhoto = new JLabel();
		jlblMyPhoto.setBounds(220, 150, 190, 250);
		
		//메인 버튼들을 모아두는 패널과 버튼들 설정
		JPanel pnlButton = new JPanel(new FlowLayout(FlowLayout.CENTER, 10, 60));
		pnlButton.setBounds(620, 170, 400, 400);
		Dimension d = new Dimension(300, 50);
		
		//메인이 되는 버튼 설정
		jbtnRegisterSubject = new JButton("수강과목");
		jbtnRegisterSubject.setPreferredSize(d);
		jbtnGradeSearch = new JButton("성적조회");
		jbtnGradeSearch.setPreferredSize(d);
		jbtnCourseApply = new JButton("수강신청");
		jbtnCourseApply.setPreferredSize(d);
		jbtnRegisterSubject.setFont(font);
		jbtnGradeSearch.setFont(font);
		jbtnCourseApply.setFont(font);
		jbtnRegisterSubject.setBorder(new LineBorder(new Color(0xE0E0E0)));
		jbtnGradeSearch.setBorder(new LineBorder(new Color(0xE0E0E0)));
		jbtnCourseApply.setBorder(new LineBorder(new Color(0xE0E0E0)));
		jbtnRegisterSubject.setBackground(Color.WHITE);
		jbtnGradeSearch.setBackground(Color.WHITE);
		jbtnCourseApply.setBackground(Color.WHITE);
		
		pnlButton.add(jbtnRegisterSubject);
		pnlButton.add(jbtnGradeSearch);
		pnlButton.add(jbtnCourseApply);
		pnlButton.setBackground(Color.white);
		pnlButton.setBorder(border);
		
		//로그인하면 보여주는 학생 정보를 보여주는 패널과 라벨 설정
		JPanel pnlInfoTag = setInfoLable(); //분류 라벨 만드는 method
		pnlInfoTag.setLocation(jlblMyPhoto.getX()-10, jlblMyPhoto.getY()+260);
		
		jlblDept = new JLabel();
		jlblDept.setBounds(120, 0, 200, 30);
		jlblMajor = new JLabel();
		jlblMajor.setBounds(120, 35, 200, 30);
		jlblEmail = new JLabel();
		jlblEmail.setBounds(120, 70, 200, 30);
		jlblLoginTime = new JLabel();
		jlblLoginTime.setBounds(120, 105, 200, 30);
		
		pnlInfoTag.add(jlblDept);
		pnlInfoTag.add(jlblMajor);
		pnlInfoTag.add(jlblEmail);
		pnlInfoTag.add(jlblLoginTime);
		
		jlblDept.setFont(font16);
		jlblMajor.setFont(font16);
		jlblEmail.setFont(font16);
		jlblLoginTime.setFont(font16);
		
		//이름, 내 정보, 로그아웃이 모여있는 패널과 설정
		JPanel pnlName = new JPanel();
		pnlName.setBounds(720, jlblMyPhoto.getY()-45, 300, 35);
		pnlName.setLayout(null);
		
		jlblMyName = new JLabel();
		jlblMyName.setHorizontalAlignment(JLabel.CENTER);
		jlblMyName.setBounds(0, 2, 105, 30);
		jlblMyName.setFont(new Font("Pretendard", Font.BOLD, 20));
		
		//작은 버튼의 색깔
		Color btnColor = new Color(0xE0E0E0);
		
		jbtnMyProfile = new JButton("내 정보");
		jbtnMyProfile.setBounds(115, 5, 85, 25);
		jbtnMyProfile.setBackground(btnColor);
		jbtnMyProfile.setBorder(null);
		jbtnMyProfile.setFont(font14);
		
		jbtnLogout = new JButton("로그아웃");
		jbtnLogout.setBounds(212, 5, 85, 25);
		jbtnLogout.setBackground(btnColor);
		jbtnLogout.setBorder(null);
		jbtnLogout.setFont(font14);
		
		pnlName.add(jlblMyName);
		pnlName.add(jbtnMyProfile);
		pnlName.add(jbtnLogout);
		pnlName.setBackground(Color.white);
		
		setLayout(null);
		
		add(jlblMyPhoto);
		add(pnlButton);
		add(pnlInfoTag);
		add(pnlName);
		
		add(jlblBg);

		//이벤트 연결
		StudentMainEvt sme = new StudentMainEvt(this);
		jbtnMyProfile.addActionListener(sme);
		jbtnLogout.addActionListener(sme);
		jbtnRegisterSubject.addActionListener(sme);
		jbtnGradeSearch.addActionListener(sme);
		jbtnCourseApply.addActionListener(sme);
		addWindowListener(sme);
		
		//화면 크기 설정
		setBounds(400, 100, 1200, 800);
		setVisible(true);
	}
	
	/**
	 * 타이틀 라벨을 만드는 메서드
	 * 추후에 보여지는 라벨이 수정이 되면 변경하기 편하게 하기 위해서 메서드로 만듬
	 * @return JPanel
	 */
	public JPanel setInfoLable() {
		String[] strArr = {"학부", "학과", "이메일", "로그인 시간"};
		JLabel[] jl = new JLabel[strArr.length];
		Font font = new Font("Pretendard", Font.BOLD, 17);
		
		JPanel pnl = new JPanel();
		pnl.setLayout(null);
		pnl.setSize(310, 140);
		pnl.setBackground(Color.white);
		
		for(int i = 0; i < jl.length; i++) {
			jl[i] = new JLabel(strArr[i]);
			jl[i].setBounds(10, 35*i, 80, 30);
			jl[i].setFont(font);
			
			pnl.add(jl[i]);
		}
		
		return pnl;
	}

	public JButton getJbtnMyProfile() {
		return jbtnMyProfile;
	}

	public JButton getJbtnLogout() {
		return jbtnLogout;
	}

	public JButton getJbtnRegisterSubject() {
		return jbtnRegisterSubject;
	}

	public JButton getJbtnGradeSearch() {
		return jbtnGradeSearch;
	}

	public JButton getJbtnCourseApply() {
		return jbtnCourseApply;
	}

	public JLabel getJlblMyPhoto() {
		return jlblMyPhoto;
	}

	public JLabel getJlblMyName() {
		return jlblMyName;
	}

	public JLabel getJlblDept() {
		return jlblDept;
	}

	public JLabel getJlblMajor() {
		return jlblMajor;
	}

	public JLabel getJlblEmail() {
		return jlblEmail;
	}

	public JLabel getJlblLoginTime() {
		return jlblLoginTime;
	}

	public static StudentVO getsVO() {
		return sVO;
	}

//	public static void main(String[] args) {
//		//임시 값
//		StudentVO s = new StudentVO();
//		s.setName("농담곰");
//		s.setDptName("연극영화부");
//		s.setMajorName("연극영화과");
//		s.setEmail("testest@naver.com");
//		s.setId(2023001);
//		new StudentMainFrame(s);
//	}
	
}
