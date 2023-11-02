package kr.co.sist.course;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.io.IOException;

import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;

import kr.co.sist.dao.ClientImageIO;

//---------------  관리자용 학생 관리 - 등록/수정 ---------------
@SuppressWarnings("serial")
public class EmployStuEditManageDialog extends JDialog {

	private EmployStuManageDialog esmd;
	private DefaultComboBoxModel<String> dcbmDept;
	private JComboBox<String> jcbDept;
	private DefaultComboBoxModel<String> dcbmMajor;
	private JComboBox<String> jcbMajor;
	private DefaultComboBoxModel<Integer> dcbmLevel;
	private JComboBox<Integer> jcbLevel;
	private DefaultComboBoxModel<String> dcbmEmail;
	private JComboBox<String> jcbEmail;
	private JTextField jtfStuNo;
	private JTextField jtfName;
	private JTextField jtfPhone;
	private JTextField jtfEmail;
	private JTextField jtfAddr;
	private JButton jbtnEdit;
	private JButton jbtnEditImg;
	private JLabel jlblImg;

	/**
	 * 학생 등록/수정 Dialog
	 * @param esmd
	 * @param esmVO - 수정시 선택한 학생 정보 받아오는 VO
	 * @param flag - 등록이면 true, 수정이면 false
	 */
	public EmployStuEditManageDialog(EmployStuManageDialog esmd, EmployStuManageVO esmVO, boolean flag) {
		super(esmd, flag ? "학생 등록" : "학생 수정", true);
		this.esmd = esmd;

		//// 라벨 ////
		JLabel jlblTitle;
		JLabel jlblStuno = new JLabel("학번");
		JLabel jlblName = new JLabel("이름");
		JLabel jlblDept = new JLabel("학부");
		JLabel jlblMajor = new JLabel("학과");
		JLabel jlblLevel = new JLabel("학년");
		JLabel jlblPhone = new JLabel("전화번호");
		JLabel jlblPhoneInfo = new JLabel("예 ) 010-1234-5678 ");
		JLabel jlblEmail = new JLabel("이메일");
		JLabel jlblAddr = new JLabel("주소");
		jlblImg = new JLabel(new ImageIcon("E:/dev/workspace/course_ysy/src/kr/co/sist/course/images/user.png"));
		JLabel jlblback = new JLabel(
				new ImageIcon("E:/dev/workspace/course_ysy/src/kr/co/sist/course/images/editBackground.png"));
		
		//// 텍스트 필드 ////
		jtfStuNo = new JTextField(); // 학번
		jtfName = new JTextField(); // 이름
		jtfPhone = new JTextField(); // 전화번호
		jtfEmail = new JTextField(); // 이메일
		jtfAddr = new JTextField(); //주소
		
		jtfStuNo.setEditable(false);
		
		jbtnEditImg = new JButton("편집");

		//// 콤보 박스 ///
		// 학부
		dcbmDept = new DefaultComboBoxModel<String>();
		jcbDept = new JComboBox<String>(dcbmDept);
		// 학과
		dcbmMajor = new DefaultComboBoxModel<String>();
		jcbMajor = new JComboBox<String>(dcbmMajor);
		// 학년
		dcbmLevel = new DefaultComboBoxModel<Integer>();
		jcbLevel = new JComboBox<Integer>(dcbmLevel);
		// 이메일
		dcbmEmail = new DefaultComboBoxModel<String>();
		jcbEmail = new JComboBox<String>(dcbmEmail);

		dcbmEmail.addElement("@naver.com");
		dcbmEmail.addElement("@gmail.com");
		dcbmEmail.addElement("@daum.net");
		dcbmEmail.addElement("@nate.com");
		
		dcbmLevel.addElement(1);
		dcbmLevel.addElement(2);
		dcbmLevel.addElement(3);
		dcbmLevel.addElement(4);
		
		// addEvent
		EmployStuEditManageEvt eseme = null;
//		EmployStuEditManageEvt eseme;
		
		//true면 등록, false면 수정
		if(flag) {
			eseme = new EmployStuEditManageEvt(this);
			jlblTitle = new JLabel("학생 등록");
			jbtnEdit = new JButton("등록");
			jtfStuNo.setText("등록시 자동 생성");
			add(jbtnEditImg);
		}else {
			eseme = new EmployStuEditManageEvt(this, esmVO.getDptName());
			jlblTitle = new JLabel("학생 수정");
			jbtnEdit = new JButton("수정");
			jtfStuNo.setText(String.valueOf(esmVO.getStuno()));
			jtfName.setText(esmVO.getsName());
			dcbmDept.setSelectedItem(esmVO.getDptName());			
			dcbmMajor.setSelectedItem(esmVO.getMajorName());
			dcbmLevel.setSelectedItem(esmVO.getNowLevel());
			jtfEmail.setText(esmVO.getEmail().equals("-") ? "-" : esmVO.getEmail().substring(0,esmVO.getEmail().indexOf("@")));
			dcbmEmail.setSelectedItem(esmVO.getEmail().equals("-") ? "@naver.com" : esmVO.getEmail().substring(esmVO.getEmail().indexOf("@")));
			jtfPhone.setText(esmVO.getPhone());
			jtfAddr.setText(esmVO.getAddr());
			try {
				jlblImg.setIcon(ClientImageIO.readImage(String.valueOf(esmVO.getStuno())));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		//// 배경 색 설정 ////
		Color backgroundColor = Color.decode("#FCF7F5");
		
		// getContentPane() 메서드를 사용하여 배경색 설정
		Container contentPane = getContentPane();
		contentPane.setBackground(backgroundColor);
		
		// setBorder
		LineBorder border = new LineBorder(new Color(0xCFCFCF));
		
		jtfStuNo.setBorder(border);
		jtfName.setBorder(border);
		jtfPhone.setBorder(border);
		jtfEmail.setBorder(border);
		jtfAddr.setBorder(border);
		jbtnEdit.setBorder(null);
		jbtnEditImg.setBorder(null);
		
		// setBackground
		jcbDept.setBackground(Color.white);
		jcbMajor.setBackground(Color.white);
		jcbEmail.setBackground(Color.white);
		jcbLevel.setBackground(Color.white);
		jbtnEdit.setBackground(new Color(0xE0E0E0));
		jbtnEditImg.setBackground(jbtnEdit.getBackground());
		jtfStuNo.setForeground(Color.gray);
		jlblPhoneInfo.setForeground(Color.gray);

		//// Bounds ////
		// 라벨
		jlblback.setBounds(0, 0, 800, 610);
		jlblTitle.setBounds(30, 13, 210, 50);
		jlblImg.setBounds(90, 78, 190, 250);
		jlblStuno.setBounds(310, 73, 100, 30);
		jlblName.setBounds(310, 123, 140, 30);
		jlblDept.setBounds(310, 173, 60, 30);
		jlblMajor.setBounds(310, 223, 80, 30);
		jlblLevel.setBounds(310, 273, 80, 30);
		jlblPhone.setBounds(310, 323, 100, 30);
		jlblPhoneInfo.setBounds(576, 323, 150, 30);
		jlblEmail.setBounds(310, 373, 80, 30);
		jlblAddr.setBounds(310, 423, 80, 30);
		// 텍스트필드
		jtfStuNo.setBounds(425, 73, 140, 30);
		jtfName.setBounds(425, 123, 140, 30);
		jtfPhone.setBounds(425, 323, 140, 30);
		jtfEmail.setBounds(425, 373, 140, 30);
		jtfAddr.setBounds(425, 423, 268, 30);
		// 콤보박스
		jcbDept.setBounds(425, 173, 140, 30);
		jcbMajor.setBounds(425, 223, 140, 30);
		jcbLevel.setBounds(425, 273, 140, 30);
		jcbEmail.setBounds(575, 373, 115, 30);
		// 버튼
		jbtnEdit.setBounds(330, 490, 100, 40);
		jbtnEditImg.setBounds(140, 341, 90, 30);
		
		//// Font ////
		Font font = new Font("Pretendard", Font.BOLD, 25);
		Font font14 = new Font("Pretendard", Font.BOLD, 14);
		jlblTitle.setFont(new Font("Pretendard", Font.BOLD, 22));
		jlblStuno.setFont(font);
		jlblName.setFont(font);
		jlblDept.setFont(font);
		jlblMajor.setFont(font);
		jlblLevel.setFont(font);
		jlblPhone.setFont(font);
		jlblPhoneInfo.setFont(font14);
		jlblEmail.setFont(font);
		jlblAddr.setFont(font);
		jbtnEdit.setFont(font14);
		jbtnEditImg.setFont(font14);
		jcbDept.setFont(font14);
		jcbMajor.setFont(font14);
		jcbLevel.setFont(font14);
		jcbEmail.setFont(font14);
		jtfStuNo.setFont(font14);
		jtfName.setFont(font14);
		jtfPhone.setFont(font14);
		jtfEmail.setFont(font14);
		jtfAddr.setFont(font14);
		
		//// add ////
		add(jlblTitle);
		add(jlblImg);
		add(jlblStuno);
		add(jlblName);
		add(jlblDept);
		add(jlblMajor);
		add(jlblLevel);
		add(jlblPhone);
		add(jlblPhoneInfo);
		add(jlblEmail);
		add(jlblAddr);
		add(jtfStuNo);
		add(jtfName);
		add(jtfPhone);
		add(jtfEmail);
		add(jtfAddr);
		add(jcbDept);
		add(jcbMajor);
		add(jcbLevel);
		add(jcbEmail);
		add(jbtnEdit);
		add(jlblback);
		
		
		jbtnEdit.addActionListener(eseme);
		jbtnEditImg.addActionListener(eseme);
		jcbDept.addActionListener(eseme);

		setLayout(null);
		setResizable(false);

		setBounds(esmd.getX() + 100, esmd.getY() + 50, 800, 610);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}// EmployProfAddManageDialog

	public EmployStuManageDialog getEsmd() {
		return esmd;
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

	public JTextField getJtfStuNo() {
		return jtfStuNo;
	}

	public JTextField getJtfAddr() {
		return jtfAddr;
	}

	public DefaultComboBoxModel<Integer> getDcbmLevel() {
		return dcbmLevel;
	}

	public JComboBox<Integer> getJcbLevel() {
		return jcbLevel;
	}

	public JLabel getJlblImg() {
		return jlblImg;
	}

	public JButton getJbtnEditImg() {
		return jbtnEditImg;
	}


}// class
