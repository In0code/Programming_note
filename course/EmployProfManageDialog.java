package self_practice_course_prj;

import java.awt.Color;
import java.awt.Font;
import java.sql.SQLException;
import java.util.List;

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

@SuppressWarnings("serial")
//////////////인영 ///////////////
/////////// 교수관리 Dialog ///////////
public class EmployProfManageDialog extends JDialog {

	private EmployMainFrame emf;

	DefaultComboBoxModel<String> dcbmSearch;
	JComboBox<String> jcbSearch;
	JTextField jtfSearch;
	JTable jtProf;
	JButton jbtnAdd;
	JButton jbtnSearch;
	EmployProfManageEvt epme;
	DefaultTableModel dtmProf;

	public EmployProfManageDialog(EmployMainFrame emf) {
		super(emf, "관리자", true);
		this.emf = emf;

		// 타이틀
		JLabel jlblTitle = new JLabel("교수관리");
		// 배경
		JLabel jlblback = new JLabel(
				new ImageIcon("C:/Users/user/git/group_prj/course_prj/src/kr/co/sist/course/images/backgr.png"));

		dcbmSearch = new DefaultComboBoxModel<String>();
		jcbSearch = new JComboBox<String>(dcbmSearch);

		dcbmSearch.addElement("사번");
		dcbmSearch.addElement("이름");

		// 검색창
		jtfSearch = new JTextField();
		// 등록버튼
		jbtnAdd = new JButton("등록");
		// 조회버튼
		jbtnSearch = new JButton("조회");
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
		
		epme=new EmployProfManageEvt(this);

		jtProf = new JTable(dtmProf);

		jtProf.setRowHeight(25);
		JScrollPane jspJtProf = new JScrollPane(jtProf);
		

		// Bounds
		jlblback.setBounds(0, 0, 1000, 700);
		jlblTitle.setBounds(115, 65, 210, 50);
		jcbSearch.setBounds(555, 80, 100, 30);
		jtfSearch.setBounds(665, 80, 140, 30);
		jbtnSearch.setBounds(815, 80, 60, 30);
		jbtnAdd.setBounds(795, 540, 80, 30);
		jspJtProf.setBounds(110, 170, 770, 350);

		// Font
		Font font = new Font("Pretendard", Font.BOLD, 14);
		jlblTitle.setFont(new Font("Pretendard", Font.BOLD, 20));
		jcbSearch.setFont(font);
		jtfSearch.setFont(font);
		jbtnSearch.setFont(font);
		jbtnAdd.setFont(font);
		jspJtProf.setFont(font);

		// back-color
//		jcbSearch.setBackground(new Color(0xE0E0E0));
		jbtnSearch.setBackground(new Color(0xE0E0E0));
		jbtnAdd.setBackground(new Color(0xE0E0E0));
		jtfSearch.setBorder(new LineBorder(new Color(0xE0E0E0)));
		jbtnSearch.setBorder(null);
		jbtnAdd.setBorder(null);

		epme = new EmployProfManageEvt(this);
		jbtnAdd.addActionListener(epme);

		for (int i = 0; i < jtProf.getColumnModel().getColumnCount(); i++) {
			jtProf.getColumnModel().getColumn(i).setResizable(false);
		}
		// add
		add(jlblTitle);
		add(jbtnSearch);
		add(jbtnAdd);
		add(jtfSearch);
		add(jcbSearch);
		add(jspJtProf);

		// add background
		add(jlblback);

		setLayout(null);
		setResizable(false);

		setBounds(emf.getX() + 100, emf.getY() + 50, 1000, 700);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

	}// EmployProfManageDialog
	
	 public void setJtProf(JTable jtProf) {
	        this.jtProf = jtProf;
	        // JTable을 JScrollPane에 추가
	        JScrollPane jspJtProf = new JScrollPane(jtProf);
	        jspJtProf.setBounds(110, 170, 770, 350);
	        add(jspJtProf);
	    }

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
