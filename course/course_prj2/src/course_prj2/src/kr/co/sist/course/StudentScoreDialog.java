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
import javax.swing.table.DefaultTableModel;

/**
 * 학생 성적을 보여주는 화면 설정
 * @author user
 */
@SuppressWarnings("serial")
public class StudentScoreDialog extends JDialog {
	
	private StudentMainFrame smf;
	private JTable jtScore;
	private DefaultTableModel dtmScore;
	private JButton jbtnSearch;
	private JComboBox<String> jcbSemester;
	private DefaultComboBoxModel<String> dcbmSemester;
	
	public StudentScoreDialog(StudentMainFrame smf) {
		this.smf = smf;
		super.setModal(false);
		super.setTitle("성적 조회");
		
		Font font14 = new Font("Pretendard", Font.BOLD, 14);
		
		//배경화면 설정 라벨
		JLabel bgLabel = new JLabel(new ImageIcon("E:/images/backgr.png"));
		bgLabel.setBounds(0, 0, 1000, 700);
		
		//타이틀 설정
		JLabel jlTitle = new JLabel("성적조회");
		jlTitle.setBounds(145, 100, 100, 30);
		jlTitle.setFont(new Font("Pretendard", Font.BOLD, 24));
		
		//콤보박스 설정
		dcbmSemester = new DefaultComboBoxModel<String>();
		jcbSemester = new JComboBox<String>(dcbmSemester);
		jcbSemester.setBounds(jlTitle.getX()-3, jlTitle.getY()+40, 150, 30);
		jcbSemester.setBackground(Color.white);
		jcbSemester.setFont(font14);
		
		//성적 테이블 설정
		String[] columnNames = {"학과명", "과목명", "평점", "성적", "이수구분"};
		dtmScore = new DefaultTableModel(null, columnNames);
		//컬럼 값 수정 불가
		jtScore = new JTable(dtmScore) {
			@Override
			public boolean isCellEditable(int row, int column) {
				return false;
			}
		};
		
		JScrollPane jsp = new JScrollPane(jtScore);
		jsp.setBounds(jcbSemester.getX(), jcbSemester.getY()+40, 705, 385);
		
		jtScore.getTableHeader().setReorderingAllowed(false);
		jtScore.getTableHeader().setFont(new Font("맑은 고딕", Font.BOLD, 14));
		jtScore.getColumnModel().getColumn(0).setPreferredWidth(110);
		jtScore.getColumnModel().getColumn(1).setPreferredWidth(210);
		jtScore.setRowHeight(30);
		jtScore.setFont(font14);
		
		//검색 버튼 설정
		jbtnSearch = new JButton("조회");
		jbtnSearch.setBounds(jcbSemester.getX()+160, jcbSemester.getY(), 80, 30);
		jbtnSearch.setBackground(new Color(0xE0E0E0));
		jbtnSearch.setBorder(null);
		jbtnSearch.setFont(font14);
		
		//이벤트 연결
		StudentScoreEvt sse = new StudentScoreEvt(this);
		jbtnSearch.addActionListener(sse);
		addWindowListener(sse);
		
		setLayout(null);
		
		bgLabel.add(jlTitle);
		bgLabel.add(jcbSemester);
		bgLabel.add(jsp);
		bgLabel.add(jbtnSearch);
		
		//배경 이미지가 있는 라벨 추가
		add(bgLabel);
		
		setBounds(smf.getX() + 100, smf.getY() + 50, 1000, 700);
		setVisible(true);
	}

	public StudentMainFrame getSmf() {
		return smf;
	}

	public JTable getJtScore() {
		return jtScore;
	}

	public DefaultTableModel getDtmScore() {
		return dtmScore;
	}

	public JButton getJbtnSearch() {
		return jbtnSearch;
	}

	public JComboBox<String> getJcbSemester() {
		return jcbSemester;
	}

	public DefaultComboBoxModel<String> getDcbmSemester() {
		return dcbmSemester;
	}
	

}
