package kr.co.sist.course;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

@SuppressWarnings("serial")
public class LecturePlanDialog extends JDialog {

	private JButton jbtnApply;
	private StudentMainFrame smf;
	private JTextField jtSubName;
	private JTextField jtSubGoal;
	private JTextArea jtaSubInfo;
	private StudentSubjectDialog ssDL;
	private MySubjectDialog msD;
	private LecturePlanEvt le;
	private Font font;
	private String subjectCode;

	public LecturePlanDialog(StudentSubjectDialog ssDL, String subjectCode) {

		this();

		this.subjectCode = subjectCode;
		System.out.println("s생성자 " + subjectCode);
		this.ssDL = ssDL;

		jbtnApply = new JButton("신청");

		jbtnApply.setFont(font);
		jbtnApply.setBounds(310, 450, 80, 30);
		jbtnApply.setBackground(Color.white);
		jbtnApply.setBorder(null);
		add(jbtnApply);
		le = new LecturePlanEvt(this);
		jbtnApply.addActionListener(le);

	}

	public LecturePlanDialog(MySubjectDialog msd, String subjectCode) {
		this();

		this.msD = msd;
		System.out.println("m생성자 " + subjectCode);
		this.subjectCode = subjectCode;
		le = new LecturePlanEvt(this);
	}

	public LecturePlanDialog() {
		font = new Font("Pretendard", Font.BOLD, 14);
		setLayout(null);
		// 타이틀
		JLabel jlblTitle = new JLabel("강의계획서");

		System.out.println("생성자LecturePlanDialog ");

		// 버튼

		// 라벨
		JLabel jlblSubName = new JLabel("과목명");
		JLabel jlblSubGoal = new JLabel("학습목표");
		JLabel jlblSubInfo = new JLabel("강의내용");
		// 내용창
		jtSubName = new JTextField();
		jtSubGoal = new JTextField();
		jtSubName.setEditable(false);
		jtSubGoal.setEditable(false);
		// 강의내용창
		jtaSubInfo = new JTextArea();
		jtaSubInfo.setEditable(false);
		jtaSubInfo.setLineWrap(true);
		JScrollPane jspjtSubInfo = new JScrollPane(jtaSubInfo);

		// set font
		jlblTitle.setFont(new Font("Pretendard", Font.BOLD, 20));
		jlblSubName.setFont(new Font("Pretendard", Font.BOLD, 17));
		jlblSubGoal.setFont(new Font("Pretendard", Font.BOLD, 17));
		jlblSubInfo.setFont(new Font("Pretendard", Font.BOLD, 17));

		jtSubName.setFont(new Font("Pretendard", Font.BOLD, 17));
		jtSubGoal.setFont(new Font("Pretendard", Font.BOLD, 17));
		jtaSubInfo.setFont(new Font("Pretendard", Font.BOLD, 17));

		// 배경색설정
		Color backgroundColor = Color.decode("#D0E0EF");
		Container contentPane = getContentPane();
		contentPane.setBackground(backgroundColor);

		jlblTitle.setBounds(25, 10, 210, 50);
		jlblSubName.setBounds(50, 85, 100, 30);
		jlblSubGoal.setBounds(50, 135, 100, 30);
		jtSubName.setBounds(120, 85, 510, 30);
		jtSubGoal.setBounds(120, 138, 510, 30);
		jspjtSubInfo.setBounds(50, 220, 580, 210);
		jlblSubInfo.setBounds(50, 180, 100, 30);
		jtSubName.setBackground(Color.white);
		jtSubGoal.setBackground(Color.white);
		

		add(jlblTitle);
		add(jlblSubName);
		add(jlblSubGoal);
		add(jtSubName);
		add(jtSubGoal);
		add(jspjtSubInfo);
		add(jlblSubInfo);
		setResizable(false);
		setBounds(650, 230, 700, 540);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}

	public JTextField getJtSubName() {
		return jtSubName;
	}

	public void setJtSubName(JTextField jtSubName) {
		this.jtSubName = jtSubName;
	}

	public StudentSubjectDialog getSsDL() {
		return ssDL;
	}

	public void setSsDL(StudentSubjectDialog ssDL) {
		this.ssDL = ssDL;
	}

	public JTextField getJtSubGoal() {
		return jtSubGoal;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public MySubjectDialog getMsD() {
		return msD;
	}

	public LecturePlanEvt getLe() {
		return le;
	}

	public Font getFont() {
		return font;
	}

	public void setJtSubGoal(JTextField jtSubGoal) {
		this.jtSubGoal = jtSubGoal;
	}

	public JTextArea getJtaSubInfo() {
		return jtaSubInfo;
	}

	public void setJtaSubInfo(JTextArea jtaSubInfo) {
		this.jtaSubInfo = jtaSubInfo;
	}

	/**
	 * @return the jbtnApply
	 */
	public JButton getJbtnApply() {
		return jbtnApply;
	}

	/**
	 * @return the smf
	 */
	public StudentMainFrame getSmf() {
		return smf;
	}

}
