package self_practice_course_prj;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;

import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

/**
 * 인영 교수 관리- 수정 Dialog
 * 
 * @author user
 *
 */
@SuppressWarnings("serial")
public class EmployProfEditManageDialog extends JDialog {

	private EmployProfManageDialog epmd;
	private EmployProfEditManageDialogEvt epemde;
	JLabel JlblSetEmpno;
	JTextField jtfName;
	JTextField jtfPhone;
	JTextField jtfEmail;
	DefaultComboBoxModel<String> dcbmDept;
	JComboBox<String> jcbDept;
	DefaultComboBoxModel<String> dcbmMajor;
	JComboBox<String> jcbMajor;
	DefaultComboBoxModel<String> dcbmEmail;
	JComboBox<String> jcbEmail;
	JButton jbtnEdit;

	// 교수 수정 창
	public EmployProfEditManageDialog(EmployProfManageDialog epmd, ProfVO pVO) {

		super(epmd, "관리자", true);
		this.epmd = epmd;

		//// 라벨 ////
		JLabel jlblTitle = new JLabel("교수 수정");
		JLabel jlblEmpno = new JLabel("사번");
		JLabel jlblName = new JLabel("이름");
		JLabel jlblDpt = new JLabel("학부");
		JLabel jlblMajor = new JLabel("학과");
		JLabel jlblPhone = new JLabel("전화번호");
		JLabel jlblEmail = new JLabel("이메일");
		JlblSetEmpno = new JLabel(pVO.getEmpno()); // 사번
		//// 텍스트 필드 ////

		String email = pVO.getEmail();
		jtfName = new JTextField(pVO.getEname()); // 이름
		jtfPhone = new JTextField(pVO.getPhone()); // 전화번호
		jtfEmail = new JTextField(email.substring(0, (email.indexOf("@")))); // 이메일

		//// 콤보 박스 ///
		// 학부
		dcbmDept = new DefaultComboBoxModel<String>();
		// 학과
		dcbmMajor = new DefaultComboBoxModel<String>();

		// 이메일
		dcbmEmail = new DefaultComboBoxModel<String>();

		dcbmDept.setSelectedItem(pVO.getDptName());
		dcbmDept.addElement("컴퓨터공학부");
		dcbmDept.addElement("인문사회부");
		dcbmDept.addElement("연극학부");
		dcbmDept.addElement("건축학부");
		dcbmDept.addElement("체육학부");

		dcbmMajor.setSelectedItem(pVO.getMajorName());
		dcbmMajor.addElement("컴퓨터과학과");
		dcbmMajor.addElement("국어국문학과");
		dcbmMajor.addElement("연극영화과");
		dcbmMajor.addElement("건축공학과");
		dcbmMajor.addElement("사회체육학과");

		email = pVO.getEmail().substring(email.lastIndexOf("@"), email.length());
		dcbmEmail.setSelectedItem(email);
		dcbmEmail.addElement("@naver.com");
		dcbmEmail.addElement("@gmail.com");
		dcbmEmail.addElement("@daum.net");
		dcbmEmail.addElement("@naver.com");
		dcbmEmail.addElement("@gmail.com");

		jcbDept = new JComboBox<String>(dcbmDept);
		jcbMajor = new JComboBox<String>(dcbmMajor);
		jcbEmail = new JComboBox<String>(dcbmEmail);
		//// 버튼 ////
		jbtnEdit = new JButton("수정"); // 수정버튼

		//// 배경 색 설정 ////
		Color backgroundColor = Color.decode("#FCF7F5");

		// getContentPane() 메서드를 사용하여 배경색 설정
		Container contentPane = getContentPane();
		contentPane.setBackground(backgroundColor);
		//// Bounds ////
		// 라벨
		jlblTitle.setBounds(20, 10, 210, 50);
		jlblEmpno.setBounds(148, 90, 100, 30);
		jlblName.setBounds(148, 140, 140, 30);
		jlblDpt.setBounds(148, 190, 60, 30);
		jlblMajor.setBounds(148, 240, 80, 30);
		jlblPhone.setBounds(148, 290, 100, 30);
		jlblEmail.setBounds(148, 340, 80, 30);
		// 텍스트필드
		JlblSetEmpno.setBounds(260, 90, 150, 30);
		jtfName.setBounds(260, 140, 140, 30);
		jtfPhone.setBounds(260, 290, 140, 30);
		jtfEmail.setBounds(260, 340, 140, 30);
		// 콤보박스
		jcbDept.setBounds(260, 190, 150, 30);
		jcbMajor.setBounds(260, 240, 150, 30);
		jcbEmail.setBounds(410, 340, 140, 30);
		// 버튼
		jbtnEdit.setBounds(274, 414, 80, 30);
		
		//이벤트 등록
		epemde= new EmployProfEditManageDialogEvt(this);
		jbtnEdit.addActionListener(epemde);
		

		//// Font ////
		Font font = new Font("Pretendard", Font.BOLD, 25);
		jlblTitle.setFont(new Font("Pretendard", Font.BOLD, 22));
		jbtnEdit.setFont(new Font("Pretendard", Font.BOLD, 14));
		jcbDept.setFont(new Font("Pretendard", Font.BOLD, 14));
		jcbMajor.setFont(new Font("Pretendard", Font.BOLD, 14));
		jcbEmail.setFont(new Font("Pretendard", Font.BOLD, 14));
		jlblEmpno.setFont(font);
		jlblName.setFont(font);
		jlblDpt.setFont(font);
		jlblMajor.setFont(font);
		jlblPhone.setFont(font);
		jlblEmail.setFont(font);
		JlblSetEmpno.setFont(new Font("Pretendard", Font.BOLD, 18));

		//// back-color ////
		jbtnEdit.setBackground(new Color(0xE0E0E0));

		//// add ////
		add(jlblTitle);
		add(jlblEmpno);
		add(jlblName);
		add(jlblDpt);
		add(jlblMajor);
		add(jlblPhone);
		add(jlblEmail);
		add(JlblSetEmpno);
		add(jtfName);
		add(jtfPhone);
		add(jtfEmail);
		add(jcbDept);
		add(jcbMajor);
		add(jcbEmail);
		add(jbtnEdit);

		setLayout(null);
		setResizable(false);

		setBounds(epmd.getX() + 140, epmd.getY() + 70, 700, 500);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}// EmployProfEditManageDialog

	/// getter///
	public EmployProfManageDialog getEpmd() {
		return epmd;
	}

	public JLabel getJlblSetEmpno() {
		return JlblSetEmpno;
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

	public JButton getJbtnEdit() {
		return jbtnEdit;
	}

}// class
