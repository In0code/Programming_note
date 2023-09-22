package kr.co.sist.course;

import java.awt.Color;
import java.awt.Font;

import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.LineBorder;
import javax.swing.table.DefaultTableModel;

@SuppressWarnings("serial")
public class SubjectManageDialog extends JDialog {

	private JLabel jlblSmd;
	private JLabel jlBack;
	private JComboBox<String> jcbDpt;
	private DefaultComboBoxModel<String> dcbmDpt;
	private JComboBox<String> jcbMajor;
	private DefaultComboBoxModel<String> dcbmMajor;
	private JButton jbtnSearch;
	private JButton jbtnAdd;
	private JTable jtLecture;
	private EmployMainFrame emf;

	public SubjectManageDialog(EmployMainFrame emf) {
		this.emf = emf;

		Font font = new Font("Pretendard", Font.BOLD, 14);

		jlblSmd = new JLabel("과목관리");
		dcbmDpt = new DefaultComboBoxModel<String>();
		jcbDpt = new JComboBox<String>(dcbmDpt);
		dcbmMajor = new DefaultComboBoxModel<String>();
		jcbMajor = new JComboBox<String>(dcbmMajor);
		jbtnSearch = new JButton("조회");
		jbtnAdd = new JButton("등록");
		jlBack = new JLabel(new ImageIcon("C:/Users/dltmd/Desktop/backgr.png"));

		// 테이블
		String[] columnNames = { "No", "과목코드", "과목명", "학부명", "학과명", 
				"교수명", "학점", "이수구분" };
		DefaultTableModel dtmSub = new DefaultTableModel(null, columnNames);
		jtLecture = new JTable(dtmSub);
		JScrollPane jspJtSub = new JScrollPane(jtLecture);

		// 행크기 변경 - setRowHeight
		jtLecture.setRowHeight(25);
		jtLecture.getColumnModel().getColumn(0).setPreferredWidth(30);
		jtLecture.getColumnModel().getColumn(1).setPreferredWidth(60);
		jtLecture.getColumnModel().getColumn(5).setPreferredWidth(30);

		// 학부 콤보박스
		dcbmDpt.addElement("컴퓨터공학부");
		dcbmDpt.addElement("인문사회부");
		dcbmDpt.addElement("연극학부");
		dcbmDpt.addElement("건축학부");
		dcbmDpt.addElement("체육학부");
		// 학과 콤보박스
		dcbmMajor.addElement("컴퓨터과학과");
		dcbmMajor.addElement("국어국문학과");
		dcbmMajor.addElement("연극영화과");
		dcbmMajor.addElement("건축공학과");
		dcbmMajor.addElement("사회체육학과");

		setLayout(null);

		// setBounds
		jlBack.setBounds(0, 0, 1000, 700);
		jlblSmd.setBounds(115, 65, 210, 50);
		jcbDpt.setBounds(110, 118, 125, 30);
		jcbMajor.setBounds(245, 118, 125, 30);
		jbtnSearch.setBounds(380, 118, 60, 30);
		jbtnAdd.setBounds(795, 540, 80, 30);
		jspJtSub.setBounds(110, 170, 770, 355);
		

		// setFont
		jlblSmd.setFont(new Font("Pretendard", Font.BOLD, 20));
		jcbDpt.setFont(font);
		jcbMajor.setFont(font);
		jbtnSearch.setFont(font);
		jbtnAdd.setFont(font);
		jtLecture.setFont(font);

		// setBackground
		jcbDpt.setBackground(new Color(0xE0E0E0));
		jcbMajor.setBackground(new Color(0xE0E0E0));
		jbtnSearch.setBackground(new Color(0xE0E0E0));
		jbtnAdd.setBackground(new Color(0xE0E0E0));
		jbtnSearch.setBorder(null);
		jbtnAdd.setBorder(null);

		// add
		add(jcbDpt);
		add(jcbMajor);
		add(jbtnSearch);
		add(jlblSmd);
		add(jbtnAdd);
		add(jspJtSub);

		// 배경
		add(jlBack);

		setResizable(false);
		setBounds(500, 150, 1000, 700);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}// SubjectManageDialog

	public JLabel getJlblSmd() {
		return jlblSmd;
	}

	public JLabel getJlBack() {
		return jlBack;
	}

	public JComboBox<String> getJcbDpt() {
		return jcbDpt;
	}

	public DefaultComboBoxModel<String> getDcbmDpt() {
		return dcbmDpt;
	}

	public JComboBox<String> getJcbMajor() {
		return jcbMajor;
	}

	public DefaultComboBoxModel<String> getDcbmMajor() {
		return dcbmMajor;
	}

	public JButton getJbtnSearch() {
		return jbtnSearch;
	}

	public JButton getJbtnAdd() {
		return jbtnAdd;
	}

	public JTable getJtLecture() {
		return jtLecture;
	}


}// class
