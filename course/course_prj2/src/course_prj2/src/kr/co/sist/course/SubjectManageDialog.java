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
import javax.swing.ListSelectionModel;
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
	private JButton jbtnEdit;
	private JTable jtLecture;
	private DefaultTableModel dtmSub;
	private EmployMainFrame emp;
	
	public SubjectManageDialog(EmployMainFrame emp) {
		this.emp = emp;

		Font font = new Font("Pretendard", Font.BOLD, 14);

		jlblSmd = new JLabel("과목관리");
		dcbmDpt = new DefaultComboBoxModel<String>();
		jcbDpt = new JComboBox<String>(dcbmDpt);
		dcbmMajor = new DefaultComboBoxModel<String>();
		jcbMajor = new JComboBox<String>(dcbmMajor);
		jbtnSearch = new JButton("조회");
		jbtnAdd = new JButton("등록");
		jbtnEdit = new JButton("수정");
		jlBack = new JLabel(new ImageIcon("C:/Users/dltmd/Desktop/backgr.png"));

		// 테이블
		String[] columnNames = { "No", "과목코드", "과목명", "학부명", "학과명", 
				"교수명", "학점", "이수구분" };
		dtmSub = new DefaultTableModel(null, columnNames);
		jtLecture = new JTable(dtmSub);
		JScrollPane jspJtSub = new JScrollPane(jtLecture);

		// 행크기 변경 - setRowHeight
		jtLecture.setRowHeight(25);
		jtLecture.getColumnModel().getColumn(0).setPreferredWidth(30);
		jtLecture.getColumnModel().getColumn(1).setPreferredWidth(60);
		jtLecture.getColumnModel().getColumn(5).setPreferredWidth(30);

		setLayout(null);

		// setBounds
		jlBack.setBounds(0, 0, 1000, 700);
		jlblSmd.setBounds(115, 65, 210, 50);
		jcbDpt.setBounds(110, 118, 125, 30);
		jcbMajor.setBounds(245, 118, 125, 30);
		jbtnSearch.setBounds(380, 118, 60, 30);
		jbtnAdd.setBounds(710, 540, 80, 30);
		jbtnEdit.setBounds(795, 540, 80, 30);
		jspJtSub.setBounds(110, 170, 770, 355);

		// setFont
		jlblSmd.setFont(new Font("Pretendard", Font.BOLD, 20));
		jcbDpt.setFont(font);
		jcbMajor.setFont(font);
		jbtnSearch.setFont(font);
		jbtnAdd.setFont(font);
		jbtnEdit.setFont(font);
		jtLecture.setFont(font);

		// setBackground
		jcbDpt.setBackground(new Color(0xE0E0E0));
		jcbMajor.setBackground(new Color(0xE0E0E0));
		jbtnSearch.setBackground(new Color(0xE0E0E0));
		jbtnAdd.setBackground(new Color(0xE0E0E0));
		jbtnEdit.setBackground(new Color(0xE0E0E0));
		jbtnSearch.setBorder(null);
		jbtnAdd.setBorder(null);
		jbtnEdit.setBorder(null);
		
		//event
		SubjectManageEvt smEvt=new SubjectManageEvt(this);
		jbtnAdd.addActionListener(smEvt);
		jbtnSearch.addActionListener(smEvt);
		jcbDpt.addActionListener(smEvt);
		jcbMajor.addActionListener(smEvt);
		jbtnEdit.addActionListener(smEvt);
		
		// 테이블의 선택 모드 설정
		jtLecture.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		
		// add
		add(jcbDpt);
		add(jcbMajor);
		add(jbtnSearch);
		add(jlblSmd);
		add(jbtnAdd);
		add(jbtnEdit);
		add(jspJtSub);

		// 배경
		add(jlBack);

		setBounds(500, 150, 1000, 700);
		setVisible(true);
		setResizable(false);
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

		public JButton getJbtnEdit() {
		return jbtnEdit;
	}

	public JTable getJtLecture() {
		return jtLecture;
	}

	public DefaultTableModel getDtmSub() {
		return dtmSub;
	}


}// class
