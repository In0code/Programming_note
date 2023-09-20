package self_practice_course_prj;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;

import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

/**
 * 인영 교수 관리 - 등록 Dialog
 * 
 * @author user
 *
 */
@SuppressWarnings("serial")
public class EmployProfAddManageDialog extends JDialog {
	private EmployProfManageDialog epmd;
	JTextField jtfName;
	JTextField jtfPhone;
	JTextField jtfEmail;
	DefaultComboBoxModel<String> dcbmDept;
	JComboBox<String> jcbDept;
	DefaultComboBoxModel<String> dcbmMajor;
	JComboBox<String> jcbMajor;
	DefaultComboBoxModel<String> dcbmEmail;
	JComboBox<String> jcbEmail;
	JButton jbtnAdd;
	EmployProfAddManageDialogEvt eped;

	// 교수 등록 창
	public EmployProfAddManageDialog(EmployProfManageDialog epmd) {
		super(epmd, "관리자", true);
		this.epmd = epmd;

		//// 라벨 ////
		JLabel jlblTitle = new JLabel("교수 등록");
		JLabel jlblName = new JLabel("이름");
		JLabel jlblDpt = new JLabel("학부");
		JLabel jlblMajor = new JLabel("학과");
		JLabel jlblPhone = new JLabel("전화번호");
		JLabel jlblEmail = new JLabel("이메일");
		JLabel jlblPhoneInfo = new JLabel("예 ) 010-1234-5678");
//		JLabel jlblback = new JLabel(
//				new ImageIcon("C:/Users/user/git/course_prj2/course_prj2/src/images/cutesexy.png"));

		//// 텍스트 필드 ////
		jtfName = new JTextField(); // 이름
		jtfPhone = new JTextField(); // 전화번호
		jtfEmail = new JTextField(); // 이메일

		//// 콤보 박스 ///
		// 학부
		dcbmDept = new DefaultComboBoxModel<String>();
		jcbDept = new JComboBox<String>(dcbmDept);
		// 학과
		dcbmMajor = new DefaultComboBoxModel<String>();
		jcbMajor = new JComboBox<String>(dcbmMajor);
		// 이메일
		dcbmEmail = new DefaultComboBoxModel<String>();
		jcbEmail = new JComboBox<String>(dcbmEmail);

		dcbmEmail.addElement("@naver.com");
		dcbmEmail.addElement("@gmail.com");
		dcbmEmail.addElement("@daum.net");
		dcbmEmail.addElement("@naver.com");
		dcbmEmail.addElement("@gmail.com");

		//// 버튼 ////
		jbtnAdd = new JButton("등록"); // 등록버튼

		/// 이벤트 연결///
		eped = new EmployProfAddManageDialogEvt(this);
		jbtnAdd.addActionListener(eped);
		jcbDept.addActionListener(eped);
		jcbMajor.addActionListener(eped);

		//// 배경 색 설정 ////
		Color backgroundColor = Color.decode("#FCF7F5");

		// getContentPane() 메서드를 사용하여 배경색 설정
		Container contentPane = getContentPane();
		contentPane.setBackground(backgroundColor);
		//// Bounds ////
		// 라벨
//		jlblback.setBounds(0, 0, 800, 500);
		jlblTitle.setBounds(20, 10, 210, 50);
		jlblName.setBounds(148, 110, 140, 30);
		jlblDpt.setBounds(148, 165, 60, 30);
		jlblMajor.setBounds(148, 220, 80, 30);
		jlblPhone.setBounds(148, 275, 100, 30);
		jlblEmail.setBounds(148, 330, 80, 30);
		jlblPhoneInfo.setBounds(419, 275, 200, 30);
		// 텍스트필드
		jtfName.setBounds(260, 110, 140, 30);
		jtfPhone.setBounds(260, 275, 140, 30);
		jtfEmail.setBounds(260, 330, 140, 30);
		// 콤보박스
		jcbDept.setBounds(260, 165, 150, 30);
		jcbMajor.setBounds(260, 220, 150, 30);
		jcbEmail.setBounds(410, 330, 140, 30);
		// 버튼
		jbtnAdd.setBounds(274, 414, 80, 30);

		//// Font ////
		Font font = new Font("Pretendard", Font.BOLD, 25);
		jlblTitle.setFont(new Font("Pretendard", Font.BOLD, 22));
		jlblName.setFont(font);
		jlblDpt.setFont(font);
		jlblMajor.setFont(font);
		jlblPhone.setFont(font);
		jlblEmail.setFont(font);
		jlblPhoneInfo.setFont(new Font("Pretendard", Font.BOLD, 14));
		jlblPhoneInfo.setForeground(new Color(0x707070)); // 글자색 설정
		jbtnAdd.setFont(new Font("Pretendard", Font.BOLD, 14));
		jcbDept.setFont(new Font("Pretendard", Font.BOLD, 14));
		jcbMajor.setFont(new Font("Pretendard", Font.BOLD, 14));
		jcbEmail.setFont(new Font("Pretendard", Font.BOLD, 14));

		//// back-color ////
		jbtnAdd.setBackground(new Color(0xE0E0E0));

		//// add ////
		add(jlblTitle);
		add(jlblName);
		add(jlblDpt);
		add(jlblMajor);
		add(jlblPhone);
		add(jlblEmail);
		add(jlblPhoneInfo);
		add(jtfName);
		add(jtfPhone);
		add(jtfEmail);
		add(jcbDept);
		add(jcbMajor);
		add(jcbEmail);
		add(jbtnAdd);
//		add(jlblback);

		setLayout(null);
		setResizable(false);

		setBounds(epmd.getX() + 140, epmd.getY() + 70, 700, 500);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}// EmployProfAddManageDialog

	public EmployProfManageDialog getEpmd() {
		return epmd;
	}

	public JTextField getJtfName() {
		return jtfName;
	}

	public JTextField getJtfPhone() {
		return jtfPhone;
	}

	public JTextField getJtfEmail() {
		return jtfEmail;
	}

	public DefaultComboBoxModel<String> getDcbmDept() {
		return dcbmDept;
	}

	public JComboBox<String> getJcbDept() {
		return jcbDept;
	}

	public DefaultComboBoxModel<String> getDcbmMajor() {
		return dcbmMajor;
	}

	public JComboBox<String> getJcbMajor() {
		return jcbMajor;
	}

	public DefaultComboBoxModel<String> getDcbmEmail() {
		return dcbmEmail;
	}

	public JComboBox<String> getJcbEmail() {
		return jcbEmail;
	}

	public JButton getJbtnAdd() {
		return jbtnAdd;
	}

}// class
