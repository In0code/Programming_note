package kr.co.sist.course;

import java.awt.Color;
import java.awt.Font;

import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;

/**
 * 교직원과 교수 내 정보창
 * @author user
 */
@SuppressWarnings("serial")
public class EmployProfileDialog extends JDialog {
	
	private JLabel jlblEmpno;
	private JLabel jlblDpt;
	private JLabel jlblMajor;
	private JLabel jlblMyImg;
	private JLabel jlblName;
	private JPasswordField jpfPw;
	private JPasswordField jpfCheckPw;
	private JTextField jtfPhone;
	private JTextField jtfEmail;
	private DefaultComboBoxModel<String> dcbmEmail;
	private JComboBox<String> jcbChoiceEmail;
	private JButton jbtnEditImg;
	private JButton jbtnUpdatePw;
	private JButton jbtnEdit;
	
	private EmployMainFrame emf;
	
	/**
	 * 관리자와 교수 화면 설정
	 * @param emf
	 */
	public EmployProfileDialog(EmployMainFrame emf) {
		this.emf = emf;
		super.setModal(false);
		super.setTitle("내 정보");
		
		int labelWidth = 100;
		int labelHeight = 30;
		int fieldWidth = 250;
		int fieldHeight = 30;
		
		//텍스트 필드와 버튼 디자인 설정
		LineBorder lineB = new LineBorder(new Color(0xCFCFCF));
		Color btnColor = new Color(0xE0E0E0);
		
		//배경화면 설정 라벨
		JLabel bgLabel = new JLabel(new ImageIcon("E:/images/backgr.png"));
		bgLabel.setBounds(0, 0, 1000, 700);
		
		//내 정보 제목 표시
		JLabel jlblTitle = new JLabel("내 정보");
		jlblTitle.setBounds(180, 100, 70, 30);
		jlblTitle.setFont(new Font("Pretendard", Font.BOLD, 24));
		
		//학생 사진 보여주는 라벨
		jlblMyImg = new JLabel();
		jlblMyImg.setBounds(160, 170, 190, 250);
		jlblMyImg.setHorizontalAlignment(JLabel.CENTER);
		jlblMyImg.setToolTipText("크기: 190 X 250");
		
		//학번 설정
		JLabel jlEmpno = new JLabel("사번");
		jlEmpno.setBounds(420, 170, labelWidth, labelHeight);
		jlblEmpno = new JLabel();
		jlblEmpno.setBounds(jlEmpno.getX()+100, jlEmpno.getY(), fieldWidth, fieldHeight);
		
		//이름 설정
		JLabel jlName = new JLabel("이름");
		jlName.setBounds(jlEmpno.getX(), jlEmpno.getY()+32, labelWidth, labelHeight);
		jlblName = new JLabel();
		jlblName.setBounds(jlblEmpno.getX(), jlName.getY(), fieldWidth, fieldHeight);
		
		//비밀번호 라벨 및 필드 설정
		JLabel jlPw = new JLabel("비밀번호");
		jlPw.setBounds(jlName.getX(), jlName.getY()+32, labelWidth, labelHeight);
		
		jpfPw = new JPasswordField(50);
		jpfPw.setBounds(jlblName.getX(), jlPw.getY(), fieldWidth, fieldHeight);
		jpfCheckPw = new JPasswordField(50);
		jpfCheckPw.setBounds(jpfPw.getX(), jpfPw.getY()+32, fieldWidth, fieldHeight);
		jpfCheckPw.setBorder(lineB);
		
		//이메일 설정
		JLabel jlEmail = new JLabel("이메일");
		jlEmail.setBounds(jlPw.getX(), jlPw.getY()+70, labelWidth, labelHeight);
		jtfEmail = new JTextField(30);
		jtfEmail.setBounds(jpfCheckPw.getX(), jpfCheckPw.getY()+38, 100, fieldHeight);
		jtfEmail.setBorder(lineB);
				
		//이메일 컴포박스 설정
		dcbmEmail = new DefaultComboBoxModel<String>();
		jcbChoiceEmail = new JComboBox<String>(dcbmEmail);
		jcbChoiceEmail.setBounds(jtfEmail.getX()+120, jtfEmail.getY(), 130, fieldHeight);
		jcbChoiceEmail.setBackground(Color.white);
		jcbChoiceEmail.setEditable(true);
		
		JLabel golbaengi = new JLabel("@");
		golbaengi.setBounds(jcbChoiceEmail.getX()-19, jtfEmail.getY()+3, 20, 20);
		
		//학부 설정
		JLabel jldpt = new JLabel("학부");
		jldpt.setBounds(jlEmail.getX(), jlEmail.getY()+32, labelWidth, labelHeight);
		jlblDpt = new JLabel();
		jlblDpt.setBounds(jtfEmail.getX(), jtfEmail.getY()+32, fieldWidth, fieldHeight);
				
		//학과 설정
		JLabel jlMajor = new JLabel("학과");
		jlMajor.setBounds(jldpt.getX(), jldpt.getY()+32, labelWidth, labelHeight);
		jlblMajor = new JLabel();
		jlblMajor.setBounds(jlblDpt.getX(), jlblDpt.getY()+32, fieldWidth, fieldHeight);
		
		//전화번호
		JLabel jlPhone = new JLabel("전화번호");
		jlPhone.setBounds(jlMajor.getX(), jlMajor.getY()+32, labelWidth, labelHeight);
		jtfPhone = new JTextField(50);
		jtfPhone.setBounds(jlblMajor.getX(), jlblMajor.getY()+32, fieldWidth, fieldHeight);
		jtfPhone.setBorder(new LineBorder(new Color(0xCFCFCF)));
		
		//수정 버튼 설정
		jbtnEdit = new JButton("수정");
		jbtnEdit.setBounds(460, 520, 80, 30);
		jbtnEdit.setBackground(btnColor);
		jbtnEdit.setBorder(null);
		
		//비밀번호 버튼 설정
		jbtnUpdatePw = new JButton("변경");
		jbtnUpdatePw.setBounds(jpfPw.getX()+255, jpfPw.getY()+3, 60, 25);
		jbtnUpdatePw.setBackground(btnColor);
		jbtnUpdatePw.setBorder(null);
				
		//사진 편집 버튼 설정
		jbtnEditImg = new JButton("편집");
		jbtnEditImg.setBounds(jlblMyImg.getX(), jlblMyImg.getY()+250, 190, 30);
		jbtnEditImg.setBackground(btnColor);
		jbtnEditImg.setBorder(null);
		
		// 라벨 폰트 설정
		Font font = new Font("Pretendard", Font.BOLD, 20);
		Font font16 = new Font("Pretendard", Font.PLAIN, 16);
		jlblTitle.setFont(font);
		jlEmpno.setFont(font);
		jlblEmpno.setFont(font16);
		jlName.setFont(font);
		jlblName.setFont(font16);
		jlPw.setFont(font);
		jpfPw.setFont(font16);
		jpfCheckPw.setFont(font16);
		jlblEmpno.setFont(font16);
		jlblName.setFont(font16);
		jlEmail.setFont(font);
		jtfEmail.setFont(font16);
		jcbChoiceEmail.setFont(font16);
		jldpt.setFont(font);
		jlblDpt.setFont(font);
		jlMajor.setFont(font);
		jlblMajor.setFont(font);
		jlPhone.setFont(font);
		jtfPhone.setFont(font);
		golbaengi.setFont(new Font("Pretendard", Font.PLAIN, 16));
		
		//버튼 폰트 설정
		Font btnFont = new Font("Pretendard", Font.PLAIN, 14);
		jbtnEdit.setFont(btnFont);
		jbtnEditImg.setFont(btnFont);
		jbtnUpdatePw.setFont(btnFont);
		
		setLayout(null);
		
		//이벤트 연결
		EmployProfileEvt epe = new EmployProfileEvt(this);
		jbtnUpdatePw.addActionListener(epe);
		jbtnEdit.addActionListener(epe);
		jbtnEditImg.addActionListener(epe);
		addWindowListener(epe);
		
		bgLabel.add(jlblTitle);
		bgLabel.add(jlblMyImg);
		bgLabel.add(jlEmpno);
		bgLabel.add(jlblEmpno);
		bgLabel.add(jlName);
		bgLabel.add(jlblName);
		bgLabel.add(jlPw);
		bgLabel.add(jpfPw);
		bgLabel.add(jpfCheckPw);
		bgLabel.add(jlEmail);
		bgLabel.add(golbaengi);
		bgLabel.add(jtfEmail);
		bgLabel.add(jcbChoiceEmail);
		bgLabel.add(jldpt);
		bgLabel.add(jlblDpt);
		bgLabel.add(jlMajor);
		bgLabel.add(jlblMajor);
		bgLabel.add(jlPhone);
		bgLabel.add(jtfPhone);
		bgLabel.add(jbtnEdit);
		bgLabel.add(jbtnUpdatePw);
		bgLabel.add(jbtnEditImg);

		//배경화면 이미지가 있는 라벨
		add(bgLabel);
		
		setBounds(150, 200, 1000, 700);
		setVisible(true);
	}

	public JLabel getJlblEmpno() {
		return jlblEmpno;
	}

	public JLabel getJlblDpt() {
		return jlblDpt;
	}

	public JLabel getJlblMajor() {
		return jlblMajor;
	}

	public JLabel getJlblMyImg() {
		return jlblMyImg;
	}

	public JLabel getJtfName() {
		return jlblName;
	}

	public JPasswordField getJpfPw() {
		return jpfPw;
	}

	public JPasswordField getJpfCheckPw() {
		return jpfCheckPw;
	}

	public JTextField getJtfPhone() {
		return jtfPhone;
	}

	public JTextField getJtfEmail() {
		return jtfEmail;
	}

	public DefaultComboBoxModel<String> getDcbmEmail() {
		return dcbmEmail;
	}

	public JComboBox<String> getJcbChoiceEmail() {
		return jcbChoiceEmail;
	}

	public JButton getJbtnEditImg() {
		return jbtnEditImg;
	}

	public JButton getJbtnUpdatePw() {
		return jbtnUpdatePw;
	}

	public JButton getJbtnEdit() {
		return jbtnEdit;
	}

	public EmployMainFrame getEmf() {
		return emf;
	}

//	public static void main(String[] args) {
//		new EmployProfileFrame();
//	}

}
