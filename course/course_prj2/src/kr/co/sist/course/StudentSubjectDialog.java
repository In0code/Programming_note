package kr.co.sist.course;

import java.awt.Font;


import javax.swing.ImageIcon;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;



@SuppressWarnings("serial")
public class StudentSubjectDialog extends JDialog {

		private JTable jtss;
		private DefaultTableModel dtmtn;
	
	public StudentSubjectDialog(StudentMainFrame smf) {
		JLabel jlblTitle = new JLabel("수강신청");
		JLabel jlblback=new JLabel(new ImageIcon("C:/Users/user/git/group_prj/course_prj/src/kr/co/sist/course/images/backgr.png"));
		Font font = new Font("Pretendard", Font.BOLD, 14);
//		StudentSubjectDAO ssDAO = StudentSubjectDAO.getInstance();
       
		String[] tabName = { "과목코드", "과목명", "교수명", "이수구분","학점"};
		 dtmtn = new DefaultTableModel(null, tabName);
		
		 jtss = new JTable(dtmtn){
	          // 셀 편집 안되게 설정
	          @Override
	          public boolean isCellEditable(int row, int column) {
	              return false;
	          }
	      };
		 
		JScrollPane jspjtss = new JScrollPane(jtss);
		
		StudentSubjectEvt se = new StudentSubjectEvt(this);
		jtss.addMouseListener(se);
		
		// 행크기 변경 - setRowHeight
		jtss.setRowHeight(25);
		jtss.setFont(font);
		jlblTitle.setFont(new Font("Pretendard", Font.BOLD, 20));
		
		jlblback.setBounds(0, 0, 1000, 700);
		jlblTitle.setBounds(115, 65, 210, 50);
		jspjtss.setBounds(110, 170, 770, 350);
		
		setLayout(null);
		
		add(jlblTitle);
		add(jspjtss);
		
		add(jlblback);
		
		this.setResizable(false);
		
		setBounds(smf.getX() + 100, smf.getY() + 50, 1000, 700);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}

	 public boolean isCellEditable(int row, int column) {
         return false;
     }
 
	
	public JTable getJtss() {
		return jtss;
	}



	public void setJtss(JTable jtss) {
		this.jtss = jtss;
	}







	public DefaultTableModel getDtmtn() {
		return dtmtn;
	}



	public void setDtmtn(DefaultTableModel dtmtn) {
		this.dtmtn = dtmtn;
	}



	
	

}
