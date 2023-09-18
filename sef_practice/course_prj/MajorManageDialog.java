package self_practice_course_prj;

import java.awt.Color;
import java.awt.Font;
////////////// 인영 ///////////////
/////////// 학과관리 Dialog ///////////
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

/**
 * 인영 학과관리 Dialog
 * 
 * @author user
 *
 */
@SuppressWarnings("serial")
public class MajorManageDialog extends JDialog {
	private EmployMainFrame emf;

	DefaultComboBoxModel<String> dcbmDpt;
	JComboBox<String> jcbDpt;
	DefaultComboBoxModel<String> dcbmDptAdd;
	JComboBox<String> jcbDptAdd;
	JTextField jtfMajor;
	JTable jtMajor;
	JLabel jlblMajor;
	JLabel jlblDpt;
	JButton jbtnAdd;
	JButton jbtnSearch;
	JButton jbtnChange;
	EmployMainEvt emfe;

	public MajorManageDialog(EmployMainFrame emf) {

		super(emf, "관리자", true);
		this.emf = emf;

		// 타이틀
		JLabel jlblTitle = new JLabel("학과관리");
		// 배경
		JLabel jlblback = new JLabel(
				new ImageIcon("C:/Users/user/git/group_prj/course_prj/src/kr/co/sist/course/images/backgr.png"));
		// 콤보박스
		dcbmDpt = new DefaultComboBoxModel<String>();
		jcbDpt = new JComboBox<String>(dcbmDpt);

		dcbmDptAdd = new DefaultComboBoxModel<String>();
		jcbDptAdd = new JComboBox<String>(dcbmDptAdd);

		// 검색창
		jtfMajor = new JTextField();

		jlblMajor = new JLabel("학부");
		jlblDpt = new JLabel("학과");

		// 등록버튼
		jbtnAdd = new JButton("등록");
		// 조회버튼
		jbtnSearch = new JButton("조회");
		// 조회버튼
		jbtnChange = new JButton("수정");
		// 테이블
		String[] columNames = { "No", "학부", "학과코드", "학과명" };
		DefaultTableModel dtmMajor = new DefaultTableModel(null, columNames);
		jtMajor = new JTable(dtmMajor);
		JScrollPane jspJtMajor = new JScrollPane(jtMajor);

		// Bounds
		jlblback.setBounds(0, 0, 1000, 700);
		jlblTitle.setBounds(115, 65, 210, 50);
		jcbDpt.setBounds(113, 141, 150, 30);
		jcbDptAdd.setBounds(685, 255, 155, 35);
		jtfMajor.setBounds(685, 385, 155, 35);
		jbtnSearch.setBounds(285, 141, 60, 30);
		jbtnAdd.setBounds(683, 459, 80, 30);
		jbtnChange.setBounds(787, 459, 80, 30);
		jlblMajor.setBounds(685, 210, 80, 30);
		jlblDpt.setBounds(685, 340, 80, 30);
		jspJtMajor.setBounds(111, 193, 530, 350);

		// Font
		Font font = new Font("Pretendard", Font.BOLD, 14);
		jlblTitle.setFont(new Font("Pretendard", Font.BOLD, 20));
		jcbDpt.setFont(font);
		jcbDptAdd.setFont(font);
		jbtnSearch.setFont(font);
		jbtnAdd.setFont(font);
		jbtnChange.setFont(font);
		jlblMajor.setFont(new Font("Pretendard", Font.BOLD, 20));
		jlblDpt.setFont(new Font("Pretendard", Font.BOLD, 20));
		jspJtMajor.setFont(font);

		// back-color
		jbtnSearch.setBackground(new Color(0xE0E0E0));
		jbtnAdd.setBackground(new Color(0xE0E0E0));
		jbtnChange.setBackground(new Color(0xE0E0E0));
		jtfMajor.setBorder(new LineBorder(new Color(0xE0E0E0)));
		jbtnSearch.setBorder(null);
		jbtnChange.setBorder(null);
		jbtnAdd.setBorder(null);

		// add
		add(jlblTitle);
		add(jbtnSearch);
		add(jbtnAdd);
		add(jbtnChange);
		add(jcbDptAdd);
		add(jcbDpt);
		add(jtfMajor);
		add(jlblMajor);
		add(jlblDpt);
		add(jspJtMajor);

		// add background
		add(jlblback);

		setLayout(null);
		setResizable(false);

		setBounds(emf.getX() + 100, emf.getY() + 50, 1000, 700);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

	}// MajorManageDialog

	public EmployMainFrame getEmf() {
		return emf;
	}

	public DefaultComboBoxModel<String> getDcbmDpt() {
		return dcbmDpt;
	}

	public JComboBox<String> getJcbDpt() {
		return jcbDpt;
	}

	public DefaultComboBoxModel<String> getDcbmDptAdd() {
		return dcbmDptAdd;
	}

	public JComboBox<String> getJcbDptAdd() {
		return jcbDptAdd;
	}

	public JTextField getJtfMajor() {
		return jtfMajor;
	}

	public JTable getJtMajor() {
		return jtMajor;
	}

	public JLabel getJlblMajor() {
		return jlblMajor;
	}

	public JLabel getJlblDpt() {
		return jlblDpt;
	}

	public JButton getJbtnAdd() {
		return jbtnAdd;
	}

	public JButton getJbtnSearch() {
		return jbtnSearch;
	}

	public JButton getJbtnChange() {
		return jbtnChange;
	}

	public EmployMainEvt getEmfe() {
		return emfe;
	}

}// class
