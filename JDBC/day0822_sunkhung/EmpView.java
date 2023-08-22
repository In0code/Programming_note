package day0822_sunkhung;

import javax.swing.DefaultListModel;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

@SuppressWarnings("serial")
public class EmpView extends JFrame {

	private JList<String> jlEmpno;
	private DefaultListModel<String> dlmJlEmpno;

	public EmpView() {

		super("사원번호 조회");

		dlmJlEmpno = new DefaultListModel<String>();
		jlEmpno = new JList<String>(dlmJlEmpno);
		JScrollPane jsJLEmpno=new JScrollPane(jlEmpno);

		EmpViewEvt eve = new EmpViewEvt(this);
		jlEmpno.addMouseListener(eve);


		add("Center", jsJLEmpno);

		setBounds(100, 100, 300, 400);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}

	public JList<String> getJlEmpno() {
		return jlEmpno;
	}

	public DefaultListModel<String> getDlmJlEmpno() {
		return dlmJlEmpno;
	}

}
