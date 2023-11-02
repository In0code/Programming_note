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
import javax.swing.JTextField;
import javax.swing.border.LineBorder;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;

/**
 * 인영 교수 관리 Dialog
 * 
 * @author user
<<<<<<< HEAD
 *ㄴ
=======
 *
>>>>>>> refs/heads/main
 */
@SuppressWarnings("serial")
public class EmployProfManageDialog extends JDialog {

	private EmployMainFrame emf;

	private JComboBox<String> jcbSearch;
	private DefaultComboBoxModel<String> dcbmSearch;
	private JTextField jtfSearch;
	private JTable jtProf;
	private JButton jbtnAdd;
	private JButton jbtnEdit;
	private JButton jbtnSearch;
	private EmployProfManageEvt epme;
	private DefaultTableModel dtmProf;

	public EmployProfManageDialog(EmployMainFrame emf) {
		super(emf, "관리자", true);
		this.emf = emf;

		// 타이틀
		JLabel jlblTitle = new JLabel("교수관리");
		// 배경
		JLabel jlblback = new JLabel(new ImageIcon("E:/images/backgr.png"));

		dcbmSearch = new DefaultComboBoxModel<String>();
		jcbSearch = new JComboBox<String>(dcbmSearch);

		dcbmSearch.addElement("사번");
		dcbmSearch.addElement("이름");

		// 검색창
		jtfSearch = new JTextField();
		// 등록버튼
		jbtnAdd = new JButton("등록");
		jbtnEdit = new JButton("수정");
		// 조회버튼
		jbtnSearch = new JButton("조회");

		///// JTable/////
		// 테이블
		dtmProf = new DefaultTableModel();
		// 컬럼 이름 추가
		dtmProf.addColumn("No");
		dtmProf.addColumn("사번");
		dtmProf.addColumn("이름");
		dtmProf.addColumn("학부명");
		dtmProf.addColumn("학과명");
		dtmProf.addColumn("전화번호");
		dtmProf.addColumn("이메일");
		// JTable 컬럼 값 수정 불가
		jtProf = new JTable(dtmProf) {
			@Override
			public boolean isCellEditable(int row, int column) {
				return false;
			}
		};

		JScrollPane jspJtProf = new JScrollPane(jtProf);

		// JTable 컬럼 width 크기 설정
		TableColumn column = jtProf.getColumnModel().getColumn(0);
		column.setPreferredWidth(5);
		column = jtProf.getColumnModel().getColumn(1);
		column.setPreferredWidth(50);
		column = jtProf.getColumnModel().getColumn(2);
		column.setPreferredWidth(20);
		column = jtProf.getColumnModel().getColumn(6);
		column.setPreferredWidth(90);
		// 컬럼 height 크기 설정
		jtProf.setRowHeight(25);
		// JTable 크기 조절 불가
		for (int i = 0; i < jtProf.getColumnModel().getColumnCount(); i++) {
			jtProf.getColumnModel().getColumn(i).setResizable(false);
		} // end for

		// Bounds
		jlblback.setBounds(0, 0, 1000, 700);
		jlblTitle.setBounds(115, 65, 210, 50);
		jcbSearch.setBounds(555, 80, 100, 30);
		jtfSearch.setBounds(665, 80, 140, 30);
		jbtnSearch.setBounds(815, 80, 60, 30);
		jbtnAdd.setBounds(700, 540, 80, 30);
		jbtnEdit.setBounds(795, 540, 80, 30);
		jspJtProf.setBounds(110, 170, 770, 350);

		// Font 설정
		Font font = new Font("Pretendard", Font.BOLD, 14);
//		jtProf.setFont(font);
		jlblTitle.setFont(new Font("Pretendard", Font.BOLD, 20));
		jcbSearch.setFont(font);
		jtfSearch.setFont(font);
		jbtnSearch.setFont(font);
		jbtnAdd.setFont(font);
		jbtnEdit.setFont(font);
		jtProf.setFont(new Font("Pretendard", Font.BOLD, 13));

		// background-color 설정
		jbtnSearch.setBackground(new Color(0xE0E0E0));
		jbtnAdd.setBackground(new Color(0xE0E0E0));
		jbtnEdit.setBackground(new Color(0xE0E0E0));
		jtfSearch.setBorder(new LineBorder(new Color(0xCFCFCF)));
		jbtnSearch.setBorder(null);
		jbtnAdd.setBorder(null);
		jbtnEdit.setBorder(null);
		jcbSearch.setBackground(Color.white);

		/// 이벤트 연결///
		epme = new EmployProfManageEvt(this);
		jbtnAdd.addActionListener(epme);
		jbtnEdit.addActionListener(epme);

		jbtnSearch.addActionListener(epme);

		// add
		add(jlblTitle);
		add(jbtnSearch);
		add(jbtnAdd);
		add(jbtnEdit);
		add(jtfSearch);
		add(jcbSearch);
		add(jspJtProf);

		// add background
		add(jlblback);

		setLayout(null); // 수동 배치
		setResizable(false); // 창 크기 조절 불가

		setBounds(emf.getX() + 100, emf.getY() + 50, 1000, 700);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

	}// EmployProfManageDialog

	public EmployMainFrame getEmf() {
		return emf;
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

	public JTable getJtProf() {
		return jtProf;
	}

	public JButton getJbtnAdd() {
		return jbtnAdd;
	}

	public JButton getJbtnEdit() {
		return jbtnEdit;
	}

	public JButton getJbtnSearch() {
		return jbtnSearch;
	}

	public EmployProfManageEvt getEpme() {
		return epme;
	}

	public DefaultTableModel getDtmProf() {
		return dtmProf;
	}

}// class
