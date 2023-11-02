package kr.co.sist.prj;

import java.awt.Font;

import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.JTextField;

@SuppressWarnings("serial")
public class EmployProfManageDialog extends JDialog {

	public EmployProfManageDialog() {
		
		JLabel jlblProManage=new JLabel("교수관리");
		JLabel jlblback=new JLabel(new ImageIcon("C:/Users/user/git/group_prj/course_prj/src/kr/co/sist/prj/backgr.png"));
		DefaultComboBoxModel<String> dcbmSearch=new DefaultComboBoxModel<String>();
		JCheckBox jcbSearch=new JCheckBox();
		JTextField jtfSearch=new JTextField();
		JButton jbtnAdd=new JButton("등록");
		JButton jbtnSearch=new JButton("조회");
		JTable jtProf=new JTable();

		
		jlblProManage.setBounds(95, 50, 210, 50);
		jlblback.setBounds(0, 0, 900, 600);
//		jtProf.setBounds(500, 500, 100, 100);
		jbtnAdd.setBounds(700, 450, 80, 30);
		
		Font font=new Font("Pretendard", Font.BOLD, 20);
		jlblProManage.setFont(font);
		
		add(jlblProManage);
		add(jlblback);
//		add(jtProf);
//		add(jbtnSearch);
		add(jbtnAdd);
//		add(jtfSearch);
//		add(jcbSearch);
		
		setLayout(null);
		
		setBounds(500, 100, 900, 600);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		
	}//EmployProfManageDialog
	
	public static void main(String[] args) {
		new EmployProfManageDialog();
	}//mian
	
}//class
