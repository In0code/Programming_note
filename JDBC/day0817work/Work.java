package day0817work;

import java.sql.SQLException;

import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

@SuppressWarnings("serial")
public class Work extends JFrame { // 승우 숙제

	private DefaultTableModel dtmWork;
	private DefaultComboBoxModel<String> dcbmJcbWork;
	private JTable jtWork;
	private JComboBox<String> jcbWork;
	private JScrollPane jspWork;

	public Work() throws SQLException {
		super("테이블 구조");

		String[] columnNames = { "컬럼명", "데이터형", "크기", "null허용", "default여부" };
		dcbmJcbWork = new DefaultComboBoxModel<String>();
		jcbWork = new JComboBox<String>(dcbmJcbWork);

		dtmWork = new DefaultTableModel(null, columnNames);
		jtWork = new JTable(dtmWork);
		jspWork = new JScrollPane(jtWork);

		WorkEvt we = new WorkEvt(this);
		jcbWork.addActionListener(we);

		JPanel jpNorth = new JPanel();
		jpNorth.add(jcbWork);

		add("North", jpNorth);
		add("Center", jspWork);

		setBounds(100, 100, 600, 400);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// Work

	public DefaultComboBoxModel<String> getDcbmJcbWork() {
		return dcbmJcbWork;
	}

	public JScrollPane getJspWork() {
		return jspWork;
	}

	public DefaultTableModel getDtmWork() {
		return dtmWork;
	}

	public void setDtmWork(DefaultTableModel dtmWork) {
		this.dtmWork = dtmWork;
	}

	public JTable getJtWork() {
		return jtWork;
	}

	public void setJtWork(JTable jtWork) {
		this.jtWork = jtWork;
	}

	public JScrollPane getJspJtTable() {
		return jspWork;
	}

	public void setJspJtTable(JScrollPane jspWork) {
		this.jspWork = jspWork;
	}

	public JComboBox<String> getJcbWork() {
		return jcbWork;
	}

	public void setJcbWork(JComboBox<String> jcbWork) {
		this.jcbWork = jcbWork;
	}

	public static void main(String[] args) throws SQLException {
		new Work();

	}// main
}// class
