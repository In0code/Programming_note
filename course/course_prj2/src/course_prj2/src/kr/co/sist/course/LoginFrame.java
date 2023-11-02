package kr.co.sist.course;

import java.awt.Color;
import java.awt.Font;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPasswordField;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;
//돼라
/* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 *//* 태균 */
/**
 * 로그인 화면을 보여주는 창
 * @author user
 */
@SuppressWarnings("serial")
public class LoginFrame extends JFrame {
	
	private JButton jbtnLogin;
	private JTextField jtfId;
	private JPasswordField jpPw;
	private JCheckBox jcbChangeAdmin;
	private JCheckBox jcbIdSave;
	
	/**
	 * 로그인 화면 설정
	 */
	public LoginFrame() {
		super("로그인");
		
		//배경화면 설정
		JLabel jlblBg = new JLabel(new ImageIcon("E:/images/mainBg.png"));
		jlblBg.setBounds(0, 0, 1200, 800);
		
		//아이디, 비밀번호 입력창 선 색깔 설정
		LineBorder lineColor = new LineBorder(new Color(0xCFCFCF));
		
		//아이디 라벨 설정
		JLabel jlblId = new JLabel("ID");
		jlblId.setBounds(250, 210, 70, 40);
		
		//아이디 입력 필드 설정
		jtfId = new JTextField(20);
		jtfId.setBounds(jlblId.getX()+75, jlblId.getY()+2, 220, 40);
		jtfId.setBorder(lineColor);
		
		//비밀번호 라벨 설정
		JLabel jlblPw = new JLabel("PW");
		jlblPw.setBounds(jlblId.getX(), jlblId.getY()+42, 70, 40);
		
		//비밀번호 입력 필드 설정
		jpPw = new JPasswordField(20);
		jpPw.setBounds(jlblPw.getX()+75, jlblPw.getY()+2, 220, 40);
		jpPw.setBorder(lineColor);
				
		//아이디(학번)과 비밀번호 라벨, 입력 폰트 설정
		Font font = new Font("Pretendard", Font.BOLD, 26);
		Font font14 = new Font("Pretendard", Font.BOLD, 14);
		jlblId.setFont(font);
		jlblPw.setFont(font);
		font = new Font("Pretendard", Font.PLAIN, 22);
		jtfId.setFont(font);
		jpPw.setFont(font);

		//관리자 모드 전환 체크박스
		jcbChangeAdmin = new JCheckBox("관리자 모드 전환", false);
		jcbChangeAdmin.setBounds(jlblId.getX(), jlblId.getY()-35, 120, 30);
		jcbChangeAdmin.setFocusPainted(false);
		jcbChangeAdmin.setFont(font14);
		jcbChangeAdmin.setBackground(Color.white);
		
		//아이디 저장 여부 체크박스
		jcbIdSave = new JCheckBox("아이디 저장");
		jcbIdSave.setBounds(jlblPw.getX(), jlblPw.getY()+50, 120, 30);
		jcbIdSave.setFocusPainted(false);
		jcbIdSave.setFont(font14);
		jcbIdSave.setBackground(Color.white);
		
		//로그인 버튼 설정
		jbtnLogin = new JButton("로그인");
		jbtnLogin.setBounds(jlblPw.getX(), jlblPw.getY()+90, 295, 40);
		jbtnLogin.setBackground(new Color(0xE0E0E0));
		jbtnLogin.setBorder(null);
		jbtnLogin.setFont(new Font("Pretendard", Font.BOLD, 16));
		
		//학교 이미지 설정
		JLabel jlblImg = new JLabel();
		jlblImg.setIcon(new ImageIcon("C:/Users/user/git/course_prj2/course_prj2/src/images/logo2.png"));
		jlblImg.setBounds(610, 150, 435, 280);
		
		//사용방법 표시하는 라벨(로그인 가장 아래 있는 설명)
		JTextArea jtaMsg = new JTextArea();
		StringBuilder sb = new StringBuilder();
		sb.append("- 최초 사용자는 전화번호 뒷자리 4개가 임시 비밀번호로 설정되어있습니다.").append("\n")
		.append("- 비밀번호는 마이페이지에서 변경할 수 있습니다.").append("\n")
		.append("- ID는 학번/사번 입니다.").append("\n")
		.append("- 학생, 교직원은 별도의 회원가입 절차 없이 학번/사번으로 로그인이 가능합니다.");
		
		jtaMsg.setText(sb.toString());
		jtaMsg.setEditable(false);
		jtaMsg.setBounds(jbtnLogin.getX(), jbtnLogin.getY()+85, 600, 100);
		jtaMsg.setFont(new Font("Pretendard", Font.BOLD, 16));
		
		//화면에 표시(추가)
		add(jcbChangeAdmin);
		add(jlblId);
		add(jtfId);
		add(jlblPw);
		add(jpPw);
		add(jcbIdSave);
		add(jbtnLogin);
		add(jlblImg);
		add(jtaMsg);
		
		add(jlblBg);
		
		//이벤트 설정
		LoginEvt le = new LoginEvt(this);
		jbtnLogin.addActionListener(le);
		jcbChangeAdmin.addActionListener(le);
		jcbIdSave.addActionListener(le);
		jpPw.addActionListener(le);
		addWindowListener(le);
		
		//화면 크기 설정
		setBounds(400, 100, 1200, 800);
		setVisible(true);
	}

	public JButton getJbtnLogin() {
		return jbtnLogin;
	}

	public JTextField getJtfId() {
		return jtfId;
	}

	public JPasswordField getJpPw() {
		return jpPw;
	}

	public JCheckBox getJcbChangeAdmin() {
		return jcbChangeAdmin;
	}

	public JCheckBox getJcbIdSave() {
		return jcbIdSave;
	}

	public static void main(String[] args) {
		new LoginFrame();
	}

}
