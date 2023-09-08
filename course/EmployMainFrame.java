package self_practice_course_prj;

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

/* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 */
@SuppressWarnings("serial")
public class EmployMainFrame extends JFrame {
	
	private JButton jbtnStuManage;
	private JButton jbtnProfesorManage;
	private JButton jbtnMajorManage;
	private JButton jbtnSubjectManage;
	private JLabel jlblOne;
	private JLabel jlblTwo;
	private JLabel jlblMyEmail;
	private JLabel jlblLoginTime;
	private JLabel jlblMyPhoto;
	private JLabel jlblMyName;
	private JButton jbtnMyProfile;
	private JButton jbtnLogout;
	
	private boolean flag;

	static EmployVO eVO;
	
	public EmployMainFrame(EmployVO VO) {
		eVO = VO;
		flag = eVO.getUsercode()=='M' ? true : false; //관리자면 true를 교수면 false를 반환한다.
		
		// 배경 사진 설정
		JLabel jlblBg = new JLabel(new ImageIcon("C:/Users/user/git/group_prj/course_prj/src/kr/co/sist/course/images/mainBg.png"));
		jlblBg.setBounds(0, 0, 1200, 800);
		
		// 학생 사진을 보여주는 라벨 설정
		jlblMyPhoto = new JLabel();
		jlblMyPhoto.setBounds(220, 150, 200, 250);
		jlblMyPhoto.setBorder(new LineBorder(Color.red));
		
		// 메인 버튼들을 모아두는 패널 설정
		JPanel pnlButton = new JPanel(new FlowLayout(FlowLayout.CENTER, 10, 40));
		pnlButton.setBounds(620, 170, 400, 400);
		pnlButton.setBorder(new LineBorder(Color.red));
		
		Dimension d = new Dimension(300, 50);
		
		jbtnStuManage = new JButton("학생관리");
		jbtnStuManage.setPreferredSize(d);
		jbtnProfesorManage = new JButton("교수관리");
		jbtnProfesorManage.setPreferredSize(d);
		jbtnMajorManage = new JButton("학과관리");
		jbtnMajorManage.setPreferredSize(d);
		jbtnSubjectManage = new JButton("과목관리");
		jbtnSubjectManage.setPreferredSize(d);
		
		pnlButton.add(jbtnStuManage);
		pnlButton.add(jbtnProfesorManage);
		pnlButton.add(jbtnMajorManage);
		pnlButton.add(jbtnSubjectManage);
		
		// 로그인하면 보여주는 학생 정보를 보여주는 패널 설정
		JPanel pnlInfoTag = setInfoLable(); //분류 라벨 만드는 method
		pnlInfoTag.setLocation(jlblMyPhoto.getX(), jlblMyPhoto.getY()+290);
		pnlInfoTag.setBorder(new LineBorder(Color.red));
		
		//관리자 정보 표시창
		jlblOne = new JLabel();
		jlblOne.setBounds(100, 0, 200, 30);
		jlblTwo = new JLabel();
		jlblTwo.setBounds(100, jlblOne.getY()+35, 200, 30);
		
		jlblMyEmail = new JLabel();
		jlblMyEmail.setBounds(100, jlblTwo.getY()+35, 200, 30);
		jlblLoginTime = new JLabel();
		jlblLoginTime.setBounds(100,jlblMyEmail.getY()+35, 200, 30);
		
		
		pnlInfoTag.add(jlblOne);
		pnlInfoTag.add(jlblTwo);
		pnlInfoTag.add(jlblMyEmail);
		pnlInfoTag.add(jlblLoginTime);
		
		// 이름, 내 정보, 로그아웃이 모여있는 패널과 설정
		JPanel pnlName = new JPanel();
		pnlName.setBounds(680, jlblMyPhoto.getY() - 45, 340, 35);
		pnlName.setLayout(null);

		Font font = new Font("맑은 고딕", Font.BOLD, 16);

		jlblMyName = new JLabel();
		jlblMyName.setHorizontalAlignment(JLabel.CENTER);
		jlblMyName.setBounds(0, 2, 140, 30);
		jlblMyName.setBorder(new LineBorder(Color.pink));
		jlblMyName.setFont(font);

		jbtnMyProfile = new JButton("내 정보");
		jbtnMyProfile.setBounds(152, 5, 85, 25);
		jbtnLogout = new JButton("로그아웃");
		jbtnLogout.setBounds(250, 5, 85, 25);

		pnlName.add(jlblMyName);
		pnlName.add(jbtnMyProfile);
		pnlName.add(jbtnLogout);

		setLayout(null);

		add(jlblMyPhoto);
		add(pnlButton);
		add(pnlInfoTag);
		add(pnlName);

		add(jlblBg);


		//기본 값 설정
		EmployMainEvt eme = new EmployMainEvt(this);
		jbtnStuManage.addActionListener(eme);
		jbtnProfesorManage.addActionListener(eme);
		jbtnMajorManage.addActionListener(eme);
		jbtnSubjectManage.addActionListener(eme);
		jbtnMyProfile.addActionListener(eme);
		jbtnLogout.addActionListener(eme);
		addWindowListener(eme);

		//화면 크기 설정
		setBounds(200, 150, 1200, 800);
		setVisible(true);
	}
	
	public JPanel setInfoLable() {
		String[] M_Arr = {"", "사번", "이메일", "로그인 시간"};
		String[] P_Arr = {"학부", "학과", "이메일", "로그인 시간"};
		String[] strArr = null;
		JLabel[] jl = null;
		
		if(eVO.getUsercode() == 'M') {
			jl = new JLabel[M_Arr.length];
			strArr = M_Arr;
		} else {
			jl = new JLabel[P_Arr.length];
			strArr = P_Arr;
		}
		
		Font font = new Font(null, Font.BOLD, 14);
		
		JPanel pnl = new JPanel();
		pnl.setLayout(null);
		pnl.setSize(310, 140);
		
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

	public JLabel getJlblMyPhoto() {
		return jlblMyPhoto;
	}

	public JButton getJbtnStuManage() {
		return jbtnStuManage;
	}

	public JButton getJbtnProfesorManage() {
		return jbtnProfesorManage;
	}

	public JButton getJbtnMajorManage() {
		return jbtnMajorManage;
	}

	public JButton getJbtnSubjectManage() {
		return jbtnSubjectManage;
	}

	public JLabel getJlblMyName() {
		return jlblMyName;
	}

	public JLabel getJlblMyEmail() {
		return jlblMyEmail;
	}

	public JLabel getJlblLoginTime() {
		return jlblLoginTime;
	}
	
	public JLabel getJlblOne() {
		return jlblOne;
	}

	public JLabel getJlblTwo() {
		return jlblTwo;
	}

	public static EmployVO geteVO() {
		return eVO;
	}
	
	public boolean getFlag() {
		return flag;
	}

	public static void main(String[] args) {
		//임시 값
		EmployVO v = new EmployVO();
		v.setUsercode('M');
		v.setName("농담곰");
		v.setEmpno("EMP000100");
		v.setDptName("컴퓨터공학부");
		v.setMajorName("컴퓨터과학");
		v.setEmail("testest@gmail.com");
		new EmployMainFrame(v);
	}

}
