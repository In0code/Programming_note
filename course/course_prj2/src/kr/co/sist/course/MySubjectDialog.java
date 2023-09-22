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
public class MySubjectDialog extends JDialog{
	

	private DefaultTableModel dtmtn;
	private JTable jtMySub;
	private StudentMainFrame smf;
	private String subjectCode;



public MySubjectDialog(StudentMainFrame smf) {
		
		this.smf=smf;
		
		JLabel jlblTitle = new JLabel("수강과목");
		JLabel jlblback=new JLabel(new ImageIcon("C:/Users/user/git/group_prj/course_prj/src/kr/co/sist/course/images/backgr.png"));
		Font font = new Font("Pretendard", Font.BOLD, 14);
		String[] tabName = { "학과명", "과목명","과목코드", "교수명", "이수구분", "학점"};
		 dtmtn = new DefaultTableModel(null, tabName);
		
		 jtMySub = new JTable(dtmtn){
	          // 셀 편집 안되게 설정
	          @Override
	          public boolean isCellEditable(int row, int column) {
	              return false;
	          }
	      };

		JScrollPane jspjtMySub = new JScrollPane(jtMySub);
		
	
	  	MySubjectEvt mse = new MySubjectEvt(this);
		jtMySub.addMouseListener(mse);
		
		// 행크기 변경 - setRowHeight
		jtMySub.setRowHeight(25);
		jtMySub.setFont(font);
		jlblTitle.setFont(new Font("Pretendard", Font.BOLD, 20));
		
		jlblback.setBounds(0, 0, 1000, 700);
		jlblTitle.setBounds(115, 65, 210, 50);
		jspjtMySub.setBounds(110, 170, 770, 350);
		
		setLayout(null);
		
		add(jlblTitle);
		add(jspjtMySub);
		
		add(jlblback);
		
		this.setResizable(false);
		
		setBounds(smf.getX() + 100, smf.getY() + 50, 1000, 700);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}

public void setSmf(StudentMainFrame smf) {
	this.smf = smf;
}

public void setDtmtn(DefaultTableModel dtmtn) {
	this.dtmtn = dtmtn;
}



public DefaultTableModel getDtmtn() {
	return dtmtn;
}



public JTable getJtMySub() {
	return jtMySub;
}

public void setJtMySub(JTable jtMySub) {
	this.jtMySub = jtMySub;
}
public StudentMainFrame getSmf() {
	return smf;
}
public String getSubjectCode() {
	return subjectCode;
}

//public static void main(String[] args) {
//	new MySubjectDialog();
//}
}
