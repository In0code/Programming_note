package kr.co.sist.course;

import java.awt.Color;
import java.awt.Font;

import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;
import javax.swing.table.DefaultTableModel;

// ---------------  관리자용 학생 관리 ---------------
@SuppressWarnings("serial")
public class EmployStuManageDialog extends JDialog {

	private EmployMainFrame emf;
	private DefaultComboBoxModel<String> dcbmDept;
	private JComboBox<String> jcbDept;
	private DefaultComboBoxModel<String> dcbmMajor;
	private JComboBox<String> jcbMajor;
	private DefaultComboBoxModel<String> dcbmSearch;
	private JComboBox<String> jcbSearch;
	private DefaultTableModel dtmStu;
	private JTable jtStu;
	private JTextField jtfSearch;
	private JButton jbtnAdd;
	private JButton jbtnEdit;
	private JButton jbtnSearch;
	private JButton jbtnDMSearch;

	/**
	 * 관리자용 학생 관리 Dialog
	 * @param main
	 */
	public EmployStuManageDialog(EmployMainFrame emf) {
		super(emf, "관리자", true);
		this.emf = emf;
		Font font = new Font("Pretendard", Font.BOLD, 14);

		setLayout(null);

		// 타이틀
		JLabel jlblTitle = new JLabel("학생 관리");
		// 배경
		JLabel jlblback = new JLabel(
				new ImageIcon("C:/Users/user/git/group_prj/course_prj/src/kr/co/sist/course/images/backgr.png"));
		// 검색
		dcbmSearch = new DefaultComboBoxModel<String>();
		jcbSearch = new JComboBox<String>(dcbmSearch);
		dcbmSearch.addElement("학번");
		dcbmSearch.addElement("이름");
		// 검색창
		jtfSearch = new JTextField();
		// 등록 버튼
		jbtnAdd = new JButton("등록");
		// 수정 버튼
		jbtnEdit = new JButton("수정");
		// 검색 조회 버튼
		jbtnSearch = new JButton("조회");
		// 학부 학과 조회 버튼
		jbtnDMSearch = new JButton("조회");
		// 테이블
		String[] columnNames = { "No", "학번", "이름", "학부", "학과", "학년", "전화번호", "이메일", "주소" };			
		dtmStu = new DefaultTableModel(null, columnNames);
		
		jtStu = new JTable(dtmStu) {
		    // 셀 편집 안되게 설정
		    @Override
		    public boolean isCellEditable(int row, int column) {
		        return false;
		    }
		};
		
		JScrollPane jspJtStu = new JScrollPane(jtStu);
		
		// 학부
		dcbmDept = new DefaultComboBoxModel<String>();
		jcbDept = new JComboBox<String>(dcbmDept);
		
		// 학과
		dcbmMajor = new DefaultComboBoxModel<String>();
		jcbMajor = new JComboBox<String>(dcbmMajor);

		// 행크기 변경 - setRowHeight
		jtStu.setRowHeight(25);
		jtStu.getColumnModel().getColumn(0).setPreferredWidth(2);
		jtStu.getColumnModel().getColumn(1).setPreferredWidth(43);
		jtStu.getColumnModel().getColumn(2).setPreferredWidth(55);
		jtStu.getColumnModel().getColumn(5).setPreferredWidth(10);
		jtStu.getColumnModel().getColumn(8).setPreferredWidth(100);

		// setFont
		jlblTitle.setFont(new Font("Pretendard", Font.BOLD, 20));
		jcbSearch.setFont(font);
		jcbDept.setFont(font);
		jcbMajor.setFont(font);
		jtfSearch.setFont(font);
		jbtnSearch.setFont(font);
		jbtnDMSearch.setFont(font);
		jbtnAdd.setFont(font);
		jbtnEdit.setFont(font);
		jtStu.setFont(new Font("Pretendard", Font.BOLD, 12));

		// setBounds
		jlblback.setBounds(0, 0, 1000, 700);
		jlblTitle.setBounds(115, 65, 210, 50);
		jcbSearch.setBounds(555, 80, 100, 30);
		jtfSearch.setBounds(665, 80, 140, 30);
		jbtnSearch.setBounds(815, 80, 60, 30);
		jbtnAdd.setBounds(700, 540, 80, 30);
		jbtnEdit.setBounds(795, 540, 80, 30); 
		jspJtStu.setBounds(110, 170, 770, 355);
		jcbDept.setBounds(113, 118, 120, 30);
		jcbMajor.setBounds(243, 118, 120, 30);
		jbtnDMSearch.setBounds(373, 118, 60, 30);

		// setBackground
		Color color = new Color(0xE0E0E0);
		jcbSearch.setBackground(Color.white);
		jcbDept.setBackground(Color.white);
		jcbMajor.setBackground(Color.white);
		jbtnSearch.setBackground(color);
		jbtnDMSearch.setBackground(color);
		jbtnAdd.setBackground(color);
		jbtnEdit.setBackground(color);
		jtfSearch.setBorder(new LineBorder(new Color(0xCFCFCF)));
		
		// setBorder
		jcbDept.setBorder(null);
		jbtnSearch.setBorder(null);
		jbtnDMSearch.setBorder(null);
		jbtnAdd.setBorder(null);
		jbtnEdit.setBorder(null);

		// add
		jbtnEdit.setEnabled(false);
		add(jbtnAdd);
		add(jbtnEdit);
		add(jlblTitle);
		add(jcbSearch);
		add(jtfSearch);
		add(jbtnSearch);
		add(jspJtStu);
		add(jcbDept);
		add(jcbMajor);
		add(jbtnDMSearch);
		
		// addEvent
		EmployStuManageEvt esme = new EmployStuManageEvt(this);
		jbtnSearch.addActionListener(esme);
		jbtnDMSearch.addActionListener(esme);
		jbtnAdd.addActionListener(esme);
		jbtnEdit.addActionListener(esme);
		jtStu.addMouseListener(esme);
		jcbDept.addActionListener(esme);
		jtfSearch.addMouseListener(esme);
		jcbSearch.addActionListener(esme);

		// 배경
		add(jlblback);
		
		setResizable(false);
		setBounds(emf.getX() + 100, emf.getY() + 50, 1000, 700);
		setVisible(true);
	}

	public DefaultComboBoxModel<String> getDcbmSearch() {
		return dcbmSearch;
	}

	public JComboBox<String> getJcbSearch() {
		return jcbSearch;
	}

	public JTextField getJtfSearch() {
		return jtfSearch;
	}

	public JButton getJbtnAdd() {
		return jbtnAdd;
	}

	public JButton getJbtnSearch() {
		return jbtnSearch;
	}

	public JButton getJbtnDMSearch() {
		return jbtnDMSearch;
	}

	public DefaultTableModel getDtmStu() {
		return dtmStu;
	}

	public JTable getJtStu() {
		return jtStu;
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

	public JButton getJbtnEdit() {
		return jbtnEdit;
	}
	
}
